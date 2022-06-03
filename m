Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C953C6E5
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 10:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDwrt52lMz3bnG
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 18:23:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TQjaqSnD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TQjaqSnD;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDwrm02KNz3bl4
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Jun 2022 18:23:51 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id gd1so6889575pjb.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jun 2022 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJ5nOCm8LzcOFMf8dnh/CUtYdPr3TKZePHvPE4Ct0MA=;
        b=TQjaqSnDFwGyupFW9eoFjOll0k72uxMIxfGVm2AnhrSZWe7ATloGVFkY/cUNwu9zbB
         w+C3i3HZQj0Ef5OMvLZujyOCLFcT0WtZwF9GuDLv/4/b87zEiPUgEC4MjNGBRQcjqXBM
         qzTZf31kKRrt34/KjGtbwFh9iwp5i/fRcVMiZGqUMfTamVNZh0yslWC8OFrQYDtWeXv8
         +Zq2w5wMmnXNq4/K5qG05hBPfKzIxjlP4YMIj2P2weEsabq7s2hzW8KbQ9pySx94I+kQ
         MB7Jtlm0Os8as7/uuRCsrTgI8/13atDyU2wJJmTMx0FU/EL7RZ1vbtcLjUcIdegBY44K
         /N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJ5nOCm8LzcOFMf8dnh/CUtYdPr3TKZePHvPE4Ct0MA=;
        b=nav6luFzglKF/YMIY5G7Wf6CD9pqtllD4lz56KD2Rs4SFQdjseJcGrekUmOA6sIJHW
         7Yo7MdUxuwOns76YvcSCcF+MMvncBC/vKSX7eWRN6cqS6mn87vvtwSthEgy97acMuwHV
         w1IHrpgO1mIx8Q8QIU+M/BVQ2pWMOI6iK1HQaazkuncfufj43DJaHM0Ac/2J6XYSRh2D
         5PZjqzs9ubttINSUN1qosdQdGlzKID4kLftdiQ0C5KS1b1utjxm1Ld+pxWowWN0Cij1R
         9Akah1AdmAhRmZ27WtJdGCUtvmzVOnqnzUz1jOrGtcL+HKSqRckWVO/lGpGqWLLAwEhl
         26gg==
X-Gm-Message-State: AOAM533OWyqq+UvPUypvSTRYa6t7zfQUNZPaTHjMgApeSIaghzgtggeF
	HGpYnOJjvA6wq3dr3LRFbkY=
X-Google-Smtp-Source: ABdhPJwG680KUxCoYDSbUUqPJzsbyeO7F8Mz29YiJl6SmAvepgPoKkwAgxs7y83lsE1ERiQwCAv7jQ==
X-Received: by 2002:a17:902:8d87:b0:162:da7:e3d6 with SMTP id v7-20020a1709028d8700b001620da7e3d6mr9212233plo.44.1654244626465;
        Fri, 03 Jun 2022 01:23:46 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id ju10-20020a17090b20ca00b001df264610c4sm4818881pjb.0.2022.06.03.01.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:23:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Patrick Venture <venture@google.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
Date: Fri,  3 Jun 2022 12:23:34 +0400
Message-Id: <20220603082336.3867-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

platform_get_irq() returns negative error number instead 0 on failure.
And the doc of platform_get_irq() provides a usage example:

    int irq = platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

Fix the check of return value to catch errors correctly.

Fixes: 524feb799408 ("soc: add aspeed folder and misc drivers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
Link: https://lore.kernel.org/r/20220114064357.18562-1-linmq006@gmail.com
In previous thread:
Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Patrick Venture <venture@google.com>
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
2.25.1

