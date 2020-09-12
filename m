Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F9267941
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 11:42:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpSMJ1rnczDqvD
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Sep 2020 19:42:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eZokzSMI; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpSM44K9DzDqR0
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 19:41:46 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id z19so8327782lfr.4
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZU/zGwz2ovaC4pIMVMr+MCjpS2iaz8WzZBqdPPj3tI=;
 b=eZokzSMIQ7hJR8bFXNYglm8tUxXHklQVG1x93I2xiIKCW5A8fVxmdyT6LLArph/LNW
 QgYUy/dHVGIKPtUkTfQlGdfjSY8sa59lPD/d3tzo98w1II/rDnuzqANq6pBEOzaZpqeh
 BGq9tuaLi6LrI2zcyNLooPoSA2C+zmi+AQ0ev92rjWK0hINqDfeAwnBKrRcD2EgYhOzF
 TecwnJFY3Tw1S73W5qV+CdjGOX0IxzRUVuGkdG9RDRbTY5vbmr/kWyyTr+dngENvs0cy
 Sjdan74x6z2WafgtXy94uaA5Ibf22ntO2PBUwIGlycFidvOcLWs+NX71KQkGxcTG9xYD
 H8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZU/zGwz2ovaC4pIMVMr+MCjpS2iaz8WzZBqdPPj3tI=;
 b=ndH5KEl0LtGlTpmiKOJmfmElFlj41lu1dPtcbqR36KPJzC3zDjOU8/2hCccYx2Zrjp
 FnMmxUUHB1NTw8DUpo4hBT0dFsnOq//O6Paph7A9ARkWu1k3Sbjj1K7lNGKzK/baYTMs
 1VsKb5d3zi+1ik8Hm1MeVqgd5lc1CuQY9tY0d/I5QB0+r2Z8nesciME34un/XkJ1mCkd
 4f3fy/iZ2BMTN+XIjbkyw+6gmmpcCfJti3KGOYlH5DUQe0UKTzykSeMlNkk3ass2XTdk
 3mJlk04v17QLU0YirLZrhsEMqN4du2hV8sapPQ29OwFQSO1ZZYVzhBxcMYsn5PLaj+GD
 aEDw==
X-Gm-Message-State: AOAM530BHgEbGOu5vaMC0EMnpdjYiw1LwWW84pF3T/6g1dJx+PwhpotZ
 OYj8wOYUvVo/vTa0IJDee2CwtW3hsbk6Upzw48tslg==
X-Google-Smtp-Source: ABdhPJy4kP0f3CQ9PdpoZfSsR1ZDkXvseTxFo2z9nh5ohEpgFep9TTkvnaVgSqHW+XxIx3RTqvEqvy8k4mH5h5PDXj4=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1628328lfq.260.1599903700539; 
 Sat, 12 Sep 2020 02:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200829094024.31842-1-krzk@kernel.org>
 <20200829094024.31842-5-krzk@kernel.org>
In-Reply-To: <20200829094024.31842-5-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 11:41:29 +0200
Message-ID: <CACRpkdaR5jao0hMEUF9KC4EHQwOVZNsd+Up8U+MMKFBTYqNReg@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: dove: Fix PCA95xx GPIO expander properties
 on A510
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 11:40 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
