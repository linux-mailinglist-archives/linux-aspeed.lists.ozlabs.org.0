Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E03224D6
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 05:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl5Pg6R21z3cHS
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 15:17:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Wo9nC6Fz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wo9nC6Fz; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl5Pd2FKkz30N2;
 Tue, 23 Feb 2021 15:17:54 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id w18so7976690pfu.9;
 Mon, 22 Feb 2021 20:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gzs+lLSVaE993nw8Nyen177ZOwuN43ccPeEJwO/dn8E=;
 b=Wo9nC6FzqbHp2XtezJ+NnMW0EmenENobnEVUgbL49wIzRfaiEzeFM5wSOcZEy0QH06
 mpvXpgP7YJra7/YQSZIWFU8KbhTQamwPRElgKqFk8ZZsXbEhvf77qERZnxFKKceSxexI
 ZMosqCcTrXD9yM01NmStukp1LpFo37Kj59ynMcgZ/KyUf/10FWxCoQLyWJ8F42X13EjX
 uPFqf2xS6GmofJiH/82psxaZz1VdYHjYHiSeMRsyo/3PmMHAg5ccKDnuM7MipZWSowp1
 em0s7XyHUxMImlL0mySiI9Obh811LG/WHhdxj9KezH9zr5IwaKMlPbNrQsJj37NqU1BR
 PJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Gzs+lLSVaE993nw8Nyen177ZOwuN43ccPeEJwO/dn8E=;
 b=Xmk6Mf5Jx48n/z65ZWhB5jX1zh7GZUjiE60JmOI+7S3ckWHLe0DiA8MeZiqUDnkSfU
 bkYcpVTMbWAFg5ZBKRVbqjJVKgbegAyzmI9HHSvmS3oH6Gay6oWtpTIufAwhtLei6QjW
 bhfvcj1YcYrmbbIkT9XsY7LWKtUpEEcKPuj1ACVSFiBLIhkWNnThEq8hHLTrHnPLmH3b
 ToF2CLOqlb9mEHxIo/RlKmCBSQrzk3SiOdA0Lx+Q5jMI2h7BHzhW/9hcPi7Ir5JaaxfL
 oYBTF74CJ/nHuAWUl8YNDrOHj+YikGrY5QLQdZQSbNBAkLh4470sNqL4rQeZsmby+Dti
 OCyQ==
X-Gm-Message-State: AOAM5314V6BWnokUxCyw6h++AW57/VvBp1/TUQ4/aFuYKcaYIye74BdU
 jmlyjXMFbeUct8tnmbq+u38=
X-Google-Smtp-Source: ABdhPJwdAskaiczNbCW9pSsr5hq268hO4ty3aqGRyARBQB5eKKgTFpiLNvp6mO+cC/KihS8u5OEwxg==
X-Received: by 2002:aa7:87d5:0:b029:1ed:b85b:1420 with SMTP id
 i21-20020aa787d50000b02901edb85b1420mr527702pfo.17.1614053867337; 
 Mon, 22 Feb 2021 20:17:47 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gd18sm1164466pjb.5.2021.02.22.20.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 20:17:46 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] fsi: aspeed: Emit fewer barriers in opb operations
Date: Tue, 23 Feb 2021 14:47:37 +1030
Message-Id: <20210223041737.171274-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When setting up a read or write to the OPB memory space, we must perform
five or six AHB writes. The ordering of these up until the trigger write
does not matter, so use writel_relaxed.

The generated code goes from (Debian GCC 10.2.1-6):

        mov     r8, r3
        mcr     15, 0, sl, cr7, cr10, {4}
        str     sl, [r6, #20]
        mcr     15, 0, sl, cr7, cr10, {4}
        str     r3, [r6, #24]
        mcr     15, 0, sl, cr7, cr10, {4}
        str     r1, [r6, #28]
        mcr     15, 0, sl, cr7, cr10, {4}
        str     r2, [r6, #32]
        mcr     15, 0, sl, cr7, cr10, {4}
        mov     r1, #1
        str     r1, [r6, #64]   ; 0x40
        mcr     15, 0, sl, cr7, cr10, {4}
        str     r1, [r6, #4]

to this:

        str     r3, [r7, #20]
        str     r2, [r7, #24]
        str     r1, [r7, #28]
        str     r3, [r7, #64]
        mov     r8, #0
        mcr     15, 0, r8, cr7, cr10, {4}
        str     r3, [r7, #4]

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 90dbe58ca1ed..09fff86b2bac 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -101,11 +101,11 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 	u32 reg, status;
 	int ret;
 
-	writel(CMD_WRITE, base + OPB0_RW);
-	writel(transfer_size, base + OPB0_XFER_SIZE);
-	writel(addr, base + OPB0_FSI_ADDR);
-	writel(val, base + OPB0_FSI_DATA_W);
-	writel(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(CMD_WRITE, base + OPB0_RW);
+	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
+	writel_relaxed(addr, base + OPB0_FSI_ADDR);
+	writel_relaxed(val, base + OPB0_FSI_DATA_W);
+	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
@@ -149,10 +149,10 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	u32 result, reg;
 	int status, ret;
 
-	writel(CMD_READ, base + OPB0_RW);
-	writel(transfer_size, base + OPB0_XFER_SIZE);
-	writel(addr, base + OPB0_FSI_ADDR);
-	writel(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(CMD_READ, base + OPB0_RW);
+	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
+	writel_relaxed(addr, base + OPB0_FSI_ADDR);
+	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
-- 
2.30.1

