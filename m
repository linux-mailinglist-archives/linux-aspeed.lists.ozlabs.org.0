Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0C4E8B36
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 02:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRYD91jK3z3c1q
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 11:17:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=eKlZk9m4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T1KkaWlb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=eKlZk9m4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=T1KkaWlb; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRYD02zYgz2yNF
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 11:17:03 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 817DD5C00D5;
 Sun, 27 Mar 2022 20:16:59 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 20:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=mgr+q6hTcHUy/H/4YeTfVYwEJBikiFPELSPVA6
 n0Fro=; b=eKlZk9m4rJHuvkxbifHrUMfC3djZo0Hs17w+ra6OA3tEfYy1pkShYe
 LttDrB5g/1V1JichvFml/6NMGDONUH7qnDcyMvM0RmuX4BEvsro3iI0BaqfHs/fS
 4cTD7ZXsrBl+tSmVuPIRhEy3EuXKBdii80k+8V7EzOVDfO0Hzq6WrrDAfNH5Nw5D
 tc22En78/mEQfrHHmP6adV6rNhcwViUl6fKVKE8L3u3NwZwsYUS1q4zxrwS4vATg
 PLZkE9BjCbIIHEdiTrKG3khlpYRMhnUHgrUufuBKcCYJY411IWJWbV8jMJc2MkJL
 090cf+/TEufhzolYEa6Wc9uGq+EEWZOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mgr+q6hTcHUy/H/4Y
 eTfVYwEJBikiFPELSPVA6n0Fro=; b=T1KkaWlb6exVpLv3do04KXF2t69D55Ju6
 OJECInK9ceg5uVJ+ohg2cmTd21cZCTh3pyKJJw58dIXTChM/1z7cXTUQHNWej2+v
 PpKFY+1O0GsESgFiNmUDwx34tXjcDFPty6niw4akO1wEHyXYP+P2uabsJENZJwFu
 S7h54k02jADtTgdHqG4Xb5rJJQeqhprYUKXmXVlkFLwLgIC3a/TS3TdKO31QTwOk
 U42vPqSukoQEIQzAufR4/oe/ce4N6ipX0lGsl3N9OvXuGgKWAKTmCt1MOG2rdlZv
 BbsY3fCRsYkgdNSl6GPXM+WXc+5IGtUilS2SiTLrqmggzNCpk/3cQ==
X-ME-Sender: <xms:e_5AYiooPDV1cfY46VCXbcBF8ZuYuuYmE2I_DxTr1hGEIEmmeayvew>
 <xme:e_5AYgryYHGcbudzohUcjYaJcJSBN5IJ1RmxrpakYy6llEfbbiWL6FNp8ODmkIH2S
 jGCcNAt9xcYNPQATA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeuvedvvdfhffekiedtueeile
 egiefgveeivdejfedtueeifeeugeejieeklefggfenucffohhmrghinhepghhithhhuhgs
 rdgtohhmpdgrnhgurhhoihgurdgtohhmpdhoiihlrggsshdrohhrghdpkhgvrhhnvghlrd
 horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 rghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:e_5AYnNiVCTdhcAbg8bQo1VnDcSY2Au6eSuGx88Xj9ce9-AjvE_DxA>
 <xmx:e_5AYh6pSAl1ErOujtiMyRdhyQGYAUMR8nsIr1NbdpnJBbn3jG7eEw>
 <xmx:e_5AYh66zGOXxD5hTtqMWpdTYbSsBCWgx5Rq04E531Llwh-P40_xcw>
 <xmx:e_5AYug68udaaQw0McBlhAiysxGZeizb4tYr9XvQGb6iubtwCH8s6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 58509F60354; Sun, 27 Mar 2022 20:16:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
In-Reply-To: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
References: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
Date: Mon, 28 Mar 2022 10:46:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ali El-Haj-Mahmoud" <aaelhaj@google.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: aspeed2500 SPI1 control at run-time with OpenBMC
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
Cc: Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ali,

On Sat, 26 Mar 2022, at 01:09, Ali El-Haj-Mahmoud wrote:
> I'm working on an aspeed2500-based system:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts.
>
> We would like to be able to update the host BIOS (SPI1) from the BMC.
> Something along these lines:
>
> - Upload a BIOS image to the BMC. Validate.
> - Power down the host.
> - Switch SPI1 control (SCU70[13:12]) to 'master' to connect to BMC.
> - Flash the new image.
> - Switch SPI1 to 'passthru' to connect back to the host.
> - Power on the host.
>
> I'm able to accomplish this in a debug build using devmem to control
> SCU70[13:12]. However, it seems this should be doable via pinctrl
> instead 
> (https://github.com/torvalds/linux/blob/master/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c#L515-L520),
> but I'm not able to get it to work.

Right, we don't have any support for runtime pinmuxing beyond 
binding/unbinding drivers. Adjusting the mux state on driver 
bind/unbind is handled by the core of the kernel driver model.

A slightly less messy approach is to use the pinmux-select attribute in 
debugfs (still bad though, in that it doesn't require devmem but does 
require debugfs. That's bad for these reasons: 
https://source.android.com/setup/start/android-11-release#debugfs ).

>
> To begin with, a patch similar to
> https://lists.ozlabs.org/pipermail/openbmc/2016-November/005392.html
> is needed to allow modifying SCU70[13:12] via pinctrl.
>
> After that, I'm not sure how to configure SPI1 in the DTS.
>
> With the config below, SPI1 is connected to the BMC, and the host cannot boot:
>
> &spi1 {
> status = "okay";
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_spi1_default>;
> pinctrl-1 = <&pinctrl_spi1passthru_default>;
> ...
> };

This won't do what you hope as the pinctrl-N index values must align to 
the mux states in pinctrl-names, so pinctrl-1 is meaningless in this 
case.

>
> I can still switch it to passthru at run time and boot the host, but
> that's not the behavior I'd like:
>
> $ echo SPI1PASSTHRU SPI1PASSTHRU >
> /sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select
>
> If I switch the order of the pinctrls, SPI1 is connected to the host,
> and I cannot access it from the BMC, even if I try to explicitly
> switch it:
>
> &spi1 {
> status = "okay";
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_spi1passthru_default>;
> pinctrl-1 = <&pinctrl_spi1_default>;
> ...
> };
>
> And this has no effect:
> $ echo SPI1 SPI1 >
> /sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select
>
> Is this use-case supported through pinctrl? Am I missing something here? Thanks!

Not explicitly as I mentioned. You're also going to run into the 
constraints here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c?h=v5.17#n2739

Fundamentally that needs to be changed. We could do something like have 
it default to pass-through unless a driver is bound.

Andrew
