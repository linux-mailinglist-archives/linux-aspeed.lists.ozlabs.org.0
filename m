Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CA267955
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 11:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpSkc0L9bzDqv9
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 19:58:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bNkjodzg; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpSkT1brQzDqmd
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 19:58:37 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id u8so8362439lff.1
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
 b=bNkjodzgEyCHQlbMXE1deFOC+aEb+jZ/eg8pcskEb63rdUJ+ZCeEv0qADusqXyFQlc
 A11APrQ8MRSDsiGuWjfcWfUicTuhJdcfAwBCzSZF3AI2dko5bJJE/+P6P2RvpWhV/ZJW
 cfRKDxMcMAwi4jqwEY1QL3E8PLR7qOl6D3LhtSY1EQ6kna+PNpHDhnbZq7o1e4oNRtIS
 k1tXIBeWW3YzjbDT0D4KMDI1g6L5EVxNLSjlbe+aE1Qp3BB7uy1GKQ1k68s6iGK5THKQ
 hs3cS8rZn+V42ez4GUuUuM1DpR5Vs3XOaoHye7MswUQ7kohVMsfNhrpYFV4O+DHq4uKk
 M7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
 b=Crc2dIo1KODTi0PaHEfGmG4KFJubBgTgCeanOv+TSnlHeJlllNFpz2c8XXTu6gdHIp
 0XaL4H86jpnBYE+CGDZSTWe/Y8Kn5pGNfSB1N414z9hl9ssNUpzDT+IuOd27Wo9lPdky
 851/E3Mqltsh0Wa0xgu2wPACi3wuZYJE6FUefuz1I70YSOX34eO153/SGFOXC1AAk7W7
 nyyApLzhCi/N9/ANNuL7fShPSUvWcRD7T6QM0wvXBMpGXspA+CAbQhv1upaLW2SSnPlo
 ESHdbQ+i7N1awLSr7no7j0yUgYeKQcAsSVpyo5GpSxu0aDvrz8sa1bdKsuliIu8iOjGU
 7gXw==
X-Gm-Message-State: AOAM5321YQMLQYgRGkZ1jp6OsTUjjHg+C1gQhQBJJT2cJXQRFw7eLqQc
 JOoloV+so9qkJ22FERohTfXlP8Ds81Ut2jVzbKFPXQ==
X-Google-Smtp-Source: ABdhPJz2DrvLqFno9Czac040PFbYE4v0es0Eq6+34Rf534KupzpDXiQZE1x4bI74fTkUy2VMuaKKZBCTxqQ4dSSRceI=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1358539lfb.502.1599904713123; 
 Sat, 12 Sep 2020 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-3-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 11:58:22 +0200
Message-ID: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
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
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Can I just apply this one patch to the GPIO tree?

Yours,
Linus Walleij
