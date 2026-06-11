Return-Path: <linux-aspeed+bounces-4230-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DRJXJW5IKmrVlgMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4230-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:32:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B243C66E9A6
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=aspeedtech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4230-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4230-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbWVB0tCHz3brL;
	Thu, 11 Jun 2026 15:31:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781155906;
	cv=none; b=jT3Ax4nnKrAIyuQB2z6HCKxRPbSHfBi53Gtkq/4stt2X6PaMCkCB1ULV4mWi/bp21E5Whz/ClCuFhq+RJhjTrBBfv1HRYQ8xwH2RgUR6rEi/GIOn++ahCuPUVZIovdCl9xF29U+hM0wc18FsoO+xfzZOqCHFoctCQPSjEnSIDS0oIPCX3xNuc08jzsh5sThJCKOhBoxMO7osKvCg+IE5NxvtaVClAEi+Yf4TLxKEbNpqHtiM4a07F+tDz+66Bfb19ZRX8SxXUKLUA6sG5YnZUBonUbDyeYNG6eYDTrC094I0JP3nSU0yfpxnOOnKSCll02AMs2RPhmqxJiXbLs8Mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781155906; c=relaxed/relaxed;
	bh=ho6mfZDKt5P/lI1DeJovBwIq6peowlJbrBhGda+8Pak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SQw8hQ6O/Pjuu+RJPWTohfwDl+3/E5stqHfWzk9BDzhtLXl/vlGj0z18hf5BzONb4YXpwsytHirRdDXw95Od76dJINuze5TQVO8fqefydK4GNOkIzrQTwVazeq3m2Jg3n4Ed/kYw6UcSE+lFc6+3Z3DOZ6tqpRzbI4pD3ieK1uLd7BHDJxdJUz66eMNGILsXrp2QHzSp/ThTWd20yQWeqP1/1Ny6QLfJkIeDgUD0oMaZKb3frnpjpRWcAcn/qbUgKpzQJLxfTAeQIGUZkVvrDRRcaeVou8DL+AuE6hDiMRnFMyx1SWzK1r5FmN6RwOB5ZUkQnZ1ETL272K0Bq41ECg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbWV92rXXz3brZ;
	Thu, 11 Jun 2026 15:31:45 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 11 Jun
 2026 13:31:22 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 11 Jun 2026 13:31:22 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Thu, 11 Jun 2026 13:31:22 +0800
Subject: [PATCH v32 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-upstream_i2c-v32-2-b66eba921d01@aspeedtech.com>
References: <20260611-upstream_i2c-v32-0-b66eba921d01@aspeedtech.com>
In-Reply-To: <20260611-upstream_i2c-v32-0-b66eba921d01@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781155882; l=2076;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=bu5HMc2Z/yj0Ft5OgeLngLhHplEIK0fnHLwW0MpLC2E=;
 b=HXKCWHwKPDa00Strvo6vZc8oFyJTvdo6B4fYFhi6p9v9h0diXPPb5sVbNbkTA3jNbObmXUL5n
 Iv5+qWNIYU9DJihtcKgZfBhpHIYx04fHOehH9qf4wZiW05Jx6sEypWb
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,aspeedtech.com:email,aspeedtech.com:mid,aspeedtech.com:from_mime];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4230-lists,linux-aspeed=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B243C66E9A6

Use i2c_parse_fw_timings() to read the standard "clock-frequency"
property, and fall back to "bus-frequency" only when the standard
property is absent.

This honors device trees written against the updated
aspeed,ast2600-i2c binding without silently falling back to 100 kHz,
while keeping existing in-tree device trees using "bus-frequency"
working.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v31:
- Zero-initialise `struct i2c_timings timings` so the bus-frequency
  fallback runs when clock-frequency is absent (Sashiko AI review).
---
 drivers/i2c/busses/i2c-aspeed.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a26b74c71206..f00bd779146e 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1000,6 +1000,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
 	struct clk *parent_clk;
+	struct i2c_timings timings = {};
 	int irq, ret;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
@@ -1025,12 +1026,18 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	}
 	reset_control_deassert(bus->rst);
 
-	ret = of_property_read_u32(pdev->dev.of_node,
-				   "bus-frequency", &bus->bus_frequency);
-	if (ret < 0) {
-		dev_err(&pdev->dev,
-			"Could not read bus-frequency property\n");
-		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+	i2c_parse_fw_timings(&pdev->dev, &timings, false);
+	if (timings.bus_freq_hz) {
+		bus->bus_frequency = timings.bus_freq_hz;
+	} else {
+		ret = of_property_read_u32(pdev->dev.of_node,
+					   "bus-frequency",
+					   &bus->bus_frequency);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"Could not read clock-frequency or bus-frequency property\n");
+			bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+		}
 	}
 
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);

-- 
2.34.1


