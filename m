Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A09988313
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 13:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFSdG66P0z3cTv
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 21:18:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727435902;
	cv=none; b=eVs1ErGFsFr5PepmIY0RPKy1yoEexZ5lUbRJNKVFPzf3t2zAYEpRZoDroaEbMfOOPAnMalSx/9fJTe0M+5WwxDpr81Dn+vlVXp5k2tdgiTHiv42LiTRNQETR8NutBTMPFlfeT7BDYAiNGOVdiNbYulmJoX5ELqkLzWBgso6ap2SH7vvHH44QKK3qP3qpcy6E+Jk3oO0WhsCLxtRT4OQljd371R8i47ok7qyX+LA4SW/LPX2aTcD4MDW4IIf7XVd9vXHIhoR5a1AurNPTXpYfgCBDE53mKWAZLUjUUwzK9NMIMSZFIaYq5OmavFgPzH6oJZteg2dolM3kKXilGRjbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727435902; c=relaxed/relaxed;
	bh=wEcwqitbnV9ryFwsj6hcpsKbdI00J9uEc5aJGQU/vRc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQco4pn/aKWMsGqBspyyUuFnJE5S9W2JuQnb3TvKZiq0Mvz6V85WRjePvt7kMtX5fiGz7tDJTkHI/7T6li95iDFMhPzuIRQdMs4xIS/5LNsRFqhPyHj668HTjkZNiGpxlWJjPeQRLZ8Jv4a76UVAOmhVR0XrOm2pGC/PlUsplFEqBYHwhXE29uPoeCAciFy2lFpDCYHnZ/OayJ3jBJf0Pk52Jka/jL24ig02zui/EM4IkVcJtLqOYtVOkUj6cnjU3gyPdh80Q7ML3N2I6ZQFtUsmKlB+C08BH4dSLgHk7HgkfKjD1XGihjBKTZ7umdPLsRLhktdF1wp374m7F3XpCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFSdB0BJSz3c66
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 21:18:22 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 19:17:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 19:17:45 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v6 5/7] gpio: aspeed: Change the macro to support deferred probe
Date: Fri, 27 Sep 2024 19:17:42 +0800
Message-ID: <20240927111744.3511373-6-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
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
index 1be9a7aa9e8b..d6a35e230370 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1313,7 +1313,7 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
-static int __init aspeed_gpio_probe(struct platform_device *pdev)
+static int aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
@@ -1414,13 +1414,14 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
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

