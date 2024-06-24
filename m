Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4491403C
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 03:55:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VHwaME7v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6rdh05YLz3cWt
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 11:55:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VHwaME7v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6rdY3LWnz30VZ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 11:55:27 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso41755035e9.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jun 2024 18:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1719194124; x=1719798924; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv5F3gJNSVhzn+e6PbmhdJJ5gm0AtweUP0e5uStvQLY=;
        b=VHwaME7vfQrRLk7cOUiD7sd2Rdn3CRnWF/5SeYFj88ArQ6ikQiSYVvFzeOXNPnI+pG
         q9ITABcQ+hcbTmRuW+GRqymAuRk+v+NQQoZO+3FTH676KZ+ESKjzDyeIPRoYfQJwPU9r
         3B2P4h7BlZSopM0nAILRHJFRbIG5pZwRfoLkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719194124; x=1719798924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv5F3gJNSVhzn+e6PbmhdJJ5gm0AtweUP0e5uStvQLY=;
        b=nDtGAz3uCmhTqION9L8keO21p9YCENOwFHyIyINETAj8RkzERluZRZeinwtaYhCtjl
         Zlnvn45IfVc3PC5gvth+iW08ecpfJ/ptp2YIOsmuP6dct67wRNXaDL6VNU4968b5ndhh
         21QikpepudGGoqG3paHmg4yNYsq5/xXhwfnZaJ/Xw7odhB+C9OrM82f06Pa0LtL2e4ZL
         5PSxa30ksPxuZ6qDdqjHh8vao7HYf0YFwcjz3KXl8M9n7MSQm3pX/2VaZUN9sYS0MeSa
         HsXMeKkGc4BG5lTJ2fNCdkfbG+V7ANEJR+vN4hxbLfKsBbBeb5JKYiRxBy//EgoDdcXs
         jWdA==
X-Forwarded-Encrypted: i=1; AJvYcCW+fNVK+bbyE3gNwbHfiU5gT7wyhD5938kpThceIpi8TStlb+ldQd+eErYXPzLWC2CdLItlhnlT1ZbNfCFx1ln9vfwj8iMTiBvcXRwHXA==
X-Gm-Message-State: AOJu0YxbviN12Nwd3SV+z3sJ/8IQxduT0/usjAHIloXC9U+VYb/K4Vpf
	0MfTD4ACJNSZuEneEVQ4Hed1VmcbT0YOdWwDJHebed6UMlfzHRxV8E86Y1QSoxeFFK4M/pgjoLb
	aRnsWqVORGBkLVBs+qRI1YAWwB80=
X-Google-Smtp-Source: AGHT+IFNeXjFq3paeyUjIv8M9A14FXoR4HFW267SwtprEiB2S3khZdX4rFJrD0J0hkZKvSEM3C4i7DkSm+oR61KQ5uI=
X-Received: by 2002:a05:6000:178f:b0:366:ee01:30d6 with SMTP id
 ffacd0b85a97d-366ee0134b8mr2099521f8f.49.1719194124017; Sun, 23 Jun 2024
 18:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240531193115.3814887-1-robh@kernel.org>
In-Reply-To: <20240531193115.3814887-1-robh@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Jun 2024 11:25:12 +0930
Message-ID: <CACPK8Xes5vp+3YpQ3L5ix=LaDv7oWtqGFVc8moQf4D+o3rnLjg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
To: "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 1 Jun 2024 at 05:01, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The standard node name for I2C buses is 'i2c'.

Unfortunately this can't be merged, as it will break userspace. There
is a lot of code out there that looks up devices based on the device
tree node path:

https://github.com/openbmc/phosphor-state-manager/blob/3c1351cc2b63178876ef68f4107c9804d2e17dcc/meson.options#L140

Cheers,

Joel

