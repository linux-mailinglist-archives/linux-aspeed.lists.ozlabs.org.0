Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C76A5564
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 10:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQsFP2xprz3cFW
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 20:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OYxKrpQv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OYxKrpQv;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQsFG5GWNz3c3W
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 20:16:50 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E1E6C20261; Tue, 28 Feb 2023 17:16:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677575807;
	bh=Nmn4HH5803cy07yWAH0sQPYtbLPgpmt7KgYyu56Yn9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYxKrpQvKxvIE9YPqFaGG4ql/yBd42fGVqUE5A3Lj8QC/6ya1j0LGmw+wbJXNPIcg
	 aTkQRiMzA2XJMOmo6kFsv6U4I8QJK4B86NTTeaaKD71+rwxF9s9i06gsNeF0v5JHdD
	 3OjaU98nLNJSuEwed1DL5pmhVj9g58eI9EObmiytO9Xe9QOF+nE547+CLnthcflyUU
	 hrc8r3bWR5UwjC6HA94uXk1Ei9/J5KL4BflYrhozDmxIFWaVcb3v9FzzKV+j+QGXO4
	 GGozlWeXY4Z51cDxsyLQK2THQz9VGJCh0vfZqxx6eDhxz/ZFZp+e+CmckU9fbpqigV
	 YidDv0aU7CaUA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: clock: ast2600: Add top-level I3C clock
Date: Tue, 28 Feb 2023 17:16:35 +0800
Message-Id: <20230228091638.206569-3-jk@codeconstruct.com.au>
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

The ast2600 hardware has a top-level clock for all i3c controller
peripherals (then gated to each individual controller), so add a
top-level i3c clock line to control this.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v4:
 - use contiguous clock index
v3:
 - split into separate bindings & clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index d8b0db2f7a7d..dd1581bfdf58 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_I3C			71
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.39.1

