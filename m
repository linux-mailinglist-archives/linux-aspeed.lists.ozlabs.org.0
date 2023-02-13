Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB976693E04
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 07:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFYfC4GZSz3c6d
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 17:02:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WIPpnDak;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WIPpnDak;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFYf15rjtz3bh1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 17:02:33 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id CA752200E3; Mon, 13 Feb 2023 14:02:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676268151;
	bh=SOWZZPJGDZPZMw6VKanvUlJnXziSzitX11n08pf7ETU=;
	h=From:To:Cc:Subject:Date;
	b=WIPpnDakZLa8iCkeyf1vdmoJdKgUIaYQ4zYD14hyUbevi9/HAkrzbHCcVldhWMf6g
	 UYxgC0TW97byyRIOWVN6Mgy816YYaH3kOJZJjREWWn9BmlRL63vmxjD0WqFZux6vTA
	 8VxMyGmNcz8jOy0vtMaYaEHJKtC8w8ZvJPjiY9CWrO/d8ZXaah+LvsO6byWvmED2Ju
	 fWX2f4tTAND/Ap3nCnSt6HN7hc3gmxr3WhXOLmvjObHpFw8RWqqAg7d93UypdA7eEi
	 JQnV4GdcSd81JfmM2aEjBg6qkEnELi1cVpzdlPvCzA63yz+QASoyE3rjjNbdAxJToT
	 SlWAJMdbOxHcg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/3] Add definitions for AST2600 i3c clocks and resets
Date: Mon, 13 Feb 2023 14:02:05 +0800
Message-Id: <cover.1676267865.git.jk@codeconstruct.com.au>
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

v2:
 * based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.


Jeremy Kerr (3):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  clk: aspeed: Add full configs for i3c clocks
  dts: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 41 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.39.1

