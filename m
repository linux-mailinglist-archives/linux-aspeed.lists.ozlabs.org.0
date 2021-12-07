Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A56A473766
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Dec 2021 23:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCbbR11z2z3bWC
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Dec 2021 09:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=njGh3bev;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=njGh3bev; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7j715CQlz2x9K
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Dec 2021 01:17:31 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 137so10871073wma.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Dec 2021 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hms9maxth3tfl967mHRi3GsZJgZuyJ0zaMexlXG7ZCs=;
 b=njGh3bevvOMEWvAuNMridA2Wu/AoJVjOJod5IqWGiE1pPRrOIpSJVQYoclXJhWW0+A
 m4qJxtyL1gZZg0Lqezz/yUrpgidgle5Jds6ml/So2c1iYYvAV2pxnXxq5tG+iiYN4nEu
 M38qN0X2Ea3vuTykNq6X/vahONWOjDyxjbECPh4xRHw1mmehdpYseAulxcMNQzMOaF6A
 6QAw6JfM1WLZT9yIoqLmTs1mCsw7IzfCNJJOXdXlJjsX66DaT9XvDJIhxKtKgyLxxdNE
 VPNF22F6qR3tGslDeVVD0Y+LI0eg2r4AOsduGcGli0FsW327NfXqdpSQeMOPEc1ut0Kp
 6ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hms9maxth3tfl967mHRi3GsZJgZuyJ0zaMexlXG7ZCs=;
 b=TQc86ZJK+/ersmsli0c9J/i9L5ryvmEv35GVQ1AH/sx+oIOJLonUGQGIvaY3hsdyve
 bAwGgXXqAxIRIQGvrLIpJLpfsE/KkuKTdg4h08PYvlgnQ8YXI8kO6QaGHEAMyBIYQGlk
 KNVo6NU7zxX5PPOXPvBgdmjFTI87L28GBEe1q3yTAJBV8FPsnkXPRL0vbVeZmrNlv5I2
 +WQG7C/jKewU6hPyvy3z/PN1zoZf6W6GSPQylSiLdjy844dbgQZ3WxI/tTJPacaUbgc8
 Jc1UP/AbwMeHMKz5rDbuubPyj3/F8Ne2MJKBpvvjA9AI56GNn74qrG0IcA3P+l+zkq17
 jUqA==
X-Gm-Message-State: AOAM531ZJ+6iWfQ97jDR3BE4L1zVnE4FSfxmQrdnuYXvpOxuilCAsQaP
 yFkM6NocwYY3MKo0NLN7iJOYcyVELAheTg==
X-Google-Smtp-Source: ABdhPJySOuirg4tvqLwlK5vx6F/pExIIiFpejCfy/BlZcjljWkm1TTowbQLFKDezYky4m/P33Sq37g==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr7400567wmq.120.1638886647697; 
 Tue, 07 Dec 2021 06:17:27 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id m36sm2847401wms.25.2021.12.07.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:17:26 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: aspeed: Remove unused includes
Date: Tue,  7 Dec 2021 15:17:22 +0100
Message-Id: <20211207141722.440213-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Dec 2021 09:22:05 +1100
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
Cc: Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Thierry Reding <treding@nvidia.com>

No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
headers are used in the driver, so they can be removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..771e53d3d197 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -16,8 +16,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-- 
2.33.1

