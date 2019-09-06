Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4783AC279
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2019 00:24:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QBtB1gsyzDrCN
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2019 08:24:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="PcVCeOpw"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46QBsz2QymzDr8H
 for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Sep 2019 08:23:51 +1000 (AEST)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04419214E0;
 Fri,  6 Sep 2019 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567808629;
 bh=7fWT4pSEpV668ptngcAoGmXNSeOFGFx6ayqh1U9b/uc=;
 h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
 b=PcVCeOpwb38RDWS/yuj5NA6PzqfUXRkDLDdWnyHqWvGf+ibd3zRGHXkz+W5PI+Mi/
 uQsMpsP4fmSBvZDsCFX2sxrmLFU0QaBs7hGaJzuUfm9PQIP57QxduygJsaYI5UMf8Q
 yltad5HTkUhYeC0w5OhY+BKUvA026HZlDJ5p5wmc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190825141848.17346-3-joel@jms.id.au>
References: <20190825141848.17346-1-joel@jms.id.au>
 <20190825141848.17346-3-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: Add support for AST2600 SoC
User-Agent: alot/0.8.1
Date: Fri, 06 Sep 2019 15:23:48 -0700
Message-Id: <20190906222349.04419214E0@mail.kernel.org>
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

Quoting Joel Stanley (2019-08-25 07:18:48)
> The ast2600 is a new BMC SoC from ASPEED. It contains many more clocks
> than the previous iterations, so support is broken out into it's own
> driver.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next

