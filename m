Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB36946E0
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlSM0RrGz3bTq
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:24:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SsbW8jVc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SsbW8jVc;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlS55f0Lz2x9T
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:24:37 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 2466920260; Mon, 13 Feb 2023 21:24:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676294677;
	bh=KxCJhgCD147FONaRQXGIowuXrZg+dpJaJ8MxOzByVg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SsbW8jVcJV2aA+/K/4MURd74QFs1nkOp8yFD5RM/CVK22emQWYHczK1nsl01AOobS
	 Y4ilfjfNQdosnu8iysmauqkMoInZJ2AwBxSuLEKzZCZr3si330mls+uhJqqx55P8gI
	 OfShowVshDUpWU0s8aZVP2gvXWoYBm7xOtl+yEJQQM2LzX0hbrXthC/S3kK3CdpYGd
	 vsnHNMhMxbBIJLDmX9pkfCOMAF02+N+amN5/IacBxBQJRaxTpRQDJrBeQbX9i6770d
	 MCef5U3PAENM0v+rgMNFYE9RKvjCT7ql1BcQDHYyPPeEmljWeJlS5XZ4wF8h0FL+q7
	 JJnnUIBJ+R7Ow==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: clock: ast2600: Add top-level I3C clock
Date: Mon, 13 Feb 2023 21:24:18 +0800
Message-Id: <cfa142894e3e3a2895ae1ef7dce9bc89c493b9f4.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676294433.git.jk@codeconstruct.com.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
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

The ast2600 hardware has a top-level clock for all i3c controller
peripherals (then gated to each individual controller), so add a
top-level i3c clock line to control this.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - split into separate bindings & clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index d8b0db2f7a7d..608ce576e63e 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_I3C			74
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.39.1

