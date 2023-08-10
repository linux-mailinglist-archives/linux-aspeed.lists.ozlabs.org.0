Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E47802F3
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 03:17:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=linaro.org header.i=@linaro.org header.a=rsa-sha1 header.s=google header.b=YAetKf4q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRkVq67NNz3cSP
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 11:17:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YAetKf4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM0Fj0wQ2z2yTv
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 18:19:21 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso586366276.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=YAetKf4q0nZa/dO71z7++J7KKpe1E1CC7O3ahafQ7APpHv5jmvyn5BBv2mwDpYC5is
         aCqkyV5eahWJcbkNVk0H4ZuATN+jOIeGgJTiNul2i5t9tXVMigNJA6VlxX/a8OMvNSIA
         YaLs/IE+usEOobqLkPYKtN3CknTSd/aP7iBrjDMEftqOkGi4Hzn8W27JugL/elhtZAtS
         lvN5G1ptPirqDO85jdOp47BWA9MJm/z4Kcuzuh6yVL2pnLpcF/Uw4mERq/Siv1vZ2eMQ
         WGKJAkQHqeDReRN5me9rxTKini4wIOwCZjirxG0wunRnpyvqVfZs1EDQzXiZjCK8xLxA
         VFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=SpcwBjd/zpZKAAuR3Y/L/wIdQD62dAF4ys2dTBMiGfuA0HeHcFcPvpS+cHJ/dGeo/d
         5FFf6u6Hqb8LeqMnWZ1DRrvtp5ueOHS3lPl8RKhKUjUSDHmxaMVn8Vgh8kYs+XpscORH
         ZauSrPByS+R4qRyy5mE/5dZ5xD9ddlNDJhKBW1EyJQ+OS3JQA4/pwNUCgMFOfLp24gd8
         nxYGpow5TmiGXFFovJUfxy0hLEOIkj9CdZKvt/S6rtlGnwRneCVUvGpqVB7QIqmFdqx2
         lBe+l1iPReUxab73Su1Y/afrw8+k0TJX2IAwqG6cy6XcUD82lTtIlCL5RfjT2Tp9wprN
         dx1g==
X-Gm-Message-State: AOJu0Yx+c1RjD96JKmufQ1DC1YkjIoy5xNxIBRALwyfbAAsTizTkAumV
	8hVk/k2ckMKEqA39lPt7AaYxLNUcP9QlExz2xzl00Q==
X-Google-Smtp-Source: AGHT+IG5aWoH89NQGXx33HlD2q+rxamc3JsaObqeeE5H8gH+u446bjvEEFYnXEHJg1VQn5y6v1yXRNGsOkfTWSlQZaU=
X-Received: by 2002:a25:d711:0:b0:d1a:b59c:502d with SMTP id
 o17-20020a25d711000000b00d1ab59c502dmr1894292ybg.18.1691655558135; Thu, 10
 Aug 2023 01:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org> <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:19:07 +0200
Message-ID: <CACRpkdYsdKCrQpfoXZFv1XqT-o1skX=TDY-WJ1CSpgavMb+UrQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] ARM: versatile: Drop unused includes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 18 Aug 2023 11:16:42 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Stuart Yoder <stuyoder@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>, Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-aspeed@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qiang 
 Zhao <qiang.zhao@nxp.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, linux-pm@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, soc@kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shiraz Has him <shiraz.linux.kernel
 @gmail.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 12:43=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> Several includes are not needed, so drop them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
