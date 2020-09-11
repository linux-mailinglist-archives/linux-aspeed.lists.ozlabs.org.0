Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B72D2659A6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:52:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnmf74y35zDqnZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:52:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dkCscqbJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnmdt5NdJzDqm6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:52:18 +1000 (AEST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A4C822204
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599807135;
 bh=PvPqMWHR4rTZyg0mx7guwNSzHx2gYCEab6A1OsvoQGs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dkCscqbJ3BxxdnaZ/s6BEfah6323j4W+ukH0h4kgXUSZBGSjPNCszgETLQuOlSPY+
 hHHXjPeIlp/SzfcWA71QsgsxVyqpB3JKnaxx/jDzyjpc1piRf3TCeZ52f9cJLoW0M9
 h+RhyvvwFCHIqbOUMC6NMBXmO6EsGTjTqgCsKeBo=
Received: by mail-ej1-f51.google.com with SMTP id nw23so12326587ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:52:15 -0700 (PDT)
X-Gm-Message-State: AOAM532Arxl9DMTjMwWdeeULoKUZkN5Oj3qNBjd1IteDdl5qa1bJkBrx
 vhJuAm0ll/n8o2yi4La4QDxEKd7+T51QeNg1jME=
X-Google-Smtp-Source: ABdhPJyQsp18R1aO6xomXKrS4P4TBW8oLLN/MwZ/kE/MYbR5zlnBByW56Q9pS5gbWiZx5BgY7fQIaaEpv0zAcIPIrGc=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr722021ejj.148.1599807133943; 
 Thu, 10 Sep 2020 23:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
In-Reply-To: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:52:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Joel Stanley <joel@jms.id.au>
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

On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> > schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > +    type: object
> > +    properties:
> > +      gpio-hog: true
> > +      gpios: true
> > +      input: true
> > +      output-high: true
> > +      output-low: true
> > +      line-name: true
> > +
> > +    required:
> > +      - gpio-hog
> > +      - gpios
> > +
>
> > +            usb3-sata-sel-hog {
> > +                gpio-hog;
> > +                gpios = <4 GPIO_ACTIVE_HIGH>;
> > +                output-low;
> > +                line-name = "usb3_sata_sel";
>
> I would prefer we didn't require the addition of hte -hog prefix. It's
> mostly just a matter of taste, but I can think of a few more concrete
> reasons:
>
> We don't require -high or -low prefixes, so the node name doesn't need
> to describe the properties that will be found below.

Thanks for the comments.

It is not about properties (high or low) but the role of a device
node. The node names should represent a generic class of device (ePAPR
and device tree spec) and "hog" is such class.

The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
uses such naming so the best would be to unify.

>
> Changing around node names for existing boards carries with it the
> chance of userspace breakage (as sysfs paths change). I would prefer
> we avoid that if possible.

The impact on userspace is indeed important, but are you sure that
hogs are visible to user-space via sysfs and configurable? I guess you
think of deprecated CONFIG_GPIO_SYSFS?

Rob,
Any hints from you about hog-naming?

Best regards,
Krzysztof
