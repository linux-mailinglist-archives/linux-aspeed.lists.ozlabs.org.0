Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D883988315
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 13:18:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFSdH0D1Yz3cWD
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 21:18:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727435902;
	cv=none; b=KvbsBCwzHKDKMTUZUmyflnccmqCjsUKcMAf7JSe6oAzIlobOYWYAb/diKY1w+LwYOb1TX6cVkwuazUp6ALrKifKzy+W90pOxZ1uH/2d81+0CEI8mPamEh6IC4yMEkf+mCOyKjPvv7G9l4paa710z6LS3TvXRL7rVqP6LacDeRxdBOA3ddoAd22yBeoXfJs6549GImK1/fQxgPoTmc68fGJq3ZcFCx61ZLKeQYChviz5GVCWG5d+HAY88EqkqIewKtD4zr515lTStDvQuYJqLoJGNxcYX/v1o9TvBo1J4JodCFCplpmXGPvFkWXsBT1wp2VPZpX5Zfc6Ncjlp1ld0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727435902; c=relaxed/relaxed;
	bh=tvMDuavOXr/z0rclmUpOH9wEZAO+TlklJMaHT5pGx+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TS89vTOuFvfgwUWw4ZttejLBTqDxW3qRMO0kgoVG/b/2odfjWuhr0OI5TTPyGuAWqs8ChmVJkKyEx3ckCg5hDe1LaUm3qsq+py6RC6tWhxE2Dd0lIOCOuegvh0GVyb0NUwCT7+xK9uz8xih8gotdMpRO2oqw7pBLcwnGPUZmKk+Zc1hHTkFEboOZVZL0/Xm7Qs9emkAP9m/vGeHf/gB+BZ/3tcVoezKYLfq6EcdgV6TtINuFS0OfmgJnpBpk5zjUcwqBwbaE9WUf9z2AwD4pu22PrTLOxDZG2jRkaHHlZapZEEQRavXQqPe82UQ6YWG3as0UWhX9Kr9KIEQ4SOFQpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFSdB2CjHz3btT
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
Subject: [PATCH v6 6/7] gpio: aspeed: Add the flush write to ensure the write complete.
Date: Fri, 27 Sep 2024 19:17:43 +0800
Message-ID: <20240927111744.3511373-7-billy_tsai@aspeedtech.com>
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

Performing a dummy read ensures that the register write operation is fully
completed, mitigating any potential bus delays that could otherwise impact
the frequency of bitbang usage. E.g., if the JTAG application uses GPIO to
control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
sets the TCK clock to 1 MHz, the GPIO's high/low transitions will rely on
a delay function to ensure the clock frequency does not exceed 1 MHz.
However, this can lead to rapid toggling of the GPIO because the write
operation is POSTed and does not wait for a bus acknowledgment.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d6a35e230370..7cea3c5ba696 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -406,6 +406,8 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_val, val);
+	// flush write
+	gpio->config->llops->reg_bit_get(gpio, offset, reg_val);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-- 
2.25.1

