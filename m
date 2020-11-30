Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781E2C7E0F
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 07:16:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckw3k1Cb9zDr4R
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 17:16:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=I28mP9V5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YXKxGXsB; 
 dkim-atps=neutral
X-Greylist: delayed 457 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Nov 2020 17:16:21 AEDT
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckw3T2Pb7zDqfZ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Nov 2020 17:16:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 13887E24;
 Mon, 30 Nov 2020 01:08:40 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 30 Nov 2020 01:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=C5J1tdXluFxh4c0JQjvN0sOfQgNwkXI
 lVaVmjYnYzWs=; b=I28mP9V5ITl5zDh2s7vN8v3EZsV/lK5FyPlRYoXBcViZEP4
 V7ABGPs5qEHTtMnYYblMcEl5jDjFFrB3uRWwEpG+/7tch3P0W8UQhj8qrGWBb/bE
 UspX1w+AHKB+7A9sp2TFzWYGD0Jxy6DwW8jRLRel0FQp7DSw8f6PwotEK+IwBs4G
 Zdnc4RHlWgSX6SjjVS8ZuaycjXCaclkeSYpGQP3rcj7NE0RDkWuaJWGwyulFqQSz
 3tNXQBV2KsjTWGgAJWAOYXFl38v0v0Ppg1yZT8orpcsmnernkd6iWc7hCT4zLGrr
 KTBc3Ma2ro4ky2POypMqdTjZ7cjjRxKlr6zvNUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C5J1td
 XluFxh4c0JQjvN0sOfQgNwkXIlVaVmjYnYzWs=; b=YXKxGXsBkzgsq8Eobu9mqZ
 3zdZeIrc9nuBwKPVdOkXgRI+atriuO+Erj1H0hVxfirhQUd6OBeZllQKjud8nbP1
 McjowS7K6AUqasRwWRClXgawEPMiptX0vz82mwqLm39+FaNkt+A6VcxY9z/AJqI8
 Hepu0sgMTmCRVupGLhp8QAKcqptY9BawDJvO9kIOroEWv9pCSMFDzgK/on5Izxfj
 7/8C0VNdNpczqtUR9JT1uQD6/G739Cndx0bTbauZ3kSw49Lhr3BZuijn2NiuJo/s
 Nn5V+Bb9rPjOGq42rhFKgQ7cFFCvqvnEay0rvHzPEeiFCkddPaqlYaDXSHbNv03Q
 ==
X-ME-Sender: <xms:ZozEX9Eb5aB7qrpv5-E_S83e9i7kfWBiUvgXFYD1e_46Qf05m7o7IA>
 <xme:ZozEXyW6LIMroeYaqiX2BbV-MZvZZ4A_jzLOj4cxfwqv5Q7BBLGxgK5BCciPFrnXG
 _neQ-I55cAllnhSNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehledgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZozEX_LXxLCLJ_nlk_GaAV_GNnqaa84FHEdfs_GQ-A6pDepKgG_ViQ>
 <xmx:ZozEXzHKzlE-CerT5hW-bHdlM8Pn6hIrcWF2Wm98qvDAn4jeZOL_tQ>
 <xmx:ZozEXzXhI76n5_xvnFEjm31cxhL7Uq_WN9JJZZStdgtUZiLPlZPnaw>
 <xmx:Z4zEX5xkFMpfTm-oaF6PJ1zWTPGhiPA93SxBk5ZFXajbzwRvhAlpdA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 28857E00C9; Mon, 30 Nov 2020 01:08:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <a6855c9f-c843-4e54-bef0-469b5097d596@www.fastmail.com>
In-Reply-To: <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-6-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
Date: Mon, 30 Nov 2020 16:38:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, vishwa <vishwa@linux.vnet.ibm.com>,
 "Eddie James" <eajames@linux.ibm.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: =?UTF-8?Q?Re:_[PATCH_6/6]_ARM:_dts:_aspeed:_rainier:_Add_leds_that_are_o?=
 =?UTF-8?Q?n_optional_PCI_cable_cards?=
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 16 Nov 2020, at 16:43, Joel Stanley wrote:
> On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
> <vishwa@linux.vnet.ibm.com> wrote:
> >
> > These are LEDs on the cable cards that plug into PCIE slots.
> > The LEDs are controlled by PCA9552 I2C expander
> >
> > Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 288 +++++++++++++++++++++++++++
> >  1 file changed, 288 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > index 67c8c40..7de5f76 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > @@ -696,6 +696,70 @@
> >                         gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
> >                 };
> >         };
> > +
> > +       leds-optional-cablecard0 {
> 
> Is it necessary to have separate nodes for each of the different GPIO devices?

Good question. Vishwa, what's the advantage either way here?

> 
> Would it make sense to combine them, or is it better to be separate?
> 
> Andrew, Eddie, Brad: please review this one before I merge it.
> 
> > +               compatible = "gpio-leds";
> > +
> > +               cablecard0-cxp-top {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca5 0 GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               cablecard0-cxp-bot {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca5 1 GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> > +
> > +       leds-optional-cablecard3 {
> > +               compatible = "gpio-leds";
> > +
> > +               cablecard3-cxp-top {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca6 0 GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               cablecard3-cxp-bot {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca6 1 GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> > +
> > +       leds-optional-cablecard4 {
> > +               compatible = "gpio-leds";
> > +
> > +               cablecard4-cxp-top {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca7 0 GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               cablecard4-cxp-bot {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca7 1 GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> > +
> > +       leds-optional-cablecard10 {
> > +               compatible = "gpio-leds";
> > +
> > +               cablecard10-cxp-top {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca8 0 GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               cablecard10-cxp-bot {
> > +                       retain-state-shutdown;
> > +                       default-state = "keep";
> > +                       gpios = <&pca8 1 GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> >  };
> >
> >  &ehci1 {
> > @@ -1212,6 +1276,180 @@
> >                 compatible = "atmel,24c64";
> >                 reg = <0x52>;
> >         };
> > +
> > +       pca5: pca9551@60 {
> > +               compatible = "nxp,pca9551";
> > +               reg = <0x60>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +};
> > +
> > +&i2c5 {
> > +       status = "okay";
> > +
> > +       tmp275@48 {
> > +               compatible = "ti,tmp275";
> > +               reg = <0x48>;
> > +       };
> > +
> > +       tmp275@49 {
> > +               compatible = "ti,tmp275";
> > +               reg = <0x49>;
> > +       };

These aren't LED devices.

> > +
> > +       eeprom@50 {
> > +               compatible = "atmel,24c64";
> > +               reg = <0x50>;
> > +       };
> > +
> > +       eeprom@51 {
> > +               compatible = "atmel,24c64";
> > +               reg = <0x51>;
> > +       };

Neither are these.

> > +
> > +       pca6: pca9551@60 {
> > +               compatible = "nxp,pca9551";
> > +               reg = <0x60>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca7: pca9551@61 {
> > +               compatible = "nxp,pca9551";
> > +               reg = <0x61>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> >  };
> >
> >  &i2c5 {
> > @@ -2028,6 +2266,56 @@
> >                 compatible = "atmel,24c64";
> >                 reg = <0x51>;
> >         };
> > +
> > +       pca8: pca9551@60 {
> > +               compatible = "nxp,pca9551";
> > +               reg = <0x60>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> >  };

If we're adding LEDs, why aren't we using PCA955X_TYPE_LED? Why the indirection through the leds-gpio driver?

Andrew
