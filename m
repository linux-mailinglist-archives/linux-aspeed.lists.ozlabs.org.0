Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBB44CD23
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Nov 2021 23:52:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqKqK44yYz2y7M
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Nov 2021 09:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K/JgB3Vr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K/JgB3Vr; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HppxS0Ry2z2yPV
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Nov 2021 13:40:41 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so551565pja.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Nov 2021 18:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yK8tf+b3N+A2kTTCczmEPv1PnBms4K5YZkWqOi0Jnp4=;
 b=K/JgB3VrqU0y907Q/ElTo0Bpg/CKpq7MDHa1EdGLt6taS2XIaTkhJxYUfeFDRJ4erm
 SeDOzfqwRRP6emZIQ1Pijz9utNg7JrOG3OHUSnCggxDu/zNvpwF2nSZu+hDtyVwzWyyI
 rqUzc1QmtGGgb8MJE3QD/ZV4Ow1WyPd1jDB6VyFy7ti2bzF0J9q/uJgQsj4k+i61UacE
 GbCpSu0fTp487wpJAXAGhvJ9ep/pTriogzE3SJI10+0hBt2KtO/0q3S0Ib2h5MC+vWv+
 Wy6x5j4ig4kf/PatsYoHlOHy6TwMZFUiSNbQSy3Woxu2bRWbPIQM5ir+7lapei64uomI
 aYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yK8tf+b3N+A2kTTCczmEPv1PnBms4K5YZkWqOi0Jnp4=;
 b=m+coMOOY/KGHrqw9L6uZEFPI+eSNSIUYu+oz2FY2DD3cszBXYfGfofBKFWlAZ/Knd1
 d5p0Oi1XaEEFg9eTJei0bebAlYG4l4p5r0GNS0e91gCgr9Vsd71yrRwPSjXOU6QMif8c
 kzuUj6DQc5FsXn4IABA7F7b1DnnChFsFrV0ziIAEpQxvRQJIgLEhfHFgXqA6NtjWTTgD
 iZF8hO6BblQvoDH2M7ba6HxUXuBpo/9JPXBZZcUQGmybFTTem2raOd4etEJwMTQTryyl
 Z6AG34DLCVzJB2dWHkUaE7y96xSBCBQLgPAYjGAUrI7OJM5p4kKNm6KfLZxuXFlHrpd7
 fAww==
X-Gm-Message-State: AOAM532dZ83cBf7mkoMlsYKH8cEbkG8jsSLiWY+MVxDMkbzr8pqhKMbl
 1N2fKv41i6ClHPMBloiP67s=
X-Google-Smtp-Source: ABdhPJzsyUO0t0QbjXLAGh7rjMEDgFSQKWlVNNr5f5oCf9Sb5QqFOtLuUemzva4UmPg0WPMMazk4gw==
X-Received: by 2002:a17:903:22c6:b0:141:fac1:b722 with SMTP id
 y6-20020a17090322c600b00141fac1b722mr12612172plg.23.1636512033976; 
 Tue, 09 Nov 2021 18:40:33 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c20sm21587957pfl.201.2021.11.09.18.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:40:33 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: johan@kernel.org
Subject: [PATCH] serial: 8250_aspeed_vuart: Replace snprintf in show functions
 with sysfs_emit
Date: Wed, 10 Nov 2021 02:40:28 +0000
Message-Id: <20211110024028.135887-1-yao.jing2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Nov 2021 09:52:00 +1100
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
Cc: zev@bewilderbeest.net, yao.jing2@zte.com.cn, gregkh@linuxfoundation.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
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
2.25.1

