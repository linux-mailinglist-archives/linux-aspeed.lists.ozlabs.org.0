Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C883190735
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 19:49:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699nD4qNdzDr3M
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 03:49:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="uuNsX+zn"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698k92TQmzDr7x
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 03:01:52 +1000 (AEST)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E6772077C;
 Fri, 16 Aug 2019 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565974910;
 bh=kRQdySEFfbNhYV8BmidHDQ/rtgeMqFr1JW9v/ifI7XE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uuNsX+znuy1DGYakmALpmy1BjPJyfebQMKl5cBSg1KfNGFTK4JURmOCy6NOGLk/Pa
 6skHQhX+mLXaBjvLbzf7UA+lXmkjY0gzheppmOmslj5fbi0UwBo1UPOW7B3EnXL9ak
 0AQLcfUjw1WUbRc4bq6cyYukdgAcQj91AePbHmAE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190816155806.22869-2-joel@jms.id.au>
References: <20190816155806.22869-1-joel@jms.id.au>
 <20190816155806.22869-2-joel@jms.id.au>
Subject: Re: [PATCH 1/2] clk: aspeed: Move structures to header
From: Stephen Boyd <sboyd@kernel.org>
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date: Fri, 16 Aug 2019 10:01:49 -0700
Message-Id: <20190816170150.4E6772077C@mail.kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Joel Stanley (2019-08-16 08:58:05)
> diff --git a/drivers/clk/clk-aspeed.h b/drivers/clk/clk-aspeed.h
> new file mode 100644
> index 000000000000..92d384367c25
> --- /dev/null
> +++ b/drivers/clk/clk-aspeed.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Structures used by ASPEED clock drivers
> + *
> + * Copyright 2019 IBM Corp.
> + */

Please include reset.h (or whatever defines reset_controller_dev),
clk-provider.h, kernel.h (for container_of and types), and forward
declare struct regmap and clk_div_table here.

> +
> +/**
> + * struct aspeed_gate_data - Aspeed gated clocks
