Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ADC278D21
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 17:48:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bybt20ryczDqmd
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Sep 2020 01:48:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bybsw1cZSzDqjb
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Sep 2020 01:48:14 +1000 (AEST)
Received: by mail-wr1-f68.google.com with SMTP id e16so4144168wrm.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Sep 2020 08:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Qh5+ZRjYoXTfTyMdsphNx4+wbs2iln0Dg7bJktrLac=;
 b=LwCfPuAcOeTL4KTO5whwUSxPGXrZLNKH3eUeDPU9nQUClEk/1X4j7UXKT17BIdd4ap
 hKsAY5viORvtbPhg0ZThcQ01f71Vc4yKVmz45oRTIj9bEmURhkVJ1KBMpYsOEp827S8X
 qv1mKg+09BL37U5UGuu8KTnocnlet3+eshAqLCD7mIJnRNqAH4XLQZ5OxRsrI6h+MXOo
 a5eiolBnDn27MLMNrmerTsxZBxp3WmOesuk8VVLAR5s92qTCwb1mJ57Pgse8cNvpaJdc
 ZbtsWLF4K+8a6ZmwIdU5Sjo586cddSiJMjyS7PDLff5t1Pjw4ieCpk7HXE8f6dNp3nR0
 743g==
X-Gm-Message-State: AOAM531g1Zd4zxc3ngpiyAkxozzCuslDGTqvqdq2Pmv7ikRAEafMcSuV
 1sbZk23w1q2IdOpyMapY9/8=
X-Google-Smtp-Source: ABdhPJw0NxnpCAb54EdTsCUv1oA2JhAAx01jYuFmqouNOz5V/9GWfo7kcmF2Z8f+IMYVxGIHsAi2tA==
X-Received: by 2002:adf:f082:: with SMTP id n2mr5158088wro.35.1601048889557;
 Fri, 25 Sep 2020 08:48:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.132])
 by smtp.googlemail.com with ESMTPSA id k8sm3477035wma.16.2020.09.25.08.48.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Sep 2020 08:48:08 -0700 (PDT)
Date: Fri, 25 Sep 2020 17:48:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200925154804.GB16392@kozik-lap>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-2-krzk@kernel.org>
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
 Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <festevam@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 05:57:01PM +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add Rob's review tag
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

Hi Linus,

The first two patches (bindings) have Rob's ack/review. Could you pick
them via GPIO tree?

Best regards,
Krzysztof

