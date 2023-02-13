Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E56946E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlSc15tzz3bTq
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DnMh/K7b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DnMh/K7b;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlS72gKmz2yNm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:24:39 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id D5C112035B; Mon, 13 Feb 2023 21:24:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676294678;
	bh=5PxLrMDn/dYNEzqEiYFSmslE1pxFn8IWWRuK6ldS/Oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DnMh/K7bJO0hZNUbAA9RBlOV6QhOuDNC/ThRc2itAqDgLI/L6M9F7q4k0+ihKqMSz
	 2/c9Z3dDvDy5FWT89GXxLkOu6HKOuML7wwD3C08G5bpuWcVgDnSVcrk0jZkOK8RaHD
	 y4739CP8fC7wFUFLWJhiHIh6KLHbJnaf5FGH2h2UG20LrLg7HqJWH2OBt2QBhQzn3C
	 a93YAmPjh9tYPx+ljGBSfYbzRQjSinmhY7AtRpO+xJvO8r0zfdj8FDAscZ4V3LMS39
	 VZ4GpMHJS5lVb+pPDjn0M9VvQiqPfEoeK0v9Ma0IYgjfEz0Av1qeCqtBUCHbbDTIt2
	 Le9txVougpxuA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
Date: Mon, 13 Feb 2023 21:24:21 +0800
Message-Id: <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
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

Add reset line definitions for the AST2600 I3C block's reset inputs.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 600549d7bee8..16b7389bbb9c 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -90,6 +90,12 @@
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
+#define ASPEED_RESET_I3C5		45
+#define ASPEED_RESET_I3C4		44
+#define ASPEED_RESET_I3C3		43
+#define ASPEED_RESET_I3C2		42
+#define ASPEED_RESET_I3C1		41
+#define ASPEED_RESET_I3C0		40
 #define ASPEED_RESET_I3C_DMA		39
 #define ASPEED_RESET_PWM		37
 #define ASPEED_RESET_PECI		36
-- 
2.39.1

