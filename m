Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD8D759398
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jul 2023 13:00:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pu6DLejj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5XsT66sTz2ykW
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jul 2023 21:00:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pu6DLejj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 304 seconds by postgrey-1.37 at boromir; Mon, 17 Jul 2023 22:31:48 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4M0465KGz2yFB
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 22:31:48 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id AAE70CE9BB
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 12:26:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0D32000C;
	Mon, 17 Jul 2023 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689596788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfIQQUGuk2YngWOS8fdrYDdOu8Z6QhNBtgynXxqIkxI=;
	b=pu6DLejjSYrxTONDk5/XdeXoNmahir1eSWyr0IAyC5+CzV+z7kVIv0SIU1WMmF5on1CgqD
	KQMv7HISFwBD83UgHXeIYvA6rMs4zilESREno4fIl9tHoG5j8KuMGef30GXaJomEjoNSXB
	b27ZnZ9I2DkJ16lt7XoMqFe9mN2ip4prfSVsj2SpNBgHGroLTT9anwzmDU7ZmjHgcKavfM
	YT6a5qXXuO8iNNI928PNokmiYbnOK1bsbfPyiXo6MfvnS5M/07LrFJlHjhELObDmMRCvQo
	UvLPoo3HQls1bUDPug12g+YVs2SccW7y5VCvmnwJJIZUaBWuD6j/7/vLgvzENw==
Date: Mon, 17 Jul 2023 14:26:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
Message-ID: <20230717142614.78db5c4e@booty>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
References: <20230714174342.4052882-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Approved-At: Wed, 19 Jul 2023 20:57:09 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Peng Fan <peng.fan@nxp.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Tomasz Figa <tomasz.figa@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-riscv@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Abel Vesa <abelvesa@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-samsung-soc@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, Emilio =?UTF-8?Q?L=C3=B3pez?= <emilio@elop
 ez.com.ar>, Kevin Hilman <khilman@baylibre.com>, Gregory Clement <gregory.clement@bootlin.com>, linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, l
 inux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Alex Helms <alexander.helms.jy@renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-oxnas@groups.io, Tero Kristo <kristo@kernel.org>, Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudee
 p.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?UTF-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jul 2023 11:43:29 -0600
Rob Herring <robh@kernel.org> wrote:

>  drivers/clk/clk-versaclock5.c                    | 1 -

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # versaclock5

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
