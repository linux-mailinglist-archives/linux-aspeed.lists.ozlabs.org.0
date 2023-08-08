Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 148927802EB
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 03:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRkVY05mXz3cC5
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 11:16:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangzhu9@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKsVC3s6xz2yKy
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 22:11:15 +1000 (AEST)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RKs3P6QH6z1L8wW;
	Tue,  8 Aug 2023 19:51:29 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 19:52:39 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
	<sebastian.hesselbarth@gmail.com>, <a.zummo@towertech.it>,
	<alexandre.belloni@bootlin.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<nicolas.ferre@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH -next 0/5] rtc: remove redundant of_match_ptr()
Date: Tue, 8 Aug 2023 19:52:08 +0800
Message-ID: <20230808115213.154377-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
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
of_match_ptr() here. We remove of_match_ptr().

Zhu Wang (5):
  rtc: aspeed: remove redundant of_match_ptr()
  rtc: at91sam9: remove redundant of_match_ptr()
  rtc: nct3018y: remove redundant of_match_ptr()
  rtc: armada38x: remove redundant of_match_ptr()
  rtc: at91rm9200: remove redundant of_match_ptr()

 drivers/rtc/rtc-armada38x.c  | 4 +---
 drivers/rtc/rtc-aspeed.c     | 2 +-
 drivers/rtc/rtc-at91rm9200.c | 2 +-
 drivers/rtc/rtc-at91sam9.c   | 2 +-
 drivers/rtc/rtc-nct3018y.c   | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.17.1

