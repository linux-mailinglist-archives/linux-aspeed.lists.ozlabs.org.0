Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA445760206
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 00:08:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sberdevices.ru header.i=@sberdevices.ru header.a=rsa-sha256 header.s=mail header.b=ftS9UdnF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8vSg62Tgz2ykV
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jul 2023 08:08:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sberdevices.ru header.i=@sberdevices.ru header.a=rsa-sha256 header.s=mail header.b=ftS9UdnF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sberdevices.ru (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=ddrokosov@sberdevices.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 503 seconds by postgrey-1.37 at boromir; Thu, 20 Jul 2023 04:48:08 AEST
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5lFN087Zz2yFB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jul 2023 04:48:05 +1000 (AEST)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 660A412007A;
	Wed, 19 Jul 2023 21:39:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 660A412007A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689791973;
	bh=sc+94aLvgVUxBUEzSPbWOsr9WhtmbJCsOLteFFzOoLU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=ftS9UdnFVupfX9JxONl46s/RGEHl80jPk77NDDqzvRlD1qSq1jhJ6yXhfHaSPewnr
	 LEQ6tu0ClcfcCUU9btQ8pcnKoaAO2EJBXjugGbhFMHWzBlTJxypP0F3af+WF7YnUcT
	 qwRJV+UdIg9Tq/ng5S2MnxsHFZSDjXsqkqprkZ/FAn6+PAzMRaUZQlMaszmoB8jzPf
	 AAU7c/jMuvSi1AM8yvRzt0m4L7ILTyWgBLaRMTnYKOJhuMJljph7thz7MAefNZECdm
	 ASZdS2Hm97OvI4aj7PSdUXrCYM7KLsHLwhBPeZ4VRaDC7sbNbBsJ+UEFUFLlGc1JiM
	 1mc7vWHZzj6DA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 19 Jul 2023 21:39:33 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 21:39:33 +0300
Date: Wed, 19 Jul 2023 21:39:27 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
Message-ID: <20230719183927.c4ykdjw3iekmugzy@CAB-WSD-L081021>
References: <20230714174342.4052882-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178730 [Jul 19 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 524 524 9753033d6953787301affc41bead8ed49c47b39d, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/19 15:29:00 #21641898
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Peng Fan <peng.fan@nxp.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Tomasz Figa <tomasz.figa@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-riscv@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Abel Vesa <abelvesa@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-samsung-soc@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez
 .com.ar>, Kevin Hilman <khilman@baylibre.com>, Gregory Clement <gregory.clement@bootlin.com>, linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, lin
 ux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Alex Helms <alexander.helms.jy@renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-oxnas@groups.io, Tero Kristo <kristo@kernel.org>, Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <ke
 rnel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:43:29AM -0600, Rob Herring wrote:
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

[...]

For

>  drivers/clk/meson/a1-peripherals.c               | 2 +-
>  drivers/clk/meson/a1-pll.c                       | 2 +-

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

[...]

-- 
Thank you,
Dmitry