>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 28 +++++++++++-----------
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 28 +++++++++++-----------
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 32 ++++++++++++-------------
>  3 files changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
> index 857cb26ed6d7..c669ec202085 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
> @@ -463,7 +463,7 @@ i2c_ic: interrupt-controller@0 {
>                 interrupt-controller;
>         };
>
> -       i2c0: i2c-bus@40 {
> +       i2c0: i2c@40 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -478,7 +478,7 @@ i2c0: i2c-bus@40 {
>                 /* Does not need pinctrl properties */
>         };
>
> -       i2c1: i2c-bus@80 {
> +       i2c1: i2c@80 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -493,7 +493,7 @@ i2c1: i2c-bus@80 {
>                 /* Does not need pinctrl properties */
>         };
>
> -       i2c2: i2c-bus@c0 {
> +       i2c2: i2c@c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -509,7 +509,7 @@ i2c2: i2c-bus@c0 {
>                 status = "disabled";
>         };
>
> -       i2c3: i2c-bus@100 {
> +       i2c3: i2c@100 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -525,7 +525,7 @@ i2c3: i2c-bus@100 {
>                 status = "disabled";
>         };
>
> -       i2c4: i2c-bus@140 {
> +       i2c4: i2c@140 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -541,7 +541,7 @@ i2c4: i2c-bus@140 {
>                 status = "disabled";
>         };
>
> -       i2c5: i2c-bus@180 {
> +       i2c5: i2c@180 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -557,7 +557,7 @@ i2c5: i2c-bus@180 {
>                 status = "disabled";
>         };
>
> -       i2c6: i2c-bus@1c0 {
> +       i2c6: i2c@1c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -573,7 +573,7 @@ i2c6: i2c-bus@1c0 {
>                 status = "disabled";
>         };
>
> -       i2c7: i2c-bus@300 {
> +       i2c7: i2c@300 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -589,7 +589,7 @@ i2c7: i2c-bus@300 {
>                 status = "disabled";
>         };
>
> -       i2c8: i2c-bus@340 {
> +       i2c8: i2c@340 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -605,7 +605,7 @@ i2c8: i2c-bus@340 {
>                 status = "disabled";
>         };
>
> -       i2c9: i2c-bus@380 {
> +       i2c9: i2c@380 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -621,7 +621,7 @@ i2c9: i2c-bus@380 {
>                 status = "disabled";
>         };
>
> -       i2c10: i2c-bus@3c0 {
> +       i2c10: i2c@3c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -637,7 +637,7 @@ i2c10: i2c-bus@3c0 {
>                 status = "disabled";
>         };
>
> -       i2c11: i2c-bus@400 {
> +       i2c11: i2c@400 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -653,7 +653,7 @@ i2c11: i2c-bus@400 {
>                 status = "disabled";
>         };
>
> -       i2c12: i2c-bus@440 {
> +       i2c12: i2c@440 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -669,7 +669,7 @@ i2c12: i2c-bus@440 {
>                 status = "disabled";
>         };
>
> -       i2c13: i2c-bus@480 {
> +       i2c13: i2c@480 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> index e6f3cf3c721e..6e05cbcce49c 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> @@ -592,7 +592,7 @@ i2c_ic: interrupt-controller@0 {
>                 interrupt-controller;
>         };
>
> -       i2c0: i2c-bus@40 {
> +       i2c0: i2c@40 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -607,7 +607,7 @@ i2c0: i2c-bus@40 {
>                 /* Does not need pinctrl properties */
>         };
>
> -       i2c1: i2c-bus@80 {
> +       i2c1: i2c@80 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -622,7 +622,7 @@ i2c1: i2c-bus@80 {
>                 /* Does not need pinctrl properties */
>         };
>
> -       i2c2: i2c-bus@c0 {
> +       i2c2: i2c@c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -638,7 +638,7 @@ i2c2: i2c-bus@c0 {
>                 status = "disabled";
>         };
>
> -       i2c3: i2c-bus@100 {
> +       i2c3: i2c@100 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -654,7 +654,7 @@ i2c3: i2c-bus@100 {
>                 status = "disabled";
>         };
>
> -       i2c4: i2c-bus@140 {
> +       i2c4: i2c@140 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -670,7 +670,7 @@ i2c4: i2c-bus@140 {
>                 status = "disabled";
>         };
>
> -       i2c5: i2c-bus@180 {
> +       i2c5: i2c@180 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -686,7 +686,7 @@ i2c5: i2c-bus@180 {
>                 status = "disabled";
>         };
>
> -       i2c6: i2c-bus@1c0 {
> +       i2c6: i2c@1c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -702,7 +702,7 @@ i2c6: i2c-bus@1c0 {
>                 status = "disabled";
>         };
>
> -       i2c7: i2c-bus@300 {
> +       i2c7: i2c@300 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -718,7 +718,7 @@ i2c7: i2c-bus@300 {
>                 status = "disabled";
>         };
>
> -       i2c8: i2c-bus@340 {
> +       i2c8: i2c@340 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -734,7 +734,7 @@ i2c8: i2c-bus@340 {
>                 status = "disabled";
>         };
>
> -       i2c9: i2c-bus@380 {
> +       i2c9: i2c@380 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -750,7 +750,7 @@ i2c9: i2c-bus@380 {
>                 status = "disabled";
>         };
>
> -       i2c10: i2c-bus@3c0 {
> +       i2c10: i2c@3c0 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -766,7 +766,7 @@ i2c10: i2c-bus@3c0 {
>                 status = "disabled";
>         };
>
> -       i2c11: i2c-bus@400 {
> +       i2c11: i2c@400 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -782,7 +782,7 @@ i2c11: i2c-bus@400 {
>                 status = "disabled";
>         };
>
> -       i2c12: i2c-bus@440 {
> +       i2c12: i2c@440 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -798,7 +798,7 @@ i2c12: i2c-bus@440 {
>                 status = "disabled";
>         };
>
> -       i2c13: i2c-bus@480 {
> +       i2c13: i2c@480 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 7fb421153596..0c00882f111a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -905,7 +905,7 @@ udma: dma-controller@1e79e000 {
>  #include "aspeed-g6-pinctrl.dtsi"
>
>  &i2c {
> -       i2c0: i2c-bus@80 {
> +       i2c0: i2c@80 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x80 0x80>;
> @@ -919,7 +919,7 @@ i2c0: i2c-bus@80 {
>                 status = "disabled";
>         };
>
> -       i2c1: i2c-bus@100 {
> +       i2c1: i2c@100 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x100 0x80>;
> @@ -933,7 +933,7 @@ i2c1: i2c-bus@100 {
>                 status = "disabled";
>         };
>
> -       i2c2: i2c-bus@180 {
> +       i2c2: i2c@180 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x180 0x80>;
> @@ -947,7 +947,7 @@ i2c2: i2c-bus@180 {
>                 status = "disabled";
>         };
>
> -       i2c3: i2c-bus@200 {
> +       i2c3: i2c@200 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x200 0x80>;
> @@ -961,7 +961,7 @@ i2c3: i2c-bus@200 {
>                 status = "disabled";
>         };
>
> -       i2c4: i2c-bus@280 {
> +       i2c4: i2c@280 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x280 0x80>;
> @@ -975,7 +975,7 @@ i2c4: i2c-bus@280 {
>                 status = "disabled";
>         };
>
> -       i2c5: i2c-bus@300 {
> +       i2c5: i2c@300 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x300 0x80>;
> @@ -989,7 +989,7 @@ i2c5: i2c-bus@300 {
>                 status = "disabled";
>         };
>
> -       i2c6: i2c-bus@380 {
> +       i2c6: i2c@380 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x380 0x80>;
> @@ -1003,7 +1003,7 @@ i2c6: i2c-bus@380 {
>                 status = "disabled";
>         };
>
> -       i2c7: i2c-bus@400 {
> +       i2c7: i2c@400 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x400 0x80>;
> @@ -1017,7 +1017,7 @@ i2c7: i2c-bus@400 {
>                 status = "disabled";
>         };
>
> -       i2c8: i2c-bus@480 {
> +       i2c8: i2c@480 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x480 0x80>;
> @@ -1031,7 +1031,7 @@ i2c8: i2c-bus@480 {
>                 status = "disabled";
>         };
>
> -       i2c9: i2c-bus@500 {
> +       i2c9: i2c@500 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x500 0x80>;
> @@ -1045,7 +1045,7 @@ i2c9: i2c-bus@500 {
>                 status = "disabled";
>         };
>
> -       i2c10: i2c-bus@580 {
> +       i2c10: i2c@580 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x580 0x80>;
> @@ -1059,7 +1059,7 @@ i2c10: i2c-bus@580 {
>                 status = "disabled";
>         };
>
> -       i2c11: i2c-bus@600 {
> +       i2c11: i2c@600 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x600 0x80>;
> @@ -1073,7 +1073,7 @@ i2c11: i2c-bus@600 {
>                 status = "disabled";
>         };
>
> -       i2c12: i2c-bus@680 {
> +       i2c12: i2c@680 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x680 0x80>;
> @@ -1087,7 +1087,7 @@ i2c12: i2c-bus@680 {
>                 status = "disabled";
>         };
>
> -       i2c13: i2c-bus@700 {
> +       i2c13: i2c@700 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x700 0x80>;
> @@ -1101,7 +1101,7 @@ i2c13: i2c-bus@700 {
>                 status = "disabled";
>         };
>
> -       i2c14: i2c-bus@780 {
> +       i2c14: i2c@780 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x780 0x80>;
> @@ -1115,7 +1115,7 @@ i2c14: i2c-bus@780 {
>                 status = "disabled";
>         };
>
> -       i2c15: i2c-bus@800 {
> +       i2c15: i2c@800 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x800 0x80>;
> --
> 2.43.0
>
