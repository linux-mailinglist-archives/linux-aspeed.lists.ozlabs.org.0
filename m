Return-Path: <linux-aspeed+bounces-2142-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F012B438C8
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Sep 2025 12:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHbSY6cWsz302g;
	Thu,  4 Sep 2025 20:34:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756982061;
	cv=none; b=XH3uSix3CVAJ+l5+6GtxPs1DKWl+5GLrYHPC/kOqOMikGm3iALUDHOnr6k5uikmK6ZDbfGQ+F0Q7RnPMcMLjI5/GoQx+dL/2g1L3OJgwHWsM7O/m6nsgX43oEpAVBfDPMsV+aVh2oPoyfcg91rWzilSY+eBwtgnli4HVfDaa/ViVpNRJ96Um8ipES7eZR8TXarAqYeNsgwQACSy6+AlZeQPe6fS6W/YCnhlSdkdDNnZVIpsCCpHKT2DhBWIOw1umNikpA+6bUAaVA26rfUfY8tZFXeoicIi7kF/R6V3BBr2o2hvNleRV+E9R016cW8tPIjqcjIDqc4z2gwrzMsOEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756982061; c=relaxed/relaxed;
	bh=DahGBC2yOouijprcUWySo9CE96xEr74ilYGjS+h0t68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WaLHuWfBebQ1tyH7oYoREJvUTkEQ8FF43LjYJzVnZO8qsaFhp8TtF/dH80t1vZqBH6tucYGt4Ze5NYXxqVNJKyUfLMeYu/cdSomFts9ISJ2XZC0ebzdmtCBSkIYs9Aos9Z0/+iwOUh1j5SoGBxcwAWS7sc7UPguA1EnactVttIYkbBG0hBeJ+h983McSLp2mKi6ns5KbYL9HwP4Wk0nMZxgcO/EDB2QuM123Om7pB0QyniZEF8OqfBQbP2ecGRwsde3C+TtEn63D8cXglOUNVZ9aC6a7szNCbTOecX/KRJ9lsfAB3Hd+eZadYaFuMAlpgXhZAEXxa4inkGX1AjTJeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHbSY2W65z2yrp;
	Thu,  4 Sep 2025 20:34:21 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 4 Sep
 2025 18:34:02 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 4 Sep 2025 18:34:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 1/4] dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
Date: Thu, 4 Sep 2025 18:33:58 +0800
Message-ID: <20250904103401.88287-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add the ast2700 pinctrl compatible string.
"aspeed,ast2700-soc0-pinctrl" and "aspeed,ast2700-soc1-pinctrl"

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 5eccd10d95ce..3a993702a6f6 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -61,6 +61,8 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc0-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible
-- 
2.25.1


