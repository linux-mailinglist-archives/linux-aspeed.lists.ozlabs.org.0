Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6B957941
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ72Q0Vz3cZy
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=un/eX6pZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVQ214dh4z3cQX
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2024 17:05:43 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so47333971fa.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 May 2024 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633540; x=1715238340; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=un/eX6pZ5lMmrOgceNKcbteGN6/DToto2LPn96pPmm52gaPST+CegSAePG/6GAzFMB
         K6nWRxlTaWD5szEJGAKnjMCJE3IGrcI/uETZl2W7MWUj2CV/IyHN8dFYhmopxkFzQCTv
         JFdodeqZhOTNKNnkzfML/B/73QDrFFyUzjkawTdz8zYgVyDgkiRHkMm3n3WZDEA7aX/2
         fbXWwZeSIDkPftXJWOqoCD3gAirDOigQdU4PbDz+xKfZJXPj7Y2G7/g47cGk00/GSFg/
         e+uwQJtqxkTNuCog/ucScEAtx/PVlkR1QnzXLLyg4JLMLGY3HzhogR6d6rCPCu9Qrnpl
         hTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633540; x=1715238340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=btBmmHdMXINoES+DuRMdjjQ6vFW5WO3pHMKiANcxc2IEPPyxN3ANWkwHbVGjju9wTf
         XdhjaCvB8mq15foaGzQJUkFlRCuEuNzrjA9G+D5ALqQ4VNqD6ujfdSx47hMgVD0R+KmC
         5DStEiVKmTIvygGnpEXA8U/ispiMoXkknuZH2LOss9UywWOWgrqyHJCVFrdoVx+QURFD
         sYJNkzYANXWB7Lp67W/9zAqI3qD5Q75JfLeOYEQdM6UJDXRiThaxTZ6lVPVTBb/NoxKD
         hngWJPCQrMpw41BbS4Tqp1/ni1sk5BOQA80K3JZNf2S+Lx/EVJIp23HhVqCwC1VHXjPI
         AINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGGIL4K9jLGSMRQMy3GYGuYDkVWDjbmvP4MXY3n1zLUAZedU/uEgI8vTBRwudZALGoo6qOoTJrAq+hwqIPCrMuSMLAPcjCKTR51J1uvQ==
X-Gm-Message-State: AOJu0YxiyUaHIbSbPcmDHeFFDsyV40vlKozojTPQEG3I7EU/ed1/Al2y
	9ig0sLbFSv2rtPukqfrpZJENg0KsTNh2+BSq5AsQwXr+DeASDPBsu6Rt4O8nnNQ=
X-Google-Smtp-Source: AGHT+IGHVWuyebZDGCsij4vuuCGXUnlNacdJhnGzP0jhAixWhDpzQ1nmi4t3DPfRBlZrMwTir+WhcA==
X-Received: by 2002:a2e:a58e:0:b0:2d9:fb60:9afa with SMTP id m14-20020a2ea58e000000b002d9fb609afamr1096872ljp.40.1714633540084;
        Thu, 02 May 2024 00:05:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q26-20020a2e969a000000b002d860a40f9dsm69420lji.136.2024.05.02.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:05:39 -0700 (PDT)
Date: Thu, 2 May 2024 10:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <26aab31b-8085-49e0-862d-24c26ff4d02c@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
 <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
 <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Emil Renner Berthing <kernel@esmil.dk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2024 at 12:28:42AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
> > cleanups
> > 
> > On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> > > @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct
> > platform_device *pdev)
> > >  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to register pinctrl\n");
> > > -		goto exit_out;
> > > +		return ret;
> > >  	}
> > >
> > >  	platform_set_drvdata(pdev, iod);
> > >
> > >  	return pinctrl_enable(iod->pctl);
> > > -
> > > -exit_out:
> > > -	of_node_put(np);
> > > -	return ret;
> > >  }
> > 
> > This will call of_node_put() on the success path so it's a behavior change.  The
> > original code is buggy, it's supposed to call of_node_put() on the success path
> > here or in ti_iodelay_remove().
> > 
> > If it's supposed to call of_node_put() here, then fine, this is bugfix but if it's
> > supposed to call it in ti_iodelay_remove() then we need to save the pointer
> > somewhere using no_free_ptr().  Probably saving ->np is the safest choice?
> > 
> > The original code is already a little bit buggy because it doesn't check for
> > pinctrl_enable() errors and cleanup.
> 
> It was introduced by 
> commit 6118714275f0a313ecc296a87ed1af32d9691bed (tag: pinctrl-v4.11-4)
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Thu Mar 30 09:16:39 2017 -0700
> 
>     pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
> 
> of_node_put is expected in probe, not in remove.
> 

Ah, right.  You'll add that for the Fixes tag obviously...

regards,
dan carpenter

