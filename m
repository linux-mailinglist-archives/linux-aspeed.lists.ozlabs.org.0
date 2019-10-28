Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45529E7D24
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Oct 2019 00:40:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472B6d35PZzF0Ql
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Oct 2019 10:40:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YkJki0OH"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472B6R6hkqzDrTf
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Oct 2019 10:40:31 +1100 (AEDT)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07821214E0;
 Mon, 28 Oct 2019 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572306029;
 bh=ObPc5KxyfF36jBQrMbOO/RrJdWvyO4TVaIiA0XQNzyc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=YkJki0OHTQCbmQe2ENpLJpntLyj1ThZeESVUxufVFkBQjK5yzJQzYbGsIy6S/qxc+
 swSCGeziuE9AE7bCWtLOBnQ+YmCmc/5+xJOaS5H1fiSeMew4Jc+2tSTNvi51g+i+EV
 jfB3Pw6I/c9kR4RM9bEr+uTp6ZZi5E42U7S/kOjU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016131319.31318-1-joel@jms.id.au>
References: <20191016131319.31318-1-joel@jms.id.au>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ast2600: Fix enabling of clocks
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date: Mon, 28 Oct 2019 16:40:28 -0700
Message-Id: <20191028234029.07821214E0@mail.kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Joel Stanley (2019-10-16 06:13:19)
> The struct clk_ops enable callback for the aspeed gates mixes up the set
> to clear and write to set registers.
>=20
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-fixes

