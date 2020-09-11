Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9C2659AC
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:55:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnmj51CsXzDqTd
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:55:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=wGDEhigM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnmhy4834zDqSc
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:54:58 +1000 (AEST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B1E3221F0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599807296;
 bh=LYU8Tb5GMA6mmuFbZxVtsFi/egUHKAmHaWZZIbnXOvo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wGDEhigM8+lkU1NxKzxEtrjOx/BWGTf2++fzvR261PFG2BRGc9FTW1nj4T3BYurJ6
 nh0gM37axibQdwHIPmwmXbE1pxFvocMZRZ9oQ+pQwy6wyZ3O70XbvvKfaGcHoZeQcy
 ny4nSnPfEsKMtMcFVrANy/VC3/WHfn5eTinNC5fQ=
Received: by mail-wr1-f48.google.com with SMTP id a17so10336495wrn.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:54:55 -0700 (PDT)
X-Gm-Message-State: AOAM531TTTa8S8W0SH1a7vD/BXooJ8Spih6VPrixIpf4h0Jx6LhuKyOl
 wKJMvcxN3EoVIlu+SqZ09KFe1790bAPy/2HDmj4=
X-Google-Smtp-Source: ABdhPJwFL/7j5w+fjQzCHgD8gJxiV9FGUB6o363qCx8Mfmt5a32puUoIjMf+DBJD/BgaOz8YT/NIs5ONHQziHSJrLOA=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr730092ejj.148.1599807293350; 
 Thu, 10 Sep 2020 23:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
In-Reply-To: <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:54:40 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 08:42, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Thu, Sep 10, 2020 at 8:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > > [...]
> > > > +  wakeup-source:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +
> > > > +patternProperties:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > >
> > > I wonder if "hog" is too generic and might clash with "something-hog" in
> > > the future?
> >
> > This pattern is already used in
> > Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> > match only children and so far it did not find any other nodes in ARM
> > and ARM64 dts. I don't expect clashes. Also the question is then - if
> > one adds a child of GPIO expander named "foobar-hog" and it is not a
> > GPIO hog, then what is it?
>
> Perhaps you didn't find any other nodes as children of pca953x
> controllers?

There shouldn't be.. unless one makes some i2c-gpio controller under
such GPIO expander. But now it wouldn't be instantiated as expander is
not a bus.

> There are other hog nodes in other types of GPIO controllers. Typically
> they're named after the purpose, e.g. "wifi-disable", "i2c3_mux_oe_n",
> "pcie_sata_switch", "lcd0_mux".
>
> IMHO it's a hog if it contains a "gpio-hog" property, regardless of node
> naming.

Yes. The question is then whether to expect the "hog" in name. Just
like we expect for all other device nodes to represent the class.

Best regards,
Krzysztof
