Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C315B95ADBD
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 08:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqD8q6lwfz3026
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 16:40:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqD8p2tnFz2ym1
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 16:40:10 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WqCmG4bT2z1S8TZ;
	Thu, 22 Aug 2024 14:22:22 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FB89140447;
	Thu, 22 Aug 2024 14:22:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:22:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-hwmon@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH -next 0/8] hwmon: Simplify with scoped for each OF child
Date: Thu, 22 Aug 2024 14:29:48 +0800
Message-ID: <20240822062956.3490387-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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
Cc: ruanjinjie@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Jinjie Ruan (8):
  hwmon: (aspeed-g6-pwm-tacho): Simplify with scoped for each OF child
    loop
  hwmon: (aspeed-pwm-tacho): Simplify with scoped for each OF child loop
  hwmon: (ina3221): Simplify with scoped for each OF child loop
  hwmon: (lm90): Simplify with scoped for each OF child loop
  hwmon: (nct7802): Simplify with scoped for each OF child loop
  hwmon: (npcm750-pwm-fan): Simplify with scoped for each OF child loop
  hwmon: (tmp421): Simplify with scoped for each OF child loop
  hwmon: (tmp464): Simplify with scoped for each OF child loop

 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
 drivers/hwmon/aspeed-pwm-tacho.c   | 8 +++-----
 drivers/hwmon/ina3221.c            | 7 ++-----
 drivers/hwmon/lm90.c               | 7 ++-----
 drivers/hwmon/nct7802.c            | 7 ++-----
 drivers/hwmon/npcm750-pwm-fan.c    | 5 ++---
 drivers/hwmon/tmp421.c             | 7 ++-----
 drivers/hwmon/tmp464.c             | 7 ++-----
 8 files changed, 16 insertions(+), 36 deletions(-)

-- 
2.34.1

