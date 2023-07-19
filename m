Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEB760205
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 00:08:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ragnatech-se.20221208.gappssmtp.com header.i=@ragnatech-se.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=PNHMPmfG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8vSZ2xP9z30Ql
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 08:08:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech-se.20221208.gappssmtp.com header.i=@ragnatech-se.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=PNHMPmfG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ragnatech.se (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=niklas.soderlund@ragnatech.se; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5lC44V6gz2ygr
	for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jul 2023 04:46:08 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f122ff663eso11961485e87.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jul 2023 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=PNHMPmfGkc1gL3s+kuZsOV06iS0AVcua9wceAmdSEpVaau8usQXOmlxuVajPoqahSZ
         oXCeyXW3i7qO4gPQC3/B5Lo5Eqmi2HM4U13eYxzJby4ZFd5uR2kFc8wjOiArIEd55PBA
         FeCJue+xZBMErbY8RHL9QpZivP+scZ+Uhv+xiPlfw+QmU/c+xu8cJYkIrMEc/MG7elAK
         qWZ83FR4V9wLcNgcODc1mJlKxSJnwdLewAg5rcPN0PhCf2e09w5V1Bp1xL5H141MnfFQ
         Zld3xPSZJnzYVXtM2wQmsSZTU5Qt4Z0CaW8ampG4BzUMYrnqq3UfbUoP7KRh6XWbjalG
         17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=J7az1eDmUSeNMB9EWn8gwRBV9RN1WMQfzn1XpmcPh1nlCtFoc8xy5u6aEmKglMiig0
         MU/1xX8JDs62auuySd8ekSWAqn3KZe7jCCMPj2MNehooCssqYva/9mtPUFajDZR7S3Dh
         /CxgD+Ylz+pygVg2snE30Iarg52I1DScQ9uf0PUNNEPMw3bdTg2zRvUCA9elkmHPdQwC
         iq9e9L7Dxiisbu1zjM3U1xAShVvxmOth1pHuqf3z34BcbFo69ziXoup4hvDRNdzkdke2
         RggGdOthnKNSG3ng+iQharWBdpj9nuPACGreHPbvW9Arzi9GM7YSGomDLfEwT4n8asiV
         bA3Q==
X-Gm-Message-State: ABy/qLZbfunQfiWCjR9++66+vnea38KY8EiDq7umqfOfcVO2c4fO++eR
	dcVBKEm4ART5ZwvYuSHBTqdfBA==
X-Google-Smtp-Source: APBJJlFtrWyQNURr4DI24Yfx+KhHtEnbcs8mZXCEdNLSvmMP4IixrdRQLU+06NloRR7Z4XxkYEDlqQ==
X-Received: by 2002:a05:6512:250f:b0:4fb:8de9:ac0e with SMTP id be15-20020a056512250f00b004fb8de9ac0emr607490lfb.1.1689792361237;
        Wed, 19 Jul 2023 11:46:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m8-20020ac24248000000b004fbad6bc93dsm1057209lfl.136.2023.07.19.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:46:00 -0700 (PDT)
Date: Wed, 19 Jul 2023 20:45:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] media: Explicitly include correct DT includes
Message-ID: <ZLgvZ2ao1tgrRlFu@oden.dyn.berto.se>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 25 Jul 2023 08:08:42 +1000
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
Cc: Maxime Ripard <mripard@kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org, Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Sean Young <sean@mess.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org, Chen-Yu Tsai <w
 ens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Shijie Qin <shijie.qin@nxp.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Andy Gross <agross@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-renesas-soc@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>, Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.
 infradead.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Yong Deng <yong.deng@magewell.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Michael Tretter <m.tretter@pengutronix.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>, Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 2023-07-18 08:31:14 -0600, Rob Herring wrote:
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
> v2:
> - Fix double include of of.h
> ---

For,

>  drivers/media/platform/renesas/rcar-isp.c                     | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c           | 1 -
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c           | 1 -

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
