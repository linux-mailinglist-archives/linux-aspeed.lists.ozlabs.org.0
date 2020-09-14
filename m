Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FC268681
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 09:50:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqdnQ3jlBzDqZW
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 17:50:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=liushixin2@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqc2c1cZ7zDq9T
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 16:31:35 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A6F764523210BD948D6E;
 Mon, 14 Sep 2020 14:31:29 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 14:31:18 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH -next] EDAC/aspeed: use module_platform_driver to simplify the
 code
Date: Mon, 14 Sep 2020 14:53:58 +0800
Message-ID: <20200914065358.3726216-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 17:49:19 +1000
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/edac/aspeed_edac.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index fbec28dc661d..fde809efc520 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -388,23 +388,7 @@ static struct platform_driver aspeed_driver = {
 	.probe		= aspeed_probe,
 	.remove		= aspeed_remove
 };
-
-
-static int __init aspeed_init(void)
-{
-	return platform_driver_register(&aspeed_driver);
-}
-
-
-static void __exit aspeed_exit(void)
-{
-	platform_driver_unregister(&aspeed_driver);
-}
-
-
-module_init(aspeed_init);
-module_exit(aspeed_exit);
-
+module_platform_driver(aspeed_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Stefan Schaeckeler <sschaeck@cisco.com>");
-- 
2.25.1

