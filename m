Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3C9965D9
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 11:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNp4T1cDhz3bcp
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 20:48:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728467335;
	cv=none; b=aX51N0LadKDiICh96WBrjDExeIaYCH/5DBvweySxTnlXZyEaHdgxzL4pIOSsyDrqXgjEOqbV0V2u7Y+O5AeoEG5OmLxWgaTwpnMNIHol2f1ADsmrfrR0ez3uy+CeiJx+z1JKy1muuG1Scyqeuyn4Uicyx01eLjkElZHZk7pXJUYMlSdojQT00/VRt+iHYh3m4trICH7Z2Ndn/lH46uhwQm0KWj4B9lnKErwQA1RjTYiSvE3xSGgrY7LJ5rFnjhbLKD9WfuItS8Hm+Z0MAd0sPm42dFTA0NEey9nJFqVkxEFG6kOX9Rh88gaVbSrnlvBarxjJGb+T2yPXvPJAYfO0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728467335; c=relaxed/relaxed;
	bh=hgG977btJWT4/qCMm2FgTmLwENH++flY2iV0RRHB9d4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jR3beKIbtq2vf6j4sEmyTUu2vtxGtJefDMFGK2PJU7mJEraozEiUR7gVlBENxXJkIm+p4bMfJk2Sg8AewKi1FgVQyEQUSpZG8eqcX5ujBAq5nWL/Rigw/K6K5pSzDIynQj+Ghk+czh9oesRghoZMjPDlnXT+oMQ+xefPEvDEBQPy3Oiz35Pp4mO1Gboo2ieXCQ8jIWMXs3lWkW7N4BLYhPRe832mwj0bgCFsERSfVFTF/bAYpbGieAfjBDZg+H8VuIJALuOBnJbPn/HdBnyfA7pffxN/gyckU2gI1zt1uksoOG3guPx15YJHpBvl8bh/lMn3GYEzdTqIwHMtCfOYXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNp4P2JPJz2xDD
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 20:48:51 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syTIh-0004Zh-WB; Wed, 09 Oct 2024 11:48:12 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syTIe-000ZhO-F9; Wed, 09 Oct 2024 11:48:08 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syTIe-00061T-1G;
	Wed, 09 Oct 2024 11:48:08 +0200
Message-ID: <cc7faea42df6281a24360090d99cef8f99aa7736.camel@pengutronix.de>
Subject: Re: [PATCH v5 3/3] clk: aspeed: add AST2700 clock driver.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, dmitry.baryshkov@linaro.org, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org
Date: Wed, 09 Oct 2024 11:48:08 +0200
In-Reply-To: <20241009060521.2971168-4-ryan_chen@aspeedtech.com>
References: <20241009060521.2971168-1-ryan_chen@aspeedtech.com>
	 <20241009060521.2971168-4-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mi, 2024-10-09 at 14:05 +0800, Ryan Chen wrote:
> Add AST2700 clock controller driver and also use axiliary
> device framework register the reset controller driver.
> Due to clock and reset using the same register region.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/clk/Kconfig       |    8 +
>  drivers/clk/Makefile      |    1 +
>  drivers/clk/clk-ast2700.c | 1554 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 1563 insertions(+)
>  create mode 100644 drivers/clk/clk-ast2700.c
>=20
[...]
> diff --git a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c
> new file mode 100644
> index 000000000000..ef1f939b1c9f
> --- /dev/null
> +++ b/drivers/clk/clk-ast2700.c
> @@ -0,0 +1,1554 @@
[...]
> +static void aspeed_reset_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev =3D _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static void aspeed_reset_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +
> +	kfree(adev);
> +}
> +
> +static int aspeed_reset_controller_register(struct device *clk_dev,
> +					    void __iomem *base, const char *adev_name)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D adev_name;
> +	adev->dev.parent =3D clk_dev;
> +	adev->dev.release =3D aspeed_reset_adev_release;
> +	adev->id =3D 666u;
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	adev->dev.platform_data =3D (__force void *)base;
> +
> +	return devm_add_action_or_reset(clk_dev, aspeed_reset_unregister_adev, =
adev);
> +}

Should this be moved into reset-aspeed.c?

regards
Philipp
