Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D755B97E964
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 12:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBzDF0TBPz3c6q
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 20:06:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727085993;
	cv=none; b=Icsz/DPLIfXXARjBcy64X0ssSCquUgL9yE5ixd+N4Ryp29nKTSRtmkw2xFtaioC2z+AKQwgSGG9AO4kKMpqQDSU3NoHufTMCr7b0cEMelP+lxpaxv8WUteIGJBG+6AgGBNITbNT32+SAfrLpfrG0PFZg1M6J81VRzowbRpnuEtOtQJOH0qh/YBQwK32kPPhLShAf9bmwGx5M3nc/gsHifS671IyZqz0bf25A8gbtcOcMp5l4uTZXXMPv7tyKHSlSm9FpZMST/9iVhb1A/yzOx29c2HlDfBmtnPhbddF77IWgTZdrRU2Pyzru7np5mPQOqwhB2rT5mYeQD2pEFuu44w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727085993; c=relaxed/relaxed;
	bh=h74t+0dkWF74sy82G+FzhqDM2sz+ZOL1/s76GaYoYp8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTsIxfytDHVifq8EUVT0fYPfvUBiF470+12gwcLjDCw2mGdvbClEZYhh8FUl8UztyvYFKju+s6sbAebfp4iwXRCdW1tq2wL1XMb1zdaAmL+vDfQrKYOfdIRpvpYIxGF7TiNkurbzTgFJuc/Y8x+C+PyQ5VJ2RI0R6X91aYkx/7cFerBp0miqofevzWC40kHp7SMpB1wCW/Jpx+y5RcSWmv3jfr7K0EZJ4B3kW1GyBwF/7f4uTaWVSY5DwMksn+OtwqXe3ej1VZ3UNhdeVi1pFKWErkr6/FSeqm0sQmz2ppKyWUzv30Sds0AqLEO7zNYeJPJQ79xclggTQVzW1aTdHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBzD86q9sz2yNj
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 20:06:32 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 18:06:12 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 18:06:12 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v5 6/6] gpio: aspeed: Add the flush write to ensure the write complete.
Date: Mon, 23 Sep 2024 18:06:11 +0800
Message-ID: <20240923100611.1597113-7-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
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
index 230af90aa966..e7dcc37e40f9 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -402,6 +402,8 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 
 	gpio->config->llops->reg_bit_set(gpio, offset, reg_val, val);
+	// flush write
+	gpio->config->llops->reg_bit_get(gpio, offset, reg_val);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-- 
2.25.1

