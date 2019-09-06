Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF046AB26F
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:26:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PndW6DdPzDr7l
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:26:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGNMeOiy"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PndQ1C68zDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:26:33 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id w11so2637170plp.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VywQQgwoddW91Jq4aMSrybOZ072q9St1Z4i5rxfAKss=;
 b=GGNMeOiyYHFVFbotkWPcgoumWVou3FxdbVs9/ZllGyRMZj3CYE50mPl9eaGFK1SSJ1
 ehwBhp1UScc4KWEVlRPTVx5dcCy+WX7EbS7TTARFNII+ncgxuk21EEMFuOwhgWtIa+hy
 /f6e7unxpJT7Gy1vtgrYz8B8OK/i7/jJyGmy06Zd2HRGt0nVcQhxLxpf/i6vGD+oGigX
 CpnNnsbajWYqKej4a5ukjmDX2t/YD8+maxsED7v6pUHoO6keEhTC2ZjlnTfxTkfPQXbD
 vTYcDqCdcICnYEKy+XEg3z7BLeBcmQK0pGKWBNT+XrnEdIR8+Zot+2wioR+D/zN7vM4n
 vGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VywQQgwoddW91Jq4aMSrybOZ072q9St1Z4i5rxfAKss=;
 b=fvqdkYQrU0/GmFx4U9ewJhnxKtHTbpn9VfrYfmxp5xLYtcteDF1inGYb2wsHj4YvjS
 OdzI75HA1UjqBFcxW9qm9V4oA10WFxPytXvbFbNkd0wXJ2TseyTym56d3pZsJPjfPCs/
 eTmUoc7N95Ps/jtKF+fbRC4nIbUAsJmZ9yAdjEPJ4GRfoQ0heokO6B44zXs8O8ToIrL0
 xHFtUS+r5/BVLDeHPW0rrFtmxKnuCORRdF1aOHXL2pWfT9GX1aVDebjvC6h0S/W3LQOA
 B+b/ayzQdZG2qRurHKYTMsOPW7ZRn+dB+2TCMwMrOiqDcr8Ewgs61B5H2v+Lrf0/5BBw
 HyqQ==
X-Gm-Message-State: APjAAAXlUThZII9f1WI9HG0xw3l3f8yzTOvgHTR8OL7TMaDUmuWUTUhn
 45nfkuqrDKpyz3xDUH+ikiE=
X-Google-Smtp-Source: APXvYqyB4ARXWSH67d+dolbjyhdZvVBxPlfvR8PsPQ1/637E5ASl4JnhB8dHZykbbS8hKbyHlvXzkg==
X-Received: by 2002:a17:902:aa02:: with SMTP id
 be2mr7780215plb.172.1567751191484; 
 Thu, 05 Sep 2019 23:26:31 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c64sm1631254pfc.19.2019.09.05.23.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:26:30 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
Date: Fri,  6 Sep 2019 16:26:22 +1000
Message-Id: <20190906062623.13354-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The current calculation for the number of GPIO banks is only correct if
the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
currently say there are 0 banks, which is incorrect).

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..b83e23aecd18 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

