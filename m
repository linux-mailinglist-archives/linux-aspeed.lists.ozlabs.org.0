Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E197C742
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:44:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Vw13nXkz2yqB
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 19:44:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726739038;
	cv=none; b=laSE+5TfvyTbiFHZwRpQ7rmD1fT3UQAfOEBMBwgU1ZWRVSkzxBzL5jKKpdMGZEuxBaD4dFLouMeq7NB7MNEY1wEAfHB3e40Y96g9v5TwUunpq6NILsNOn8T8THoVwGqV9Lsl+tJm+pcn8LogxRPcnm9KLQBsf5xNBX6NF9mzAeDX29GwGpzxtJGLs+a/zmOF9r+WW2jWb8uNy9Oq6cWEvWPXll7gVvc1UKO9XnsNL89mnDuLeNY9iu4t2D4xVIGFtCQ+ekQpY8ooyE0EmxVIIXLeo0AVEEssMT/irbiZi0AIeKqesfC77guoxsT3TuvQDcWy57SZWAeodQYOh/sSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726739038; c=relaxed/relaxed;
	bh=ixTPBPyDQYjuRSVS9eTapFqgoRbQVELMJYbI3CXNLS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ra/is/Wjfl84szaX3O7FOa7iVLLji6WBQesVnbKDIB+n6Wvw33kzwIg+r2aVVF6X20ooXqFogMHSZR0qV5UKBdX/EtBojzihwGolLviTnwLKFzEahw+fSEOxATk/MGxyPdNtTcneHHI9aHA4LU4GXafUfTy2qnKkfWxg4fm9BdiSDt7Bd8kpHnhh7i/zc0+veceyZSMrN3FRi8V7QFycPUqfQz+FW+GJauClVR8+LL8209C5LAxo+19wMNcs2cm+O9073Un/j/W2QrCztdH69YBuLFuUFu2GF9i9AcLx8vG8mT0Wo3y4yaA54aRaPrQnBw5/LngcFjnhLjjFicUDGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Vvy4V40z2y66
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 19:43:58 +1000 (AEST)
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
Subject: [PATCH v4 2/6] gpio: aspeed: Remove the name for bank array
Date: Thu, 19 Sep 2024 17:43:35 +0800
Message-ID: <20240919094339.2407641-3-billy_tsai@aspeedtech.com>
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

The bank array name is only used to determine if the GPIO offset is valid,
and this condition can be replaced by checking if the offset exceeds the
ngpio property.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 04c03402db6d..d20e15b2079d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -77,7 +77,6 @@ struct aspeed_gpio_bank {
 	uint16_t	debounce_regs;
 	uint16_t	tolerance_regs;
 	uint16_t	cmdsrc_regs;
-	const char	names[4][3];
 };
 
 /*
@@ -104,7 +103,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0040,
 		.tolerance_regs = 0x001c,
 		.cmdsrc_regs = 0x0060,
-		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
@@ -113,7 +111,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0048,
 		.tolerance_regs = 0x003c,
 		.cmdsrc_regs = 0x0068,
-		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
@@ -122,7 +119,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x00b0,
 		.tolerance_regs = 0x00ac,
 		.cmdsrc_regs = 0x0090,
-		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
@@ -131,7 +127,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0100,
 		.tolerance_regs = 0x00fc,
 		.cmdsrc_regs = 0x00e0,
-		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
@@ -140,7 +135,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0130,
 		.tolerance_regs = 0x012c,
 		.cmdsrc_regs = 0x0110,
-		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
@@ -149,7 +143,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0160,
 		.tolerance_regs = 0x015c,
 		.cmdsrc_regs = 0x0140,
-		.names = { "U", "V", "W", "X" },
 	},
 	{
 		.val_regs = 0x01E0,
@@ -158,7 +151,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x0190,
 		.tolerance_regs = 0x018c,
 		.cmdsrc_regs = 0x0170,
-		.names = { "Y", "Z", "AA", "AB" },
 	},
 	{
 		.val_regs = 0x01e8,
@@ -167,7 +159,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.debounce_regs = 0x01c0,
 		.tolerance_regs = 0x01bc,
 		.cmdsrc_regs = 0x01a0,
-		.names = { "AC", "", "", "" },
 	},
 };
 
@@ -280,11 +271,11 @@ static inline const struct aspeed_bank_props *find_bank_props(
 static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offset)
 {
 	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	unsigned int group = GPIO_OFFSET(offset) / 8;
 
-	return bank->names[group][0] != '\0' &&
-		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
+	if (offset >= gpio->chip.ngpio)
+		return false;
+
+	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
 }
 
 static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
-- 
2.25.1

