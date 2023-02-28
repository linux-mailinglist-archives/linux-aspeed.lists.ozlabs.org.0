Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F506A5569
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 10:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQsFf56Sxz3bM7
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 20:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lBox6Kqi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lBox6Kqi;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQsFH2p1Sz3c3W
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 20:16:51 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 7338D20934; Tue, 28 Feb 2023 17:16:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677575809;
	bh=FKACMzYaX4ajqnkME7t+Nf3YFy/ELpU0UjtKWf1c9Eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lBox6KqiZxODjaTsgyXm/xfJOqZToJvnSGkChDNfCzjv7lgmycNAB04qGnAPntZ4I
	 gH5WjStpOULLwMPxGnsJeMutaxcGvgeauQEUUFr1nsn+6sXKuRtLwwS3b0IuH04sgc
	 Z1BOMemeDNL2VmSs0KDgMZtFyxy+laf3y14roGuO8UyU2tgYzzEauWeFk7p8V8M+C9
	 329vxV7RKRwin5J/xGHTyrmUKf6gV/P4H0xX4HuhqKSCLzwjETzyj3IIcwwpG5vHTP
	 9lfLX8j/MHN6UR8YglzFra53tkiRwceTDjpYQazribBaz1i29tl1Pdalyy1NZ3g9Dz
	 nK2xI6R35AF3A==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
Date: Tue, 28 Feb 2023 17:16:38 +0800
Message-Id: <20230228091638.206569-6-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228091638.206569-1-jk@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index b4d69103d722..b1c129977910 100644
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

