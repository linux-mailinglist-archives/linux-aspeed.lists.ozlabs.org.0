Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35B4CAE2
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 11:32:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TxRZ4lKyzDrG3
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 19:32:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jdg/UCsK"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tx745snjzDr9T
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 19:17:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f25so1246044pgv.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/N0qHE94BgVcSxh7Y7ddjnVY+VEqSIyYgrIMxgshDU=;
 b=Jdg/UCsKPmIjRfaapYt1gOM5GjjcSZvHtz8ONkgpvHrAWlb9vbnRJMNl4MW4FbYtEw
 8+YR65T2T2ap5Lwq5+sMJuahof/pFY9ZKkJuf2gUBIelzu163GN+7HW0H+Ku4aKkWBPN
 ITlXlxJGNrnau/yhcjNck0/pYz21gwLdhwooI29uqWwrbEgFPJe2wKt024dcE+KG+Vp+
 zf//1oOezxAGYjrucQmfBYcsUrUDteM5Mwu5XAcx8yY/eRJfguZs2eY1rj5MQEHgax5R
 RoxM3lbwpH2LrteXty6Tn/Mx5Gh42sZZi/AojBszBTgqvPti6KKt4QFtG1yVDu7GmCB1
 0krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H/N0qHE94BgVcSxh7Y7ddjnVY+VEqSIyYgrIMxgshDU=;
 b=rIFQYtRK/O37hJqvXyz8WU7Lv06ITfYYgwB6Ye4mqeteJUPAu2wt98zVYaXqgCwfHf
 ItuQl8sN3pCh8qDSwGAkJA2CsJgru9KvptKidhVb07WCxxNB2mWprnX1js53RJumflBN
 ftNVUL4+GgZsgoLr1aHhLoHYCb0L4Ycm8MvJLqX8lm30UyzR05ybcUp+w+fLEI1nHR2P
 ZGCQBfNXrFivjg6YD+NTQZu0cByijMWX7EWofJWNYp8tguf45yulVs/Pm2NR1hA8AybN
 GlahTAmfg8fb8pNJkE3WCLnV+lzF3qd7Y7RLNQn87PZdrH8nwzXr7ejCM1PAde6M1Rhr
 QYzw==
X-Gm-Message-State: APjAAAXRRJsIauHRQnmN48QCNWdiVEyNYTJkp0Oy9K8OF8MuCiNrodHe
 dpty7+CJgXHl9zjhhkWpLJU=
X-Google-Smtp-Source: APXvYqyjRU2XOSFHLaSw2NHSfqeinOcL6lcfQZPbUgKSsSNdlUUmXuhILPthF8TjGwD0ko3/VxzC9w==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr2075612pjz.85.1561022266727; 
 Thu, 20 Jun 2019 02:17:46 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id j64sm32324138pfb.126.2019.06.20.02.17.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:17:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH] soc: aspeed: lpc-ctrl: Fix probe error handling
Date: Thu, 20 Jun 2019 18:47:38 +0930
Message-Id: <20190620091738.14683-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

gcc warns that a mising "flash" phandle node leads to undefined
behavior later:

drivers/soc/aspeed/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
drivers/soc/aspeed/aspeed-lpc-ctrl.c:201:18: error: '*((void *)&resm+8)' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Only set the flash base and size if we find a phandle in the device
tree.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index aca13779764a..eee26c2d8b52 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -223,10 +223,11 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 			dev_err(dev, "Couldn't address to resource for flash\n");
 			return rc;
 		}
+
+		lpc_ctrl->pnor_size = resource_size(&resm);
+		lpc_ctrl->pnor_base = resm.start;
 	}
 
-	lpc_ctrl->pnor_size = resource_size(&resm);
-	lpc_ctrl->pnor_base = resm.start;
 
 	dev_set_drvdata(&pdev->dev, lpc_ctrl);
 
-- 
2.20.1

