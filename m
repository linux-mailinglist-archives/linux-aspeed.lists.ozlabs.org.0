Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12245EB19
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 11:11:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0r9s2t6Fz3bmc
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 21:11:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0r9m4Mxlz306h
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Nov 2021 21:11:07 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mqYBz-000796-FL; Fri, 26 Nov 2021 11:10:55 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mqYBw-0005NW-IR; Fri, 26 Nov 2021 11:10:52 +0100
Message-ID: <727777874f925c0d862887589a868859a95d3649.camel@pengutronix.de>
Subject: Re: [v12 2/2] pwm: Add Aspeed ast2600 PWM support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>, lee.jones@linaro.org, 
 robh+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 thierry.reding@gmail.com,  u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Date: Fri, 26 Nov 2021 11:10:52 +0100
In-Reply-To: <20210906024339.21124-3-billy_tsai@aspeedtech.com>
References: <20210906024339.21124-1-billy_tsai@aspeedtech.com>
 <20210906024339.21124-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Mon, 2021-09-06 at 10:43 +0800, Billy Tsai wrote:
[...]
> +static int aspeed_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +	struct aspeed_pwm_data *priv;
> +	struct device_node *np;
> +	struct platform_device *parent_dev;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	np =3D pdev->dev.parent->of_node;
> +	if (!of_device_is_compatible(np, "aspeed,ast2600-pwm-tach"))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported pwm device binding\n");
> +
> +	priv->regmap =3D syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Couldn't get regmap\n");
> +
> +	parent_dev =3D of_find_device_by_node(np);
> +	priv->clk =3D devm_clk_get(&parent_dev->dev, 0);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");
> +
> +	priv->reset =3D devm_reset_control_get_shared(&parent_dev->dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "Couldn't get reset control\n");
> +	}

I'd remove these curly braces for consistency with the code above.

regards
Philipp
