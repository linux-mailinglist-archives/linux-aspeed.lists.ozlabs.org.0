Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D84274EB6
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 03:51:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx1PJ6hHRzDqZ1
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 11:51:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=matthias.bgg@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eiCBPrtD; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw01t4VCnzDqR6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 19:46:07 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id z1so12020190wrt.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
 b=eiCBPrtDbQz9fZpSRMUVbN6HVT+LTVz2w9MZX2zQfNgGbnCdcsn5WeyL8Qcx5+1g8T
 9f872qU2PLofzXy9DUTawLWrew/J7qTtkZTiRDYSaXvhieK4GNA58JQuLyrVGsoZfrN3
 yARyCoQqcCMVcFeWbC7kCcoWTdc7VsnaJYVp57FQSbfWTL5qUgWpqetSd7kJsmpq3Tl1
 O/dQqLtq1BJZu6cjPVEFpNbG0wN7JiEh/rq+O3muezrENYoo4tjwNy84IQgCoWkCY3mA
 3nIGirFmE95me64ZAnC4fcEnl9s6YyR2ypK6aQPvSH8C1tLyRsTKX6KU2vjoW94K3Hwb
 N/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
 b=qz0VBslhviYzYL5ANtgy8A82RDDUsP4A/7FGIvyKIr1vQF//96wH5SxmHH2Y2wK7AH
 vQN/Dnht2NSBxJ5MQbTSFwnDL5Q9Ux19tgpTCapVezw5JLBEgby4veJxzf3MHXKcMpEn
 GF7YgIjsIy/DWqdK1zlpvIPBA1X7zdhnN51esd8Tu7vPMuHxaRR0ArouPbjxqb+CGY4a
 RsA8YN5StPYSCJBHjOB7ZYb1mN8u1ZBRIHCwJpHFJKOVXrfu9RPJ0NxarwNL8nsRbtCx
 140e/R/1CPfER3MP78FSRwSYmZkwa2cR5jnduXe8Yt1mlUdva4VoIzbdH8e0jg4K4Cwt
 TEeA==
X-Gm-Message-State: AOAM530OMqH6X5o7hymBHILPDDDcT/JFcXE+b6dNxn2z7RIkK9snypCd
 Ld6ZNgt6BOkSZaY//JASR+Y=
X-Google-Smtp-Source: ABdhPJznDhgMre1h2yMv5CA2MkQwbd2x1oCcy4YKpIiOFgYsBiNKv6yfhzZXlH8PLSlsOD0bvbtTBA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr51052257wrs.218.1600681562851; 
 Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id t202sm19475945wmt.14.2020.09.21.02.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] arm64: dts: mediatek: fix tca6416 reset GPIOs in
 pumpkin
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-4-krzk@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <911e34dc-3516-d15d-89d6-1e234e9309f6@gmail.com>
Date: Mon, 21 Sep 2020 11:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910175733.11046-4-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 23 Sep 2020 11:51:25 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 10/09/2020 19:57, Krzysztof Kozlowski wrote:
> Correct the property for reset GPIOs of tca6416 GPIO expander.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index dfceffe6950a..29d8cf6df46b 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -56,7 +56,7 @@
>   	tca6416: gpio@20 {
>   		compatible = "ti,tca6416";
>   		reg = <0x20>;
> -		rst-gpio = <&pio 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&tca6416_pins>;
>   
> 
