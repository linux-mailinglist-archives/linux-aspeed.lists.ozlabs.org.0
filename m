Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B85265669
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:09:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd1t6F6HzDqjl
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:09:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FLH0ZPoi; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bncm75YRRzDqhn
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 10:57:11 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id z23so11397223ejr.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 17:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
 b=FLH0ZPoi2B+nzLIURnXoKuWbMep6zKKPYC6feQLG4/bp/nGSAzqy6LdsXV3RObmTc6
 8YEO0znR4SkOvCAXPwiiYCi3FAjn0RenWwpx5dI/wvCOpBRBA+H/v0l7tO7VVNpkAYqz
 9fQt/MnfMtup4vD0lMBU5WRFoYhppvFPeLw+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
 b=l+MHOrnhHNMT1Nv/7m1pIpr1yfGJafnC+1FOFX4UGnHcH1Sxd/22fWQ2dOcosBlYmt
 6dzJzUMcR0685X4G6UHbrvSTN/lyOTaf/Aqdt1xwVKNfbh7ks+N6wf58KjYIe2VsIikI
 20uBOohr/mGC/adugxuRZPQs+LK/KZv9SvsfGiqK557EiOV75Sx0Bpp7pEauWtwsDiqI
 AVp7NmWyAAYOf8nUOCirFczPrMtKodbEa3hZFzkD/4fTJ7sxp/IHt3NrGL3w1cSSHWoZ
 CJqJ7BoB4ot3YVgbAEZHftzf91V2NBbyLjp3zHHLOyCmxkkX9B2MH2bs8YGwFpTfdFeS
 IUVQ==
X-Gm-Message-State: AOAM5315VrUe7oh0ck/a7edcBeyNtwdGzXvoiQDTwrx0oybwhDvgdzGc
 yEyZ868y1MDZU1OBRQhNtICmcB+7lXynGc2K+1E=
X-Google-Smtp-Source: ABdhPJzN9op/B4tSTilqcYoFaNSXY5BFurioXjFk61As43aUOnnnkGmnc7IPzMBe//QTkgP458J0K5uPVCUqFkW/EI0=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr11306983ejb.442.1599785825728; 
 Thu, 10 Sep 2020 17:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-12-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-12-krzk@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 00:56:53 +0000
Message-ID: <CACPK8Xe8ufYxKA_Xh7D=TgocRFQ7BKFdm_Le-Ob-QxZWm6PZJw@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] ARM: dts: aspeed: fix PCA95xx GPIO expander
 properties on Portwell
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Sep 2020 11:07:03 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>

(This device tree can probably be dropped in the future. I heard these
boards were very hard to come by even a year or so ago, and I doubt
they are still in use.)

> ---
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 4a1ca8f5b6a7..03c161493ffc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -121,6 +121,8 @@
>         pca9555@27 {
>                 compatible = "nxp,pca9555";
>                 reg = <0x27>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
>         };
>  };
>
> --
> 2.17.1
>
