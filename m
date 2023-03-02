Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF06A78A0
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 01:59:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRt5t4wsxz3cFW
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 11:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=U2Q0zgjR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=U2Q0zgjR;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRt5c24mBz3c6C
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 11:58:44 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 7702B2024F; Thu,  2 Mar 2023 08:58:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677718721;
	bh=lYoTPeexRcOzzTOGXNKHbOel7qjqCaaeX1rZP2bFTX4=;
	h=From:To:Cc:Subject:Date;
	b=U2Q0zgjRpreRtnQiVkZ+hd4kAZ01WdIXMuzxbAcRpPaMB8M0nhBk1ZzpvnQQvBuVy
	 QnoYzqraoWiTqtzrwAylgYGQ1YL8TJ3ledWHbiIJYtt6oFRUvGlusDTXAYCca8FIg3
	 o2vGoqQEI2Vj4bYeRDwHo2+HA7a6uD1uAxcTeOvqaaz3roPaxYCPyBHBGlSbAmGBUD
	 JO9NMaKwl/mR7nUkUBGxpRKTv/0+hBVXE5yp2E1DW+qqIcI/JDHryxH2Rw405xJ1e+
	 7ovoJVUVT4llNRFCeFSsWHtSTd1jFXJgg89POg4WMJUNoCQmRmHydoY7C+c4FbjEAc
	 YPeXEv2xqtWTA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 0/6] Add definitions for AST2600 i3c clocks
Date: Thu,  2 Mar 2023 08:58:28 +0800
Message-Id: <20230302005834.13171-1-jk@codeconstruct.com.au>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

v5:
 - use regmap_update_bits rather than FIELD_PREP
 - drop reset defines; resets should be handled by clock control
 - add comments for the above
 - add comment for NUM_CLKS semantics
v4:
 - ensure we have enough space in ASPEED_G6_NUM_CLKS
v3:
 - split dt-bindings from clk changes
 - unify subject prefixes
v2:
 - based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.

Jeremy Kerr (6):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  dt-bindings: clock: ast2600: Add top-level I3C clock
  clk: ast2600: Add full configs for I3C clocks
  dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
  clk: ast2600: Add comment about combined clock + reset handling
  dt-bindings: clock: ast2600: Expand comment on reset definitions

 drivers/clk/clk-ast2600.c                 | 67 ++++++++++++++++++++---
 include/dt-bindings/clock/ast2600-clock.h |  5 +-
 2 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.39.1

