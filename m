Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0A95793C
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ54yNZz3dSp
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zrRuqsnA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTygF5ccrz3cQ7
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 23:32:56 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34d7b0dac54so459759f8f.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 May 2024 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714570370; x=1715175170; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=zrRuqsnA/6ayoweEx9AJLIlLGYoTIOlWZu3qh4XJKeN9f9kQmnEfgldAD9rRlzkUL8
         /p6OtOA82u6N9PYZrUP+gkQKFclOoFNWp4FaydH/VElf4BFXlYEo3w6iJDLeML3yZrt8
         Wu7rt74LK+HCBmp+2dU3QYcrDJuaoCs4QX4ma21tUBTDNE94kTZ0oV//Qvlh9DNUSoiL
         HaEJYsHec7TV9+H/+GrRcNJSzB186py4vWYb5SxSP/eTJGUtRtqrgshLjY5xlR3T10Su
         qPxdk7TkEyvQgZnqDorJgM/vXvfi+9HfFh7h7zTjlyhYSFW3OfD7UqjnhersC5tuXvj7
         CIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570370; x=1715175170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=NVnm2ewvIFrNoSDhqAb4JEnGHLWmcRZNOuqLLhsU91p0N+FPHOkWLY91Fg2Ke49cX4
         diBBZzF9Hez4NVZxff/CyunVya0wf6CsArjoBNaI5Jk7rgUpyFw79l5h/vHkzc6jeMml
         dsaOm+eMM1b31ehtieUSL2ZBpKzcpNQiHUxifx8ohK4ghE+9HkFbfgy30/CIaAKRf7I5
         zDAL6OWAPPpaeftI443UHB0x2H5UgWdO4/ca5st6acbnQBt9yFMPcpfK1QUasSrRBzSu
         8RmQKdp3ArgOalPmrRC850OZ7FXZodZn64AErYaGEdNx2WDb5SC6DvzmlPS4VgmAhwDN
         aITA==
X-Forwarded-Encrypted: i=1; AJvYcCUfYeG1bO1/QzoGjqLmGw9jXbP2O6aC/P5b8dmoVUrAG1xdX5xDHssLy/v3XECdtuV10OoiG/CCNeC2bJLgN8HtAiknp22F8eMGdPNFQw==
X-Gm-Message-State: AOJu0YxY6NgkUcKUMM+cX2KAqW5xyUuOsAilHWk38+B76fVuwddFIIZP
	ZFcqaxf/cbEthG0J80zRKmrTJHKLhuMQDfQ89BV192DAmvHjFE5xur5i6CdM798=
X-Google-Smtp-Source: AGHT+IHuNu3c35RsAkvpJAfWqKVWQhv6Z4Ac0yjTjDmpBKt12bv5Zna3drXEkGYfHrENBoZl/SwOjw==
X-Received: by 2002:a05:6000:24f:b0:34c:bf22:73f9 with SMTP id m15-20020a056000024f00b0034cbf2273f9mr2265612wrz.28.1714570369370;
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm32876234wrj.100.2024.05.01.06.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Date: Wed, 1 May 2024 16:32:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, soc@kernel.org, Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
>  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
>  	if (ret) {
>  		dev_err(dev, "Failed to register pinctrl\n");
> -		goto exit_out;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, iod);
>  
>  	return pinctrl_enable(iod->pctl);
> -
> -exit_out:
> -	of_node_put(np);
> -	return ret;
>  }

This will call of_node_put() on the success path so it's a behavior
change.  The original code is buggy, it's supposed to call of_node_put()
on the success path here or in ti_iodelay_remove().

If it's supposed to call of_node_put() here, then fine, this is bugfix
but if it's supposed to call it in ti_iodelay_remove() then we need to
save the pointer somewhere using no_free_ptr().  Probably saving ->np
is the safest choice?

The original code is already a little bit buggy because it doesn't
check for pinctrl_enable() errors and cleanup.


diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..f40a1476e4ff 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -156,6 +156,7 @@ struct ti_iodelay_device {
 
 	const struct ti_iodelay_reg_data *reg_data;
 	struct ti_iodelay_reg_values reg_init_conf_values;
+	struct device_node *np;
 };
 
 /**
@@ -884,7 +885,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iod);
 
-	return pinctrl_enable(iod->pctl);
+	ret = pinctrl_enable(iod->pctl);
+	if (ret)
+		goto exit_out;
+
+	iod->np = no_free_ptr(np);
+	return 0;
 
 exit_out:
 	of_node_put(np);
@@ -903,6 +909,7 @@ static void ti_iodelay_remove(struct platform_device *pdev)
 		pinctrl_unregister(iod->pctl);
 
 	ti_iodelay_pinconf_deinit_dev(iod);
+	of_node_put(iod->np);
 
 	/* Expect other allocations to be freed by devm */
 }




