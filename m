Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A457584F82
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Jul 2022 13:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvQCh66RLz2yj3
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Jul 2022 21:24:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvQCb5BfKz2xGm
	for <linux-aspeed@lists.ozlabs.org>; Fri, 29 Jul 2022 21:24:41 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 26TB5WpV050856;
	Fri, 29 Jul 2022 19:05:33 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 29 Jul
 2022 19:23:17 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller"
	<davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>,
        Dhananjay Phadke <dhphadke@microsoft.com>,
        "Johnny Huang" <johnny_huang@aspeedtech.com>
Subject: [PATCH v9 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE reset definition
Date: Fri, 29 Jul 2022 19:23:10 +0800
Message-ID: <20220729112313.86169-3-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729112313.86169-1-neal_liu@aspeedtech.com>
References: <20220729112313.86169-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 26TB5WpV050856
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add HACE reset bit definition for AST2500/AST2600.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/aspeed-clock.h  | 1 +
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index 9ff4f6e4558c..06d568382c77 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -52,5 +52,6 @@
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
+#define ASPEED_RESET_HACE		10
 
 #endif
diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 62b9520a00fd..d8b0db2f7a7d 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -111,6 +111,7 @@
 #define ASPEED_RESET_PCIE_RC_O		19
 #define ASPEED_RESET_PCIE_RC_OEN	18
 #define ASPEED_RESET_PCI_DP		5
+#define ASPEED_RESET_HACE		4
 #define ASPEED_RESET_AHB		1
 #define ASPEED_RESET_SDRAM		0
 
-- 
2.25.1

