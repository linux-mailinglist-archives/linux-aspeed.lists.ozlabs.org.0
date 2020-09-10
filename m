Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02E265666
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:08:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd1Z6dy7zDqkc
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:08:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=NWf2TTe7; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnSjD4csDzDqXP
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 04:54:08 +1000 (AEST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68A82221ED
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599764045;
 bh=XhMR0se3B2M3cCm4dG7gM2H1njurlMTbkC88FGhIKJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NWf2TTe71JDTV5fTFH3pnw3HOYxZ5ivZJJsDunUt35gp25A4mNzl407I2iacg6Psi
 Budl9qFpHKWvZJLdEln1WkpXuBpI3tCHQdwvnqxK5EHBixzH8JD2FeS50pKl/BJZ9Q
 oW6NJfp9FaoUigAD/y/1aDn9KN/rWfhNcmsuNGLQ=
Received: by mail-ed1-f47.google.com with SMTP id n13so7366109edo.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 11:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM531zVHLQcldwd0XyX1ESuRHbNDQ7dgJqqA7SGpwe5l+fixjZ4wOi
 SkJ+JKRKftWPhqjnuf38hlDc6Jn9ntTJLThq8F8=
X-Google-Smtp-Source: ABdhPJzxOkwjKIRJe1J7RhPZI8K0aJEHMtzOqR5F+V93515rBHAjgLIuO18iiQn+8UTlJNwgheXSwAxcmyXoMHMFYBk=
X-Received: by 2002:a05:6402:180a:: with SMTP id
 g10mr10672940edy.18.1599764043844; 
 Thu, 10 Sep 2020 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
In-Reply-To: <20200910182814.veviax3n377undkv@akan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 20:53:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Sep 2020 11:07:02 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
>
> On 19:57-20200910, Krzysztof Kozlowski wrote:
> [...]
> > +  wakeup-source:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>
> I wonder if "hog" is too generic and might clash with "something-hog" in
> the future?

This pattern is already used in
Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
match only children and so far it did not find any other nodes in ARM
and ARM64 dts. I don't expect clashes. Also the question is then - if
one adds a child of GPIO expander named "foobar-hog" and it is not a
GPIO hog, then what is it?

Best regards,
Krzysztof
