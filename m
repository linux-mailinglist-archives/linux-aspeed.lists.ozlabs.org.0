Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D88693D26
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 04:49:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFVhT2z2Sz3c6y
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RVbFq5CG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RVbFq5CG;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFVhN0p5hz302m
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 14:49:23 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 85AC6200E3; Mon, 13 Feb 2023 11:49:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676260160;
	bh=erDpDwF/cExM1uPDf3agcPHzcsJY6zCHxSnfbsh5mzA=;
	h=From:To:Cc:Subject:Date;
	b=RVbFq5CG921DVFcPRPnb67FYhhn7CPLIgahEtHg/I+rnjerSxXX+5Wz4MFhDEvl12
	 vca7cvYsf7NooFdsVk1apdroFoxHupcRBa2D3yX5iM3zh/oVppwzz/QJSuwouV+xtl
	 iXshkACFCZkbNe3jTnwR0mPXWjTDvgtysHKnLeHzwNy9JWN8cV8r8hsPSiQalY+jbF
	 4uZGvstOXr20otJueIwAk5bbdJO/l9Cu11P6xN3VITKEEEb1mGlo+50D8f1BVqh1I3
	 NJXiF9rON5WQ2vHjlXJfgcqEYrMtNitzNBl2vipiX7AfcYlMTLDFtRoGQOE6NQkztm
	 x5qqts8dy8EUw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] Add definitions for AST2600 i3c clocks and resets
Date: Mon, 13 Feb 2023 11:48:31 +0800
Message-Id: <cover.1676259904.git.jk@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Joel Stanley <jms@jms.id.au>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

Jeremy Kerr (2):
  clk: aspeed: Add full configs for i3c clocks
  dts: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 39 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h | 12 +++++--
 2 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.39.1

