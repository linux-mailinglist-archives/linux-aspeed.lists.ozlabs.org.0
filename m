Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37920265947
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnm2C2jq7zDqRJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:24:51 +1000 (AEST)
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
 header.s=google header.b=iwxNNRSq; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnm250M39zDqRJ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:24:44 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id i26so12203814ejb.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
 b=iwxNNRSqHQPPw7NRN3+AJDPYeet1cIe/BlZC9CmOPEmivDcmkXwVg6nAsHooODEeC8
 9EO7FQ5VufnzEfm3/j4+SKpqHNDE2sPor9HObeojQJ7mkcSDKAYX3+dgbzEnwAmX/zt5
 EgDmsRXXN/ycose+Vtdl1SotJHnNGv/5q06uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
 b=CBiIaVj7lynOu5NS7Tkh6G/LZPKAHqxUoL3a5sWB0t+YSJrr3VFwj1HC2vFDzMji4i
 MYZw/0X5H5pH3BE3xP8+9X0sHDAVMA9CD/VvPmfTSY2jSeqw1uSSPT7gnIpDmxCETQ3r
 YVKOqLoPWYXcDmcMJIWvFppcpH6SfeVejypW+uioJzFgCNMzWOfV2j36F+GcN+8COUgk
 pn02Ja+4IKrlukJei4QxbNnxC5OI1g40blEHzbWhD1gXebrDzubRItdoaUgraNVYLR+c
 MuhmSsK2oJVX1Oiv7DEAGlCJQpPc2yyh3qznXZBzAM7ltfydtPZvsS1iuqSeWr8yxpHk
 APCQ==
X-Gm-Message-State: AOAM532bn1zqaDP/JBh/You0FoCAFa29jet/YzqkQ/He9EWvpic9HRKG
 wzI+PHt0pYiELQa3rQAUc7aB33GpYexeyU4g+Wk=
X-Google-Smtp-Source: ABdhPJwGsIFct6xD49icnIdRIUypp1dR0gXkCjgcK8V0N6s7a11zNG7uif/vfB4uystoNpvqg7tfhllyjz2DhzvlA5Y=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr630416ejw.108.1599805477428; 
 Thu, 10 Sep 2020 23:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 06:24:25 +0000
Message-ID: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +

> +            usb3-sata-sel-hog {
> +                gpio-hog;
> +                gpios = <4 GPIO_ACTIVE_HIGH>;
> +                output-low;
> +                line-name = "usb3_sata_sel";

I would prefer we didn't require the addition of hte -hog prefix. It's
mostly just a matter of taste, but I can think of a few more concrete
reasons:

We don't require -high or -low prefixes, so the node name doesn't need
to describe the properties that will be found below.

Changing around node names for existing boards carries with it the
chance of userspace breakage (as sysfs paths change). I would prefer
we avoid that if possible.

Cheers,

Joel
