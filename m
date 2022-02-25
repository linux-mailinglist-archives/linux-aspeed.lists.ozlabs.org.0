Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627E14C412A
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Feb 2022 10:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4kjb3nWjz3bb9
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Feb 2022 20:18:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=Dii+kV0O;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Dii+kV0O; 
 dkim-atps=neutral
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4kjV5Kykz30NW
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Feb 2022 20:18:53 +1100 (AEDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P9IBjF017495;
 Fri, 25 Feb 2022 03:18:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645780691;
 bh=rvWbhCJfnEIOUkIutnw+J3DZO5DRfhnDxkBwC3aC8fE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Dii+kV0O8lo7+yx9O7UyWiW3gSP6WIDtP/4eZgE9Ho3Cw26ca86US8X/AxQnfks1G
 nASL/KcwxckCgSbhpmVeBT9xnbVkTil2IopvLPhBkrOnoL+iOuszuj3r/4TahYOuuD
 xnFsC8AoW1vpbjkbo3nNFSOHCla7+eB+KnEynj/M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P9IB0H081229
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 03:18:11 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 03:18:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 03:18:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P9IAlO009024;
 Fri, 25 Feb 2022 03:18:10 -0600
Date: Fri, 25 Feb 2022 14:48:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 08/10] spi: aspeed: Calibrate read timings
Message-ID: <20220225091809.gvup3mcst45szi6x@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-9-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214094231.3753686-9-clg@kaod.org>
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

On 14/02/22 10:42AM, C�dric Le Goater wrote:
> To accommodate the different response time of SPI transfers on different
> boards and different SPI NOR devices, the Aspeed controllers provide a
> set of Read Timing Compensation registers to tune the timing delays
> depending on the frequency being used. The AST2600 SoC has one of
> these registers per device. On the AST2500 and AST2400 SoCs, the
> timing register is shared by all devices which is a bit problematic to
> get good results other than for one device.
> 
> The algorithm first reads a golden buffer at low speed and then performs
> reads with different clocks and delay cycle settings to find a breaking
> point. This selects a default good frequency for the CEx control register.
> The current settings are bit optimistic as we pick the first delay giving
> good results. A safer approach would be to determine an interval and
> choose the middle value.
> 
> Due to the lack of API, calibration is performed when the direct mapping
> for reads is created.

The dirmap_create mapping says nothing about _when_ it should be called. 
So there is no guarantee that it will only be called after the flash is 
fully initialized. I suggest you either make this a requirement of the 
API, or create a new API that guarantees it will only be called after 
the flash is initialized, like [0].

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210311191216.7363-2-p.yadav@ti.com/

> 
> Cc: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: C�dric Le Goater <clg@kaod.org>
> ---

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
