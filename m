Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 255423DE5B5
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 06:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf2Tc0T5gz30Dq
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 14:49:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=F9La31nE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DQhxKcAc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=F9La31nE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DQhxKcAc; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf2TT2PzQz2xWT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Aug 2021 14:49:17 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5CF67580ACA;
 Tue,  3 Aug 2021 00:49:14 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 00:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Wl85h6bg4MSlv1M5FS0LFGeSsIE5nFs
 rQ2n2j7b6l98=; b=F9La31nE4Ln4oZyhaSQ4UbuRlMQA6YW2qhPgizEx7m8YpQ/
 BTkBuWgIEmkjeXwx4SV4ibq65KLuB0b1gp5oy35HsOs0NTC1+cHVF2Wxv22I8d7n
 o7RnT79CY7+xetGJ9oMlRVUYuFbKqdrlCm5G4gUA3D9EmUW5sGWaY+3MFGk5LSoL
 4XHxdgBuDxDOIHfZdHNKiisCLCx6QD+Hpsb6yIbtNzdc+xmEax383WVguCFcE03B
 +XbKkM5UiyieA/++zcDd7W3kpLXLbeQgUOQ1culTo6507nWTT19sn+jp0gWJWiSB
 Kv766FD6ADN11GyOyi6p2CqK0DSNkJKr1uzT0XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Wl85h6
 bg4MSlv1M5FS0LFGeSsIE5nFsrQ2n2j7b6l98=; b=DQhxKcAc9Vem3+lknEXU7z
 oy9hga9H96N/PjcSb0VUoVQ+4GQkUQNEl3jvAe5PFfOERL3b6qJEhBTir3SEB1iO
 adoTBSLn/FesNvDPOGjnmIlINH4wi1iq/xGVG2svcSttzyB5UBrekPmTHh72QQxA
 CLvjLeTBkbnlSgTeJCKE/yK9vclcZ4J8epKvLJzeJPcpSOJNPxoCbJXyImx7juKE
 c3GwIboIC90yCtCK55wbNzYvC+fDekJIV2Lb8LmCc3bu+3G090zOzMBXfj++H793
 h/S4/8Jx787BrMrMH3n5ULmo+yy7Ux19yyJU4S65fSZs5h8VbdJLwgKLLb1xiKGQ
 ==
X-ME-Sender: <xms:yMoIYYNYTY8oezsS5chwfrmbr3hS7vK4rd2yhcWNk51uTmg7cffmbQ>
 <xme:yMoIYe99LvyJ3PBQ8Z3hmwbwrIUoAXB6zyQhW08Q1woBYvoJZztvqfDiifoKq4t9Q
 59oIeMqn5MNd-jgEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:yMoIYfSwpHZi0w7BQpbp74gOJF5chKPYx3fsmMLzwFVftonQSSzMWg>
 <xmx:yMoIYQv87XjcqR7slrnUb0LZmUG11CSnuMWGyaXNl9wKpJiYkXmY5A>
 <xmx:yMoIYQf3LW4Qxk4FIfqwlSDM0D3cYTW5nN51KtyFrDfy8Fn18rP9sg>
 <xmx:ysoIYRVZLHVokGFVwUmRCNDIihlHTiVBByqRvLzhzNC3nnIortAR9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 65E2EAC0DD0; Tue,  3 Aug 2021 00:49:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
In-Reply-To: <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
 <20210723031615.GA10457@aspeedtech.com>
 <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
