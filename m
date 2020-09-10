Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC39265665
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:08:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd1T50knzDqkT
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:08:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRXn3lJpzDqXG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 04:01:44 +1000 (AEST)
Received: by mail-ej1-f68.google.com with SMTP id z22so10045438ejl.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 11:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vzlILYYSQksxsWvenp+0BQ/ZzGG+3vsuxeefhQwKuys=;
 b=OIrwSh1JU2iJIvmCYefOBn367mP90w71hjl0OGeWlMrWZEIt1y8DeeICi5OMjcQQRh
 ZsUoxUejRtPjbzS3FqWAxIV4mTGFSDO0Mu3ep4fF/Gv/i4bjQCYDTBXtrDjrwGukCHBj
 LVGAfj2x/ywAiZddOvMbd74vE+pSUBanepFkCOEKsIMcySmhX8tYKljw0y2XSXef3yQN
 ns782MuKv6xDS7psz23DejcyFHy6Rx8FwjcMExIIkmFnwOQ8NjEy+GrEejIyJYUMWic5
 tIHsa6r4ObNXph8RpGKHZuSadfSUjetbXVj1VFdAGEx0yHC3lj12Rr0FoG05ga85blRO
 5zpA==
X-Gm-Message-State: AOAM532Yb+XBI6KO+ftfRp+UbnfkVrvzAUG8OBqccvueRw6Y5LtdwfET
 0nwEElDWilPYJuLLdb+N1eE=
X-Google-Smtp-Source: ABdhPJwT6JbyXfUrGZCRSOFBx+boMTdYFSDTFrULKEN0eqYHOZ15ua7zgfpIH84oBBIKMt8Sze2wOQ==
X-Received: by 2002:a17:906:a4b:: with SMTP id
 x11mr10673914ejf.368.1599760899958; 
 Thu, 10 Sep 2020 11:01:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id 1sm7839797ejn.50.2020.09.10.11.01.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 11:01:38 -0700 (PDT)
Date: Thu, 10 Sep 2020 20:01:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO
 expander properties
Message-ID: <20200910180135.GA11154@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 07:57:26PM +0200, Krzysztof Kozlowski wrote:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I forgot to add here Ack from v1:
Acked-by: Tony Lindgren <tony@atomide.com>

Tony,

I think it should go through sub-architecture maintainers, not as entire
series.

Best regards,
Krzysztof

