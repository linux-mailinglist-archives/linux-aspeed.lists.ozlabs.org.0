Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34316DE138
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:31:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGHh52mhzDqM2
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:31:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=46.235.227.227; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qS0X1txdzDqWl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 23:28:11 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C474290EF4;
 Fri, 11 Oct 2019 13:28:08 +0100 (BST)
Date: Fri, 11 Oct 2019 14:28:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
Message-ID: <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191004115919.20788-5-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:30:07 +1100
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri,  4 Oct 2019 13:59:07 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> +#define ASPEED_SMC_HCLK_DIV(i) \
> +	(aspeed_smc_hclk_divs[(i) - 1] << CONTROL_CLOCK_FREQ_SEL_SHIFT)
> +
> +static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
> +{
> +	/*
> +	 * Keep the 4Byte address mode on the AST2400 SPI controller.
> +	 * Other controllers set the 4Byte mode in the CE Control
> +	 * Register
> +	 */
> +	u32 ctl_mask =3D chip->controller->info =3D=3D &spi_2400_info ?
> +		 CONTROL_IO_ADDRESS_4B : 0;
> +
> +	return (chip->ctl_val[smc_read] & ctl_mask) |
> +		(0x00 << 28) | /* Single bit */
> +		(0x00 << 24) | /* CE# max */
> +		(0x03 << 16) | /* use normal reads */
> +		(0x00 <<  8) | /* HCLK/16 */
> +		(0x00 <<  6) | /* no dummy cycle */
> +		(0x00);        /* normal mode */

IIUC, you're using a SPINOR_OP_READ operation to read the golden
buffer, and if I'm right, you start reading at offset 0 of the dirmap
window (offset 0 in the flash), so basically the first block in the NOR.
What happens if this block is erased? In that case your golden buf will
contain only 0xff values, and the read calibration is likely to be
useless (how can you determine if timings are good when IO pins always
stay high). Don't we have a command that return non-ff/non-0 data while
still being predictable and immutable? Do you expect users to always
flash a pattern that helps calibrating those delays?

> +}
> +
> +static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
> +				    u32 max_freq)
> +{
> +	u8 *golden_buf, *test_buf;
> +	int i, rc, best_div =3D -1;
> +	u32 save_read_val =3D chip->ctl_val[smc_read];
> +	u32 ahb_freq =3D chip->controller->clk_frequency;
> +
> +	dev_dbg(chip->nor.dev, "AHB frequency: %d MHz", ahb_freq / 1000000);
> +
> +	test_buf =3D kmalloc(CALIBRATE_BUF_SIZE * 2, GFP_KERNEL);
> +	golden_buf =3D test_buf + CALIBRATE_BUF_SIZE;
> +
> +	/* We start with the dumbest setting (keep 4Byte bit) and read
> +	 * some data
> +	 */
> +	chip->ctl_val[smc_read] =3D aspeed_smc_default_read(chip);
> +
> +	writel(chip->ctl_val[smc_read], chip->ctl);
> +
> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> +
> +	/* Establish our read mode with freq field set to 0 (HCLK/16) */
> +	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> +
> +	/* Check if calibration data is suitable */
> +	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
> +		dev_info(chip->nor.dev,
> +			 "Calibration area too uniform, using low speed");
> +		writel(chip->ctl_val[smc_read], chip->ctl);
> +		kfree(test_buf);
> +		return 0;
> +	}
> +
> +	/* Now we iterate the HCLK dividers until we find our breaking point */
> +	for (i =3D ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
> +		u32 tv, freq;
> +
> +		/* Compare timing to max */
> +		freq =3D ahb_freq / i;
> +		if (freq > max_freq)
> +			continue;
> +
> +		/* Set the timing */
> +		tv =3D chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
> +		writel(tv, chip->ctl);
> +		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
> +		rc =3D aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
> +		if (rc =3D=3D 0)
> +			best_div =3D i;
> +	}
> +	kfree(test_buf);
> +
> +	/* Nothing found ? */
> +	if (best_div < 0) {
> +		dev_warn(chip->nor.dev, "No good frequency, using dumb slow");
> +	} else {
> +		dev_dbg(chip->nor.dev, "Found good read timings at HCLK/%d",
> +			best_div);
> +		chip->ctl_val[smc_read] |=3D ASPEED_SMC_HCLK_DIV(best_div);
> +	}
> +
> +	writel(chip->ctl_val[smc_read], chip->ctl);
> +	return 0;
> +}


