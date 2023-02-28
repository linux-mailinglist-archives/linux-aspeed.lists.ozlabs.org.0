Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B26A5567
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 10:17:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQsFT68Mmz3cDc
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 20:17:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f1X96u2O;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f1X96u2O;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQsFG4kvLz3c1K
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 20:16:50 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 271102024F; Tue, 28 Feb 2023 17:16:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677575807;
	bh=oFMs6phIpJBNXA24Nbc9r74KR/93A/vdt1YyCI02xCQ=;
	h=From:To:Cc:Subject:Date;
	b=f1X96u2OjCpws8n/R/YAt4N7kTH4QDi1y+n7ubaQCCmz4nFtGlzCp3PujvGGOXZ11
	 95aQimdoWEHLay55UrfJhsK/E0yDl3ISDWyfgWe1obnxS1Ea3JBEWzrJs9gpzLgf3V
	 GlfLUe4LYzvAXLICDU8b/TDepKNTrtOR4yxaCUMDgFMBC+OdpcgD+QKC+NspMIXNXy
	 +fUIoPgeysiqS5wffQxJXWIR6PLiyOw3M9LaTl5i+VurON1fQ+sTKGNlAeM4HN9u1Z
	 l5x1QNRNdpqBRzCo72fCSuknv75NN6hv098tzqUdeBZcAHj4Cw8+iVO3sQqVOq3tkp
	 6ahdSlNtRMFTg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 0/5] Add definitions for AST2600 i3c clocks and resets
Date: Tue, 28 Feb 2023 17:16:33 +0800
Message-Id: <20230228091638.206569-1-jk@codeconstruct.com.au>
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

v4:
 - ensure we have enough space in ASPEED_G6_NUM_CLKS
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

 drivers/clk/clk-ast2600.c                 | 43 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.39.1

