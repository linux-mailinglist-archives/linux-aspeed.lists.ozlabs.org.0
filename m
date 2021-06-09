Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B83A0884
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 02:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G07fH5sFFz303k
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 10:44:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=bVRKLOUR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OP20yPyW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=bVRKLOUR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OP20yPyW; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G07f90Mxgz2xb2
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 10:44:16 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 62AC358080A;
 Tue,  8 Jun 2021 20:44:13 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ESiqrqHIYM7z6lCPltkbOtCTOZqyomg
 PzxWqTxX7aGw=; b=bVRKLOURloQOdEKSoaD4tMvkO3qzi7j8RZyWI4pVMP6PkIQ
 siPo8vytoxrk44Y3TIi/bkNKdN/dcjBtVy4m6arN8XRKA5GI4hGELYDaVWJVfk/+
 GdMduLxpGhfxqqA4BjnyJ8leeiNUWtAeTkZqMxKR/MS6ma8gzlEWyQqTXczKnXRp
 CH0bQqK+HQaBhIdqGB/fwu21sIEG1qN9DjVf4RdlLG3jm6+r2nUKe8/2cixjaulk
 hXJyoE5cMdhN3KqCl44UCHILQ12nrnO74ElQ+6bZvHQmSXBL7tLQWBWLgGcWv7cQ
 +nOuMmpJzgBfU1Yq6OXDOcTGhrSB/bsdWo1zbTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ESiqrq
 HIYM7z6lCPltkbOtCTOZqyomgPzxWqTxX7aGw=; b=OP20yPyWYIpKkn4lyJSIqm
 XT97jSdlU6qoeVTdz+TUxSWGyCtnrQokuJ4ZwrxHxnbuyj5APnpPs11H1f0rY6vh
 K8xeeazZT/sV8mX0SYI1ekZn35ZZv1tL2UmQD+lulG3GfpvbAZ2Y5XRZmP5hqd76
 cHw/kQleM8mKsm0isU/HFfojTMoqkl7RpTa50kHk59EnfRmrGkqpE2DvA/ode66K
 5V+ucTABwJqWPrXU4xzgj/NniEPqu4q2/goFn2+MMx+pg3OvkhSi//FyElx52CZs
 IfP/qxyk6HO3CQT8Rrx+qmtGjd+botTAqrOov0g00jEAJo1LdLLGFSGImjG5WEqw
 ==
X-ME-Sender: <xms:2w7AYEn6m6D7euzGaEN-6h6I32Y0MGdK42EjnP0Ls4q-uOe2Yot96A>
 <xme:2w7AYD1DidbHrqe3mhgqOcglVFjzyQOZbT96VU5jc0eNHp_Ot1UwOLvFgWCe067Rw
 VTXoAZk2Grj0PxZVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdffudfgudeivdfgffevueelkeekjeekudejfeelgeeivdevhfdtudfh
 gedvgfehnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruh
X-ME-Proxy: <xmx:2w7AYCrHdoRHo6trtVAv1wfE44WfSem9zj4WfP5UHhpakUNjvi76SQ>
 <xmx:2w7AYAn1HWmkrtw8tT1Oke_1WXiBzN7SXNmy57_TgqYTDtO0JY33Og>
 <xmx:2w7AYC0vd5qwYoAa18m64aD_daAxhE-r8X8_JLZ8dxR6Kp6CixGcUA>
 <xmx:3Q7AYLvma_dnswMMmVBhntIxWu4PogW7yuZsgay4bJmdkS5c9_Jaww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3B73AC0062; Tue,  8 Jun 2021 20:44:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <cef3e619-bd49-4318-bdcd-f844d2b80af7@www.fastmail.com>
In-Reply-To: <20210608102547.4880-4-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-4-steven_lee@aspeedtech.com>
Date: Wed, 09 Jun 2021 10:13:51 +0930
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
Subject: Re: [PATCH v5 03/10] ARM: dts: aspeed-g6: Add SGPIO node.
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



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..c55baaf94314 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -377,6 +377,34 @@
>  				#interrupt-cells = <2>;
>  			};
>  
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom-128";
> +				reg = <0x1e780500 0x100>;
> +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_APB2>;

The example in the binding document used ASPEED_CLK_APB. Which is correct? I assume ASPEED_CLK_APB2?

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
> +				clocks = <&syscon ASPEED_CLK_APB2>;
> +				interrupt-controller;
> +				bus-frequency = <12000000>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_sgpm2_default>;
> +				status = "disabled";
> +			};
> +
>  			gpio1: gpio@1e780800 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
