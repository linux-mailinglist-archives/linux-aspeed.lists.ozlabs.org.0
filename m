Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE54AE27B
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Feb 2022 21:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtYx00KMLz3bWR
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 07:08:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=opT1ONKv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=opT1ONKv; 
 dkim-atps=neutral
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtYwt448Rz30Ds
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 07:08:28 +1100 (AEDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 218J6cbj046485;
 Tue, 8 Feb 2022 13:06:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644347198;
 bh=6UqkATHFYuKMAaK02BGNEELKOaebX+fdRGwvNctEq64=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=opT1ONKvoXJeiWDy4C7+obV7cOaSEKXJp0DwOGZwB2jKBrjPCWqC3Kvh80OM4HrN5
 PHjgX3pPUUhVAuJA9cA0M6669bUEwT8DUgejKSFMCEjCnofGhch26ZmzNP1Cv8jSJ5
 o3QFhE2IOf9vzOSK6uCtXTtapOb0lYGVkgcuUM4Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 218J6caC084086
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Feb 2022 13:06:38 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Feb 2022 13:06:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Feb 2022 13:06:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 218J6axK108441;
 Tue, 8 Feb 2022 13:06:37 -0600
Date: Wed, 9 Feb 2022 00:36:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20220208190636.h6dubktkmuosvdxo@ti.com>
References: <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
 <20220103171721.46c8e697@xps13> <YdSP6tKyQ2ZRUC+2@heinlein>
 <20220105063244.lno3xur64uepa7i5@ti.com>
 <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
 <20220124153644.m3iwlvq5ld5cpbyz@ti.com>
 <b222361a-288a-55b2-fc02-04c0b93b4220@kaod.org>
 <20220124203708.lm23sgsub234wlhq@ti.com>
 <53d53523-7174-89fd-8661-550346d53141@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53d53523-7174-89fd-8661-550346d53141@kaod.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Potin Lai <potin.lai@quantatw.com>,
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/02/22 06:13PM, Cédric Le Goater wrote:
> Hello,
> 
> On 1/24/22 21:37, Pratyush Yadav wrote:
> > On 24/01/22 07:34PM, Cédric Le Goater wrote:
> > > > > spimem needs an extension I think. Sorry I have not been able to
> > > > > push that forward. Lack of time and other tasks to address on the
> > > > > host side of the machine. This is really a software problem, we
> > > > > have the HW procedures ready. If a spimem expert could get involved
> > > > > to make a few proposals, I would be happy to help and do some testing.
> > > > > QEMU models are good enough for the software part. We can do the
> > > > > training validation on real HW when ready.
> > > > 
> > > > What information about the flash do you need for this training?
> > > 
> > > Last time I looked, we lacked some post_init handler to setup a slave:
> > > configure the registers defining the AHB windows for each flash
> > > slave and perform the read timing calibration. calibration should
> > > only be done once.
> > > 
> > > See how the aspeed_spi_flash_init() routine doing the calibration
> > > is hooked up under aspeed_spi_claim_bus() in the u-boot driver :
> > 
> > My patch series should provide a hook for doing the calibration _after_
> > the flash is initialized.
> 
> You can also use the .dirmap_create handler. The flash device has
> been scanned when called and the size is available in the spi-mem
> dirmap descriptor.

I feel uncomfortable doing that since the API does not actually make 
this guarantee. Who knows if a future change will violate that 
assumption. That is why I added a new API call to explicitly mark the 
flash as ready. I suppose you can get the op from the .dirmap_create 
handler, but I guess we can debate that over the patches.

> 
> I reworked the current Aspeed driver with this approach and it
> seems sufficient for read calibration.
> 
> Thanks,
> 
> C.
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
