Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F066946DF
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:24:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlSG5TGhz3c73
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:24:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DLyAgzZr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DLyAgzZr;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlS524sGz2x9T
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:24:37 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id CF17C200E3; Mon, 13 Feb 2023 21:24:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676294675;
	bh=xWVo/cioNLips5Na/dw9hBc7pbRVy2N8LT3wjXnTbLY=;
	h=From:To:Cc:Subject:Date;
	b=DLyAgzZrUNhDLoWUzhUmVo0X8GxWUH+wrRKqT/mW1MQgBw4R4YMJsAdaFh1nyuuJu
	 OLOwv466GEoyxkzNrBm5/bv6ddOh7kCcN3miqpRhjl1zseuEIu9O3HL+Un2dJQkDqj
	 biIzuw3b2KIZoDSSAA5Xl4bsiwYx2Fr7shBBqssqm7SVMLwQFMT6QGOP0zaRwShTrX
	 4/Fd9WdB7RJSs8b2NbmvkT0CK8gg1B2CoOLvzEiRKDYf4qfe7D/ioUe546vjM6m8G7
	 apD61JindsZulZ8NInDLxtmUprZJNg0lSA+aPgrpH2baZJ53cw8pE9EV29/9OEb5fY
	 N1ky0iYqEkUEw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/5] Add definitions for AST2600 i3c clocks and resets
Date: Mon, 13 Feb 2023 21:24:16 +0800
Message-Id: <cover.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

v3:
 - split dt-bindings from clk changes
 - unify subject prefixes
v2:
 - based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.

Jeremy Kerr (5):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  dt-bindings: clock: ast2600: Add top-level I3C clock
  clk: ast2600: Add full configs for I3C clocks
  dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
  dt-bindings: clock: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 41 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.39.1

