Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F6658B6
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 16:26:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kyz74FBpzDqjQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 00:26:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yuehaibing@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kyyW0CP2zDqjH
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 00:25:37 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C5510EC944DB3A989B11;
 Thu, 11 Jul 2019 22:25:32 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 11 Jul 2019
 22:25:26 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
Date: Thu, 11 Jul 2019 22:24:57 +0800
Message-ID: <20190711142457.37028-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix sparse warning:

drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
 symbol 'aspeed_pinmux_ips' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 5b0fe17..839c01b 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -5,7 +5,7 @@
 
 #include "pinmux-aspeed.h"
 
-const char *const aspeed_pinmux_ips[] = {
+static const char *const aspeed_pinmux_ips[] = {
 	[ASPEED_IP_SCU] = "SCU",
 	[ASPEED_IP_GFX] = "GFX",
 	[ASPEED_IP_LPC] = "LPC",
-- 
2.7.4