Date: Tue, 03 Aug 2021 14:18:51 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Steven Lee" <steven_lee@aspeedtech.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
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
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 23 Jul 2021, at 17:00, Bartosz Golaszewski wrote:
> On Fri, Jul 23, 2021 at 5:16 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > The 07/21/2021 21:27, Bartosz Golaszewski wrote:
> > > On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
> > > >
> > > > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > > > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > > > supports up to 80 pins.
> > > > In the current driver design, the max number of sgpio pins is hardcoded
> > > > in macro MAX_NR_HW_SGPIO and the value is 80.
> > > >
> > > > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > > > contains the following enhancement:
> > > > - Convert txt dt-bindings to yaml.
> > > > - Update aspeed-g6 dtsi to support the enhanced sgpio.
> > > > - Support muiltiple SGPIO master interfaces.
> > > > - Support up to 128 pins by dts ngpios property.
> > > > - Pair input/output GPIOs instead of using 0 as GPIO input pin base and
> > > >   MAX_NR_HW_SGPIO as GPIO output pin base.
> > > > - Support wdt reset tolerance.
> > > > - Fix irq_chip issues which causes multiple sgpio devices use the same
> > > >   irq_chip data.
> > > > - Replace all of_*() APIs with device_*().
> > > >
> > > > Changes from v5:
> > > > * Squash v5 patch-05 and patch-06 to one patch.
> > > > * Remove MAX_NR_HW_SGPIO and corresponding design to make the gpio
> > > >   input/output pin base are determined by ngpios.
> > > >   For example, if MAX_NR_HW_SGPIO is 80 and ngpios is 10, the original
> > > >   pin order is as follows:
> > > >     Input:
> > > >     0 1 2 3 ... 9
> > > >     Output:
> > > >     80 81 82 ... 89
> > > >
> > > >   With the new design, pin order is changed as follows:
> > > >     Input:
> > > >     0 2 4 6 ... 18(ngpios * 2 - 2)
> > > >     Output:
> > > >     1 3 5 7 ... 19(ngpios * 2 - 1)
> > > > * Replace ast2600-sgpiom-128 and ast2600-sgpiom-80 compatibles by
> > > >   ast2600-sgpiom.
> > > > * Fix coding style issues.
> > > >
> > > > Changes from v4:
> > > > * Remove ngpios from dtsi
> > > > * Add ast2400 and ast2500 platform data.
> > > > * Remove unused macros.
> > > > * Add ngpios check in a separate patch.
> > > > * Fix coding style issues.
> > > >
> > > > Changes from v3:
> > > > * Split dt-bindings patch to 2 patches
> > > > * Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
> > > > * Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
> > > > * Correct the typo in commit messages.
> > > > * Fix coding style issues.
> > > > * Replace all of_*() APIs with device_*().
> > > >
> > > > Changes from v2:
> > > > * Remove maximum/minimum of ngpios from bindings.
> > > > * Remove max-ngpios from bindings and dtsi.
> > > > * Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
> > > >   driver.
> > > > * Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
> > > >   number of available gpio pins are different.
> > > > * Modify functions to pass aspeed_sgpio struct instead of passing
> > > >   max_ngpios.
> > > > * Split sgpio driver patch to 3 patches
> > > >
> > > > Changes from v1:
> > > > * Fix yaml format issues.
> > > > * Fix issues reported by kernel test robot.
> > > >
> > > > Please help to review.
> > > >
> > > > Thanks,
> > > > Steven
> > > >
> > > > Steven Lee (9):
> > > >   dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
> > > >   dt-bindings: aspeed-sgpio: Add ast2600 sgpio
> > > >   ARM: dts: aspeed-g6: Add SGPIO node.
> > > >   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
> > > >   gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
> > > >   gpio: gpio-aspeed-sgpio: Add set_config function
> > > >   gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
> > > >   gpio: gpio-aspeed-sgpio: Use generic device property APIs
> > > >   gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
> > > >
> > > >  .../bindings/gpio/aspeed,sgpio.yaml           |  77 ++++++++
> > > >  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
> > > >  arch/arm/boot/dts/aspeed-g5.dtsi              |   1 -
> > > >  arch/arm/boot/dts/aspeed-g6.dtsi              |  28 +++
> > > >  drivers/gpio/gpio-aspeed-sgpio.c              | 178 +++++++++++-------
> > > >  5 files changed, 215 insertions(+), 115 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > >
> > > The series looks good to me. Can the DTS and GPIO patches go into
> > > v5.15 separately?
> > >
> >
> > Hi Bart,
> >
> > Thanks for the review.
> > Shall we do anything to make the patches go into v5.15 or wait for picking-up?
> >
> > Steven
> >
> > > Bart
> 
> It's more of a question to the relevant SoC maintainers.
> 
> Joel, Andrew: can I take the GPIO patches through the GPIO tree and
> you'll take the ARM patches separately into v5.15?

I think that should be okay. I'll poke Joel.

Andrew
