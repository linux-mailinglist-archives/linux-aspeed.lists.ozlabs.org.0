Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5D2CB448
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 06:21:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm6l84HsnzDqSn
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 16:21:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=yTpjg/5v; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm6dn0ljCzDq9T
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 16:16:40 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id g18so388111pgk.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Dec 2020 21:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GtGtPbg6S6XKVKh82wVhGzyfNnkNiglHRZS762Gp8h4=;
 b=yTpjg/5vPTATnfoFO0GOcxyy/yiYUUXJjKNzERHukSH6utLlTGRfyx+S6UzT+cjg/w
 dMsSOI1zz34tfE41k1LH54QkIrFch4/QcoSX9q8OjO+ZB2v6IYNlm9h/vZWTmSGwdsT9
 faB/m05s9Qd7W6/Yj19PbFZ6zjGW7M8YZf/uUg2moJK7CqACQcttFkT+sLX/R31RYMhF
 2AKsgEtIVsziuT7sP8wXy2wwhhBYQBCQ+noQ9hamWAQ5DWXuXxg9N/B2EZa4nuJbUQrE
 oqtAK+AplMNwesTPNluXQQQ4Ql03xXST8AI4a8pGLOWaS637KyHNBmddECETWDuxIrnO
 74Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GtGtPbg6S6XKVKh82wVhGzyfNnkNiglHRZS762Gp8h4=;
 b=YiOORSS8Q+yikteD+n85fH/QIGmey1rT5bt02l9aonWFfsUYlcNZxvzZTuoVZj5feG
 zqodm3c74XFn/QHnv/frDPvjOCPJPoatUS0ujc2Fhmsu4d4TVqsQXajCEekiF7nm5Rs9
 cgLHvluEuOcmdyzOr/58UskEB43c4ywEnbZyuInLo2BC5oTJ03HUKcYKECVZRUjMgC38
 Vt+JnyGkb1KixwpAqWWsTxB+68dtMH5BLHkjsjQQTawG4b2sTR9YkvYxYUbew7k2r7Ju
 KUuJYsfE7QzZqJCNWoo9o6EAI6aczI4gGS/4rPJaLuI1u+igRisKggEU8VHfWOxuLORT
 gvVA==
X-Gm-Message-State: AOAM5320YSgMWtthqwA6P8cU4T09NhMvDUBniyXuB8bS6sTpvDaZ9455
 oqGB6OwnLhFW3qW5tnIm2Uf2Yw==
X-Google-Smtp-Source: ABdhPJyH6g/iSiIYweoziem2Du7RUZljIo6zCrG1kBxujGXUB4xR1hWqzfOw+ZznapK4sq/NdHd3bw==
X-Received: by 2002:a63:d45:: with SMTP id 5mr1154561pgn.0.1606886198037;
 Tue, 01 Dec 2020 21:16:38 -0800 (PST)
Received: from localhost ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id d4sm457523pjz.28.2020.12.01.21.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 21:16:37 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH 1/2] misc: Add clock control logic into Aspeed LPC SNOOP driver
Date: Wed,  2 Dec 2020 13:16:33 +0800
Message-Id: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Dec 2020 16:21:21 +1100
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
 <linux-aspeed@lists.ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>

If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
SNOOP block will be enabled without heart beating of LCLK until
lpc-ctrl enables the LCLK. This issue causes improper handling on
host interrupts when the host sends interrupt in that time frame.
Then kernel eventually forcibly disables the interrupt with
dumping stack and printing a 'nobody cared this irq' message out.

To prevent this issue, all LPC sub-nodes should enable LCLK
individually so this patch adds clock control logic into the LPC
SNOOP driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 682ba0eb4eba..20acac6342ef 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/kfifo.h>
@@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {
 struct aspeed_lpc_snoop {
 	struct regmap		*regmap;
 	int			irq;
+	struct clk		*clk;
 	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
 };
 
@@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	lpc_snoop->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(lpc_snoop->clk)) {
+		rc = PTR_ERR(lpc_snoop->clk);
+		if (rc != -EPROBE_DEFER)
+			dev_err(dev, "couldn't get clock\n");
+		return rc;
+	}
+	rc = clk_prepare_enable(lpc_snoop->clk);
+	if (rc) {
+		dev_err(dev, "couldn't enable clock\n");
+		return rc;
+	}
+
 	rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
 	if (rc)
-		return rc;
+		goto err;
 
 	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
 	if (rc)
-		return rc;
+		goto err;
 
 	/* Configuration of 2nd snoop channel port is optional */
 	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
 				       1, &port) == 0) {
 		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
-		if (rc)
+		if (rc) {
 			aspeed_lpc_disable_snoop(lpc_snoop, 0);
+			goto err;
+		}
 	}
 
+	return 0;
+
+err:
+	clk_disable_unprepare(lpc_snoop->clk);
+
 	return rc;
 }
 
@@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	aspeed_lpc_disable_snoop(lpc_snoop, 0);
 	aspeed_lpc_disable_snoop(lpc_snoop, 1);
 
+	clk_disable_unprepare(lpc_snoop->clk);
+
 	return 0;
 }
 
-- 
2.25.1

