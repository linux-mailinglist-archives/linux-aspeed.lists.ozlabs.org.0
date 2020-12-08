Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E042D274D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 10:18:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqvjW0Pt7zDqXL
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 20:18:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fg4koyxO; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqvjN4D2CzDqVd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 20:17:58 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id g18so11666630pgk.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Dec 2020 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCL72abh8RwsObGRTRo7uppPTyqxE0CC1s+FFsxo4Gg=;
 b=fg4koyxOioGekDoKsMY6yz1G6lyWSB/jYVaeMA0gg+MZylnvs+xLg7kXaBb0RH72wL
 //Wj9M193tOHo1TDD6dfoFUj/TV/x2gIhiq90Pz40uutrSIUqTAR3FtjwyjUr1dQnLdf
 ZOFEdTQLZYWyztsL6ZB2kDLiRAwphq1u+JJi+ESL2kXh/hvJnY+Sa80My2tNVAYtUBRL
 vE84hIoSr+HeTR1uDa2u7q+tBAzgy6N6oq36HvN9djE23/eKoXt0FG3q6lq+cZxc1ndq
 ieEE8uVhT48nRgpKOJ+TSGfX71JzgLCgfvP5k3c0rKQWaCkb/hnNUgCxZ8rHAtN/Ri/P
 JAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCL72abh8RwsObGRTRo7uppPTyqxE0CC1s+FFsxo4Gg=;
 b=tYEgznw9CW65OJULtUvxLs/yF4Xwkj6tzd39cEiAuLfCTVi6qkWh5lZvpFw/fsJQV8
 qbijXuIKTeT3CMbi+THtv5cEV6OGHR1FwgneDqoUxIWFzfWGGnrLYPeDBn1c5nKP1VFu
 FjX/fTj43Py37Oh/FwxSPIanVNKA8EQtSAoY3rBtuokBm9jBvGOtaKDbMHtSqf4A03ee
 BFrkvmWZsw7RtVvLGsdLPgchDqX/CtAqW5FDfmPlenL4fVVka5qIeGgoORxMuQZw0iNB
 MPiubjJqUo7Louogz+GklwNWL6T8UpO+SWljpGR5Co8BAEVZSGvXTbw+Z7FwlVTQIdmQ
 hRsA==
X-Gm-Message-State: AOAM531j1j3UT13fwrQ3XstlUt56v7OX2hv0FAyWi6wgogk0Kfgh+fl4
 fgU4P6umTFD443kgqJB79K7a3g==
X-Google-Smtp-Source: ABdhPJxS1AxAvAht0AdTpuGZ1oYMyAx9+D6b38OJ6z2m146XBuq1py0oVaH8DU5HXECT1x4c9MqvSw==
X-Received: by 2002:a62:e901:0:b029:197:ca81:4bb9 with SMTP id
 j1-20020a62e9010000b0290197ca814bb9mr611916pfh.26.1607419073902; 
 Tue, 08 Dec 2020 01:17:53 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id 22sm2380816pjb.40.2020.12.08.01.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:17:53 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC SNOOP
 driver
Date: Tue,  8 Dec 2020 17:17:47 +0800
Message-Id: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Lippert <rlippert@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Patrick Venture <venture@google.com>,
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

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
chardev")

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
v2:
  reword: Add fixes line
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

