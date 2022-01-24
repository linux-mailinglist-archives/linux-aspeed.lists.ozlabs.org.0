Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC44983AC
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 16:37:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjDd14yymz3bPS
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jan 2022 02:37:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=bZrTz87D;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bZrTz87D; 
 dkim-atps=neutral
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjDcv3K8Qz30Q9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jan 2022 02:37:17 +1100 (AEDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20OFajLq114967;
 Mon, 24 Jan 2022 09:36:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643038605;
 bh=JQ59ooByHFX9y5XTd/tJSN1GuEDWKpebJJU65HBNeBA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bZrTz87D9CVyTjjwWqE31ni4e0RQQmQHVHzz4fImkPqdRK/2JeGpqIq2MnPMaqF50
 piFl3zlbu0kJD8Pv2Fk+ZscwatRJXdGokLtwvZ0+FeOXI/2sJ64NMi4N132H/Wx7I0
 +UCP4YjnqHGj+RtTaSiLDhLYUtfRooBqiafu3I8Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20OFajBB072291
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Jan 2022 09:36:45 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 24
 Jan 2022 09:36:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 24 Jan 2022 09:36:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20OFaiWw019720;
 Mon, 24 Jan 2022 09:36:44 -0600
Date: Mon, 24 Jan 2022 21:06:44 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20220124153644.m3iwlvq5ld5cpbyz@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
 <20220103171721.46c8e697@xps13> <YdSP6tKyQ2ZRUC+2@heinlein>
 <20220105063244.lno3xur64uepa7i5@ti.com>
 <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
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

On 23/01/22 11:44PM, Cédric Le Goater wrote:
> > > I had an offline discussion with someone who knew more history on this driver.
> > > My understanding is that the linux-aspeed team is aware of this being deprecated
> > > but that there was some missing support for interface training that nobody has
> > > gotten around to write?  If that is the case this really isn't even a "simple"
> > > port to a new API at this point.
> > 
> > Unless the controller needs some unique feature (I don't think it does
> > on a quick glance), the conversion should not be too difficult. For any
> > experienced developer, even if they are unfamiliar with the SPI MEM API,
> > I don't think it should take more than 2-3 days to do the conversion.
> > The code to program the registers would stay the same, all that needs to
> > change is the API through which it is accessed.
> 
> Writing a spimem driver is not a problem, I think people have done
> that in house. Aspeed has one for AST2600. We have one for u-boot
> I wrote sometime ago. I even have one for Linux but training comes
> with ugly hacks to fit in the current stack.
> 
> All Aspeed SoCs need training and that has been the problem for the
> last 4 years or so because we can not do training without knowing
> a minimum about the flash being trained :/ The previous framework
> offered a way to do a first scan and tune the delay settings
> afterwards. It worked pretty well on AST2400, AST2500 and AST2600
> even if more complex.
> 
> One alternative was to include the setting in the DT but the flash
> modules are not always soldered on the boards, at least on OpenPOWER
> systems which have sockets for them. The board are large, the wires
> long, the need is real, some chips freak out if not tuned correctly.
> 
> spimem needs an extension I think. Sorry I have not been able to
> push that forward. Lack of time and other tasks to address on the
> host side of the machine. This is really a software problem, we
> have the HW procedures ready. If a spimem expert could get involved
> to make a few proposals, I would be happy to help and do some testing.
> QEMU models are good enough for the software part. We can do the
> training validation on real HW when ready.

What information about the flash do you need for this training? I 
proposed a patch series [0] some time ago trying to implement training 
for TI SoCs. It did not get merged but I do intend to respin it and get 
it through. Would this API work for your tuning as well?

Also, I am curious how your training works. What data do you read for 
training delays? Where is it stored? In our case we need to flash a 
known pattern at some location (which is passed in via DT). Do you need 
to run it for every read transaction or just once after the flash is 
initialized?

[0] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=233504&state=%2A&archive=both

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
