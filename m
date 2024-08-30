Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270D966C26
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 00:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwXYQ5hFLz30T6
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 08:16:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725056183;
	cv=none; b=I1DZsDfHkYIdHcPA75xCFjobb1ZyrxC2oJ53cgglyzBQmFvHgtsOq9XGDDeJ7RIPXlaZ6oX5R/8291JHwbCvPKTmj8feV80G9sGTGCv/crRUlEbIWueQ5xUv0QBMrIx+wsF5qLBdDHvqIC30atFFzfpkmhtTEarqU4sE5gjNkuxk0qKIcfD2frcXoPmZ7RiZO03uZmSVRZCV3M6hr0yUsa5l6F1nYa1ugdZGcrNDlzCDBPMF+IwSicA3FqnF7GeNfF42EWEjJYg9Z2zu9euYJzlUGJO2t1VtPZt/N+5CuD68FEY3SfwPdS9GAbHUMR08hMZ/kP4JmtassjNtlIiVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725056183; c=relaxed/relaxed;
	bh=I7H81hQF268KAroQBxNa0F30Khcefp1vM0KlS38dQhQ=;
	h=Received:Received:DKIM-Signature:Message-ID:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:
	 Subject:From:To:Date:User-Agent; b=drti7cYb2umm1cgoat27UlWEMksSUqfhcnlVImp9dLBjsE/KlHusVXiommss9lJ/xfcEjgMG9lBlVi2hnBq+nhJK1fOyB3je3NHtUYGFvXMmf7k70CmQxpGE3BDWb6n/T8kzCSTM6QicDnogPaywlVivTl+GFNNTHlRHRHW4fvABLNiohyigyq3NnOrc6SlgJ/pZHgBSu3A5CS5lAf+/mlCaqmQjIZQ8upJaJfx/mY73BiySgZ7Sw/CgdMJwq4c2uR3/JEONjE4/Rs9vTT3W8NR3ON5nJPa+6mj0qVFdSwLx/EbZuFS1VYT7cBzLvdWro+2PA0aAQLnO+k393st2dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M71grJzl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M71grJzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwXYM4h75z2yw2
	for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2024 08:16:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E68DA44548;
	Fri, 30 Aug 2024 22:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2966AC4CEC2;
	Fri, 30 Aug 2024 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725056180;
	bh=fJOk64w1KvNsgFSNifgZViqLAi1eNKi+j0BhblwmrqI=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=M71grJzlvDD6cLtOVpcRPMqiP3ECPrxcF6jYFTtWUOZYK2zIxVVnixshiJ/zCiqU0
	 HGNwMPngVcz3Cxkt5qRTeLfER3GJScGke3fhsK+eQwPWJa4lzZEdI0pxwgak+e3Pdi
	 DUk+1AEFZ7ds7SlcKDm3YeDFgOVb72p50fn2HAzr4Of7uONRlzlrZ48aPAykaP7CsZ
	 G6ZBalQyGL5+OpO9l7XEGqbx27MtkJ6qBivaU1/djv5FJYti9h58Lrhhy8Xn0k/Orq
	 m9L/ofkc3+rmzH1SyDr0iGe4vNrZuSaOXePM/e4DhXUnHA8t6JhTFgS96MlL6N4Pge
	 8c3BWK9Y0ebKQ==
Message-ID: <45c7cf75876c5822f8c51f05375af507.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS8PR06MB7541BFDC6D2E490ECDAE085CF2972@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240828062740.1614744-1-ryan_chen@aspeedtech.com> <20240828062740.1614744-4-ryan_chen@aspeedtech.com> <61c8234139fcd2b27610ef18e9d9fbf7.sboyd@kernel.org> <OS8PR06MB7541F12972412AE565A93287F2962@OS8PR06MB7541.apcprd06.prod.outlook.com> <3569ef6d81adc41330c4002752ba3aa9.sboyd@kernel.org> <OS8PR06MB7541BFDC6D2E490ECDAE085CF2972@OS8PR06MB7541.apcprd06.prod.outlook.com>
Subject: RE: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
From: Stephen Boyd <sboyd@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Fri, 30 Aug 2024 15:16:18 -0700
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

Quoting Ryan Chen (2024-08-30 00:50:21)
> > Subject: RE: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
> >=20
> > Quoting Ryan Chen (2024-08-29 00:09:12)
> > > > Subject: Re: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
> > > >
> > > > Quoting Ryan Chen (2024-08-27 23:27:40)
> > > > > a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c new file
> > > > > mode
> > > > > 100644 index 000000000000..7e0466e73980
> > > > > --- /dev/null
> > > > > +++ b/drivers/clk/clk-ast2700.c
> > > > > @@ -0,0 +1,1198 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (c) 2024 ASPEED Technology Inc.
> > > > > + * Author: Ryan Chen <ryan_chen@aspeedtech.com>  */
> > > > > +
> > > > > +#include <linux/bits.h>
> > > > > +#include <linux/clk-provider.h>
> > > > [...]
> > > > > +
> > > > > +struct ast2700_reset {
> > > > > +       void __iomem *base;
> > > > > +       struct ast2700_reset_signal const *signal;
> > > > > +       struct reset_controller_dev rcdev; };
> > > >
> > > > Please move the reset controller to the drivers/reset directory by
> > > > means of using an auxiliary device. There are some existing examples
> > > > in there if you grep for auxiliary_device in drivers/reset to help =
guide.
> > >
> > > Do you mean to have another reset controller driver?
> > > If yes, I may need syscon for remap two drivers.
> >=20
> > Yes. A syscon is not necessary to do that.
> Thanks for point out auxiliary device.
> Since our SoC reset and clock share the same register region.
> Your recommend will use clk auxiliary_device_add for reset driver am I ri=
ght?

Yes. Either the clk or the reset driver can be a platform driver and the
other an auxiliary driver.
