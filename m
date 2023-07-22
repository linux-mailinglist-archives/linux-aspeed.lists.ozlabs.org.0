Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B661A760208
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 00:09:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=RwUTEpJM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8vSr4XHhz2yGv
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 08:09:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=RwUTEpJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mess.org (client-ip=2a02:8011:d000:212::1; helo=gofer.mess.org; envelope-from=sean@mess.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 367 seconds by postgrey-1.37 at boromir; Sat, 22 Jul 2023 20:06:27 AEST
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R7MX32mCXz2ytP;
	Sat, 22 Jul 2023 20:06:27 +1000 (AEST)
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 1365910006C; Sat, 22 Jul 2023 11:00:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1690020008; bh=YcBVF9OByPJWzCU45MSsTPERsEXi6qu8BVTu0NkN++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwUTEpJM3LXz5vvd/Y0UX8jlKMMGY5MBgH5ORtxvVA9epRgGRHV+EJ5bxsx5U1fQ6
	 be1F7Q3RwRnOO5wlKAT0dYHSsoH4oFxvkbJDIwD8j47iVVLvWgdnaMVaH+O93y4uzm
	 j3qDxiYJK6H8/rdrOpRd03QDT0xv1AjEWYkR9+0NsPhEsbWdUX1bQSfAM/Gx+soJCw
	 ruhU+je4WXNX+nPIr793k7oHAUiPHpLY2zVhHHyJqGcJAQpdoBqqBU/02KtJcabL8p
	 iq/Ie/NdHUd1BPLYxd1Z7aDweYfgxI67HdC317LlyUi4QUHxgrFjo0fCSxudDhfrPM
	 X4oARS48J/LLA==
Date: Sat, 22 Jul 2023 11:00:08 +0100
From: Sean Young <sean@mess.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] media: Explicitly include correct DT includes
Message-ID: <ZLuoqDxYUAPHCPgo@gofer.mess.org>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Maxime Ripard <mripard@kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org, Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-aspeed@lists.ozlabs.org, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabe
 c <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Shijie Qin <shijie.qin@nxp.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Andy Gross <agross@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-renesas-soc@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>, Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infr
 adead.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Yong Deng <yong.deng@magewell.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Michael Tretter <m.tretter@pengutronix.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>, Michael Riesch <michael.riesch@wolfvision.
 net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jul 18, 2023 at 08:31:14AM -0600, Rob Herring wrote:
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

For:

>  drivers/media/rc/meson-ir.c                                   | 2 +-
>  drivers/media/rc/mtk-cir.c                                    | 3 ++-
>  drivers/media/rc/sunxi-cir.c                                  | 3 ++-

Reviewed-by: Sean Young <sean@mess.org>

Thanks,

Sean
