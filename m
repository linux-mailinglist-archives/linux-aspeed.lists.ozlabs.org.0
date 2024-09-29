Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA694989857
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 00:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH00X0DXcz2ykx
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 08:55:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.61.247
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727573229;
	cv=none; b=ZVojW247Uk7kbwcABmhnfgDPh0JJXIwftNjBHsWJn9dd0z5eFhfJxdl2nUiV2ISGI0a/pU6FikfyiEhdqYTkIn8esWRCvxoeBM/OTELWwzMm9GEnqh+0q6S+7yQh9bIqY19V6C0try9SzrXb91vL+B85VJvuHWgFpvCL32m9Kn0XcF/y+gUqNa46Hds3QFCQ9gRifw2C6K/V14he6pvYTfFqYgSgRQGQtQtiOdDRpHzNOGt8FHHrKzNk8DlZrPz2yT0UdT59Xc0MHnbIgQmgE8szlNjqQ/87pddQZzf1PYKg7Wtb+ISZhLe3610rAmMS40QQqRGSF/ZJmrJlvkKlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727573229; c=relaxed/relaxed;
	bh=isUErMXykB7eJ645XnBJHLZxme0f2JhC6DK4lJZvJ3s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iwQ1GU59h1ri0uWurV/gI3up72xwUJEUaSWDacYk/Guzidfy0YPG7y4oV6D3OpGAbfub/V4yDGn2pe9v2erq8njNrSA0pfOMcGD7a1uBuv+XELt8XNb17Js/J0UCoOIHtrH3SFkgTF6mirlYxuwCZRXpvjhnPARgVvW2CK41kCi+24YCLZBpJE3Ml1ddmX6+cUZ0GGlxVc5Swoab7Lzc6GOyjy9ZRXDOW7B/GF5AjOiOLvs6iLheSJaJkcDxt2Jy/wSSOFTJ5QpKlsWnTp4IhBv5knDuij8VKcsTKDKMDuCPLjOkkSKrRjo6VCuJ5+jAlk30awlBNaI3at20qhE7NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass (client-ip=210.51.61.247; helo=ssh247.corpemail.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org) smtp.mailfrom=inspur.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.61.247; helo=ssh247.corpemail.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sun, 29 Sep 2024 11:27:08 AEST
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGRQ42mFKz2xJ6
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Sep 2024 11:27:08 +1000 (AEST)
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id ZAC00145;
        Sun, 29 Sep 2024 09:25:45 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201624.home.langchao.com (10.100.2.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 09:25:44 +0800
Received: from localhost.localdomain (10.94.12.73) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 09:25:44 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <rlippert@google.com>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>
Subject: [PATCH] soc: aspeed: Add check devm_kasprintf() returned value
Date: Sun, 29 Sep 2024 09:25:03 +0800
Message-ID: <20240929012503.18636-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.73]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2024929092545f7c10c333fcb45562c92aa29f2280cd7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on boromir.ozlabs.org
X-Mailman-Approved-At: Mon, 30 Sep 2024 08:55:22 +1000
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
Cc: Charles Han <hanchunchao@inspur.com>, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

devm_kasprintf() can return a NULL pointer on failure in
aspeed_lpc_enable_snoop()  but this returned value is not checked.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 888b5840c015..68317b2e44b5 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
+
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.31.1

