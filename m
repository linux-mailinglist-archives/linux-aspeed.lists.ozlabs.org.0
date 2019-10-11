Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AAD40FE
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 15:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qT9z3NphzDqT7
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 00:21:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ti.com
 (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com;
 envelope-from=vigneshr@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="QJcK449t"; 
 dkim-atps=neutral
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qT1D1d1yzDqXq
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 00:13:50 +1100 (AEDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BDD8jY081939;
 Fri, 11 Oct 2019 08:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570799588;
 bh=YLTCfOlEBhXcof9xWJVf65ZhWo8Svt9kMFx3/wfvMnA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QJcK449tp6L1Ph2cMGQr6+cCdoXIxnEGEVewj2wNc+rsQ0eJijCa29gNHsSxYLwsE
 FHm6nompV9YItAiKvMiIL2+tbnGREsYP6IqXQzJmZ9A1EMr24qi14igsr7pk5++eFP
 4xgNThi/pzRd0HcA/jCkHtP/dl2AIGpk8xSFQWP8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BDD842087479
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 08:13:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:13:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:13:08 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BDD2tQ115521;
 Fri, 11 Oct 2019 08:13:03 -0500
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a933999d-cb3d-ef3c-8a0d-a1f022817543@ti.com>
Date: Fri, 11 Oct 2019 18:43:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Cedric,

On 11/10/19 5:58 PM, Boris Brezillon wrote:
> On Fri,  4 Oct 2019 13:59:07 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> +#define ASPEED_SMC_HCLK_DIV(i) \
>> +	(aspeed_smc_hclk_divs[(i) - 1] << CONTROL_CLOCK_FREQ_SEL_SHIFT)
>> +
>> +static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>> +{
>> +	/*
>> +	 * Keep the 4Byte address mode on the AST2400 SPI controller.
>> +	 * Other controllers set the 4Byte mode in the CE Control
>> +	 * Register
>> +	 */
>> +	u32 ctl_mask = chip->controller->info == &spi_2400_info ?
>> +		 CONTROL_IO_ADDRESS_4B : 0;
>> +
>> +	return (chip->ctl_val[smc_read] & ctl_mask) |
>> +		(0x00 << 28) | /* Single bit */
>> +		(0x00 << 24) | /* CE# max */
>> +		(0x03 << 16) | /* use normal reads */
>> +		(0x00 <<  8) | /* HCLK/16 */
>> +		(0x00 <<  6) | /* no dummy cycle */
>> +		(0x00);        /* normal mode */
> 
> IIUC, you're using a SPINOR_OP_READ operation to read the golden
> buffer, and if I'm right, you start reading at offset 0 of the dirmap
> window (offset 0 in the flash), so basically the first block in the NOR.
> What happens if this block is erased? In that case your golden buf will
> contain only 0xff values, and the read calibration is likely to be
> useless (how can you determine if timings are good when IO pins always
> stay high). Don't we have a command that return non-ff/non-0 data while
> still being predictable and immutable? Do you expect users to always
> flash a pattern that helps calibrating those delays?
> 

Yes, this is precisely my concern as well. I have been developing
training sequence for cadence-quadspi controller (requirements are
similar to what you have here) and found that its better to use read
only data such as SFDP table data to calibrate. Cadence-quadspi requires
training only in higher performance modes like Quad/Octal DTR mode and
needs 16 bytes of known data for calibration. Hence SFDP works well for
my case.
But the problem here is that, aspeed controller needs 16K of known data.
SFDP table is not that big and read beyond address space is not required
to wrap around.
Wondering if you really need to read 16K amount of data for calibration?

Regards
Vignesh

>> +}
>> +
>> +static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>> +				    u32 max_freq)
>> +{
>> +	u8 *golden_buf, *test_buf;
>> +	int i, rc, best_div = -1;
>> +	u32 save_read_val = chip->ctl_val[smc_read];
>> +	u32 ahb_freq = chip->controller->clk_frequency;
>> +
>> +	dev_dbg(chip->nor.dev, "AHB frequency: %d MHz", ahb_freq / 1000000);
>> +
>> +	test_buf = kmalloc(CALIBRATE_BUF_SIZE * 2, GFP_KERNEL);
>> +	golden_buf = test_buf + CALIBRATE_BUF_SIZE;
>> +
>> +	/* We start with the dumbest setting (keep 4Byte bit) and read
>> +	 * some data
>> +	 */
>> +	chip->ctl_val[smc_read] = aspeed_smc_default_read(chip);
>> +
>> +	writel(chip->ctl_val[smc_read], chip->ctl);
>> +
>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>> +
>> +	/* Establish our read mode with freq field set to 0 (HCLK/16) */
>> +	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
>> +
>> +	/* Check if calibration data is suitable */
>> +	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
>> +		dev_info(chip->nor.dev,
>> +			 "Calibration area too uniform, using low speed");
>> +		writel(chip->ctl_val[smc_read], chip->ctl);
>> +		kfree(test_buf);
>> +		return 0;
>> +	}
>> +
>> +	/* Now we iterate the HCLK dividers until we find our breaking point */
>> +	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
>> +		u32 tv, freq;
>> +
>> +		/* Compare timing to max */
>> +		freq = ahb_freq / i;
>> +		if (freq > max_freq)
>> +			continue;
>> +
>> +		/* Set the timing */
>> +		tv = chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
>> +		writel(tv, chip->ctl);
>> +		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
>> +		rc = aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
>> +		if (rc == 0)
>> +			best_div = i;
>> +	}
>> +	kfree(test_buf);
>> +
>> +	/* Nothing found ? */
>> +	if (best_div < 0) {
>> +		dev_warn(chip->nor.dev, "No good frequency, using dumb slow");
>> +	} else {
>> +		dev_dbg(chip->nor.dev, "Found good read timings at HCLK/%d",
>> +			best_div);
>> +		chip->ctl_val[smc_read] |= ASPEED_SMC_HCLK_DIV(best_div);
>> +	}
>> +
>> +	writel(chip->ctl_val[smc_read], chip->ctl);
>> +	return 0;
>> +}
> 
> 

-- 
Regards
Vignesh
