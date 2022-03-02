Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF724C9E46
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 08:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7ljX1Ygnz3bpF
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 18:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=HmgiRuSI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.221.235;
 helo=out203-205-221-235.mail.qq.com; envelope-from=liwg06@foxmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=HmgiRuSI; dkim-atps=neutral
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7ljL1Nrdz3bVZ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 18:13:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646205230;
 bh=huLhAprZxNDaMXRVKOWtreTvo8DAszHRZkmEmGgVR38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HmgiRuSIVyTcokzsU04vi1jMCiB/iY7ftnQSZj6CECJr529UxPKxeJ3MGteE4zE78
 F/pceGxZpfYdQv1NzMcWixuJfqZCJ4pCGNMyva+1ijfPbUcT9zDfQ6FAg5dw6z1LvQ
 aYIRKIMiIH3Nhh+jNYpOt8vesTDKWWozRdg7ofIs=
Received: from localhost.localdomain ([111.193.130.237])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 318A5C44; Wed, 02 Mar 2022 15:12:24 +0800
X-QQ-mid: xmsmtpt1646205144tuekiyquq
Message-ID: <tencent_68563A6FDF372313228831913CC3A7041108@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uT/qA3FFsWIeCWY5xGY66X3sdjzusKNG2NDIdqMMpyVJyebZC+nb
 SHySQBPC0C1Py5xE62Ric6H8oKFb3v6Ppu56ol6FlLdUxFiqKBdl3eXo44guLhqxYKcDypwI4UJH
 c1FhdWpD3zR+cAWjLDp9uIcHWrxLBxxHdalVN/4YDGW8/mQgxG+1aqSLPO7QCBxFJzlpQhoc9llb
 Pybf6HeMQsJFSr6eX3yhlSrzxutKMo1wr5W24jbVsj54rWDAf0x3nZ2M0B06A1Smt1adnEHtkX29
 DOP8wf2GCUiugjJ9fwbR+P38DnSLvreHVBDDHU8SgdkJ8EQ15fHQv2Tyd4lykylZ+lB1fbGSDGDB
 xnFZF7O8MXIkuy9Ss7baqjarwfGHpP251HrmFTD7VoEayx4bJavltGqCSpUiUxGCSFqgVj+uYGor
 dvX061IjIRlZYWJwYRvyhIl2gFWzEGMqjkJ49PhT3LDIO7n+Hv60JftNpXUf8EAyiSCa4X7UAvNi
 jJl0lXrxL2oBAJtWxFcenJcbHjZa6XfQXfYkaYdNN8ju0upzlOSpFklyFnbEpJNS8O5At4nIAYuI
 sbrCI7EiRvtO5gUzyK/MXxP49oOE1LOtMsCSTlbEslAm0ksX4GlYHbIGaOrJLhunftMIPmjpRDZD
 nhu+ZWmv8/f4pNYF4AhiHkVgv7ALQTg9ebP6qt9DlQ3UA3o+ChasNr1+mWldM2nOE9PVd9uBI8BE
 C445PPzxytx+Cdym+BfWoDDV5P2+YHWFKAf5Ua25Q+jMCesZ/gS3CUJ+bLPs9l+/0wQaN5Ji4D5u
 LdQZItQLEoDR+9DHUxhT4mLVaZphBmny1x/yX2BBmT/35xZ5B/hPuej+9cmm9XgCV7LKNfLhQT1V
 RN0Yg7sGzYK0dEEBOqfoRYW29Zy0DoJrzELZFv/oAF9qdQncJ2/e4=
From: Weiguo Li <liwg06@foxmail.com>
To: andrew@aj.id.au
Subject: [PATCH v2] pinctrl: aspeed: fix null dereference in debug
Date: Wed,  2 Mar 2022 15:12:24 +0800
X-OQ-MSGID: <20220302071224.580142-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
References: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
v2:
* resend it after registering an account in aspeed patchwork
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

