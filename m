Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161397C747
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Vw45GNxz30K6
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 19:44:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726739040;
	cv=none; b=AhTsMs9b7X07OfSyKtD2wu2cxV8W7f6zHv4fQVa47fIrlu/XWJ7rodPjpyjXi+3rWpHtcJbOVBtJPWp8jmIiFQfFzZjLRYgXYf7vgwrIt6bWneX1CSPprGItcuY0ceS4Dbqml6Bqe7gl4Tv9J9WR5BfkE77e/P67iTlp6T8u60QoX6PyZMcne0N103wFoD3fmHyP+Lwjn9E287LxNFESQFgGAbIDt/4j3j0suoGmwsVBRIda5+vtqSjIyywegx+DbMGrAXPvtbfp/+iNvM6qrwEGaf/iFf0dj8869dEqUlRO5HGautBtZV/Flouk5LLDQXpCODtZwBnynLKHEcGOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726739040; c=relaxed/relaxed;
	bh=ptLA2Bm2xURri7nUM8CD93Pc7nPnoHTJbzmmkxEzu9o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hifB/r8mO1D31n5B1RppaTAtXCrd4jB98/M1w8ZY/bBScMOTpGIikuqp/gp3nq6J4XHt7E/wsaY9S9/dtiNIHU5B+3M5nq0LDGL/iz7CTRdWIVvwIWmkWgUzSwPHmPaYSalUalr8k4f3j3oMF9UAlJQmY9a3FhkNdOLXdTRfdQ8BOwai3bdYlXHratMsemOI46s+FhWRsV+P+v0ycblkzyCPjijERsJyefsPOZ0JYTllXgaNYHCWdIwoMT2PI9/rgkuSsUh5wJvkXkz75e9fK0lAaHti7WaBheINNPFPBcOjvgAEQAcIbc5DOcJTyi22RaHKEE/gF9qqi8Y4g4hs8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Vvz6Sk2z2y66
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 19:43:59 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v4 5/6] gpio: aspeed: Change the macro to support deferred probe
Date: Thu, 19 Sep 2024 17:43:38 +0800
Message-ID: <20240919094339.2407641-6-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use module_platform_driver() to replace module_platform_driver_probe().
The former utilizes platform_driver_register(), which allows the driver to
defer probing when it doesn't acquire the necessary resources due to probe
order. In contrast, the latter uses __platform_driver_probe(), which
includes the comment "Note that this is incompatible with deferred
probing." Since our GPIO driver requires access to the clock resource, the
former is more suitable.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 060c0225cb99..c811e84db0b9 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1282,7 +1282,7 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
-static int __init aspeed_gpio_probe(struct platform_device *pdev)
+static int aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
@@ -1382,13 +1382,14 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 }
 
 static struct platform_driver aspeed_gpio_driver = {
+	.probe = aspeed_gpio_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = aspeed_gpio_of_table,
 	},
 };
 
-module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
+module_platform_driver(aspeed_gpio_driver);
 
 MODULE_DESCRIPTION("Aspeed GPIO Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1

