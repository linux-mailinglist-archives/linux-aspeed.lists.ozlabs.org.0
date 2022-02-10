Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDD4B622F
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 05:37:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySxk0p3Yz3bcc
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 15:37:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KamH/nE7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KamH/nE7; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvY6W1QHDz30KW
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 21:35:14 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id i30so9429630pfk.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyHKEWDVKlKy9kwRRGPyuapqQZ9EQT0MCaFn+0fLSY4=;
 b=KamH/nE7RyCGAJiELKI8ttpxAJ9wkggTJ5s0F/Y9wop+T3gwUgiqgAhfmpOoLrzghl
 HHMFronttCK7irfax/sVkRSs4TvRVaDclnH/+hJtc9lRpJ7WR4KpJRRkTnR7bGqm8IpH
 1rJeZr4InqU66DRe5dK8jEg8oysCN5u0uEPLLRuHg5gqHLfQVgeap/XnOOEimXVQm8qj
 JrmcdPeh97sq3w/tXGzK4VLZ8VfQWF1UtGTEVSwxX+vCCDOzINd6nBfbKy2DulL+C1xB
 z2fO8zUunZ+wqe404S7xjpHFgrI3UUlzG9iHpKis5Gs/fOXWg7aDFVJeP9fC/DtW+vL8
 wV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyHKEWDVKlKy9kwRRGPyuapqQZ9EQT0MCaFn+0fLSY4=;
 b=AQiPZYAKyER6SpzCqVWpvel/HrIZHunDZqw+NH/N6obDC6ycpS5QXaYclMGC79DRhY
 s2cOwqWHlbtRkwofrdG0EF02M7/gAbP+cq15lCfmPEOl9kU1uVj69OTOkRHebaf9AOA8
 34tnMgOzquRlHqLrropi70BSbzuD7CXgCdDvFMg9B6pmnPOJuB/C1zRwdXxtbgghBQ61
 6PnYwzVN84Pzjb5jqfPW7bOl64zeiB7ZUSERNSs69cqNMQMQ20BhsmbIB8GJJhZib0gV
 zg2F1ClkQirsO5GHpgQBzN12AMM/QcVsds2ydNpjKPsFZXGtZ9lke5yvMW0wx3I4/wKo
 srcw==
X-Gm-Message-State: AOAM533qRFHiNlbZGvpkf/pXuTa94gO058IQXONrbThBy+wpjv62lDIh
 0JziQknY19T/+gVr0E5/eFU=
X-Google-Smtp-Source: ABdhPJyHB7MuV96LGULlUp4tGXnFXjvLg7pzcsrt/mwATW5OK7J1WrWnm4frTCS4r2tuWK+a4RMWEA==
X-Received: by 2002:a63:4e:: with SMTP id 75mr5682216pga.461.1644489312338;
 Thu, 10 Feb 2022 02:35:12 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id y20sm23063496pfi.78.2022.02.10.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:35:12 -0800 (PST)
From: davidcomponentone@gmail.com
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] serial: 8259_aspeed_vuart: replace snprintf with sysfs_emit
Date: Thu, 10 Feb 2022 18:34:45 +0800
Message-Id: <a0f3e5d6d438710413d1909365f99ae4d2a4bacc.1644399683.git.yang.guang5@zte.com.cn>
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
CC: David Yang <davidcomponentone@gmail.com>

---
Change from v1-v2:
- Modify the patch title
- Use the CC for patch sender

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

