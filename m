Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28739EA1C
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 01:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzV240xRLz2yyG
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 09:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HgSEJu9c;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B7NFnr6Z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HgSEJu9c; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=B7NFnr6Z; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzV1x3RmYz2yWx
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 09:29:09 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8BA23580533;
 Mon,  7 Jun 2021 19:29:06 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=JeacI608ztlENt+g/Kfe0iOKdJjNDia
 HCrhjdIxMGDE=; b=HgSEJu9c/q8HnpLV3yCHbHIKtSQuICOrEk2tT4mVGEHDpBe
 Rt5XHfJmxBZSRao6WXuT6jslFlHOIWAhe9TtXjprc0a2T8YrhwAIoMrlj70r1PHG
 4zPsukok5dP9eUN9ewQvnhqQkEajUbYXIA7/QdDhl3YPSHBnt+f4ZPhzFz1ibS96
 xYcDHZVCyawm0m+ANkLraLmHyv0X1DCM+Gl7mQTZ7b+9heI3jx/h9BfLYnY8sxLu
 kTYZK6iy3bgcaySWE0BoCHYiul6yAAwKv1js1Sn/5UHq5l/UJ1taS70HI9sPjs6G
 le1l56VB1UHUiPsKScXW46cciKa1yHxfDU4888w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JeacI6
 08ztlENt+g/Kfe0iOKdJjNDiaHCrhjdIxMGDE=; b=B7NFnr6Z9CaPmmwhvz4tZA
 WTDlxEjHuE9/hKP5XB+UgGuKHCJkd+Eau5yvc/IMD/BaTtbgbEUamyrnB//WVaDP
 RmlgfRb6BpomRG+QL5ZRi0mucx1NBhYNCvPL+jUWngVGhm1iRKshBtIIAFr1qbss
 Bnp6HHBmfq05oGRKLPynHs4BWeQhQs8/AxR4+KiEm+9j8zgDPwh0l+Q8YidR5jdd
 dklqR5McUEGpBHl4qUthcujFsHo+7GWZU6CDwIqyTCZI+zYitAFDvV5Lw1g7LYXT
 +4+DnWrpDW8vealbFSm/CMSDv28GDb6/K/jZYfApE+2YNNUih29/8oJDLS0D9aGA
 ==
X-ME-Sender: <xms:v6u-YPSeiImkXurjzOJpXHSPUgjk8IjbJXlNCLMCombKb85hRg_3ug>
 <xme:v6u-YAwC4bazm7e1Gjquvj0TBYETi2hWPH57tu7Nx77V1BwPcSRLQo-2ITg30Vt1d
 BHqtZ_1Zse_Z5v4jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:v6u-YE3_FEjyQ7xSdMbwrrMst0vlwckPfnsAxofLuy1W6dwODYJwOQ>
 <xmx:v6u-YPBNL_SWodZo2vhfGpwijcuR5qxyHuTEwQEhdRSVozjz7u5psw>
 <xmx:v6u-YIiTra2l-0jXkk9UYftWEa8xWEx7kHVwU5Iaooj5lp_5ZXtQWQ>
 <xmx:wqu-YNYXQN4LeH-s0U-doqGLYC-FVKzOfnb6n5Ng9QJAJ5kaj9DxZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A3E24AC0062; Mon,  7 Jun 2021 19:29:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
In-Reply-To: <20210607071514.11727-4-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-4-steven_lee@aspeedtech.com>
Date: Tue, 08 Jun 2021 08:58:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] ARM: dts: aspeed-g6: Add SGPIO node.
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
Cc: Hongwei Zhang <Hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..c09b24824b6d 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -377,6 +377,36 @@
>  				#interrupt-cells = <2>;
>  			};
>  
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom-128";
> +				reg = <0x1e780500 0x100>;
> +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <128>;

Doesn't this affect the way the data is presented on the bus?

My understanding is this should be defined by each platform, not in the dtsi. Having said that, it appears it is specified in aspeed-g5.dtsi (as the value 8?).

> +				clocks = <&syscon ASPEED_CLK_APB2>;
> +				interrupt-controller;
> +				bus-frequency = <12000000>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_sgpm1_default>;
> +				status = "disabled";
> +			};
> +
> +			sgpiom1: sgpiom@1e780600 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom-80";
> +				reg = <0x1e780600 0x100>;
> +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +				ngpios = <80>;

As above.

Andrew
