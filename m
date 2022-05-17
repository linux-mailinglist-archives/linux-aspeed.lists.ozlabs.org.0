Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF852A012
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 13:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2YL74P0Tz3bym
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 21:09:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=C+/lmMp4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=C+/lmMp4; 
 dkim-atps=neutral
X-Greylist: delayed 238 seconds by postgrey-1.36 at boromir;
 Tue, 17 May 2022 21:09:43 AEST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2YKz4Vsgz2ymf
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 21:09:43 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24HB5B9Y067885;
 Tue, 17 May 2022 06:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652785511;
 bh=hDsJq/b0VuKRFUYgX46+pCCeUUg4Uzz56vD30lAdDWc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=C+/lmMp4a8s3j9ztwdKfi7X1KsqIIY1E5422WCsWEqlsAcsrl0AdPawNsRP35HaPH
 P2WrLbLq1j3T6P2cYbplwX1Y6xPVhdgFY+ffLq6IfmaUZbNSMlNpb1Io98yAIR5Czv
 1/WsUufFlJhznkoSNZkcQLWY5SxOiHUWJqH0l7TY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24HB5BGR079369
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 May 2022 06:05:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 06:05:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 06:05:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24HB5Ahl014403;
 Tue, 17 May 2022 06:05:10 -0500
Date: Tue, 17 May 2022 16:35:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <20220517110509.2e6xbwot63yl6a3c@ti.com>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org,
 tudor.ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 clg@kaod.org, miquel.raynal@bootlin.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Cedric,

On 16/05/22 07:39PM, Mark Brown wrote:
> On Mon, 9 May 2022 19:56:05 +0200, C�dric Le Goater wrote:
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> > 
> >  * AST2600 Firmware SPI Memory Controller (FMC)
> >  * AST2600 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2500 Firmware SPI Memory Controller (FMC)
> >  * AST2500 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2400 New Static Memory Controller (also referred as FMC)
> >  * AST2400 SPI Flash Controller (SPI)
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [02/11] dt-bindings: spi: Convert the Aspeed SMC controllers device tree binding
>         commit: ce9858ea499da025684a7a5f19823c2c3f14bdce
> [03/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
>         commit: 9c63b846e6df43e5b3d31263f7db545f32deeda3
> [04/11] spi: aspeed: Add support for direct mapping
>         commit: 9da06d7bdec7dad8018c23b180e410ef2e7a4367
> [05/11] spi: aspeed: Adjust direct mapping to device size
>         commit: bb084f94e1bca4a5c4f689d7aa9b410220c1ed71
> [06/11] spi: aspeed: Workaround AST2500 limitations
>         commit: 5785eedee42c34cfec496199a80fa8ec9ddcf7fe
> [07/11] spi: aspeed: Add support for the AST2400 SPI controller
>         commit: 53526ab27d9c256504f267713aea60db7af18fb0
> [08/11] spi: aspeed: Calibrate read timings
>         commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4

I have repeatedly objected to this patch [0][1][2] and you have 
repeatedly decided to not address my objections. I won't spend any more 
time fighting it. But I will say that you should not expect any 
guarantees that SPI NOR or SPI NAND will not break your calibration in 
the future if they decide to move the dirmap_create() call around.

> [11/11] mtd: spi-nor: aspeed: set the decoding size to at least 2MB for AST2600
>         commit: 73ae97e3cabb580639f02f12a192324a53c4bebb
> 

[0] https://patchwork.kernel.org/project/spi-devel-general/patch/20220325100849.2019209-9-clg@kaod.org/
[1] https://patchwork.kernel.org/project/spi-devel-general/patch/20220214094231.3753686-9-clg@kaod.org/
[2] https://lore.kernel.org/all/20220208190636.h6dubktkmuosvdxo@ti.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
