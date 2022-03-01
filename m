Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9314CB204
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87fJ4lsWz3bvP
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=SVWU0b1P;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.221.190;
 helo=out203-205-221-190.mail.qq.com; envelope-from=liwg06@foxmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=SVWU0b1P; dkim-atps=neutral
X-Greylist: delayed 750 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 06:47:19 AEDT
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com
 [203.205.221.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7SSl4qqzz30FR
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 06:47:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646164023;
 bh=Sb3UcYOkMwOiM+FMVEB/7Mf7e9YvGkIfq21PpjOlOTk=;
 h=From:To:Cc:Subject:Date;
 b=SVWU0b1PvJ6PKaqcgCCM4TRIqwdEURunrG/LHh07vv48+4osoxxIGyaSsRHHVfqSk
 3i9j89/rIiEcrqT2kniLkvW5FBYNYO3EwDm9FYcBLrVSUFFvHurxzrx0rlQ/Kq3c8O
 Y7iQ6k20LA02c5nF8GIqzahPj7lECtHPEgCH+nRg=
Received: from localhost.localdomain ([111.193.130.237])
 by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
 id 7B723608; Wed, 02 Mar 2022 03:30:55 +0800
X-QQ-mid: xmsmtpt1646163055thmxsx56i
Message-ID: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
X-QQ-XMAILINFO: OfkeHAqGKDFb5pL06KT/dpe47k17PjLJZMgf74ZkiIng4U5qmNF3u9ILDSUGp0
 FkDOYIPRpsZp4waZ4HM7CRHkoEq5qzjZHsZp4j3bskvhlOPyGONFY842xLSDUvROd85nXkPjWngd
 uiqZr9bnP1ZBu4HU250UjY8YU1W9XgC7iWv9n6KWENSpshHAPc3R0Z0Zrm+0DjFAh4FBF+upC5Gc
 6osoqxkqHI9MpZErVDjXLjWux6yCH6+ijtjdS2rzREp0hA+nrpWhzLBmyAkIZRS5xqyAr7LxOm1S
 5FgcnXrIbI2hdP56ruslHwmafNtdilyKSs0OSEt/LJApoGRhRpdGBO/dkUJm0vk6c/zHJFpQL2h/
 k/TWHFxYxttR+LlmLjDBtTfLwfwlwpJldb2OBwU4/WaW3JiKz7B2EljRAN1BvAf1IhKMfC8Evkyw
 CjY40zGo6FUPgQN7w0QRdIkuOT0Ka5JV12woVmukk1UvcrmQY2D5MeF4yypZGgUbFuLFJF49Yik6
 nalhj8DVFpTgpaOlejm1EnZKqG40qz2nRyOteKcr9g7YcuD2fLQSoFmoEROx0kC6DswkDB2G//U1
 6Z10NRy4HhEHJBbNOyCpHwnn0Ad4b59S9zcPOYcIrqWHXnuF8AZvFlzar1QuKJm14FIEeK4y7Zzb
 Y5D1Zr2V3qCxIA7Cs/phY9vglWOXCzLueEB2GvYjDLOfjLRjaVXv2l7TDfu5tB+GeP8TMRkUn0p+
 sWUY6rl4/TXy+ozNLe0j55Mr4IouT/ZdUoR5jESVh3zELXOopZKlEfMwlf+kv+YjzF6uCvgIjm15
 x53jgArbIZZ9vItIshx7c9S1vhye+e4vg4yh02JNberywwMNeoaTYOs8UvNS5XKLVYrWhpPo8hnW
 XxruDdXXqf0s6MM/lIKdUflgV88YQ0dZNLjECx7Tgy
From: Weiguo Li <liwg06@foxmail.com>
To: andrew@aj.id.au
Subject: [PATCH] pinctrl: aspeed: fix null dereference in debug
Date: Wed,  2 Mar 2022 03:30:54 +0800
X-OQ-MSGID: <20220301193054.503419-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Mar 2022 09:11:13 +1100
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"pdesc" is null checked, but already dereferenced ahead in debug.
Swap their positions to avoid potential null dereference.

Signed-off-by: Weiguo Li <liwg06@foxmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index c94e24aadf92..83d47ff1cea8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
-
 		if (!pdesc)
 			return -EINVAL;
 
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
+
 		prios = pdesc->prios;
 
 		if (!prios)
-- 
2.25.1

