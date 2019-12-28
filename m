Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DD13513F
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 03:05:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tTwv32g1zDqVm
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 13:05:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ce+EFQyT"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47lY8F0FzlzDqCK;
 Sun, 29 Dec 2019 06:06:36 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id w62so16349166pfw.8;
 Sat, 28 Dec 2019 11:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ExkNmsId9T+IvJawOK9l5XqVWSk7e/vQjn+tqWFgqBA=;
 b=Ce+EFQyTJmQ93Ihqs4/E8gy7ty2ORo+rR2upNWrFHg8HE55TplCoOOTq7fkVCLYpEA
 /B0gQ27VwJJka5SrxxJ23JpDXDkVBoCdBdq0LWKJZb3GfmD0FXxRv7ynK9cvVHCcmlwq
 8LlKAUfIafn4yBgpiICP65i2jMgUtyJ13YKAE5u16H4o3lqE8pCX7uzLNIBPfmxnu8gb
 cCphqsBKkLlBkRPe/Rg/pt18syTCsND0VU7MDo53p5LQGPA8HU7osvEqMK6x+5v/wM0b
 NGQq3H8GrKK1WCRvn9t5s4Q/tI4H1UcmjqKdLeDZXSvTuXnQ4jwmJckROY/y7+eqTndn
 XJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ExkNmsId9T+IvJawOK9l5XqVWSk7e/vQjn+tqWFgqBA=;
 b=AD5qFfVZk93JwGl6Al0buiMz4uV6cpEn/bll4Q5+J9vkdjKePAYBZZlnYA2b3ga30r
 SRA4+eLLD1YgkrMwxZKXSzmRw/iEnOeOPykQwQ4mAsfoJ4UUAxMdq1FdBlQ8mTumQQ24
 ZrpU933KLI5ZDNGJjbBTyKNfLdKA2C/QPIaxNU7mE90AuWRfR17dHwDdcsamYmo0LgWa
 Vu39PvqqiXgD6m6ZBvotIo7k3TvrHJ8xIcS648YP65lT6Kd35O3sosN4msDGUDh5yrSF
 e2dKi1l2AVNAieac8h/3ao9emjtYhNBbtMwkeLLxp9kPZouaPa7pZXA72EaKVMBAr7xy
 l3xg==
X-Gm-Message-State: APjAAAXL/XIuMYlMcwtNoSuzVO8pgbZRVgxFJ/EsQhjxkGlJg9P83bgN
 aw+6/mt4Ry8Kxoy7JO7EpgM=
X-Google-Smtp-Source: APXvYqw6F3EIJfl5MzAdn7+WNC3mpGfr9bNTwK4QG6AMwATj/5WwYSBlLMxLhTsD1cjLhQewg4z4Kw==
X-Received: by 2002:a63:1502:: with SMTP id v2mr61363657pgl.376.1577559993191; 
 Sat, 28 Dec 2019 11:06:33 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id x132sm44273943pfc.148.2019.12.28.11.06.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 11:06:32 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jk@ozlabs.org, joel@jms.id.au, alistair@popple.id.au,
 eajames@linux.ibm.com, andrew@aj.id.au, linux-fsi@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fsi: aspeed: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 19:06:31 +0000
Message-Id: <20191228190631.26777-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 09 Jan 2020 13:05:38 +1100
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/fsi/fsi-master-aspeed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f49742b310c2..edd0b287e7b7 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -422,7 +422,6 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
-	struct resource *res;
 	int rc, links, reg;
 	__be32 raw;
 
@@ -432,8 +431,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	aspeed->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	aspeed->base = devm_ioremap_resource(&pdev->dev, res);
+	aspeed->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aspeed->base))
 		return PTR_ERR(aspeed->base);
 
-- 
2.17.1

