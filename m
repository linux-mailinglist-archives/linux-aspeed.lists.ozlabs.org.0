Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 711CBF3E65
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 04:29:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Qjy22CfzF6jk
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Nov 2019 14:29:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U/LqZXmx"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478Qjq5zDbzF6gH
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Nov 2019 14:29:17 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p13so3107393pll.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Nov 2019 19:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJCUfp8ZkVX+2Q/E2RA51yP281dLV5q+tGMP1kt6Ef8=;
 b=U/LqZXmxhh8yeGmbBFtUj4NR77Lm5hbRR8wTVSBW4aTEN2ZGLfadqRN7ImQUIFSqUy
 sjK0vvA9nvsEcVG+6F7ZEUbp1oDqZVs7y3wsDjSShszolJglwr6/8GnSQGffR/vrqK+j
 Pk+tGPaNICEovggBuwTNSv8EYKs3WKMsIVm5qaPBReQe/0tp1wHMQSyO0bUvBrOKbyTp
 nzJYu8ogUNwqNBa3ZGf087wPssKKXmt16lX17ocJvg3xQ+ySNGOkmgDE0M+dT2XGtRQd
 kOcLa4MvDCWjT/kF9JBmFHW2SjQexsv/GBZfWlG25fy1fdBWyX7hn1MzYuCRfDwCxdTf
 eepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BJCUfp8ZkVX+2Q/E2RA51yP281dLV5q+tGMP1kt6Ef8=;
 b=TvMGI9bdi1VfTAJJyelQMlauKMbaatrIe0AqXpKMly0B9iPZjBEHJrcb/bdMfvYBcN
 GaRPAKAiN9mSwoi0mQIVDTEcTMHChFPxYXErMURtJ75iNMOdGswQah8rHpPJSNrTyV8d
 7CvUV4/B+jj5fJRrKaBdQgNjS8E7JnpjjDT7tZyihgRtgLZQbHuTXf8MMqKChfW3GaIw
 /+ImEie4ghTa2NdASVTUJzN0FuaOF7MnSG9ouDbdlWRWnyKjm8G2k5OYBPebn8+pa2ku
 0NM3xpXtjKrpfCCArpUbwYFcMR152RZ+R2PmdWRp+o4WCeRnFDt+kQocgO/woUmDK0kd
 i7Yg==
X-Gm-Message-State: APjAAAXAAovuqJ7P3Kbm3YoaW+bAMfgAZoh9Mk+C1OiRq8vRefHp8A3Z
 6DxyFz2xno7Emhd6ErLaqfA=
X-Google-Smtp-Source: APXvYqwUYaLV2Q5lctEAObWGMEHLJbNchUOQ++A589z1HlK7NWtmUmy5xzScfJRPCcXhohywYKP0ag==
X-Received: by 2002:a17:902:bb8f:: with SMTP id
 m15mr4371359pls.121.1573183754056; 
 Thu, 07 Nov 2019 19:29:14 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id c13sm4219194pfo.5.2019.11.07.19.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 19:29:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: aspeed: Fix clock behaviour for ast2600
Date: Fri,  8 Nov 2019 13:59:05 +1030
Message-Id: <20191108032905.22463-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 no longer uses bit 4 in the control register to indicate a
1MHz clock (It now controls weather this watchdog is reset by a SOC
reset). This means we do not want to set it. It also does not need to be
set for the ast2500, as it is read-only on that SoC.

The comment next to the clock rate selection wandered away from where it
was set, so put it back next to the register setting it's describing.

Fixes: b3528b487448 ("watchdog: aspeed: Add support for AST2600")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 4ec0906bf12c..7e00960651fa 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -258,11 +258,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	/*
-	 * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
-	 * runs at 1MHz. We chose to always run at 1MHz, as there's no
-	 * good reason to have a faster watchdog counter.
-	 */
 	wdt->wdd.info = &aspeed_wdt_info;
 	wdt->wdd.ops = &aspeed_wdt_ops;
 	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
@@ -278,7 +273,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	config = ofdid->data;
 
-	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+	/*
+	 * On clock rates:
+	 *  - ast2400 wdt can run at PCLK, or 1MHz
+	 *  - ast2500 only runs at 1MHz, hard coding bit 4 to 1
+	 *  - ast2600 always runs at 1MHz
+	 *
+	 * Set the ast2400 to run at 1MHz as it simplifies the driver.
+	 */
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
+		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
 
 	/*
 	 * Control reset on a per-device basis to ensure the
-- 
2.24.0.rc1

