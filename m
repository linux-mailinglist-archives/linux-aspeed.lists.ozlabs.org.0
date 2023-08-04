Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAED7719F8
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 08:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sw0i87+1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5P55wqlz2yDX
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 16:04:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sw0i87+1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHZxW5CR3z3cKK;
	Sat,  5 Aug 2023 05:08:30 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so24153825e9.3;
        Fri, 04 Aug 2023 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=Sw0i87+1TNyjnpxDcQG2yBq3mmDztmoLnSIvDewEdu7MsRTVLhilD7q5AKtBLX6bCP
         elMoZXCrptU3/c0hUjL82BhwCUtuwD234IiW92vDvJchvI9yWOV7n3ucy+Kx7L537UpN
         ipmvlloMQL3eFNqO481bhW999WW4XvMDm6ak4OyD64Rpj8BB6hwXU8YfbYPNYGs75uOd
         /SYwTd7gX9E3bMqFbqOqYohdq/v+V4XPSZkY26rQAtiQgPWjeUZjGKHlAxIk49TCmKSy
         gHGT/pFVmDRTERB+/+brCukvg2dEggQozIodxVeorNa5WTQs0TY+qbw22NEndee1NBb9
         N+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=HE/MO1YL7FFL9tkhJwF5hknkpvA9/REJdVyqWb1N7YRPDG1L+GGTSfr4laVuksYKIX
         kOhH+w78iaWyKUZHO+8UBnGopEE/ZWwqXUauh+vJe5H96pALDDywXMavsOfjoWphRnRq
         EZEqfK+97QArveXpSNAN2K+uMiKcmoReYLwK42a2aMOgn9CR/ZQNa9RE6HubUldGK9rH
         VYWFjwyzwEjMsa0y91WCV36viLWISde2eBFF9z/EI/z2kco9nJ469hyW26r/dtqPDMov
         qmva7g5L66ImAEkJhc/UYesovF4qfp6BqrZfEycg2c26jqqDlMt0vtYmC6D1f1QVAiWQ
         gIDA==
X-Gm-Message-State: AOJu0YxAkxEzQdIItxvBe23t6wUXpj6SMylBPWnhTGNpCLD7DvP2IA6N
	txFFe7ppdiBaOG1LwNXywq8=
X-Google-Smtp-Source: AGHT+IEVrZLvF9EJvd/t1u18YqhdNyGjzTlFOtuLbcjUbAk5S3X8YO69YyZ5+NC4O8tskW7xE0E92w==
X-Received: by 2002:a7b:cbd3:0:b0:3fb:c9f4:1506 with SMTP id n19-20020a7bcbd3000000b003fbc9f41506mr2400916wmi.1.1691176102471;
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u24-20020a05600c00d800b003fa95f328afsm7461683wmm.29.2023.08.04.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
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
Subject: Re: [PATCH v2 16/23] bus: Explicitly include correct DT includes
Date: Fri, 04 Aug 2023 21:08:19 +0200
Message-ID: <2151246.irdbgypaU6@jernej-laptop>
In-Reply-To:  <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
References:  <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
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

Dne petek, 04. avgust 2023 ob 00:42:56 CEST je Rob Herring napisal(a):
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
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 1 +
>  drivers/bus/fsl-mc/fsl-mc-msi.c | 2 --
>  drivers/bus/hisi_lpc.c          | 2 +-
>  drivers/bus/omap_l3_smx.c       | 1 -
>  drivers/bus/simple-pm-bus.c     | 2 ++
>  drivers/bus/sunxi-rsb.c         | 2 +-

for sunxi-rsb:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/bus/ti-pwmss.c          | 2 +-



