Return-Path: <linux-aspeed+bounces-4446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8DqNmEET2p8ZAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 04:16:01 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD972BE45
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 04:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=ftms0R3l;
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4446-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwdqL1XPDz3cFD;
	Thu, 09 Jul 2026 12:15:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783563358;
	cv=none; b=YE44MFS3ZQ/YdNUO30z1A8sP97NMWORyZgBIMMTm78cggv8mq8E2U77gH1Qq2zPCaKOVitYUuqlDtZc2kooeDAVmTQ3MlG4YU6mTpQkaZmwMuDwfvQY1hZpStPtYHl14d/vwH5xCT5s2W0fkNdlgx8zPfkafoyeyWa3xhy/qqDmWUFjzG1Ysn4c37RlOtLstDiG+PJVnMG0syauXFvwi+t4NZJrBaqQDclre+Nzprp+p2sqTrE7npPn6+5CCL/kmmEtZzU0ETpvK3Gihh3nYjna1t1M4EjiLYXi8aZuQANRi+Ma0ePD+sPomG/skav4KRzItCaOil2tejtHps+lTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783563358; c=relaxed/relaxed;
	bh=tH41RNED5+clJ8bDU3yrsPjDBxC2yWIilI8EOLE574U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njKnvu45aibuM6Hno6n3t+HGy/fPju7uvk3c8qvAsBGtjGrNp6V8zO+1l5Usf66Rrls9rmQfYNxgWQt3oVemV8AWKApKXYBzaIVOz4dOO3xjb4oC9U86BeNAbq4eFfa8OJ8WfCcEV0wN8LGafYA0aKW+ihhV9BmmB4FI3RwvzbmezBHCGaXqJ/x+jCcKpZ2ZoBendjjNWa6deD7lVyQG+9dcm4kMBRjsh/4e2nbxhm2EzcSoWlYOb6DrnofOarU2vUQ6nrq3RayGoiHDsFTazS4YN3PnlZMRyOxixkzOYf2EKPepewfW+yz4c0R+4HVATMKl8NT3X5HapUxuToz7nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ftms0R3l; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwdqK1NRqz3c9k
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2026 12:15:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1783563355;
	bh=tH41RNED5+clJ8bDU3yrsPjDBxC2yWIilI8EOLE574U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftms0R3l1Hxi9KJ9589VO97Frg6kN7OeNXibsjqRd65pV+OUowKvaK4G4y+TYgTcP
	 uB8ZX8+0DdAGA9lY46OHDqUkT6OKe9E+U6Qv3eAvvB2EFuX83vJgLY32mW9W7R2I3G
	 +bdp1eQu07nsN0ZxcHvRxL+ScRsJuX6dFWeI1ii/hsUmk6FVy6+KDGykQo2oHiHIm9
	 4FEHkiIC5/XDz69xWmYZ9N8Ig7zcnjVc4pCi+OBHq3yDJBRjbDDph0P556SoViAXfd
	 92Bij0zFycrY5a3rYKvMIzMD5MaGxwK7jNQEI3u5uDKgKDeiaeMte/jhozACIZDuW1
	 4PMwao+akqDRQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4823960288;
	Thu,  9 Jul 2026 10:15:53 +0800 (AWST)
Message-ID: <ddb133ca1a3be605ee776b2276c1907c9ad32491.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Jul 2026 11:45:52 +0930
In-Reply-To: <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
References: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
	 <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4446-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:p.zabel@pengutronix.de,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:from_mime,codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DAD972BE45

Hi Ryan,

On Fri, 2026-01-16 at 10:53 +0800, Ryan Chen wrote:


...

> diff --git a/drivers/phy/aspeed/phy-aspeed-usb3.c b/drivers/phy/aspeed/ph=
y-aspeed-usb3.c
> new file mode 100644
> index 000000000000..872d2163fcf5
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-usb3.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#define PHY3S00		0x00
> +#define PHY3S00_INIT_DONE		BIT(15)
> +#define PHY3S00_SRAM_BYPASS		BIT(7)
> +#define PHY3S00_SRAM_EXT_LOAD	BIT(6)
>=20

...

> +
> +static int aspeed_usb3_phy_init(struct phy *phy)
> +{
> +	struct aspeed_usb3_phy *aspeed_phy =3D phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(aspeed_phy->clk);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "Failed to enable clock %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(aspeed_phy->rst);
> +	if (ret) {
> +		clk_disable_unprepare(aspeed_phy->clk);
> +		return ret;

Nit: Given we have to do this below if the reset_control_deassert()
succeeds, perhaps add a label below and use goto here?

> +	}
> +
> +	/* Wait for USB3 PHY internal SRAM initialization done */
> +	ret =3D readl_poll_timeout(aspeed_phy->regs + PHY3S00, val,
> +				 val & PHY3S00_INIT_DONE,
> +				 USEC_PER_MSEC, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(aspeed_phy->dev, "SRAM init timeout\n");
> +		goto err_assert_reset;
> +	}
> +
> +	val =3D readl(aspeed_phy->regs + PHY3S00);
> +	val |=3D PHY3S00_SRAM_BYPASS;
> +	writel(val, aspeed_phy->regs + PHY3S00);

According to the datasheet PHY3S00[15] (PHY3S00_INIT_DONE above)
indicates that the PHY internal SRAM initialisation is complete. The
datasheet reports the SRAM is used for configuration of calibration
among other things. PHY3S00[6] instructs the PHY that software has
completed loading the configuration data into SRAM, however
PHY3S00_SRAM_BYPASS (PHY3S00[7]) tells the PHY to load configuration
from "hard wired" values.

Is it necessary to wait for SRAM initialisation to complete if we're
bypassing it? Or are there other side-effects involved in the setting
of PHY3S00[15]?

> +
> +	/* Set protocol1_ext signals as default PHY3 settings based on SNPS doc=
uments.
> +	 * Including PCFGI[54]: protocol1_ext_rx_los_lfps_en for better compati=
bility
> +	 */
> +	writel(PHY3P00_DEFAULT, aspeed_phy->regs + PHY3P00);
> +	writel(PHY3P04_DEFAULT, aspeed_phy->regs + PHY3P04);
> +	writel(PHY3P08_DEFAULT, aspeed_phy->regs + PHY3P08);
> +	writel(PHY3P0C_DEFAULT, aspeed_phy->regs + PHY3P0C);
> +
> +	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(aspeed_phy->rst);
> +	clk_disable_unprepare(aspeed_phy->clk);
> +	return ret;
> +}
>=20

...

>=20
> +static struct platform_driver aspeed_usb3_phy_driver =3D {
> +	.probe		=3D aspeed_usb3_phy_probe,
> +	.driver		=3D {
> +		.name	=3D KBUILD_MODNAME,
> +		.of_match_table	=3D aspeed_usb3_phy_match_table,
> +	},
> +};
> +module_platform_driver(aspeed_usb3_phy_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("ASPEED USB3.0 PHY Driver");

MODULE_AUTHOR()?

Andrew

