Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FD6A78A4
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 01:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRt6D3Bzmz3cLf
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 11:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WtO1rIic;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WtO1rIic;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRt5d1D48z3c7K
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 11:58:45 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 9F3F7203F9; Thu,  2 Mar 2023 08:58:44 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677718724;
	bh=P2sKYF+UVnJfCwBMz5b/csD9Fw/yLMWPestEYUU2PLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WtO1rIic/nbBWB3idTxHeKjtfBT3WdNO6rg5lWEi5Xl4+R/JvfNXaQ+mz44UKe6J1
	 hfg+rier0wXdJKf2kyaHwTlNereve2DCCZe1HKEq+Dgy5whywxoug1fRKRae4nNAbk
	 lKQG86UmaAHyK4wpmkZTgmxxaW3jelvw9GPBdKkrH5QVN2DJy2uGQHd4g14+/yxLSH
	 ZLjmd6eD4KY5en3+OZBBtwts8hLfiQC3/qOlVNypQkKc60L9ASzqQAEbddgSYil/TS
	 AuQ0JXqs1Mnvxe5tcvoFn4CJKyBigoPqhIyBJJltTT4jyWEKg//2DVqh/dn9j6eV5z
	 2yH55iPWxo1kw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on reset definitions
Date: Thu,  2 Mar 2023 08:58:34 +0800
Message-Id: <20230302005834.13171-7-jk@codeconstruct.com.au>
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

The current "not part of a gate" is a little ambiguous. Expand this a
little to clarify the reference to the paired clock + reset control.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index b4d69103d722..e149eee61588 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,7 +87,7 @@
 #define ASPEED_CLK_MAC4RCLK		70
 #define ASPEED_CLK_I3C			71
 
-/* Only list resets here that are not part of a gate */
+/* Only list resets here that are not part of a clock gate + reset pair */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
 #define ASPEED_RESET_I3C_DMA		39
-- 
2.39.1

