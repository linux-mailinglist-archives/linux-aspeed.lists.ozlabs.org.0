Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88856C7579
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Mar 2023 03:17:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjQpY2qNzz3fFq
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Mar 2023 13:17:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hust.edu.cn (client-ip=202.114.0.240; helo=hust.edu.cn; envelope-from=dddddd@hust.edu.cn; receiver=<UNKNOWN>)
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjQpT46QNz3f52
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Mar 2023 13:17:36 +1100 (AEDT)
Received: from uu22.. ([10.12.190.56])
	(user=dddddd@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 32O2GMUl023888-32O2GMUm023888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Mar 2023 10:16:22 +0800
From: huyinhao <dddddd@hust.edu.cn>
To: joel@jms.id.au, andrew@aj.id.au
Subject: [PATCH v2 RESEND] drivers: soc: fix dead code in aspeed_lpc_snoop_config_irq
Date: Fri, 24 Mar 2023 10:15:59 +0800
Message-Id: <20230324021559.249347-1-dddddd@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dddddd@hust.edu.cn
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
Cc: hust-os-kernel-patches@googlegroups.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, huyinhao <dddddd@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From the comment of platform_get_irq, it only returns non-zero IRQ
number and negative error number, other than zero.

Fix this if condition when platform_get_irq returns a negative
error number.

Signed-off-by: huyinhao <dddddd@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8dfbeb..c4a03b3a5cf8 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	int rc;
 
 	lpc_snoop->irq = platform_get_irq(pdev, 0);
-	if (!lpc_snoop->irq)
-		return -ENODEV;
+	if (lpc_snoop->irq < 0)
+		return lpc_snoop->irq;
 
 	rc = devm_request_irq(dev, lpc_snoop->irq,
 			      aspeed_lpc_snoop_irq, IRQF_SHARED,
-- 
2.34.1

