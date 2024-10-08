Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A19940D7
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 10:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN82w3GF2z3bpm
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 19:15:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728375317;
	cv=none; b=WBcNK51n1SE7de+zSRL7b69kk2X4HWA67q/crln85IbjJ66/x9LufmNQTl+YbMPEqB8WCL/ALnldUwMAanVWhegOZ+HnrRmgIvnY/0sZVtpXdJoCwdQWtxxUdqqL9li3k+DmRVoiNJwE6NFOiGWWO62Nhs43mhFtY0Jk2XLDptVha0J39L7tbaq8yFFEWEJTqgYUMfPvwhL0n8xOhVm1hESzx/N6Ju7uOADjSDvLHciIC0bbQeILcf/pfQWxh0cZrGcZAKbadjP/3VjDD5qaH7VIgQxD/q6sItTNMzfO0yN11M86PNm066HceRZgqXjbeJHv9iI+ENWrF3Q4NBp59g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728375317; c=relaxed/relaxed;
	bh=V7tv9QFDabYEe3R+69Uz5bQwZ8inmiGrxICZKuqmdmU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyt6iXyjQC376l+ePKbLq7l8XAChAXrFWd+O6EGQKLDLMjq9iyZY9/FwnhJB1tnIU3Pv5Pz4CBFvaX02E2hHr/uBiULldAvpPKGsLlAwk3wUOezh613Bo9cvtHFScU2mGMe5xf4h+LEnIuA3WwmBD/px1bc5y5e1CqwsKGQAFVjFhPIoH7wkt4CrYti9zHCdp31pY7Of6Y6sKMgMZCwcr0tQqZQ4v1G+2g2ja9fbEhSBwysekgHPkoSVIKhR3gLWpQ9J2SkezhtVhhj9GxkUWQMH7PZQFbrmJ6mL1TYqqR1uYxFNZ5ouYKw+LyZ0x/rqJpyKuVzEVibWcpQGj71Zmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN82r2H6Yz2yNG
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 19:15:16 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 16:14:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 8 Oct 2024 16:14:51 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v7 4/7] gpio: aspeed: Remove the name for bank array
Date: Tue, 8 Oct 2024 16:14:47 +0800
Message-ID: <20241008081450.1490955-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
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
index c49c55ae962b..61a531962de3 100644
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

