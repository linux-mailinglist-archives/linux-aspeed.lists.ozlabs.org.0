Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC3402692
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Sep 2021 11:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3gdG4Vdxz2yHR
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Sep 2021 19:56:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3gdC4tSBz2xfN
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Sep 2021 19:55:58 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1879a3Sf076086;
 Tue, 7 Sep 2021 17:36:03 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (118.99.190.129) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 7 Sep
 2021 17:55:28 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v1 0/1] gpio-aspeed-sgpio: Fix irq handling issue.
Date: Tue, 7 Sep 2021 17:55:24 +0800
Message-ID: <20210907095525.24668-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [118.99.190.129]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1879a3Sf076086
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
Cc: steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGPIO input/output pin order was changed, thus hwirq should be calculated
based on the new GPIO pin order.
This patch series contains a patch for fixing wrong hwirq in irq handler.

Please help to review.

Thanks,
Steven

Steven Lee (1):
  gpio: gpio-aspeed-sgpio: Fix wrong hwirq in irq handler.

 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
2.17.1

