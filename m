Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043814B63BE
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 07:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyWnh3Rvjz3cBl
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 17:46:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0;
 helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir;
 Tue, 15 Feb 2022 17:34:29 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyWXP5Nthz30R0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 17:34:29 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 35C4530000E20;
 Tue, 15 Feb 2022 07:27:43 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 282A6314429; Tue, 15 Feb 2022 07:27:43 +0100 (CET)
Date: Tue, 15 Feb 2022 07:27:43 +0100
From: Lukas Wunner <lukas@wunner.de>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 03/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Message-ID: <20220215062743.GA12431@wunner.de>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214094231.3753686-4-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 15 Feb 2022 17:45:58 +1100
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 10:42:24AM +0100, Cédric Le Goater wrote:
> +static int aspeed_spi_probe(struct platform_device *pdev)
> +{
[...]
> +	ctlr = spi_alloc_master(dev, sizeof(*aspi));
> +	if (!ctlr)
> +		return -ENOMEM;

Use devm_spi_alloc_master() and remove the "put_controller" error path
for simplicity.


> +	ret = devm_spi_register_controller(dev, ctlr);
[...]
> +static int aspeed_spi_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
> +	struct aspeed_spi *aspi = spi_controller_get_devdata(ctlr);
> +
> +	aspeed_spi_enable(aspi, false);
> +	spi_unregister_controller(ctlr);
> +	clk_disable_unprepare(aspi->clk);
> +	return 0;
> +}

You need to move the call to spi_unregister_controller() *before*
the call to aspeed_spi_enable().  The controller must be fully
operational until spi_unregister_controller() returns.

You also need to replace the call to devm_spi_register_controller()
in aspeed_spi_probe() with spi_register_controller().
Otherwise you'll unregister the controller twice because you're
calling spi_unregister_controller() in aspeed_spi_remove().

Thanks,

Lukas
