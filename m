Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7B26AE53
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 22:00:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYxp5PVfzDqSB
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 06:00:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYxh5VPxzDqLy
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 06:00:40 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id y74so5478461iof.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 13:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L7om6RUUpmy9Tp9WTJ6hem3a68ltpv04YXLuQ+XuUpg=;
 b=O6AVv/zc9PWo0nMndB6fvTjgbk91SBgqvfL2sXbwxDQMGfI7jQKRI19c3mp7eTXvDD
 Lk3NIgifkot+AyonBQmngGpUmjOenCuK/+v2F52s2i2l42AvwRAm98SK+NDETFcJyKJN
 X/FgoulRAw+pio4vkihtd31F70RcHMrwEjviIF9jWhXWMLr/qhkxUguHCLRVJQmLTWBB
 ARKQfH28svqlwUzw9GMeI7G9GL4Yxrx69FJ6SZXQ5r2vuVPn4ycO3ypCukLff7qb8Ngn
 eTHrp0+R8zIpLZjni7jsgkAVc/E2tUscB8CDXlLIv9jQtLuunPojZhAGXDc1fPMlX/3x
 KJvg==
X-Gm-Message-State: AOAM530RJvCtzZCjGD1ecrULse8vymM6+5RbGHcEnNgFZG52h/P2NsSE
 658xD6FD3A/q0ZWBV7jAKg==
X-Google-Smtp-Source: ABdhPJyJashEW2xOKvfkZqHZZXucxwlHXqNC9JTw65ZlLFsAeTHaT5GzkbPEe9aLJArEiug2L8iMqA==
X-Received: by 2002:a6b:590c:: with SMTP id n12mr17087310iob.25.1600200038094; 
 Tue, 15 Sep 2020 13:00:38 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d71sm9595617ill.52.2020.09.15.13.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 13:00:37 -0700 (PDT)
Received: (nullmailer pid 2409290 invoked by uid 1000);
 Tue, 15 Sep 2020 20:00:32 -0000
Date: Tue, 15 Sep 2020 14:00:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200915200032.GA2409250@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-3-krzk@kernel.org>
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
 linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 19:57:20 +0200, Krzysztof Kozlowski wrote:
> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/gpio-max732x.txt | 58 ---------------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 72 ++++++++++++++++++-
>  2 files changed, 70 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
