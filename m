Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7F7802E8
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 03:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRkVS1jG6z2ydM
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 11:16:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=wangzhu9@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKsTl5rrBz2xq6
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 22:10:51 +1000 (AEST)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKs1f66cJz1hwH1;
	Tue,  8 Aug 2023 19:49:58 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 19:52:47 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
	<sebastian.hesselbarth@gmail.com>, <a.zummo@towertech.it>,
	<alexandre.belloni@bootlin.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<nicolas.ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH -next 5/5] rtc: at91rm9200: remove redundant of_match_ptr()
Date: Tue, 8 Aug 2023 19:52:13 +0800
Message-ID: <20230808115213.154377-6-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230808115213.154377-1-wangzhu9@huawei.com>
References: <20230808115213.154377-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Aug 2023 11:16:42 +1000
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
Cc: wangzhu9@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. We remove of_match_ptr() here.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/rtc/rtc-at91rm9200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index e9d17232d0a8..4052e983455f 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -642,7 +642,7 @@ static struct platform_driver at91_rtc_driver = {
 	.driver		= {
 		.name	= "at91_rtc",
 		.pm	= &at91_rtc_pm_ops,
-		.of_match_table = of_match_ptr(at91_rtc_dt_ids),
+		.of_match_table = at91_rtc_dt_ids,
 	},
 };
 
-- 
2.17.1

