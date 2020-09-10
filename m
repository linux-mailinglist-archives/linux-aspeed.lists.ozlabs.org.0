Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F8264A57
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 18:53:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnQ1y4skszDqhb
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 02:53:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.65; helo=mail-ed1-f65.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnQ1s1QJ3zDq9B
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 02:53:15 +1000 (AEST)
Received: by mail-ed1-f65.google.com with SMTP id q21so7046615edv.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 09:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3nk4XRQ2S4e5AEFEFMDuymF8Jl6oZV0YsM2IeVg++t0=;
 b=S+uIA76trh+4fJXLsL2EZuRn6MAmY6LAXAh7nFfZyUKn+C23l5eOhSgMxg/Ew0AfyD
 DLebke3WBjem+nwU7zAcRIXTFFfu6buKFEyum+7PoFYUS4q775BmdmQyYP7lxJyxKQyx
 qZK21QnGgSCTJ4Y7Wgw6BVjX+tNz3cmXuREM/Bm4rShQdyeyWq2jaBZeIgSfhz8fwLlT
 bP1Dwhhw1pOD8kErIwP3YxHWFJgZuu98MDRMskjPLIRi3NrbqIV72mL74P1ApHrbRib/
 iLcj4ItG5gjYlgp40zwuvbfcrJ38gZcZzDk4ERu4cOqg2CnUzSDeT+litwtQSUVM0IGY
 QrSg==
X-Gm-Message-State: AOAM532l9n+YGcfSDu7XwACnb+BSqyulb3wVk81o5/Xnk/61UjNQdWs5
 xY67dabPJs5mdu4I0FPVZbQ=
X-Google-Smtp-Source: ABdhPJyquD6+nZSxDAFxh5wceHTIih3xdZbNqTBnMJD615DtbqdBY7qzu8F3twgU/y/4F0Tvr77Hdg==
X-Received: by 2002:a05:6402:cb4:: with SMTP id
 cn20mr10351438edb.369.1599756792337; 
 Thu, 10 Sep 2020 09:53:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id 35sm7851689edg.71.2020.09.10.09.53.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 09:53:10 -0700 (PDT)
Date: Thu, 10 Sep 2020 18:53:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 4/6] ARM: dts: aspeed: Fix PCA95xx GPIO expander
 properties on Portwell
Message-ID: <20200910165308.GA11510@kozik-lap>
References: <20200829094024.31842-1-krzk@kernel.org>
 <20200829094024.31842-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Sat, Aug 29, 2020 at 11:40:22AM +0200, Krzysztof Kozlowski wrote:
> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
>  1 file changed, 2 insertions(+)

Hi everyone,

Any comments here?

Best regards,
Krzysztof


> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 4a1ca8f5b6a7..03c161493ffc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -121,6 +121,8 @@
>  	pca9555@27 {
>  		compatible = "nxp,pca9555";
>  		reg = <0x27>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
>  	};
>  };
>  
> -- 
> 2.17.1
> 
