Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDD488E6A
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH3J758nz2xWx
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=fxo6v6Kf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fxo6v6Kf; 
 dkim-atps=neutral
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTKRh2r5sz2xsJ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jan 2022 17:33:02 +1100 (AEDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2056WmMd012286;
 Wed, 5 Jan 2022 00:32:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641364368;
 bh=uimfbPYqTHESrm7QoGXNpIPRsgIgtQ+2tdMFjrAlrX8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fxo6v6KfTd3OIjbe8vFB3jIVs/626dLtGAh5RyfY8txMdmvYCrQI1JeRX2GLmBSFa
 o6Siyo8doSk8xH0Uo1DMGMwsOM+QtsTY/iSGIXVsojpOIH+hGXNv2A9NR5wFdulLgL
 3jq8aLZBVndulHk+9aS0u3P2CnkHl5nNsGRgduu0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2056WmJ9074231
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jan 2022 00:32:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 5
 Jan 2022 00:32:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 5 Jan 2022 00:32:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2056WlDD107485;
 Wed, 5 Jan 2022 00:32:47 -0600
Date: Wed, 5 Jan 2022 12:02:46 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20220105063244.lno3xur64uepa7i5@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
 <20220103171721.46c8e697@xps13> <YdSP6tKyQ2ZRUC+2@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YdSP6tKyQ2ZRUC+2@heinlein>
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

On 04/01/22 12:20PM, Patrick Williams wrote:
> Hi Miquel,
> 
> On Mon, Jan 03, 2022 at 05:17:21PM +0100, Miquel Raynal wrote:
> 
> > > I am fine with taking in bug fixes but no longer want to take in any new 
> > > features. My main intention was to nudge you to convert it to SPI MEM 
> > > regardless of whether this is a bug fix or a new feature, because 
> > > eventually we want to get rid of drivers/mtd/spi-nor/controllers/ and 
> > > the API that comes along with it.
> > 
> > I totally agree with Pratyush here, we no longer want to support the
> > spi-nor controller API so if, as you say, there are boards failing
> > in the field, it means there are still users and these users must be
> > warned that at some point we might discontinue the support of these
> > drivers if it becomes too painful.
> >
> 
> Your response here makes it seem like you don't realize the scope of this
> driver.  There are probably, by my estimates, on the order of 10s of millions of
> deployed systems using this driver in the world.  The vast majority of servers
> in the world use an AST2400, AST2500, or AST2600 chip, which needs this driver
> in order access its own flash storage device.  Both OpenBMC and most of the
> proprietary alternatives use this driver.

Then we should easily be able to find people willing to spend a couple 
days on updating the driver :-)

> 
> The company I work for has a LOT of systems using this code.  After I made this
> fix, for a new design being developed, it was pointed out to me that our ODM ran
> into this problem a few years ago and we've been really bad about upstreaming
> those fixes.  For this new system I'm trying to keep us on top of all
> upstreaming efforts.

If a company wants to use an upstream kernel for their systems I think 
they should invest into maintaining the drivers they are using.

> 
> To me the inability to access your own storage, resulting in a kernel panic, is
> a pretty serious issue.  Bug or feature I guess is always in the eye of the

One option you always have is to disable the bad flash in your device 
tree. I don't see why you would want to keep a flash that does not work 
enabled anyway.

> beholder though.  I think this is pretty valuable to get in, from an impact
> standpoint, and pretty minimal in terms of maintenance efforts on the
> maintainers part.

Yes, I agree that your patch itself has fairly low maintenance burden. I 
would not be too opposed to taking it in. But for the driver as a whole, 
that is indeed a maintenance burden since we have to carry code in SPI 
NOR to support it which makes adding new features a bit tricky.

We had a discussion along these lines for old unmaintained flashes in 
SPI NOR. The idea then was to warn the people who touched code related 
to those flashes that they can either update it or we will drop the 
flashes after X releases. They would still work on older kernels of 
course, but if there are any upstream users they would have to update 
the code or live without the flashes.

I would like to use the same approach for the controllers API as well. 
We can't keep carrying around legacy code forever just because a 
device/driver has no active developers. If people want to use some 
driver in the upstream kernel, they should help maintain it.

> 
> I had an offline discussion with someone who knew more history on this driver.
> My understanding is that the linux-aspeed team is aware of this being deprecated
> but that there was some missing support for interface training that nobody has
> gotten around to write?  If that is the case this really isn't even a "simple"
> port to a new API at this point.

Unless the controller needs some unique feature (I don't think it does 
on a quick glance), the conversion should not be too difficult. For any 
experienced developer, even if they are unfamiliar with the SPI MEM API, 
I don't think it should take more than 2-3 days to do the conversion. 
The code to program the registers would stay the same, all that needs to 
change is the API through which it is accessed.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
