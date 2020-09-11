Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A0626597A
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 08:42:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnmQD4T9rzDqm9
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 16:42:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnmQ71FNyzDql8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 16:42:06 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id m12so7526606otr.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 23:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fd37rPIKQ8kE2t3AwO5/OmIuIXHedyKotPXtUMjyF2w=;
 b=OfCq6EAJ9tj8PyPGK98EeWmBt+tYMbh2d2SY6zjUDNb34OHohG46ZDT/n427kKYLug
 +i9sncB2XroON6pbkk/FH97gNN5Y8XuZ/2PmFBd+PR/fvJEnN45mWSy35h0pTbJSI3U4
 t2CpA2B26EVhCBLfFB7CIgv3Y+48/RtwXQPTBI8ue5TC172l+xgEQ91Zth1/L4XmqwOk
 hvLHuB85rFiHBkAmVHh2pBYmlSwlFKJLlfJceWaMeURqi1JRzsI9mNwey3ufEZdBdVlb
 mjJbK+uOOJEkC8uU5HWvSK7a+h3XstJJDDkcoWUe5Sf1eRwvly7jpDuCA/PlKcgtoO7A
 +Pvg==
X-Gm-Message-State: AOAM5337AQQXO3hooMVyGpYwEWWG27NUI8+u9H29kH6g+Su//ZBd7WMC
 A1kSF46wYnOEPtzZmZBbT8HYQFymIiTAPAUwoWI=
X-Google-Smtp-Source: ABdhPJyHFeXfHoxVfoXb/lF9obDK4GQsw0s+uaaDCZdbjIAVpoMuCLbEzubvLMnxtVhpCEHmoeJzN55crOToqaVuB8s=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr296058otp.107.1599806523827; 
 Thu, 10 Sep 2020 23:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
In-Reply-To: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Sep 2020 08:41:52 +0200
Message-ID: <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
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

Hi Krzysztof,

On Thu, Sep 10, 2020 at 8:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > [...]
> > > +  wakeup-source:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> >
> > I wonder if "hog" is too generic and might clash with "something-hog" in
> > the future?
>
> This pattern is already used in
> Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> match only children and so far it did not find any other nodes in ARM
> and ARM64 dts. I don't expect clashes. Also the question is then - if
> one adds a child of GPIO expander named "foobar-hog" and it is not a
> GPIO hog, then what is it?

Perhaps you didn't find any other nodes as children of pca953x
controllers?
There are other hog nodes in other types of GPIO controllers. Typically
they're named after the purpose, e.g. "wifi-disable", "i2c3_mux_oe_n",
"pcie_sata_switch", "lcd0_mux".

IMHO it's a hog if it contains a "gpio-hog" property, regardless of node
naming.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
