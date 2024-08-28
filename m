Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9596306A
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 20:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvD1t3y6lz2ynn
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 04:48:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724870880;
	cv=none; b=jNI2wtQeUBSqemYJSJHwpDhnLwUXhukipxRe60DzhR2YEMvIHmEbQP0qI26cEYadHY77bOWsLcl9EBHvxVGiqYh+VOSfxvJ3Y+bb7Pj5m77ColQutGc8LVcYOs4L9jcocU1UgHDprKkzlUeVciT1yfyl09QjCKDnIpC7oBQCWN//wTHotIssZ76yK1p97IVNqsBgS10gozjQQBAwQTHx8ztOdVYHuH2Vp68Kb0T6yZ4Wz4aZiWyJxjcCAM/YtJ05G4vyvbMa3aVOb5aFoLbbrb3cJZAf43CNmka6NpEgsK++8tOm+EN4VgIhdMa49IQbHtmOIf2V0Ql5YaXXj+7snw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724870880; c=relaxed/relaxed;
	bh=AnRfWLDoOEgADKuq1aQWReqd6GsOPhqhINrFLg0D4i8=;
	h=Received:Received:DKIM-Signature:Message-ID:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:
	 Subject:From:To:Date:User-Agent; b=WstRDiPE+kv5OksJDIGA351Vklmpgi+hWziSsMRQ4U/6IdMoqdeJiP6thYJMbMrBklytCPDtuIF/ezXsE6achorthAe0UmhVUBRGKww8RzqiR5YxD0mxPcoHTXbYO20MmbytKECX+hdkKbyK0tEoYRB++0aj8Gz8DcTpWeNyd0nuXTvUlGvU1kqtjOsY9cC4rz2psDZccBA+dveCAtnyJljpd95GQc+msvupkknIhCl/9+gi7TJW3eQ00ISxHn5lIKP40LC2plCa1InV91BAr/CiMsza8pp7dCQyce/R7aUzEv+zoAPfFqvDcHCuvVfSUjATKBHWazvA5n+WZmKqsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QG/Wu4bH; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QG/Wu4bH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvD1q4sCmz2y83
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Aug 2024 04:47:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E90B4A40946;
	Wed, 28 Aug 2024 18:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A123C4CEC0;
	Wed, 28 Aug 2024 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724870876;
	bh=BWqtKeZjzI89ouRoevpj7gC/9WLPfDVqSv+VnjFUUv4=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=QG/Wu4bH7Skgv9fh1+BCAdSlUsc+q6ygbSJwP+eAJzkAkDo/FjXXFnKVLtNtbHmVC
	 xcQRuKe48fV5FFzyL32N9b2GJBiqH/rchG1C6MgwQ7x4o1znlQXFpzUPw5aI3pKfhK
	 qVlspvwIujse9n9OsmH25IPpg9Mmi2+T/+x5DVhYvhumHLEoQPQi5AMrfWNhXwJAAQ
	 sr1UxEJX0N3te3bC2kFfutZ8pZ4ZifyjLi2MdD9uWeDPcv13sA1bjFNUHTAF8z0Bhh
	 PB9Qg6YJkrO/QgJ8wehkqWAAWsSpdBCttQb2/hu+qaaKt9sC8g8FOvSl5TZkUGnRvm
	 oH+c2DMzAXvzA==
Message-ID: <61c8234139fcd2b27610ef18e9d9fbf7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240828062740.1614744-4-ryan_chen@aspeedtech.com>
References: <20240828062740.1614744-1-ryan_chen@aspeedtech.com> <20240828062740.1614744-4-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
From: Stephen Boyd <sboyd@kernel.org>
To: andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, ryan_chen@aspeedtech.com
Date: Wed, 28 Aug 2024 11:47:54 -0700
User-Agent: alot/0.10
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

Quoting Ryan Chen (2024-08-27 23:27:40)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 983ef4f36d8c..855b65f2d6dd 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -269,6 +269,16 @@ config COMMON_CLK_ASPEED
>           The G4 and G5 series, including the ast2400 and ast2500, are su=
pported
>           by this driver.
> =20
> +config COMMON_CLK_AST2700
> +       bool "Clock driver for AST2700 SoC"
> +       depends on ARCH_ASPEED || COMPILE_TEST
> +       select MFD_SYSCON

Why is this a syscon?

> +       select RESET_CONTROLLER
> +       help
> +         This driver provides support for clock on AST2700 SoC.
> +         This driver is responsible for managing the various clocks requ=
ired
> +         by the peripherals and cores within the AST2700.
> +
>  config COMMON_CLK_S2MPS11
>         tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>         depends on MFD_SEC_CORE || COMPILE_TEST
> diff --git a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c
> new file mode 100644
> index 000000000000..7e0466e73980
> --- /dev/null
> +++ b/drivers/clk/clk-ast2700.c
> @@ -0,0 +1,1198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 ASPEED Technology Inc.
> + * Author: Ryan Chen <ryan_chen@aspeedtech.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
[...]
> +
> +struct ast2700_reset {
> +       void __iomem *base;
> +       struct ast2700_reset_signal const *signal;
> +       struct reset_controller_dev rcdev;
> +};

Please move the reset controller to the drivers/reset directory by means
of using an auxiliary device. There are some existing examples in there
if you grep for auxiliary_device in drivers/reset to help guide.

> +
> +#define to_rc_data(p) container_of(p, struct ast2700_reset, rcdev)
> +
[...]
> +
> +static int ast2700_soc0_clk_init(struct device_node *soc0_node)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       void __iomem *clk_base;
[...]
> +                                            0, clk_base + SCU0_CLK_STOP,
> +                                            28, 0, &ast2700_clk_lock);
> +
> +       of_clk_add_hw_provider(soc0_node, of_clk_hw_onecell_get, clk_data=
);
> +
> +       return 0;
> +};
> +
> +CLK_OF_DECLARE_DRIVER(ast2700_soc0, "aspeed,ast2700-scu0", ast2700_soc0_=
clk_init);
> +CLK_OF_DECLARE_DRIVER(ast2700_soc1, "aspeed,ast2700-scu1", ast2700_soc1_=
clk_init);

Why can't this be a platform driver?
