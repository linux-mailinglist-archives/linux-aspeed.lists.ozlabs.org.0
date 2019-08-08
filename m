Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD5A733E
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:12:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGmP4lHvzDqlj
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:12:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nishkadg.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BtojRtPb"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4640td51zpzDqCb
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2019 17:51:21 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w3so6408863pgt.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Aug 2019 00:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSnnmihUYLaKXzyTPjYYLBxGDRScrz3svy/ObDo3mAc=;
 b=BtojRtPbMAjLmUGMQJ7ClEybpXmv1+Mi+UUo849LLaPZo5nuf6jZnK6D3bQwIswvED
 kbYiM1hgXX4lE8iBai3WptwYBKYczV6YmPJv2Dvc47CpcvGV10QThi+ZVyDdzWcoIGR+
 2As0qPeitNIQIzWxcGvN9W2M/hn7heivuNUKGcWEJ9iFfFdBSlSq5pmQQI+zkafMN6jU
 uPtznbzr6CKpnEcRdMY1nUpmGoZQ9zqz+7C8CNR3vWzjrcwB9+kn4YTGjCuYKNsVM8qE
 7+XQ+dYeInr435rJCAzO5e31+XRunfkyMHyycSnQdfUJpGAR0kkjcSx+3tRGIgJI3AkQ
 RifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSnnmihUYLaKXzyTPjYYLBxGDRScrz3svy/ObDo3mAc=;
 b=UMIlxo3lmIzfaaqZ7kq1qCsL3iTistlJ8Lq773d0155095ck2fVckrl/+LuDl/UK5z
 P6HwxpnywCSDtyeY09s7FUG4LCBMSbyUbKb3S3MhsVXvLy8rr/4dIP/UzqUIfmMrl1LM
 ry4Cq2Zdmo1HDU45sNbL4jemj6LDVcVbtoYItJbf1px8lTe0YA+KgMVzYbPaLNPZMSBk
 l74b5EWh31C6CF8LmbBty34STNUHO4W04QiAZNUklMxMBzLPfK6mz+koRGI3jJduzGtj
 3uvkAqMOgmtbF5PQYm0pyaMqE2ZYqYJuSTVakD7pmKrzjKmqKnNZS7ET9Nmeid+c8KOS
 ZZAA==
X-Gm-Message-State: APjAAAUlpRNkbc9G7F5DPCuNWv/vgAW0wyNAcNzBOUdfpOyHQ2slgXgo
 K3UzUKQlhdqjicfXi7c18tg=
X-Google-Smtp-Source: APXvYqzb4BAVBg0ifb2x9rYLwX8aneK9iIJBFsc6LtMuNn4lmieiAChuS3Dt/gOZYeg60hNjARY1iw==
X-Received: by 2002:a63:c50f:: with SMTP id f15mr11538416pgd.372.1565250678430; 
 Thu, 08 Aug 2019 00:51:18 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
 by smtp.gmail.com with ESMTPSA id c69sm3279009pje.6.2019.08.08.00.51.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 00:51:17 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, joel@jms.id.au, andrew@aj.id.au,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH] mtd: spi-nor: aspeed-smc: Add of_node_put()
Date: Thu,  8 Aug 2019 13:21:04 +0530
Message-Id: <20190808075104.15928-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:12 +1000
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a break from the middle of the loop, there is
no put, thus causing a memory leak. Upon termination of the loop
(whether by break or a natural exit), either ret will have a non-zero
value or child will be NULL. Hence add an of_node_put() that will
execute only when ret has a non-zero value, as calling of_node_put() on
a possible NULL value does not cause any further issues.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 19b8757325d2..009c1da8574c 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -836,8 +836,10 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		controller->chips[cs] = chip;
 	}
 
-	if (ret)
+	if (ret) {
+		of_node_put(child);
 		aspeed_smc_unregister(controller);
+	}
 
 	return ret;
 }
-- 
2.19.1

