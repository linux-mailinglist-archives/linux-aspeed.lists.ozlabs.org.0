Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB8989856
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 00:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH00X1dqvz2yyM
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 08:55:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.26.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727579755;
	cv=none; b=Cd2guDUFfcXo2vaDDu3AVxkVleLawhue+wkvz32xW8wYLKjzh27aG9s+YCULT/5JWbOFMWQHhL/OuhSqqkufHe6JmoCxj62+8bBR/SsKF+PndpGU1y4g+hj42ljrrKyYD+6NUmzLwsCibJ1hIA+XSQeJ5ZwH1dKPtQqLIgltegIZqsGDtE4+Ppx0VK+oSxCVBfBqWh2tm6GYJ5l5UZ2KINtRLtjb3dtcnK/98vYwurxn98q3En9N+jY5gWoG3tUHu5fZfg3ODmho3c2OqVUZNmiAOmCiMaMvDcJwCE8Bx9Qcm0sFj4iaGLIF70GK0++cOR6IUHPKz4SDk9XPPyDoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727579755; c=relaxed/relaxed;
	bh=aYUGCUHQ0lqm/KtObXxJzflrJ1/TXjsWs7nO0A6h7j0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P37wEH44nZiy5GDsKZ7UZc+bZc4I/7eLILJPoj1punyzT+Vj35J+97F2Pmdj7CYnzoINMmW6NpA69yRRnypUM4Uqfa/nDsmzaMQ7VOQoIJdquTEoMn3cq3mm7O6xb38TyZtTMxtq6oHiM2aDNugjuXG31AYulvKY0EsyiTmA/b63Wjo/cXp3yVmMaK4u0erg3W14SPz07T5g7Q0B6C3GYrQ64RufesGml7dErkozajzhwx78PSOIMsIqEvuuC2Bs2eUuiUxke342fNjQ4oorewBd0iGR0PTgvCQdQLDfmqSNUzO5SaqsBwDiE2mOd9TnZf9vROk8uS7j0I92FyxCKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org) smtp.mailfrom=inspur.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sun, 29 Sep 2024 13:15:54 AEST
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGTqZ1K8Lz2xpk
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Sep 2024 13:15:53 +1000 (AEST)
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id ZCR00029;
        Sun, 29 Sep 2024 11:14:29 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 Jtjnmail201615.home.langchao.com (10.100.2.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 11:14:28 +0800
Received: from localhost.localdomain (10.94.12.73) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 11:14:28 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <benh@kernel.crashing.org>, <gregkh@linuxfoundation.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>
Subject: [PATCH] usb: gadget: Add check devm_kasprintf() returned value
Date: Sun, 29 Sep 2024 11:14:23 +0800
Message-ID: <20240929031423.40630-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.73]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2024929111429f6c7bdcc3ed866349b777aedc9eb0361
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Charles Han <hanchunchao@inspur.com>, felipe.balbi@linux.intel.com, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

devm_kasprintf() can return a NULL pointer on failure but this
returned value in ast_vhub_init_dev() is not checked.

Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 573109ca5b79..a09f72772e6e 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -548,6 +548,9 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	d->vhub = vhub;
 	d->index = idx;
 	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
+	if (!d->name)
+		return -ENOMEM;
+
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.31.1

