Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F287AD0796
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:45:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Th1tBszDqLb
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:45:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=baylibre.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=khilman@baylibre.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="1g4svc2i"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n7m52ZYBzDqBj
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 05:09:20 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id d26so8684084pgl.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2019 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
 b=1g4svc2i2jhyiyQgS7H2WqaqlY4rawaEfSSoyLIcO9cblF0u1gFFqp/KTw35+0FZfc
 MwzkbFI30GsMRmv2OloegWaVbSjb8KDnm+dfMEbweYWsOm1wGCxZsUSg/z+13uH3xzh1
 RupL3Su0rST4Jq9HoZjj9nGm9XoyTwDep1/8UQyx/IVu9uLc6qpUfKWUlHyLvUMgJXNW
 aB2X3gCDtmoi4cYwtVghiMaLgJrHmdzn/5lss3HRCyoE4uQU4faG8oZ0vBV7mGtmCjn5
 1yBEDl3LzEuJXvBb0Jp2SepKw/cROrKcSFBMbcUwB1odwRJ0Wn5DcdTOh2g1tJhlI8t4
 bchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
 b=TkDq7Hl2g9p3KuibQW4pSsjTu1a/SaTqejYPzfGFn9YtY9tXkFM2BFsPjvveb2iusz
 fhCk/Uu0ZGJfYHeo9cQMaEqRu1Drrhjv3jET0HOsJoS9PWWVzLQpefvIXheQOX47YAN/
 GOP4VZ3gpQMAV2Y6o8KLYluw4CoCcYOoTuaHi4iz3TN5O0Xx9jxYt48Ez2mIWZwTFS00
 OG6tQtUUY6I2pVF7ovc+qum2EWRrbUvDJ9VoIdgEGvPM9DOb9vfJT2r7kBY0UQacRPPe
 sut9QbeN5bJHe8DpaBlMirA78OMI3WQ0nhhcAwTwnH6NWITiusopHsu0YqZpyNecrWV2
 9JbA==
X-Gm-Message-State: APjAAAVYtlT1zvycZhvZJHmx9PbDEGq7OELbjcshjIicr1X9kZgpS5oZ
 9/glLL/rSNkBQSTAEYSyYdryAg==
X-Google-Smtp-Source: APXvYqyCq2Sjyl//q7G2IzZThRFyehP3F/3geHI2eKnTCZnkHRsOjKjZK4tPTO1jHMEhvfanawQuGw==
X-Received: by 2002:a65:688a:: with SMTP id e10mr31994989pgt.221.1570471756657; 
 Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:bd18:5fe6:bf81:d473])
 by smtp.gmail.com with ESMTPSA id s73sm155793pjb.15.2019.10.07.11.09.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: YueHaibing <yuehaibing@huawei.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, joel@jms.id.au, andrew@aj.id.au,
 nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
 computersforpeace@gmail.com, gregory.0xf0@gmail.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
 baruch@tkos.co.il, paul@crapouillou.net, vz@mleia.com, slemieux.tyco@gmail.com,
 eddie.huang@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux@prisktech.co.nz, michal.simek@xilinx.com
Subject: Re: [PATCH -next 16/34] rtc: meson: use
 devm_platform_ioremap_resource() to simplify code
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-17-yuehaibing@huawei.com>
Date: Mon, 07 Oct 2019 11:09:15 -0700
Message-ID: <7hk19gfmwk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:38 +1100
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
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

YueHaibing <yuehaibing@huawei.com> writes:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/rtc/rtc-meson.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index e08b981..9bd8478 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -292,7 +292,6 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	};
>  	struct device *dev = &pdev->dev;
>  	struct meson_rtc *rtc;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  	u32 tm;
> @@ -312,8 +311,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->ops = &meson_rtc_ops;
>  	rtc->rtc->range_max = U32_MAX;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.7.4
