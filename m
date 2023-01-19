Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A3674792
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 00:55:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyfdX1dk4z3fH1
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 10:55:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=akYNw9C8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=akYNw9C8;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyfdN0DBJz3fD8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Jan 2023 10:55:19 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id 12so1098245plo.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlaNs59h5L/VZK9NKX1XrN48x5B0buY4rNRSvhSEduY=;
        b=akYNw9C8jZ1H8bdyXNUUsoZOe0v6Q2cgeHQp86x0kz8Id83Glq38O8wO7YWB2htT6P
         CVJo4izquStKNDmyA/31103uG/t8hCaBS5Auy2zAX4cRf7buOeDhv1kYoDbSeHeD4k82
         Zx5hCvbbI/HVdn4wErJrQ/qbSZXZgLF0hIQ4qsSXc1TdZSCwW5XxVSxugYud5eRvFwTg
         piXVZ0B/rN6p2p4AODRYPG6FL67CzneGSfWymLD5U6pMeVxCmSH1TtXML8QWa5hB9JiJ
         pZ6BRQVtEMfhp16M2WWk+TBa3WGMhnv/aLY7NOuv4TDcc739qk0dKk6FCtd4Z/fkzzOl
         KivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlaNs59h5L/VZK9NKX1XrN48x5B0buY4rNRSvhSEduY=;
        b=a1QTYGgZmXSwKZ9XBqoCyrx1KYDahKevmDMYLoL4JTns3HvkmjGBpTW2U5jvAG5G3r
         8app0egsvgIStj0N/BCC9suaOCyVgixLt9KZVvUDyhpA6c6QIYnvGjmNgsdgosY5jwca
         YgYgSCJpHCRi0IJXFk9FregRIlumT17CLr9meosYcBgyJtJk9LfICnkN5NYQZ5wKpeuI
         7+3fnaw/ZAYctrmKUyLzkyHi0Pe9GEdQytUvpGXcKj/CIQviDUp1GF9uKOO+A6s5rQfe
         yycgCoLwjJldle1Yuo0VFlVRyxxtvRiBl/ZHi2/Tu+KtXZbJEywDn+Hx6xx8cpkMycJO
         LfWA==
X-Gm-Message-State: AFqh2kr1QfLwG3NndDjbYhDKfVV/t2tTAuyM7vczKMYqCNmdQs0E6lQj
	F41/G9hgA3GaEJEUKwXxXtSOjZAo31c=
X-Google-Smtp-Source: AMrXdXtgf4X3l3kRiB9pQjlLynR7Djz18tE7IYnrdEy0rX51iGVUNwfBOIdeFXLhSIz56FgGfz0ZGw==
X-Received: by 2002:a17:903:2014:b0:194:a7b2:4329 with SMTP id s20-20020a170903201400b00194a7b24329mr10600713pla.28.1674172516245;
        Thu, 19 Jan 2023 15:55:16 -0800 (PST)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001948ff557besm8967603plf.83.2023.01.19.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:55:15 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
Date: Fri, 20 Jan 2023 10:25:01 +1030
Message-Id: <20230119235501.53294-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
function's signal") exposed a problem with fetching the regmap for
reading the GFX register.

The Romulus machine the device tree contains a gpio hog for GPIO S7.
With the patch applied:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
  aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151

The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
of_clock code returns an error as it doesn't have a valid struct clk_hw
pointer. The regmap call happens because pinmux wants to check the GFX
node (IP block 1) to query bits there.

For reference, before the offending patch:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF1
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF2
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Enabling signal GPIOS7 for GPIOS7
  Muxed pin 151 as GPIOS7
  gpio-943 (seq_cont): hogged as output/low

As a workaround, skip the clock check to allow pinmux to proceed.

Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 7ee0c473ad70..f714fe40e400 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2635,7 +2635,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		node = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 0);
 		if (node) {
-			map = syscon_node_to_regmap(node);
+			map = device_node_to_regmap(node);
 			of_node_put(node);
 			if (IS_ERR(map))
 				return map;
-- 
2.39.0

