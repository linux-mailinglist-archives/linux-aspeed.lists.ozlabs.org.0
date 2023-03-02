Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA626A78A1
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 01:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRt5z00dDz3bfp
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 11:59:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GYI5WmV7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GYI5WmV7;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRt5c2C0Kz3c7K
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 11:58:44 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id F3CD120260; Thu,  2 Mar 2023 08:58:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677718722;
	bh=lj2XbEVvAW8qMsoBYzYsEfYf9ChYAdVkw9cUGu5B5L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GYI5WmV7svHrO0MWrwsejU3Zmd1sjAiDyrW1LQKAtP3P2FK4niMHMQxaBYnstCFMq
	 jHkqgAYpckgL6seXz6Svg3RxjylLzLZf4v5BxPKDqDpI9SNANOVtbwV68ZZ9eMU4C/
	 B+pGXpdfMA9xDPTM/GIQHOJtIqEo+oTBcv7s4bgMW1jr9QW2sr3EDngUSL1GuDjSWW
	 uisEnwoib1oYsD4OrGzG8aVxYoP4kTqltKukHIx0DjnmQmrCIuLzxSvyWQXhqKnX6U
	 yybmFhXXBeSsvTYDLM8lfsmSK/D4DZP0RyWOJNh5zOTj0B35G7Pc13mDw2yi22k2/m
	 160RQ9jmq0HIg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 1/6] clk: ast2600: allow empty entries in aspeed_g6_gates
Date: Thu,  2 Mar 2023 08:58:29 +0800
Message-Id: <20230302005834.13171-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
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

We're about to remove an entry from aspeed_g6_gates, but we won't want
to alter/reorder existing entries. Allow empty entries in this array.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - reword commit message
---
 drivers/clk/clk-ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 9c3305bcb27a..1f08ff3c60fa 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -652,6 +652,9 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
 		u32 gate_flags;
 
+		if (!gd->name)
+			continue;
+
 		/*
 		 * Special case: the USB port 1 clock (bit 14) is always
 		 * working the opposite way from the other ones.
-- 
2.39.1

