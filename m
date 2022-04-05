Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF00F4F3D57
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Apr 2022 21:23:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXyHQ02Xnz2ygC
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Apr 2022 05:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=PKBKT8ma;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PKBKT8ma; 
 dkim-atps=neutral
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXyHG0RByz2y8R
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Apr 2022 05:23:36 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235JMjDv005917;
 Tue, 5 Apr 2022 14:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649186565;
 bh=gyTjrVE6XZL0s0mFe2hpv610AmkYDUb5iT13rkgmKRc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PKBKT8masPEuR2LOHeC3RosC3UfwVAOBbmci39ci03yRnQIY7L693HlQISqV5EhBi
 Pf851tANHiSV/1GhVdsERrDoEtTUvfdEe//BrbqWiTHGsHPqvSkgPqqMtwCcOjlfxA
 b+oHaewX2Mtkj8jRegPfopO8NDUb3Ee1k9Dei77w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235JMjtb023636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:22:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:22:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:22:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235JMiEb104214;
 Tue, 5 Apr 2022 14:22:45 -0500
Date: Wed, 6 Apr 2022 00:52:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 08/11] spi: aspeed: Calibrate read timings
Message-ID: <20220405192243.7ilibbsyomg42uwg@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
 <20220331164115.w5q3wxlmwcg3w4ns@ti.com>
 <8c88e726-0ddb-e2ba-35df-676cfc3d0475@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c88e726-0ddb-e2ba-35df-676cfc3d0475@kaod.org>
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 04/04/22 09:30AM, C�dric Le Goater wrote:
> On 3/31/22 18:41, Pratyush Yadav wrote:
> > Hi,
> > 
> > On 25/03/22 11:08AM, C�dric Le Goater wrote:
> > > To accommodate the different response time of SPI transfers on different
> > > boards and different SPI NOR devices, the Aspeed controllers provide a
> > > set of Read Timing Compensation registers to tune the timing delays
> > > depending on the frequency being used. The AST2600 SoC has one of these
> > > registers per device. On the AST2500 and AST2400 SoCs, the timing
> > > register is shared by all devices which is problematic to get good
> > > results other than for one device.
> > > 
> > > The algorithm first reads a golden buffer at low speed and then performs
> > > reads with different clocks and delay cycle settings to find a breaking
> > > point. This selects a default good frequency for the CEx control register.
> > > The current settings are a bit optimistic as we pick the first delay giving
> > > good results. A safer approach would be to determine an interval and
> > > choose the middle value.
> > > 
> > > Calibration is performed when the direct mapping for reads is created.
> > > Since the underlying spi-nor object needs to be initialized to create
> > > the spi_mem operation for direct mapping, we should be fine. Having a
> > > specific API would clarify the requirements though.
> > > 
> > > Cc: Pratyush Yadav <p.yadav@ti.com>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> > > Signed-off-by: C�dric Le Goater <clg@kaod.org>
> > > ---
> > >   drivers/spi/spi-aspeed-smc.c | 281 +++++++++++++++++++++++++++++++++++
> > >   1 file changed, 281 insertions(+)
> > > 
> > [...]
> > > @@ -517,6 +527,8 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
> > >   	return 0;
> > >   }
> > > +static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip);
> > > +
> > >   static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> > >   {
> > >   	struct aspeed_spi *aspi = spi_controller_get_devdata(desc->mem->spi->master);
> > > @@ -565,6 +577,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> > >   	chip->ctl_val[ASPEED_SPI_READ] = ctl_val;
> > >   	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
> > > +	ret = aspeed_spi_do_calibration(chip);
> > > +
> > 
> > I am still not convinced this is a good idea. The API does not say
> > anywhere what dirmap_create must be called after the flash is completely
> > initialized, though that is what is done currently in practice.
> 
> Yes because we wouldn't have a correct 'spi_mem_dirmap_info' if it wasn't
> the case. May be change the documentation ?

SPI NOR knows what protocol and opcodes it would use before it actually 
puts the flash in that mode. So in theory it could call dirmap_create() 
before it has put the flash in say 8D-8D-8D mode. I don't see much 
reason to do so in practice, but who knows, that might change. This is 
why I would like to hear what other people think.

> 
> > I think
> > an explicit API to mark flash as "ready for calibration" would be a
> > better idea.
> 
> OK. Since the above is a oneliner, it should not be a problem to move
> it under a new handler if needed.
> 
> The dirmap_create() handler expects the spi-mem descriptor and the field
> 'desc->info.op_tmpl' to be correctly initialized in order to compute the
> control register value, which is a requirement for dirmap_read(). The
> calibration sequence simply comes after.
> 
> AFAICT, there is nothing incorrect today.

In practice, no there is nothing incorrect. But as I explained above, it 
is certainly possible to call dirmap_create() before the flash is ready.

> 
> > Tudor/Mark/Miquel, what do you think?
> 
> 
> Thanks,
> 
> C.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
