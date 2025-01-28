Return-Path: <linux-aspeed+bounces-567-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DBA21548
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jan 2025 00:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjMSq043Bz2ykf;
	Wed, 29 Jan 2025 10:49:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738108154;
	cv=none; b=EtE/K2MCA9gcVLWL6A1+Kq0UDgf0HV2DPD++CfLXC/p2RMpM50zauUX2OjHiRvoqOd57hlWuwODmdrm2Z/UdMmTB/zMzeFEopKbI1mcgrM+WaSBacSlF5gbXcDdN8xDNfVMCOc4mHYhI/l/sCKqlUOQxdbeU3a4qh/bSuVJuT8CvREaE/sNUMmnsjb1FXN4Ki2ZhMMKDoeTOvagpeybQGcO2lxPjXOgBvHtvfdKuyZEjMa1UxwrdqtfD/vETbUoxTEF6/Gk+P9p3m+OOEPTqnFHasqIzVFfEOLxHRmZgp7XCBWgMr9dqApTNV7QBsxpNnAVTawniPAf8uJHPFK0lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738108154; c=relaxed/relaxed;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJtIzkppjPGIoEt+QjGO23IOmlmFDriWNZ2/5gguFqNqxqNtSjeokzsTsfyrHXUpwVj5PROfdkVtc3AlK77Zfmv2Wy37eP/LeRm/HnItjwJf3+pPVtJwU0LY51fm/h0tPMscVjsG78w8wd1+KPgiLMDm3DAcVsTWqCcApxPpAwUpQxNm/dBaj0e/Z613vaAMonj9MHzJ+/QzxgF+Q5DHUTpDiKgBDYZ/64GwlLWOCYjmS/JLqtY+aakztWI3yhZEMD1ms6fz9xYZ6wTmhdP3sRhg4RaDpyfFbSPpqN5hWylxiCbSL/jAuyV3HLAfkf/wqhUoxhTJ07+Hva5EaCSsWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d27kyn86; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d27kyn86;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjMSp0Tf5z2yGT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jan 2025 10:49:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738108152;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d27kyn86OW9fKb37uxAAjYTxIMGhniYZF6utj0d0lxP83K5OlLXIQGc3mwfwR+qjt
	 lXqOymLQrDX/9BLUoaBptalqeGGhBCGvev5Y5KFsn9hbt7sc2Gsqe2gvTK1BqX2av7
	 mqh0HN0lBLqtvidZC5BXZC/UwBxCS6aqMrwbm+Ewg1AG/SQ+VUj6WK9TlhnIibrnsd
	 ZLstgk7mr4Fnq/pX2qwnssCN+qKFpGOKxHSVnRAc10ZBaRYk0ioU9v63xfJvpzJcbR
	 BpaqVLh43vIi78A+Gztr8p/PRCBc/TQqZrVOgFBSlCW0+ERJYYiTavaKlbeJHiHqKG
	 ZvfGucQWj7yAQ==
Received: from [192.168.68.112] (58-7-145-34.dyn.iinet.net.au [58.7.145.34])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B175F700F5;
	Wed, 29 Jan 2025 07:48:56 +0800 (AWST)
Message-ID: <0589b4c2a6cf4e946e927081c4ed5a4b488010aa.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/14] drm/aspeed: move to
 devm_platform_ioremap_resource() usage
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, Xinliang Liu
 <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,  Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin
 <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Wed, 29 Jan 2025 10:18:56 +1030
In-Reply-To: <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
	 <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2025-01-28 at 17:29 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

