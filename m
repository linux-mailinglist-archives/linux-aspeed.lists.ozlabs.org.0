Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D55F377F
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Oct 2022 23:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhD7R46wvz30NN
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Oct 2022 08:12:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agvtNGPA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agvtNGPA;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhD7H2Ptyz2xJF
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Oct 2022 08:12:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 075ADCE0E6A;
	Mon,  3 Oct 2022 21:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC63C433D6;
	Mon,  3 Oct 2022 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664831540;
	bh=PMXiHaHX8cdiMSpxbKSGFpYCW/v8Nl0ML/t1WU7O3Vs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=agvtNGPAXNkN0PMbndePEtBWIM9VSrpgYOM+xFcfi7OSZePc1E7ygsnv9Yo3B17no
	 tBv6D9y1v5PLAvFIxt5e0CFHL3VC1szlF7McVq9dj3b5dp8ldGBkXolch9PVGW/t8/
	 rNZQ8N9K9SuNJ3g5jJAYmWs7XPoxirNPcgp0AE6qc9bixwDWwPn677lKhuYW8O4Rg/
	 qv+t6wTsmGy8DUNHpa/US0d0UBsbBrISlOJrfMHPu14ctwWrCQ50p5LAP+q6+E/bXr
	 jMzHS4CrGG7DKgtT9Kpx2uPQsV3QSBheWbzaX1LvHZyN2uQc/auLd4gkRKomTDfHlN
	 +XVkg9ROfIyjw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220421040426.171256-1-joel@jms.id.au>
References: <20220421040426.171256-1-joel@jms.id.au>
Subject: Re: [PATCH] clk: ast2600: BCLK comes from EPLL
From: Stephen Boyd <sboyd@kernel.org>
To: BMC-SW@aspeedtech.com, Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Date: Mon, 03 Oct 2022 14:12:18 -0700
User-Agent: alot/0.10
Message-Id: <20221003211220.3EC63C433D6@smtp.kernel.org>
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
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Joel Stanley (2022-04-20 21:04:26)
> This correction was made in the u-boot SDK recently. There are no
> in-tree users of this clock so the impact is minimal.
>=20
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Link: https://github.com/AspeedTech-BMC/u-boot/commit/8ad54a5ae15f27fea5e=
894cc2539a20d90019717
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next
