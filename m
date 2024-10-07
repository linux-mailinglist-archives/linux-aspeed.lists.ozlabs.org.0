Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73D9924F0
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 08:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTth1Kj3z3bfR
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 17:35:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282955;
	cv=none; b=e2RR6Rp5V0ysJV87tN8uU8fxRTuBcRNKpxAdoRz9nuuEtfbTI6U9S2i+87CG9oTp4FPEyDriy6vBoj2AdMB1P/tOfR5O3K+YAzrAKQkwGJWPsBLmcKB9X5dwg2+Hf9fuDXkjPhnAddd+1ypcBbu0awRSVrwsyJ29Zkqh8wloklSNxtVFUwyYdJbCLobIK4zjNX/R85A1WRNqh8VzMx9MomJAhjj5kkrnJC6uLO3nLD8ixdXdyj4H+I73mArbSTMCNqxpnX0jdEEtrfEzUFPXBXJ5nwr3eNczWolsth/zyXCFYqJDuBY2VRJmMosDHNG/UF0fpCVIU45maShbUo+7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282955; c=relaxed/relaxed;
	bh=fK4tmmE5iX6BbPkv8M2hlRbKcbCo7FxDo/o3xJKC/Mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuytaEUVoH7IxDPlANEQBZRAPY++UGnY2O6u/eVh9ByyVTiBheURKvHrXZcXP9uUmLVzVeaOLE3R4BFkWUpubdlu+OdTksoBGkVH+Olb2VH3iyWGtbOY15q3whRu7tp16SMFyDbS2Dj81dhBAOX+1g4GKkeqrhIiidDeraPIsv72YLPJN2MLJ6xB0tz/XIpc62XM2NMwy9maGMD9ghf/jODxLJUNWi0IZTBwchFX4k4K6V4Eoh2OcJSUSvk/KiPwqDO8suJHPfG7WlM25eNTRORqEFPapnwf3hirznn0hVlEsSJyaWMpGf5P73y6eFtQuBhqlSJa08rsk4iNYQg9YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTtN6J4Zz2yY1
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 17:35:20 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:08 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT SW reset
Date: Mon, 7 Oct 2024 14:34:05 +0800
Message-ID: <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, Bonnie_Lo@wiwynn.com, Patrick_NC_Lin@wiwynn.com, DELPHINE_CHIU@wiwynn.com, Peter.Yin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add "aspeed,restart-sw" property to distinguish normal WDT
reset from system restart triggered by SW consciously.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
index be78a9865584..6cc3604c295a 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
@@ -95,6 +95,17 @@ properties:
       array with the first word defined using the AST2600_WDT_RESET1_* macros,
       and the second word defined using the AST2600_WDT_RESET2_* macros.
 
+  aspeed,restart-sw:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: >
+      Normally, ASPEED WDT reset may occur when system hangs or reboot
+      triggered by SW consciously. However, system doesn't know whether the
+      restart is triggered by SW consciously since the reset event flag is
+      the same as normal WDT timeout reset. With this property, SW can
+      restart the system immediately and directly without wait for WDT
+      timeout occurs. The reset event flag is also different from the normal
+      WDT reset. This property is only supported since AST2600 platform.
+
 required:
   - compatible
   - reg
-- 
2.34.1

