Return-Path: <linux-aspeed+bounces-576-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA94A2208E
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jan 2025 16:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjmZ110nZz305Y;
	Thu, 30 Jan 2025 02:40:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738165209;
	cv=none; b=buGKkqyLHXCCthH2cPZs7PrSYMi+9o4+yL391dcVdcnzsjOW4L2/6GrGXf0gnQisOa2mfM/mk3HEWKWmmZDg1rPFmpszxyyJiRD4mtafd2GPTdDfKPvGuoITH1QSDiR876SU9ZQtawDER10Z7/nwxe2uUOUPICcgXW6Hv4vw9GRvFAhKKoyZ9vOueO+3OgiINszhzo8sKYr+wo/7oI6HQ2kGUdd0mSzEYbtgbkquHa1o3N5P2veJxtBfJrlt+TljjkeJ5D0D8iynfIyixmYCNkcenA+GwRTsSxvFsaOsO4hr5aRLa84LXosELwHhd+DAoiLfijskOqPfb2wEtlqhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738165209; c=relaxed/relaxed;
	bh=H7Wno81VDmAC8LZxebVHqmFv78aV+GntC7UloBA6wQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfj58iRJuy2GKtq8NIj1qDeXdhgsXJ0LiAEXPwRrWV5V+ooTrc7PfY/s3d8IXw6SJBV8vQo0lHR4J9svRjIzjbccyVmSJsCYB2UzzREeuRQqieDfSGrNSvfrWLKngTF9qmlR8xOV0Hi5TrvpikIYbC+8RWdyeZc6Ob6jfZYvwToCkgMqzw/JYP6NnIiNweHs3yz1AxBaagISgO7yXBE6LwzFhvcAq8KD0XqG/sH2YO7NH/XOe5AcSuGTnMhlM96zX3TPtm6nKGuMn9ilkzjEJx3wW8Aelel/4J8+WSAYhE53HcQIE7zEfwDrIWGxOXNftX6/p8j1otnR+zpEDEtn7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=blVJU1tB; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=blVJU1tB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjmZ02KZQz303K
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jan 2025 02:40:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CE8C5C5DB8;
	Wed, 29 Jan 2025 15:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54A4C4CED3;
	Wed, 29 Jan 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165205;
	bh=H7Wno81VDmAC8LZxebVHqmFv78aV+GntC7UloBA6wQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blVJU1tBuGlKF4p47SaFusm9eG5WZSgkALpUADxFuWuQiIFr9qF7DNpOhnbEUeXbs
	 7viGrnwFOcJSwLPYI+Ehdw7eY23dv9mEQ7o9fqlXjrbnP3pst1omLXvrGlE1aBm30m
	 Bi7pbYb1UPpMvMHUuyONufYRLOO7ZVEBsAkaSFoyED0QRRyozXtecJBokIiLtaVWOO
	 q0djJLUSg4eE2yATE1o5zFnBrTEQd2LiyidKL5wQWTiQ5Taf9QVxZKqyI4HsxEX9wi
	 K7GNZwBmVTPWfpazFvFm2ldBBFkDsVN11cDjiMvXt+chOhLgfReDoepEnSHIosPwoR
	 O1uHFNJcIFiaA==
Date: Wed, 29 Jan 2025 16:40:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 06/14] drm/mxsfb: move to
 devm_platform_ioremap_resource() usage
Message-ID: <ivwhzbasvxnnnzoqpqd6w24d6wma6pufcrc6jl7b6gsyzrnup2@r36hiijgac7m>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-6-0d1609a29587@redhat.com>
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
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j6fxajocgelt3kwa"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-6-0d1609a29587@redhat.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--j6fxajocgelt3kwa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/14] drm/mxsfb: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:30PM -0500, Anusha Srivatsa wrote:
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
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j6fxajocgelt3kwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pL0QAKCRAnX84Zoj2+
dpu8AX92mKVtYr4NesUkaNaAZLgSW9h3CZMfohWW2Hi3OHXPAvC1LmJnp0Zowbq8
4FFBL/wBf2VL8YqmcT3T9+XhphtMFWv/+85mR4/YE14rKn4brg9xZxj2nw0jIWJ5
ZU3psZFZbg==
=rMo6
-----END PGP SIGNATURE-----

--j6fxajocgelt3kwa--

