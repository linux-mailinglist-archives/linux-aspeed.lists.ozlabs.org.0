Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C282F964D3A
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 19:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvpjL2HbNz302T
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 03:50:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724953843;
	cv=none; b=LCQm9MxcCH0ef0ug9t1oyNdM+DDnsBlCamN++OkoqMixA8b7jy52PDxgC3RBzPCBc+t94V0GSpj3GtxBcf0DQBEJj5nVqV58aCv1H0kj00MNm+ZMIhMSp1Dl9uxSuXf2cPPu4acqL7ax85Prji7hr/9TKaXxWNVXy7JdNiYNqQLCWHJBN9syb892b0EKS+U28Q30yOpNorVslv/uxVwhSK06EMud8QN92QHL38AT7WHsqt4DwmHLUoBu2TB+B+j9PWA3JWUlMJxm2mpZlH/M2Btql5EHQBpr6dnUfmr2rMBcwgC3NF6vhC0hEWsxqmRr3beqNUMrac7Xa0Lr14/X2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724953843; c=relaxed/relaxed;
	bh=UAl+mop00EQbepJoYevRJuK7En4/MOvUK941qxMIEMM=;
	h=Received:Received:DKIM-Signature:Message-ID:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:
	 Subject:From:To:Date:User-Agent; b=imnLhDLCvYAm6SKpUn79+aYnKM5JHVbtbxOlEX+ghfd1N4W9i411YbNUqlcCqMX8uAzz30104m0T2l3noW2r/HqlvigIFUJ+9/wrs5XwY+Mt8jsIjM6tPydFLn+bbykZ2+FvTOaI8ZFoZB+dFSoEg0VZeQXCvd2Tu7b1GbKrY+JS7WQY2sIJ3cjsP3zoc4fGYXBH6qreSzitTmQBQa8jqUhfzyVM5Allo0RbtpklUUaQSAsbQU7AgbVD4qDEvOkinrLPwJxD3zvzb5JnEmM6qRYPUyW/2lSugn7XA+FXKFyqtDEHmBa8UDkoB2DcpSjsdIvRKHI7Ml7JE/Vz5MtznA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gY/8sdlE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gY/8sdlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvpjG5mCVz2yxL
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 03:50:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A45EEA416DA;
	Thu, 29 Aug 2024 17:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0A1C4CEC1;
	Thu, 29 Aug 2024 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724953839;
	bh=Xy3NW4pFyHQqbMAZ00aMDkY+SK+roG6AjV6zLmJQKB4=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=gY/8sdlER4kFUWz2FBBAW3hOJ0idxFM12wivu7B21nS+1jiGPY5bWo0FGYDNGmzJZ
	 QpbxFv9OROwSSfuX2jqB4WHkP7hpR2IIzyq9irjlluazTmX3aQzquyWy9HxEeQFB1G
	 lP82I8WJRsORObFpaojziBrCrs91ZzWGBO6ig1+m9YM8l3vkHprJlb0Gam5bAz8HdI
	 a+OdbQ26HGCdmJU05TVbSLk+q0deArTeWRGBGWoSWR20yGnnLAr4SuCN0RQ86g5opS
	 oMBonC02+nhTT+FjSbUfmDWYOHvLN4+FjKsoNJ+xUuvHKaf32/++qC4b0TTq27MHsT
	 PfFglx6fbbggA==
Message-ID: <3569ef6d81adc41330c4002752ba3aa9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS8PR06MB7541F12972412AE565A93287F2962@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240828062740.1614744-1-ryan_chen@aspeedtech.com> <20240828062740.1614744-4-ryan_chen@aspeedtech.com> <61c8234139fcd2b27610ef18e9d9fbf7.sboyd@kernel.org> <OS8PR06MB7541F12972412AE565A93287F2962@OS8PR06MB7541.apcprd06.prod.outlook.com>
Subject: RE: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
From: Stephen Boyd <sboyd@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Thu, 29 Aug 2024 10:50:37 -0700
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

Quoting Ryan Chen (2024-08-29 00:09:12)
> > Subject: Re: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
> >=20
> > Quoting Ryan Chen (2024-08-27 23:27:40)
> > > a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c new file mode
> > > 100644 index 000000000000..7e0466e73980
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-ast2700.c
> > > @@ -0,0 +1,1198 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2024 ASPEED Technology Inc.
> > > + * Author: Ryan Chen <ryan_chen@aspeedtech.com>  */
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/clk-provider.h>
> > [...]
> > > +
> > > +struct ast2700_reset {
> > > +       void __iomem *base;
> > > +       struct ast2700_reset_signal const *signal;
> > > +       struct reset_controller_dev rcdev; };
> >=20
> > Please move the reset controller to the drivers/reset directory by mean=
s of
> > using an auxiliary device. There are some existing examples in there if=
 you
> > grep for auxiliary_device in drivers/reset to help guide.
>=20
> Do you mean to have another reset controller driver?
> If yes, I may need syscon for remap two drivers.

Yes. A syscon is not necessary to do that.

> >=20
> > > +
> > > +#define to_rc_data(p) container_of(p, struct ast2700_reset, rcdev)
> > > +
> > [...]
> > > +
> > > +static int ast2700_soc0_clk_init(struct device_node *soc0_node) {
> > > +       struct clk_hw_onecell_data *clk_data;
> > > +       void __iomem *clk_base;
> > [...]
> > > +                                            0, clk_base +
> > SCU0_CLK_STOP,
> > > +                                            28, 0,
> > > + &ast2700_clk_lock);
> > > +
> > > +       of_clk_add_hw_provider(soc0_node, of_clk_hw_onecell_get,
> > > + clk_data);
> > > +
> > > +       return 0;
> > > +};
> > > +
> > > +CLK_OF_DECLARE_DRIVER(ast2700_soc0, "aspeed,ast2700-scu0",
> > > +ast2700_soc0_clk_init); CLK_OF_DECLARE_DRIVER(ast2700_soc1,
> > > +"aspeed,ast2700-scu1", ast2700_soc1_clk_init);
> >=20
> > Why can't this be a platform driver?
> Due to clk and reset will be the first driver in core.
> Do you think all drivers should be platform driver?

Yes all drivers should be a platform driver.
