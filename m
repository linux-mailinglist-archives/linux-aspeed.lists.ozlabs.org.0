Return-Path: <linux-aspeed+bounces-681-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB0A2AD62
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Feb 2025 17:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yphx92ftZz30DD;
	Fri,  7 Feb 2025 03:13:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738858429;
	cv=none; b=JFPFswNoVYoYMOrmESVVXGcU+mrie5pmsF9RaRxJ78nzt/zdPnwatOUhlvi2H+f33Q+vh+oSZW/UnA00T8/iqxpoJRo4NFX7DpMFbnmsOSUYfq2dTQb9Q1aETfSRgPbxub3Xc4ZPMe8oSHCm5dRQ9GqImNG+JGyWqOPHHgXl5wKRnzfIJJws0Qmo469OYQ71N5EvlaoyNeoQydRBOfjnxWRUUmfpwrYloN0yDqI8m+ZV0ZN/BLEKuziWADapvq8aAUvBM5+B3qCegAbJmx3BSnhxG+Y082Dl5pF2RIWdBLmms3oNOWC+hrGW2docqD2O+dM6CIXsU5ukESYthyq7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738858429; c=relaxed/relaxed;
	bh=HsVx1KaNwgqNLZilcbZny92AtsUxM9BfF1vMwKADwMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk17iZH2fjVY+Nz84TjVGwU/N3TBwtHmtjOgPtN7K3ZiEwq7iLJzUZWWwRK+gTlJyXoQG6VMW53XjSeg6lZHyjh3CLrDQzkR5f5+FChr6XckAcsQeldQNU22p7MBoR+9tfQr39lNQ2NJvZiDVyldefA/NsJJUouOGkgAWPVRf2LTaD+1h6bCYfHw+MX/noUTY0PdAS/k/qurjTeXo+tG5N6GXs96hJ+Jb7FgvZ7orL90K5XfWk2JQsBKGZymUGLqEe7mIIWe86bzLj+qMe7+iv7aW5noVSFM8FRL3wnS7YxpCp5Nu/u8wol2BXFmKFO70L5/m1KD5GPwAly7wKmk4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYCFPFSL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYCFPFSL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yphx83xPJz3028
	for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Feb 2025 03:13:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23F095C64A4;
	Thu,  6 Feb 2025 16:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07F8C4CEDD;
	Thu,  6 Feb 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738858425;
	bh=yugtap81E+1XEiUSlot9N/ao/3tXx/zIxbLqkf5yQ2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYCFPFSLLiDASvYd4s42uud1DtC2OYpyDgEeLT35r+DrvE2jij76XmTWQ9G67IkkY
	 GXlKlZixxwv1mXchRyKAC2XLHInGz7nXltb/sepWggEKQB2TlbKf/zl7RmfFuI/bgH
	 POQtLfiwx3vOBe+qHPtYDAHCNvMvnzxOt413CP2Ky6rkPlhy2ILdMwAJlRvRLqD0vj
	 Zr7POyxFiXm5+iQmgkdVq1+ZtMEZUnmtN8vK+HRSG+ejF6wz2rbhMHSIENz/QYTel5
	 LTPtPbUTgV8Ae2h5Vlge1PtDZVU6vqHxlAMGJQmuO06gQkxOszYi8GtT6wvI2wkZns
	 f+nG5+ZFP0G5A==
Date: Thu, 6 Feb 2025 17:13:43 +0100
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
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
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <20250206-hallowed-ultra-tiger-cfec8e@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
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
	protocol="application/pgp-signature"; boundary="nds2ddkwji5fimma"
Content-Disposition: inline
In-Reply-To: <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--nds2ddkwji5fimma
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> <+...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> ...+>
>=20
> v2: Change the SmPl patch to work on multiple occurences of
> the pattern. This also fixes the compilation error.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Ma=EDra Canal <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-------------------------=
------
>  1 file changed, 14 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c=
573d80ce7c88595 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>  	struct platform_device *pdev =3D vc4_hdmi->pdev;
>  	struct device *dev =3D &pdev->dev;
> -	struct resource *res;
>  	int ret;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -					       resource_size(res));
> +	vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname(pdev,
> +									"hdmi");
>  	if (!vc4_hdmi->hdmicore_regs)
>  		return -ENOMEM;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pdev, "hd");
>  	if (!vc4_hdmi->hd_regs)
>  		return -ENOMEM;

I *think* that one is shared between both HDMI controllers on the
RaspberryPi4, so we can't claim them from both instances. We should add
a comment there to document that it's on purpose.

The rest looks good.

Maxime

--nds2ddkwji5fimma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6TftgAKCRAnX84Zoj2+
drfXAYDBINKHBSckIuo/kq/HoUvq16io0SUMaLB/CVkeidnE3EXaDz9M3WhZ60Ha
n8d4HmABf0i2bHqp4iPr3Cr3YiSEnV9zX0sFLdFl/FejJMglsT19c+7lwsGMwuaH
8nnPGZ1q6A==
=1kXI
-----END PGP SIGNATURE-----

--nds2ddkwji5fimma--

