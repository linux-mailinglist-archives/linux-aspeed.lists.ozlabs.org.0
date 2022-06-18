Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC7551234
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 10:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMlh0KG6z2ywl
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 18:10:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.18; helo=smtpbg.qq.com; envelope-from=wangxiang@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 77 seconds by postgrey-1.36 at boromir; Sat, 18 Jun 2022 23:11:56 AEST
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQGXD1tf5z306r;
	Sat, 18 Jun 2022 23:11:52 +1000 (AEST)
X-QQ-mid: bizesmtp78t1655557745taoefuin
Received: from localhost.localdomain ( [125.70.163.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 18 Jun 2022 21:09:01 +0800 (CST)
X-QQ-SSF: 01000000002000D0I000B00A0000000
X-QQ-FEAT: mp05QlZ6er31q1MrCHV1u0rzmqaMNdwuu85emdj4nemWnmenvIbukvyKp3Ayx
	9vIsiLGSMyz+7BzxjsSRiTUW/uBTcKFOpJq0OuX6DowBSqayWbdP4mDNpsgh3H+tLNSbLt3
	iN4JQsIc4fY62m5iaz8kvQ7MSXqtO6vAY9UqX6+gXa84X3RCRdzg+uiIoIK6RyPGooVW+56
	W1hUJzI+tHBjlJRkYHLCnnJllUTcf5LFL9Ka0sICt8npjubbVMYjCHQJVZr/1zqjSuelemA
	p+4T7MBBZETzvho73jWovfaGdeenUx7b6r0u8dXa0YzxeDpQxPoqPNytYodzgldmq12qGSi
	xRC/O5G
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: andrew@aj.id.au
Subject: [PATCH] pinctrl: aspeed: Fix typo in comment
Date: Sat, 18 Jun 2022 21:08:54 +0800
Message-Id: <20220618130854.12321-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'and'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 4d7548686f39..aaa78a613196 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -632,7 +632,7 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_ALIAS(pin, sig, group)
 
 /**
- * Similar to the above, but for pins with a dual expressions (DE) and
+ * Similar to the above, but for pins with a dual expressions (DE)
  * and a single group (SG) of pins.
  *
  * @pin: The pin the signal will be routed to
-- 
2.36.1

