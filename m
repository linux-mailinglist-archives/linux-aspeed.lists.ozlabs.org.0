Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F54B622D
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 05:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySxb5h5Hz3bW9
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 15:37:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YKjkFETz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YKjkFETz; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jth8T1rCdz2xsb
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 11:48:56 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id w20so770979plq.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Feb 2022 16:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CI+hs3F4c1QaxzVBV/sm+QTUejv8UzZhOXTGUR0B9uI=;
 b=YKjkFETzIsoNqqkAmCjyV0mNIUkQkRSnB2T7NJbtwbxXJrArMifhGPLxUyR08q5bHv
 6t6xNyXKagTaEW+KSMpYR3r4SbqfopBqIabBi+Bh1fJayxMOKtbhngW1ctk39HR50gH4
 MYsyS5IcJWmB30Pl/WeDdxFuIZdY7mfU3kxJWH5aq333hrqbWiWRic52tY8NagHRDlj2
 gK/rkVOkK9+A9qgg+Q1MvkC6YBVpwnQyMFdaE/bDvYcC7flw6GKEjQEqAkDcLRC8IpG5
 KVqeIch3RcnvS/X3Yba319rF8IfT/0KfRROc11/Le/eccSmeIN+5fjh4gl4m1UDO+zhs
 xABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CI+hs3F4c1QaxzVBV/sm+QTUejv8UzZhOXTGUR0B9uI=;
 b=ek0e5uQdvva9bNz+spzrzdOg6ssV4F8SsEKPBm6N6bJPE4BbUSr2GD4cDDQPKPDgRN
 45ggY9XNtfq+mTLXO0XNahYVG5wD9HFtqFZekk7q0xe1jiVQXMxAFy5hBtH8vhCjr6G1
 QvnCe+U9bMKdTlBXM4Hk3nhUwYP+80PzsUA+o1bM31qbPwz6MAAjqq6xTSZpvK0jdPPr
 iMplaZVYXmj1Ffllpka+9dVg2DQSLMctqmhWON3Pa+rxLcZvjwfA5SU3iTH7q8mswbU4
 Jkq/yfekgw0qNW/Ju7TrhgELgUQ/s9KZhTyI8qEkZqfl/C9d8k1Uv9GMGwPlFL0OjVJW
 9nHg==
X-Gm-Message-State: AOAM530ysjNm6ZZjzBN4iABVIc2bTFEirMIqMJMQIRWyOTPVAvkddCHj
 DpUOUCi/wTxECCYF67gPwiQ=
X-Google-Smtp-Source: ABdhPJxKenclyaWuFcTHESCPUiTtBJ90EFW/FDClHKa7xQUCowiN2FiI9OlBQjPUKIjxdeTncsF5Ow==
X-Received: by 2002:a17:90a:b947:: with SMTP id
 f7mr659505pjw.184.1644367733798; 
 Tue, 08 Feb 2022 16:48:53 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id t2sm17020154pfj.211.2022.02.08.16.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 16:48:53 -0800 (PST)
From: davidcomponentone@gmail.com
To: gregkh@linuxfoundation.org
Subject: [PATCH] serial: 8259: replace snprintf with sysfs_emit
Date: Wed,  9 Feb 2022 08:48:40 +0800
Message-Id: <96f0e23f49d708ce2476a6c19867443a48d78f65.1644283006.git.yang.guang5@zte.com.cn>
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

