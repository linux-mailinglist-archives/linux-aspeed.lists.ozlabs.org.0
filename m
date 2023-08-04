Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE27719F5
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 08:03:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P52o47d9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5Np71DDz2yVZ
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 16:03:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P52o47d9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHSxl4CHqz2yGB;
	Sat,  5 Aug 2023 00:38:18 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbea147034so20705915e9.0;
        Fri, 04 Aug 2023 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=P52o47d9dHG1aUMZwk0pd23gUMU1gSEcAaorjtm0PUBSc4CTskirX886xdzRJezLg6
         M4MtQIA6juxB9+sFPFH3EPWi9hMPTVDd1wwyWh3PmXuu1po0m+repmiBQFo72mEPoUaF
         CKzmuVyB06487jxO3URnO0OYZ2cjQP/ZYPY+Ly4YmQO1h8Ul1MwxJiS6CzfTEpBkUg4D
         GvHC2AtRasiPCNfOkLFtYCr2iYrhUrXdaNuwr9xpfY5akGkjLPDtWAHv3doGspA8ZqzA
         BVho52Djxf/ClpbDDROl0ciKQJHwoe5ELFkv+xQsoTFDKnytt8GlFd+Ntd6Geakv25p/
         LA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=cZSD+9KLWZBFNka9d1iU1tQU9nnch+rP4eSHYhmFJYmCRv9q8fY/yd9OXG6UJIGA+m
         Ur/V+5W8mJJdmlgI2doxiX6K6R+4apHs6k45LI8CLPJo68sq3hOYAjABwGWbCs9NOrme
         sx5iadL+mU/684DENd1lSVSD2JyM1GtfJLjQkuQUp8wnAys7+Pg+Bz07ddt8y9/Iavvh
         COMN/9EC+HcfVcKe0NrKKjNguUgYIFq/hpDwATDsrkOljLWwqEVpS0AHbrSWIWFb/bvo
         KJYKG9qgnhVkLzAw0ajA4SpttKFzAchgpb6UUHogZ/1txOVOsacHSsw8G8XJE6HNETsq
         zIzA==
X-Gm-Message-State: AOJu0YwrptMLUmuFkELzzFPVJw+lOJqFLERvUJOxqPDkspdVZ+caEjUx
	WGIE3u8pEZA+YacbKmPBTJc=
X-Google-Smtp-Source: AGHT+IFR8gDqjRYqyXRMOxF0JJDJ3mrxElW64dDSszEM8SNr/lPevhKIntH0L12mO9e2OcoWVt3KOw==
X-Received: by 2002:a1c:7c05:0:b0:3fb:e4ce:cc65 with SMTP id x5-20020a1c7c05000000b003fbe4cecc65mr1591896wmc.25.1691159894687;
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fba92fad35sm6833727wml.26.2023.08.04.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Has him <shiraz.linux.kernel@gmail.com>,
 Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Subject:  Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
Date: Fri, 04 Aug 2023 16:38:11 +0200
Message-ID: <2690872.mvXUDI8C0e@jernej-laptop>
In-Reply-To:  <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
References:  <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 07 Aug 2023 16:01:51 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Should I take this through sunxi tree?

Best regards,
Jernej

> ---
> v2:
>  - Drop sun20i-ppu.c which moved
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 4c4864cd2342..4458b2e0562b 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>




