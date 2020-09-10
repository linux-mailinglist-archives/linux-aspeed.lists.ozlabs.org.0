Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D90264A5A
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 18:54:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnQ342B30zDqhY
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 02:54:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.68; helo=mail-ej1-f68.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnQ301jLFzDq9B
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 02:54:20 +1000 (AEST)
Received: by mail-ej1-f68.google.com with SMTP id i26so9697326ejb.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 09:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+RRvOyKYsSB07pFbec6LrWNZNZGtC9Skn84W6Crqbc=;
 b=NT8Vyfdye31+BRktZ05BOEIJNLrtqweiIPy1Fq7YGO/aawEmalWn+vp4HON3hqYu/6
 6Px3X0Sq/Y2u5pNsjSwveHQuxA+G4FCgA9EcCwIvgCs+sQsdXGw2e3jdINId8Xh21+Va
 +ob6PQtqmIGVB2w6/LuH3W1EzbyxDCyQO7P21gKQJU7UZFmuhFb8rwrBYaT8IZyvT3Sw
 dpM2adZEoknjl9tLWYL3L9ZhzHYRT1MHJDfQ//JXu6labhIIG8ec//DXvjkSiiEc/Twj
 zADJUWJgL8ITuF23WtYnunCqrw3PbpxVrg+DRcuZm5TXSbXz1yOFbDQhmuaWaQ3XHeUo
 3rEg==
X-Gm-Message-State: AOAM531l99+m+HUn5G0gio6uP5TJuAK4Epk6rWhmY0TRceqRiqDXL2iw
 r0G9F1yBpmlER6g8VhI426w=
X-Google-Smtp-Source: ABdhPJyj5xfspeBLG8ppW3CbSisewa6vNwOrvIyYECPfXCHzGxITo2vMAJd3CXmp+RnBY0Xa2JprUQ==
X-Received: by 2002:a17:906:cf9b:: with SMTP id
 um27mr9876859ejb.66.1599756856544; 
 Thu, 10 Sep 2020 09:54:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id p20sm7917053eja.18.2020.09.10.09.54.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 09:54:15 -0700 (PDT)
Date: Thu, 10 Sep 2020 18:54:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/6] dt-bindings: gpio: Convert bindings for NXP PCA953x
 family to dtschema
Message-ID: <20200910165412.GB11510@kozik-lap>
References: <20200829094024.31842-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-1-krzk@kernel.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 11:40:19AM +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ------------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 138 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 138 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>

I will resend the dt-bindings replacing unevaluated ->
additionalProperties.

Best regards,
Krzysztof

