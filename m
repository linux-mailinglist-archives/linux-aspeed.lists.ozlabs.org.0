Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D07719FC
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 08:04:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sty5lhf/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5PG5g8Fz2yVc
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 16:04:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sty5lhf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJcxS5Gm3z2y1j;
	Sun,  6 Aug 2023 21:42:03 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5230df1ce4fso4799113a12.1;
        Sun, 06 Aug 2023 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=Sty5lhf/+MyIEk4hwQ9cvBMD8WViZJPDvPtKFCwKiOj31yKv1xg8RNt7qVng+uuxAB
         dF0J+R1WzMezzlkqB6H3KudnW8pfvn392k/vzmJc+BF6eMwm0XAI9JYi8u3ebjqPp4YW
         6nPWSX99BdkyZld9vm3FaE1/bmmc2r5N8d/VXv2A7o00bUBkNjopUPw/htodQjibsRtM
         IByA4tpKN5ijL6QCap/t2vppD4mGMCtkg+7Jl/4q9XFGGS2tUCtlhYEvXF7Ddqrri8pb
         rgQkzkiawXEXsCF2b6/EgR5dtx5G/51BSm3cSDohUepsNi7iKQwA9xvMfRcxifgKNO9W
         Pe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=RQHJXaxS1EX5nMJLbo+MGJ3D45+csp0QF6IRhRYSFrL4e+FEjzNFzbxmDjrzArf9zC
         uY4hK20H1hEbqw5anoR6vdSiRnioehCKKx7c+D3FNFO/oMpcizWH0iRvc/l8U4ELrF2d
         fKENWI/1xkZLcBse3NBN570QymQg2E6NedYYClfTTIr9PmDXN1ewtIUwbQNgS5M9W5SX
         VlEPCutL2hnMPXhyp78Pm6W98KLIwig25a+FyhUfXGlQciGaSv748lj6p4C4gXlyE4IH
         YGQ6QKb68Fq+7YjY9PUiTKqNPa90JMMazMpUQzvPfEp16MfLpcQP4gwGibCCamM7raYc
         1TZg==
X-Gm-Message-State: AOJu0YwmjOfXqTVtAdSQrqZ4HUlSolTVYX+UbasdJxqTtI5EEWJ5JUJu
	Rv7v4jVcYg8XjXqN5A0LKaY=
X-Google-Smtp-Source: AGHT+IHjfr2mP6x5YwxDkuQ5vcpWIDj7BomvgLaOgkchjT8hDOHRAVJXim0VA8pfWmn5GNkEOKAxeQ==
X-Received: by 2002:a05:6402:74f:b0:523:1410:b611 with SMTP id p15-20020a056402074f00b005231410b611mr5851706edy.25.1691322116476;
        Sun, 06 Aug 2023 04:41:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b005223e54d1edsm3785473eds.20.2023.08.06.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:41:55 -0700 (PDT)
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
Date: Sun, 06 Aug 2023 13:41:53 +0200
Message-ID: <5696647.DvuYhMxLoT@jernej-laptop>
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

Applied to sunxi tree, thanks!

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




