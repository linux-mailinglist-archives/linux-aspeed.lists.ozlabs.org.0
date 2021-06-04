Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6239B105
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 05:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx7p349jPz3023
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 13:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=g1SuU500;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NspLtfqS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=g1SuU500; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NspLtfqS; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx7nv1qM6z2xYt
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 13:40:34 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7DBD258091D;
 Thu,  3 Jun 2021 23:40:30 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 03 Jun 2021 23:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=IXIL9C2HzjrAGNBk1nGy2Pu/WLpKNu2
 hvsZCetoM8WY=; b=g1SuU500NHCo7BZo/uEdeRt43gx1aRzt9/IlGJcHOoW/4Zl
 Z8H9jy9j7NAmkqBzupHRKJobQgZeYa5CwyXxdJ5UilSUdX4shu3ZUIEcJ5M98m3A
 ALgVDtyNBXI5RM5VELQGi2LjWVxILhnhtbhgsejsfvO7gPpNLbvvu32LMORPQO4k
 Pd6Dn/eC2PF2G9XZIzllmKG2congkkKbZ0YjiXth2EV8U8k4H0zilQ9zzDPARQYh
 s5zUVLLy1mQruTe7LNLBc1X4Hc229m87GNUjBNjQNlRa5tDRtEHTdzWHoi8N3uT3
 8trNW7ujgx5OzwHZHqt3KkRjYY7PTMf3fh1gUug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IXIL9C
 2HzjrAGNBk1nGy2Pu/WLpKNu2hvsZCetoM8WY=; b=NspLtfqSEuYIn4pOHCIgK8
 H0xUR7BlylRupUg/b21l2fqPvIbNLKUiXopvQ2ofbQkLve6CKCmZr2Xgw7JD+zfX
 ibX252bJqi26LD5P0Q6Sp7VutfOwiPTDkwXmQA786BsSRVr1XvJmztFDMzCEYtEx
 MS+vSBIwuSQKTGyaAGRCGi/yU3+M4z2GDkxz7Ku05IZLJjg2jIq2PAh444+PP/Ae
 AS5Gw9h26mlUJhjWs/PA2NZVDT+Ywtxczul35mHZOXOeMdToMr5rSK2xwWX1YTr6
 lfH+VDSfI30Yk4QWqC2aorMgcjRewuJ0/EGhHogEebYyROY3PjdIQYLcmFTT790w
 ==
X-ME-Sender: <xms:qqC5YEkr6BGDpSKNEuBWmOJGm3Gv3y-boz-PrRLPqqx7LzN1D4mPfg>
 <xme:qqC5YD0gALStilJ2iU17_etlSX9Oa7mZaduWouTQ4cbdsoKofY-niCqJTPqYRZvo8
 nK6S3cq-8p0L3We4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
 jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:q6C5YCrgoFYYnKoB29bo5P5z-1-DTO_hYwW_6LgE3KoZcwhd9RIoBA>
 <xmx:q6C5YAmagMP3YZzFJ8R9to0gE6RbNKJfMbgtgb1jyK7r69eO77ZegQ>
 <xmx:q6C5YC1wtdLXxT0_HUZFigl3nVhSkxEgwBL_RUoFLVRWMHsD2-Y62Q>
 <xmx:rqC5YLtnvC85elpowi1Er1uLh2rBj5sFvvXMLSRDHsZKGKil0deWrQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E035EAC0062; Thu,  3 Jun 2021 23:40:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <7a0a9625-e50f-4674-a579-b48d7eb28812@www.fastmail.com>
In-Reply-To: <20210604033039.GC25112@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-2-steven_lee@aspeedtech.com>
 <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
 <20210604033039.GC25112@aspeedtech.com>
Date: Fri, 04 Jun 2021 13:10:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/5]_dt-bindings:_aspeed-sgpio:_Convert_txt_bind?=
 =?UTF-8?Q?ings_to_yaml.?=
Content-Type: text/plain
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 4 Jun 2021, at 13:00, Steven Lee wrote:
> The 06/04/2021 07:25, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> > > sgpio-aspeed bindings should be converted to yaml format.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  .../bindings/gpio/aspeed,sgpio.yaml           | 78 +++++++++++++++++++
> > >  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 -----------
> > >  2 files changed, 78 insertions(+), 46 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml 
> > > b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > new file mode 100644
> > > index 000000000000..e7c2113cc096
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > @@ -0,0 +1,78 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aspeed SGPIO controller
> > > +
> > > +maintainers:
> > > +  - Andrew Jeffery <andrew@aj.id.au>
> > > +
> > > +description:
> > > +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> > > +  AST2600 have two sgpio master one with 128 pins another one with 80 
> > > pins,
> > > +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the 
> > > Serial
> > > +  GPIO pins can be programmed to support the following options
> > > +  - Support interrupt option for each input port and various interrupt
> > > +    sensitivity option (level-high, level-low, edge-high, edge-low)
> > > +  - Support reset tolerance option for each output port
> > > +  - Directly connected to APB bus and its shift clock is from APB bus 
> > > clock
> > > +    divided by a programmable value.
> > > +  - Co-work with external signal-chained TTL components 
> > > (74LV165/74LV595)
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aspeed,ast2400-sgpio
> > > +      - aspeed,ast2500-sgpio
> > > +      - aspeed,ast2600-sgpiom1
> > > +      - aspeed,ast2600-sgpiom2
> > 
> > You should have followed Rob's request here and made two patches for 
> > the binding document:
> > 
> > 1. A 1-to-1 conversion of the text file to dt-schema
> > 2. Add your new compatibles for the 2600.
> > 
> 
> Sorry I forgot to remove compatibles and move them to a new patch.
> 
> > From a cursory glance it looks okay except for the new compatibles.
> > 
> > Regarding the compatibles, I'd prefer we use something a bit more 
> > meaningful. What do you think of these?
> > 
> > - aspeed,ast2600-sgpiom-80
> > - aspeed,ast2600-sgpiom-128
> > 
> 
> Ok, I will change the name as you suggested.
> 
> BTW, I and development team have an internal discussion about the
> current sgpio design.
> 
> In the current design, the base offset of gpio input and output
> are calculated by the maximum number of gpio pins that SoC supported.
> For instance, in AST2500, max_ngpios is 80(defined in MAX_NR_HW_SGPIO),
> if ngpios is 16 in dts, gpio input pin id is from 0 to 15 and
> gpio output pin id is from 80 to 95.
> 
> We are thinking of removing max_ngpios(and MAX_NR_HW_SGPIO) and
> corresponding design to make the gpio input and output pin base
> are determined by ngpios.
> For instance, in any AST SoC, if ngpios is 16 in dts,
> gpio input pin id is from 0 to 15 and gpio output pin id is from 16 to 31.
> Thus we don't need to care about the max_ngpios of SoCs, and needn't to
> add 2 compatibles for ast2600.
> 
> However, it might affect users who update kernel/driver from the
> old kernel/driver as they may expect the gpio output pin base is start
> from 80(MAX_NR_HW_SGPIO).
> I was wondering if it is better to change the design as above.
> It would be great to have your suggestion.

Right, this breaks userspace. I don't think it's going to fly but I'm 
interested in feedback from Linus and Bartosz.

If we were to break userspace, a scheme I'd consider with is to pair 
input/output GPIOs. For example, GPIO 0 is input, GPIO 1 is the 
associated output, GPIO 2 is input, GPIO 3 is output etc. That way you 
can increase/decrease the number of GPIOs without affecting userspace 
(after breaking it initially).

Andrew
