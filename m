Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C61488E67
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH375zMyz2yPp
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=I9dhu3Yn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=I9dhu3Yn; 
 dkim-atps=neutral
X-Greylist: delayed 12942 seconds by postgrey-1.36 at boromir;
 Sat, 01 Jan 2022 01:02:27 AEDT
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQRfW2Ph2z2xCS
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jan 2022 01:02:25 +1100 (AEDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BVAQRXS032981;
 Fri, 31 Dec 2021 04:26:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640946387;
 bh=bpUJPGgi/5Jx8j2h6g3oXESZgoh1z7lVwijB7GXIvPY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=I9dhu3YnYCdPQV5wZhyOYljCW4hQ7M3JSxn0R/O6sq2J2xXbx2ZcHqiNzlLS9Ij7z
 flBelTZNcsrNHIBW/GTR9RiIIcbJpXDj0KeAUDldhNPbd7Vq52rYRgMLdvzap4QbUx
 JxYHXmup4QljSyZRiZHqqrq0kq57+0xMFGxWlizY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BVAQR5s023694
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Dec 2021 04:26:27 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 31
 Dec 2021 04:26:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 31 Dec 2021 04:26:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BVAQQ7k052825;
 Fri, 31 Dec 2021 04:26:26 -0600
Date: Fri, 31 Dec 2021 15:56:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20211231102623.izaqlzjvracbbgmp@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yc3Qav+ULNdF5zRT@heinlein>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:51:28 +1100
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
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Patrick,

On 30/12/21 09:29AM, Patrick Williams wrote:
> On Wed, Dec 29, 2021 at 11:04:13PM +0530, Pratyush Yadav wrote:
> > Hi,
> > 
> > On 29/12/21 08:33AM, Patrick Williams wrote:
>  
> > The patch itself looks fine to me but we no longer want to maintain 
> > drivers under drivers/mtd/spi-nor/controllers/. They should be moved to 
> > implement the SPI MEM API (under drivers/spi/).
> 
> Is the linux-aspeed community aware of this?  Are you saying you don't want to
> take fixes for their driver into the MTD tree?  Can it be pulled into the Aspeed
> tree?

I am fine with taking in bug fixes but no longer want to take in any new 
features. My main intention was to nudge you to convert it to SPI MEM 
regardless of whether this is a bug fix or a new feature, because 
eventually we want to get rid of drivers/mtd/spi-nor/controllers/ and 
the API that comes along with it.

As for your patch, I certainly don't want it to go via the aspeed tree. 
It should go via the MTD tree or not at all. I am not quite sure if this 
counts as a bug fix or a new feature though.

> 
> > Could you please volunteer to do the conversion for this driver?
> 
> I'm not personally going to be able to get to it for at least the next 3 months.
> 
> It looks like we don't have a dedicated maintainer for this driver other than
> Joel by nature of him being listed as the maintainer of "ARM/ASPEED MACHINE
> SUPPORT".  I'm not sure if Aspeed themselves are planning on doing the necessary
> refactoring here.
> 
> 
> Joel, are you aware of this driver using a deprecated implementation?  Were
> there anyone planning to do the reworks that you are aware of?  I'd like to get
> this fix at least into the OpenBMC kernel tree because I'm seeing this fail in
> the real world.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
