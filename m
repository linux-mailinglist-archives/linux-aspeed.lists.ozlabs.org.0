Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5D488E6C
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 02:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH3P6hHbz2yZx
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 12:55:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.131; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JWyVD0ld4z2xCM
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Jan 2022 00:29:21 +1100 (AEDT)
Received: from pop-os.home ([90.11.185.88]) by smtp.orange.fr with ESMTPA
 id 6Y8inCULaUujj6Y8inIUhA; Sun, 09 Jan 2022 14:21:46 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 09 Jan 2022 14:21:46 +0100
X-ME-IP: 90.11.185.88
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Alistar Popple <alistair@popple.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] fsi: Aspeed: Fix a potential double free
Date: Sun,  9 Jan 2022 14:20:35 +0100
Message-Id: <3b5c9b693749a956b525c54bed0eeac9f958b8e8.1641734402.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:51:28 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A struct device can never be devm_alloc()'ed.
Here, it is embedded in "struct fsi_master", and "struct fsi_master" is
embedded in "struct fsi_master_aspeed".

Since "struct device" is embedded, the data structure embedding it must be
released with the release function, as is already done here.

So use kzalloc() instead of devm_kzalloc() when allocating "aspeed".
This prevent a potential double free().

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Keep the release function which is correct
    s/devm_kzalloc()/kzalloc()/ instead
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 8606e55c1721..ae6319818b14 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -542,7 +542,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
+	aspeed = kzalloc(sizeof(*aspeed), GFP_KERNEL);
 	if (!aspeed)
 		return -ENOMEM;
 
-- 
2.32.0

