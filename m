Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC04901F1
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jan 2022 07:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JchkZ26qpz30Dy
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jan 2022 17:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tfs4fl6q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tfs4fl6q; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZsGJ1tygz2yPM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jan 2022 17:44:06 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so21092907pjf.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jan 2022 22:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=1Nv9cBoTms/HAwsSMh+lrTCJcZ3jwJC/miP/N5++3LM=;
 b=Tfs4fl6qHMuuHwQcDMVPYoDo86+b2M9lggqTgT/Et6qTm+mmefqpHC7XMjUueEuNDH
 ZLBIFPSx2EzW8aK666d+lPVK0uR19prsak1BPbGBey9A5JC0XfvWz2x8OC31GQGBwr4z
 CzUXU7C0fjAB7f6pO7P+N0N5eFVlUGAlAW7EzgikuU5+Lfz1oxYdUcJnXSSl8txpUD0W
 6OuodjwilZlkM6F2QZXyMbWHQ5RukOV7UZhjKfly4mxv12egYIebWd4A6PXsQSgfNtQa
 85YmtLFr6EfoUAjw44BzIqJ29pwgt4TNN2dcHG3xxXEcPVH5JPQDprnXMs4mrGUwq3Ld
 p3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=1Nv9cBoTms/HAwsSMh+lrTCJcZ3jwJC/miP/N5++3LM=;
 b=3IpLvs4k4CP/ZO6bLoAmKg6h8RTCYZTIIcjoLv/v1/Djiz+gq62pCPaGctZDRfkxSn
 JE4AdXn6+qjE/gE8cQSBf+WZPAOPiBB+TgdVQz+bOBdT6Tt9onqipPKKLmFDdG7ZJeXL
 nZrwLky+OVSK5vtyYt4NigZV6rMfbhNpx+Rr2NNwtRLyT0+9A1wgPWtIhtfwo/GYtBGX
 /9Oq8ty+nR1G6B/m+HbdwC5HlMO2uCJjsTvS0xn60yX6/N7f6meeLnrzBLE/yANr6Df/
 EEpo5R35miFD0fkwmllWhEGS/GSsvUr3lwRjFq2/lhfrHusyLYBReKn7FFlyb1vhRDJC
 n/4w==
X-Gm-Message-State: AOAM531c1IfWwsrpvwP0WOSmN69GvU+2etAeKAxt0xGXvO+KidwhcL8E
 Iwvu9uTfQSFRfJ2dGIt0wdk=
X-Google-Smtp-Source: ABdhPJyj9OUFs3Ifg7Q/foM4Lw4if60L1dh8TxGLGhtD4IOaR0ZdfzpiYGEpmw38sjPo4afyX6uhxA==
X-Received: by 2002:a17:903:2311:b0:14a:8068:a6d with SMTP id
 d17-20020a170903231100b0014a80680a6dmr5337470plh.70.1642142643211; 
 Thu, 13 Jan 2022 22:44:03 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id t3sm4821080pfj.137.2022.01.13.22.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 22:44:02 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Patrick Venture <venture@google.com>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
Date: Fri, 14 Jan 2022 06:43:55 +0000
Message-Id: <20220114064357.18562-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Jan 2022 17:26:27 +1100
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

platform_get_irq() returns negative error number instead 0 on failure.
And the doc of platform_get_irq() provides a usage example:

    int irq = platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

Fix the check of return value to catch errors correctly.

Fixes: 524feb799408 ("soc: add aspeed folder and misc drivers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
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
2.17.1

