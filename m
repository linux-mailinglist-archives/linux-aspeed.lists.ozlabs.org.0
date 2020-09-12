Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEA267961
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 12:08:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpSxk0RdjzDqtV
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 20:08:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=m84ZT5BP; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpSxZ6JPmzDqp7
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 20:08:15 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id w3so14519902ljo.5
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
 b=m84ZT5BPICoUprfBrZfjZJo2ToERzKGaIY2M6zIDJinD/VsTcZGwo12Haard8p1vhC
 MjZ8Hx1mOMoZusfjl0oIINyvWLew3L/D9Vjr6BiIPqengZMXdB/f0RVu1NZMRU2Q3z2V
 kDw7HrGgkIRJkY7ZdDYxtEtXHKR5/QKvHKBVMwnPxWhPJDa8IJD1nxJmu+ACxDeUAVRj
 eWLRVBXOA6MNERWuGkqiqoNBVFHwzaDGQ/HFBHpcyhLZgLwuWw0uLKa/KkF+xDYIC+Fm
 y512jagysE3SZE1JiPHWpTndTacUnZvwMYiNVx5FAlo6DD9u1U+4vzX3/glDN2wD5pMh
 pEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
 b=JwXmHoQRJeGamGaD+i4gP+fa0272bhyc52hbNZ8iKjcVrfxu/Z1a5i42SSB6B01/5t
 I/nEjUxLut2oGKTK4+X89R6/Sx7Dtsz8q3OY9Ig7BFk35JVXoQ5dYG3nXWAIn0VkIXcG
 ub98rT6dvg+/bXTl3I5cfNVyzn1MGazZYeU8Ua/QnBln7zsZZ63fcZBG6DRTztPe1WAr
 QyiGIHBBhuX4Ua+zm46oZ6eLXqua+7eAYQQR0M7kcDQLG8PUQUmOlNYxzZeUlVsEj1X6
 NxFf5CLFcsnpJZbanNsVc/kgYJjAGRi0IvM4sg8L8Zkexvtj7/CsHFEDgTFPG0rl4FrK
 CcZw==
X-Gm-Message-State: AOAM531qJp4/gFv7vW6dBvgwK8h6N1ZZxMuRtBOfZrt4bNCnyUXz8Mlx
 Wl4or2htS/dWQLibpL+wAsa2GtbzqitWESdBte0oVQ==
X-Google-Smtp-Source: ABdhPJztH8Y3Zl30n6XdqCSNpq33ojnWBwr/h05qXrY6CWiTumbfWA4LLSAc0k49IpbpJ+j5i9pFRwI9T1f7AE6sj0s=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr2308597lji.286.1599905290685; 
 Sat, 12 Sep 2020 03:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
In-Reply-To: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 12:07:59 +0200
Message-ID: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Grygorii Strashko <grygorii.strashko@ti.com>,
 Rob Herring <robh+dt@kernel.org>
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
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> More over, there is already generic schema for gpio hogs: gpio-hog.yaml

Where is this? I don't have it in my GPIO devel branch for sure, and
it is not in linux-next either so not in Bartosz' tree.

I did suggest that I want a gpio-common.yaml file which includes the
hogs.

> Originally, gpio bindings were defined without restricting gpio hog node names and,
> generic schema follows this.
>
> I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
> if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).
>
> gpio@20 {
>         gpio-hogs {
>                 yyy-hog {
>                          gpio-hog;
>                          gpios
>                 }
>         }
>
> But this require as gpio code as generic gpio schema update (with backward compatibility in mind).

The whole problem I have with the DT bindings is that defining
them is not really a Linux problem and the people maintaining it even want
to move it out of the Linux kernel tree. It is supposedly the responsibility of
all operating systems using device tree including but not limited to BSD
and Zephyr.

But there is noone picking up the responsibility outside of the Linux kernel
tree except for Rob and Rob cannot do everything.

With things like this it breaks apart because noone takes the overall
responsibility. And as subsystem maintainer I am fully overloaded with
the Linux side of things.

This is of course not your or anyone else's fault. But:
GPIO DT binding maintainers/writers wanted!

Yours,
Linus Walleij
