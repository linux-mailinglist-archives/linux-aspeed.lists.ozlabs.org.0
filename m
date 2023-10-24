Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79507D43C8
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 02:14:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GUx5geqN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDsxK5GjFz3c2G
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 11:14:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GUx5geqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDsx84q2qz2ygX
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Oct 2023 11:14:04 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net [118.210.136.142])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B500F20034;
	Tue, 24 Oct 2023 08:13:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1698106442;
	bh=xf45kMR6lFEzv3Mn9oNtZZ7uAthFMPRd7r9ZXIrWv7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GUx5geqNxZPF0MtIxzsvsFTVESMyuDuDjKHiWQqcyqRia/okbxSE6uKQbWe5g5re7
	 isGkc4IGs2cHg8pQT52IimK+B9wasH2ws3jzSxcyJ2gEG3WnW1ey5CCyqVtaHHPwHa
	 uckM7NPQt/eBPF/181w1K6w9tX3stP3Hjc6j7N9fSlPeIyjF/ZgUoAwl+QzFiaKKUT
	 9bhPHskstheOQUIYsyupO760PTI21905eYXRhNDgDGmxKi0fqdHZqHLv3SPuwrm/5w
	 k+0crspYly9IZA0eq5iC9rzeTsO2uoNRITV5ohc6W8L0kgJB9+/Y0v+tsAuT06YqpS
	 j7oxYADgJPEIQ==
Message-ID: <d4f77e13d3c5de613877450fd25bf5f77f1331a2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] drm: Use device_get_match_data()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joel
 Stanley <joel@jms.id.au>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Oct 2023 10:43:55 +1030
In-Reply-To: <20231020125214.2930329-1-robh@kernel.org>
References: <20231020125214.2930329-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2023-10-20 at 07:52 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data in a single step. With this, adjust the
> includes to explicitly include the correct headers. That also serves as
> preparation to remove implicit includes within the DT headers
> (of_device.h in particular).
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c    | 24 +++++++-----------------
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 ++++------

For Aspeed:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!
