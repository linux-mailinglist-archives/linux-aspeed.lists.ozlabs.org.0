Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB326BC67
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 08:15:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brqb46t7kzDqKX
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 16:15:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrqZy41T7zDqHq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 16:15:20 +1000 (AEST)
Received: by mail-wm1-f68.google.com with SMTP id k18so1624680wmj.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 23:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Uh7Ou5BUk6cJr1eeO8uTrFUHXPcK3jWLNCgC2OA24Q=;
 b=bF7ghNQiDlZucq+izOj8PARhs0LWeYtHUyPVLUNneqHfSYi2PK/Fus4jFDs0nV3mdK
 lkPLn4gTbC0T/5TcL/kxu3lB5huMXQafjqEDcyfvCHrLLkrLzeIB+e3aRiLDL/TgXOUc
 CLKkhQbJydouN2RX/de6WbYT6mqqNfpHXrj1SmH0adVp066KUx6ZSjKnst8ZH29SKq38
 Ev/lbB2UJeO86YSOiPBWxTmjovE4R2Kf5EDsQAAyQfWGGQy1bSgP0BjmiXErJDgKTCGD
 LPhL0kqsh38pz3hX/MbIqXMJhUgGxct32zekR+FLpY+PWAupl+LuyDXpme2Fw1/4cPGA
 4JWQ==
X-Gm-Message-State: AOAM531js1aC/oTCVn+ilKp8FxrhOVEH9WfJByOIh5f9Xxn5UfsxKtBx
 N1BYBz9SCGgIlLEmH4KtWws=
X-Google-Smtp-Source: ABdhPJw7nNn+CFhmnzt169e4rqB2CZP7AUPFZ9UBjFZbfGui7iEULE8AHLZ3m9ra4r8Pv7DiLjNGnw==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2849155wml.121.1600236916238; 
 Tue, 15 Sep 2020 23:15:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
 by smtp.googlemail.com with ESMTPSA id u126sm4022642wmu.9.2020.09.15.23.15.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Sep 2020 23:15:15 -0700 (PDT)
Date: Wed, 16 Sep 2020 08:15:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200916061511.GA5719@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > tree schema by merging it with existing PCA95xx schema.  These are quite
> > similar so merging reduces duplication.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Can I just apply this one patch to the GPIO tree?

No, this requires the previous one (1/15) because it merges the max732x
into pca95xx.

Although now Rob reviewed both so you can pick them up.

Best regards,
Krzysztof
