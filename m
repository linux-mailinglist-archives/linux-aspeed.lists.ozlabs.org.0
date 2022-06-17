Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A9551232
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 10:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMlZ44hlz3blt
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 18:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YUbWt5fw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YUbWt5fw;
	dkim-atps=neutral
X-Greylist: delayed 1895 seconds by postgrey-1.36 at boromir; Sat, 18 Jun 2022 01:14:47 AEST
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPjJR2Yvwz3bsK
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Jun 2022 01:14:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oqTFS
	HQR0LyoKRjMr2/vnSyFVI269+kRaqPVQCinquA=; b=YUbWt5fwnt/qeuRUmA3ks
	eVCpZ2psR0iXF1+SWD6egNuCcjodxyAm8GSiCgo5o0xD45yq6mZpxNt31gJUPPWs
	4Zu2nyVGceNZd+r9Q4L5CpPrlk6Q1FOH/wELEeUK5ApmuVtgj2z/Y/aZJBdZbCFY
	jMmJxz4160rAY0fqjpIZ7A=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowACHJv+Ckqxin0VlDg--.21214S2;
	Fri, 17 Jun 2022 22:41:07 +0800 (CST)
From: Liang He <windhl@126.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	joel@jms.id.au,
	andrew@aj.id.au,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	billy_tsai@aspeedtech.com,
	colin.king@intel.com
Subject: [PATCH] iio: adc: Fix refcount leak bug in aspeed_adc
Date: Fri, 17 Jun 2022 22:41:06 +0800
Message-Id: <20220617144106.4050677-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACHJv+Ckqxin0VlDg--.21214S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4fWry3Gry7Cr4UZr15XFb_yoW3CrcEgw
	s7WwsxXrnrAFZ0vrWqvw1fXr909Fy8WFWkuF10v34fWa4UArZ7AryDWF4YvrWUZrs2va45
	ZF4DX34xJrnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjn2-3UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuA0jF2JVj6h7ygABsh
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:06:19 +1000
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
Cc: linux-iio@vger.kernel.org, windhl@126.com, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In aspeed_adc_set_trim_data(), of_find_node_by_name() will return
a node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/iio/adc/aspeed_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 0793d2474cdc..9341e0e0eb55 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -186,6 +186,7 @@ static int aspeed_adc_set_trim_data(struct iio_dev *indio_dev)
 		return -EOPNOTSUPP;
 	}
 	scu = syscon_node_to_regmap(syscon);
+	of_node_put(syscon);
 	if (IS_ERR(scu)) {
 		dev_warn(data->dev, "Failed to get syscon regmap\n");
 		return -EOPNOTSUPP;
-- 
2.25.1

