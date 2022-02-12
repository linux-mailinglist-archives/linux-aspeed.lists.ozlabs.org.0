Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A074B6230
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 05:37:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySxn09xlz2xgb
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 15:37:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hIJSwGBw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hIJSwGBw; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwZ2M6WMJz30R0
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Feb 2022 13:20:10 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso10504546pjg.0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Feb 2022 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=17pyCMYUdJRs5/I+oAtbnvmljOFXa0XqjKCSqRSFssE=;
 b=hIJSwGBwjoV1eeu9VKbrhLXYQVHUKfUJMEUxxRM7j/NivoJdv1LcivbeCfvsutaamV
 rkOwlNdGExHun9L1H76LddAZKpjTyBwnQolusGJzdpjN9erMbHEhfOqlVNUB/nQUjTq9
 +ANO1PrL77t+7ybRtncF5aqrPZlCQ5nsRXoT9OHEqD1VJj+wmndJ37nv3z8uXpczcNX9
 KtTgS4vNSdei4DX49SbQdEXTibSFk/6egZ0YWeLWxCrSYay5IHpvoSxcX1XpTX4CnVA7
 QoptaQAFV9zWyZ+iC6QMrgPj76CNMpXochr3Q/WgVYcEu4QHiD7hX4irno+mTtWyBhEa
 ZGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=17pyCMYUdJRs5/I+oAtbnvmljOFXa0XqjKCSqRSFssE=;
 b=Er3wLbwRB68V7CdxlxdiBGvNXxkMz+L1esUGXQUM27+lYOADjZQxrFeb9+AhlAsma+
 LeP8WQZcyFl8E/cwLnpEBQWhOgYVhRPBBvoCjflRsOk6Bw+zInfxh2J+JoBCS0Wh5Y3w
 jGyXdXs5I4z3NXs69L8wrZyIixT4pKi/SiSJjWcNx5j1Atkypgap9xNkM6SShhauY6Oy
 uH0wDbm7FlNCfD7lUjTT0lgUKFu6EkSGv1bPS8TY5XMPb7slmJxwfBEQWYcwjfO2/W5T
 L7tszls+dAwGXpSPqMVQ4Z6K9VkaT2DJGtdE282YCu0g1f0+xRsZsWQ4kvztHUjBC14E
 deZQ==
X-Gm-Message-State: AOAM531o5XqRd/bdRPzRpqFe/DXufJcgwLLuI2fOhxTBrbPo6K2aYt2m
 GsHmVz0K5cuw127AiNcaq5E=
X-Google-Smtp-Source: ABdhPJw1CgpJG8g9VxdycjemQbXKY+xXFw3BFj2mihwtdK2c44cuKTYH/q9r0w+1w9kHJvQFEuTQEQ==
X-Received: by 2002:a17:90a:e549:: with SMTP id
 ei9mr3280517pjb.190.1644632408124; 
 Fri, 11 Feb 2022 18:20:08 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id a17sm6429806pju.15.2022.02.11.18.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 18:20:07 -0800 (PST)
From: davidcomponentone@gmail.com
To: gregkh@linuxfoundation.org
Subject: [PATCH v3] serial: 8250_aspeed_vuart: replace snprintf with sysfs_emit
Date: Sat, 12 Feb 2022 10:19:48 +0800
Message-Id: <fed40753603dac4d14b17970c88e6f5f936348c1.1644541843.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:29 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, zev@bewilderbeest.net,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>, johan@kernel.org,
 davidcomponentone@gmail.com, yang.guang5@zte.com.cn,
 linux-serial@vger.kernel.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/tty/serial/8250/8250_aspeed_vuart.c:85:8-16:
WARNING: use scnprintf or sprintf
./drivers/tty/serial/8250/8250_aspeed_vuart.c:174:8-16:
WARNING: use scnprintf or sprintf
./drivers/tty/serial/8250/8250_aspeed_vuart.c:127:8-16:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>

---
Change from v1-v2:
- Modify the patch title
- Use the CC for patch sender

Change from v2-v3:
- Fix the patch subject prefix typo ("8250")
- Change back the SoB for patch submitter

---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 2350fb3bb5e4..36c39b8ea7af 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -82,7 +82,7 @@ static ssize_t lpc_address_show(struct device *dev,
 	addr = (aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRH) << 8) |
 		(aspeed_vuart_readb(vuart, ASPEED_VUART_ADDRL));
 
-	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
+	return sysfs_emit(buf, "0x%x\n", addr);
 }
 
 static int aspeed_vuart_set_lpc_address(struct aspeed_vuart *vuart, u32 addr)
@@ -124,7 +124,7 @@ static ssize_t sirq_show(struct device *dev,
 	reg &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
 	reg >>= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
+	return sysfs_emit(buf, "%u\n", reg);
 }
 
 static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)
@@ -171,7 +171,7 @@ static ssize_t sirq_polarity_show(struct device *dev,
 	reg = aspeed_vuart_readb(vuart, ASPEED_VUART_GCRA);
 	reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
+	return sysfs_emit(buf, "%u\n", reg ? 1 : 0);
 }
 
 static void aspeed_vuart_set_sirq_polarity(struct aspeed_vuart *vuart,
-- 
2.30.2

