Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95F28D8B6
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Oct 2020 04:50:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9xjm3kprzDqLt
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Oct 2020 13:50:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Kqz83Gst; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9xjc25TZzDqLt
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Oct 2020 13:50:27 +1100 (AEDT)
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AC4A21775;
 Wed, 14 Oct 2020 02:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602643824;
 bh=t1NAjWm5WI7hLJxk22EulkFvJQp0ZmLPSt6XkGLLllk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Kqz83Gst+aikoaD44NPIkqiQe/0o5n0N2H7JEI7FVc0emRLrys9O5hEE7/s4ThdRv
 vg4B73us88R77FyibZsG+3zBaBP0Zk+njKkK5O9E4krppJNbnPizBvYBiSZ9ayQQGB
 0yUAfgyjQRKSNZlWg1nFWqxdlkzrxBGNXZAB/LTs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200928070108.14040-2-ryan_chen@aspeedtech.com>
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
 <20200928070108.14040-2-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
From: Stephen Boyd <sboyd@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Michael Turquette <mturquette@baylibre.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, bmc-sw@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2020 19:50:22 -0700
Message-ID: <160264382296.310579.9835482254268204873@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Ryan Chen (2020-09-28 00:01:08)
> In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2 are
> default for Host SuperIO UART device, eSPI clk for Host eSPI bus access
> eSPI slave channel, those clks can't be disable should keep default,
> otherwise will affect Host side access SuperIO and SPI slave device.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

Is there resolution on this thread?
