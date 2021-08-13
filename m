Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A03EB3BE
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Aug 2021 12:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmJyR6dMYz3bj5
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Aug 2021 20:02:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmJyM0L52z30G4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Aug 2021 20:02:33 +1000 (AEST)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mEU14-0003CR-44; Fri, 13 Aug 2021 12:02:18 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mEU11-0003w2-Fx; Fri, 13 Aug 2021 12:02:15 +0200
Message-ID: <5da35c2030e57621fa56795cd193e727f53205fe.camel@pengutronix.de>
Subject: Re: [v11 2/2] pwm: Add Aspeed ast2600 PWM support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>, lee.jones@linaro.org, 
 robh+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 thierry.reding@gmail.com,  u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Date: Fri, 13 Aug 2021 12:02:15 +0200
In-Reply-To: <20210812040942.5365-3-billy_tsai@aspeedtech.com>
References: <20210812040942.5365-1-billy_tsai@aspeedtech.com>
 <20210812040942.5365-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
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

On Thu, 2021-08-12 at 12:09 +0800, Billy Tsai wrote:
> This patch add the support of PWM controller which can be found at aspeed
> ast2600 soc. The pwm supoorts up to 16 channels and it's part function
> of multi-function device "pwm-tach controller".
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
[...]
> diff --git a/drivers/pwm/pwm-aspeed-ast2600.c b/drivers/pwm/pwm-aspeed-as=
t2600.c
> new file mode 100644
> index 000000000000..f89ce1d4cd67
> --- /dev/null
> +++ b/drivers/pwm/pwm-aspeed-ast2600.c
> @@ -0,0 +1,327 @@
[...]
> +static int aspeed_pwm_probe(struct platform_device *pdev)
> +{
[...]
> +	priv->clk =3D devm_clk_get(&parent_dev->dev, 0);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");
> +
> +	ret =3D clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Couldn't enable clock\n");
> +
> +	priv->reset =3D devm_reset_control_get_shared(&parent_dev->dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(priv->reset),
> +				    "Get reset failed\n");
> +		goto err_disable_clk;
> +	}

I suggest to request the reset control before enabling the clock. That
way you can simplify the error path and avoid enabling the clock in case
of reset_control_get failure.

regards
Philipp
