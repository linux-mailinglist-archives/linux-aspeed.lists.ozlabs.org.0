Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D58977A03
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 09:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4mXS5W44z3cBx
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2024 17:44:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726213444;
	cv=none; b=P22CkIGUZ28vaOoKwP8bf9jSWiOhm2MfSTu/3qgG40NgbEgiKNpiOUEecJAAPsn+7A8Zw2mqghM0HXJn9bF5h6FObjtrgDeuQXrQlFdoJ2x5CHXZ0sVW527Kd8O8QAuSeIJ0Ho1BSXJ/nxsUDE0taSxo/ojt3B4+pOmxZvUsMX/N2ZJCpWtj3AbP/H6gPElxeHmMMmqHmRn8VSzroNaxWUYeY/EksaSzUkGFsCswyE8RTTsiRWNmTG13fI/P3s4Nyb1db7JDSj9jiy5PSCt6jS5YllONr20dNwQZSNZYKii/4HP4aiwxXMzFkCINpKHz5Py4R6orjr5T1n6mEn9lJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726213444; c=relaxed/relaxed;
	bh=G9n3B7AYssSg/VvQ9QE44iy1VArVwBVEoLgDBuDRBP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UeGbCCdWpFRqS6eCJzM4SYmP0rXr6tzgX2Jpc/PDS6n3+6dIMEzla5i/o0A6VSUEYedeExCtRao3kcCXKTxVCnaV8gHlyHv13Y+0Bd30Yco+91r5tVFqz4SalcCjpq0xheizKLyh9Y+slfu65vKPhaQauMJqlcTCLWtgf2hmvKuWU41qP0XYoRBl9nEU01/g78U8YIDaeXCAj3RLif78voZ4tLo2wGoq3HQcI8lQdIlkz9wh+VWy/hr2VtBto20TyHX+SnPUt2b8Lqe4Eu9HGqfAB3xNAVLeI8dR1wasWKlM/KWuBUAag4z3QUKlJCGUrr5hAdtkdda7rWQRDheMig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4mXN4Y3jz2ygX
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Sep 2024 17:44:04 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 15:43:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 13 Sep 2024 15:43:25 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>
Subject: [PATCH v3 5/6] gpio: aspeed: Change the macro to support deferred probe
Date: Fri, 13 Sep 2024 15:43:24 +0800
Message-ID: <20240913074325.239390-6-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
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
 drivers/gpio/gpio-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 13495442e1aa..d322c03481a8 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1359,13 +1359,14 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
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

