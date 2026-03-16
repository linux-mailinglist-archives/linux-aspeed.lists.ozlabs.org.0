Return-Path: <linux-aspeed+bounces-3690-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mON/NjLUt2n0VgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3690-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 10:58:10 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93650297898
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 10:58:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZ9Wg1KFtz2xpn;
	Mon, 16 Mar 2026 20:58:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773655087;
	cv=none; b=bfBBXwNFbueXRSHHL9bHNkdPYTum0uUBMGw6vDtufSD+HjscJhZgzhkl/4YJ4RISOC1bfHpYozGQ8nBOwoZJUUhlgQYXD7YpkIg47aiTQzN28ZEnIRj9Tx4ANIvp7kybizGcDyoFnMv2Rxfu01eJhCzSZf2H1ke8iwQGdHOMyRI1bNSTzD+Jac4Muy+5lc7lbujX+sqZzHUk5ByXsaMQP5+ueBdi1ZZTx8Ui1SLn5LiH5ZAVKLymsj+FRikJrw/+bMj5ZBtePcLAjw/03d5OhaXBJE4QbCXHZ0CbY3kElWrSnUgcll+Rj1igYnosbu1TUXU0FQt0V0eUTPvSRZzCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773655087; c=relaxed/relaxed;
	bh=PoGlOimHfHzN8euhg2o8iGnxBlJJD4ffvhCyAnDqdJs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=htfo/K+1O1o11n8blOUBRq4udssGraUlAW60PnkXbhr86ng2WuKNVvM0yFw+8K89ogfCbxlBr8C6xXI0xMXTUqRjoOrhamMmBXnzNbMmgO+raSeYAgbiEYlWtrw0LvAE3CgVpcXa9Xfre58pUygizJX+Y21jeFUH5uhy+5iT1AEOR2GpSj+TR52yuvlMbcHaYVF7iP9VVbxMhZy5qlLn8R53FhFlPOBTs5LBnxQbhTmp/S1m1D01a+cZoE3iUhIdiPXnSVv55mfyujoEI3Zm6ahcDq6qMaOAWPJGqrjANkbdSerYMBitmu8VFC59t0Fxh2huBWJ9X/bJD60ldN+XTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ9Wf3Vj0z2xQD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2026 20:58:05 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hm-0001bl-SR; Mon, 16 Mar 2026 10:57:46 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hm-000Y29-0W;
	Mon, 16 Mar 2026 10:57:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hh-00000000iLn-0IUd;
	Mon, 16 Mar 2026 10:57:41 +0100
Message-ID: <0658c04655fc96829723cad1f17b3d899a1b2bbf.camel@pengutronix.de>
Subject: Re: [PATCH 2/7] soc: aspeed: Introduce core eSPI controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
	 <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, maciej.lawniczak@intel.com
Date: Mon, 16 Mar 2026 10:57:40 +0100
In-Reply-To: <20260313-upstream_espi-v1-2-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-upstream_espi-v1-2-9504428e1f43@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-3690-lists,linux-aspeed=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:yh_chung@aspeedtech.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:ryan_chen@aspeedtech.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:maciej.lawniczak@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.661];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,aspeedtech.com:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 93650297898
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fr, 2026-03-13 at 18:07 +0800, aspeedyh wrote:
> Add core eSPI controller support and common code for ASPEED SoCs. The
> eSPI engine is a slave device in BMC to communicate with the Host over
> the eSPI interface.
>=20
> The initial support includes basic eSPI driver probe/remove operations,
> and provides operators for ASPEED SoCs to implement their own eSPI slave
> device drivers that are different among SoC models.
>=20
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> ---
>  drivers/soc/aspeed/Kconfig            |   7 ++
>  drivers/soc/aspeed/Makefile           |   1 +
>  drivers/soc/aspeed/espi/Makefile      |   1 +
>  drivers/soc/aspeed/espi/aspeed-espi.c | 143 ++++++++++++++++++++++++++++=
++++++
>  drivers/soc/aspeed/espi/aspeed-espi.h |  27 +++++++
>  5 files changed, 179 insertions(+)
>=20
[...]
> diff --git a/drivers/soc/aspeed/espi/aspeed-espi.c b/drivers/soc/aspeed/e=
spi/aspeed-espi.c
> new file mode 100644
> index 000000000000..15d58b38bbe4
> --- /dev/null
> +++ b/drivers/soc/aspeed/espi/aspeed-espi.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Unified Aspeed eSPI driver framework for different generation SoCs
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "aspeed-espi.h"
> +
> +struct aspeed_espi_ops {
> +	void (*espi_pre_init)(struct aspeed_espi *espi);
> +	void (*espi_post_init)(struct aspeed_espi *espi);
> +	void (*espi_deinit)(struct aspeed_espi *espi);
> +	irqreturn_t (*espi_isr)(int irq, void *espi);
> +};
> +
> +static const struct of_device_id aspeed_espi_of_matches[] =3D {
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_espi_of_matches);
> +
> +static int aspeed_espi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct aspeed_espi *espi;
> +	struct resource *res;
> +	struct device *dev;
> +	int rc;
> +
> +	dev =3D &pdev->dev;
> +	espi =3D devm_kzalloc(dev, sizeof(*espi), GFP_KERNEL);
> +	if (!espi)
> +		return -ENOMEM;
> +
[...]
> +
> +	espi->irq =3D platform_get_irq(pdev, 0);
> +	if (espi->irq < 0) {
> +		dev_err(dev, "cannot get IRQ number\n");
> +		return espi->irq;
> +	}
> +
> +	espi->rst =3D devm_reset_control_get_optional(dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

> +	if (IS_ERR(espi->rst)) {
> +		dev_err(dev, "cannot get reset control\n");
> +		return PTR_ERR(espi->rst);

Consider using dev_err_probe, same for the other errors.
That way the driver won't print incorrect error messages on
-EPROBE_DEFER.

[...]
> diff --git a/drivers/soc/aspeed/espi/aspeed-espi.h b/drivers/soc/aspeed/e=
spi/aspeed-espi.h
> new file mode 100644
> index 000000000000..f4ad7f61fef6
> --- /dev/null
> +++ b/drivers/soc/aspeed/espi/aspeed-espi.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Unified eSPI driver header file and data structures
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +#ifndef ASPEED_ESPI_H
> +#define ASPEED_ESPI_H
> +
> +#include <linux/irqreturn.h>
> +#include <linux/miscdevice.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define DEVICE_NAME		"aspeed-espi"
> +
> +struct aspeed_espi {
> +	struct platform_device *pdev;
> +	struct device *dev;

Storing both pdev and &pdev->dev seems unnecessary.
Is pdev used at all?

> +	void __iomem *regs;
> +	struct reset_control *rst;

This is missing a forward declaration for struct reset_control.


regards
Philipp

