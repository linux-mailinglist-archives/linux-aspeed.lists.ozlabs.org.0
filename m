Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7B21C51C
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jul 2020 18:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3w5N2wBVzDr2N
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Jul 2020 02:16:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=KYzV8/ZH; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3w5C4l95zDqwm
 for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Jul 2020 02:16:15 +1000 (AEST)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17F5F2075F;
 Sat, 11 Jul 2020 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594484172;
 bh=+BSGlLJBW8PWM3+BVUVf02ZgKAnl9LalQ3SOruYoT0c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KYzV8/ZHzQUxOw0I+CMVF1wiT7uZvnhyd5eD8mS4uTYghTKVvoI1GyIKVUC5Xsr9w
 hxDLexH9X30DWfBvlRbOmueols7wGfzk83ckeBTFqoqPdjxkSV7VkCQc5YavKKQX6I
 pbm6ixyLjgSmjs1abybkS1DG68Ot/UF/1b2oLr8Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709195706.12741-2-eajames@linux.ibm.com>
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-2-eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] clk: AST2600: Add mux for EMMC clock
From: Stephen Boyd <sboyd@kernel.org>
To: Eddie James <eajames@linux.ibm.com>, linux-clk@vger.kernel.org
Date: Sat, 11 Jul 2020 09:16:11 -0700
Message-ID: <159448417133.1987609.8669229169177662950@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 mturquette@baylibre.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Eddie James (2020-07-09 12:57:05)
> The EMMC clock can be derived from either the HPLL or the MPLL. Register
> a clock mux so that the rate is calculated correctly based upon the
> parent.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Applied to clk-fixes
