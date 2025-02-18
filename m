Return-Path: <linux-aspeed+bounces-763-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0071A39139
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Feb 2025 04:17:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxl816p2cz2ykZ;
	Tue, 18 Feb 2025 14:17:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739848657;
	cv=none; b=jxdV8zie8nTyXOQhzIsMpuKZwbgQmgmcaQj0DfRoCmuoRP1cHoJCQxIhOzWKhKKpsbQu/05UdVnG3v4z9NNhrrOs7njfQbNewiRUWojFvGx81tDhR3zw24GucGaTSor5fEfRdZ5tNBGIRWemDtdXzFSdd1JpfPhksfz+QVjOVY4VN+fAB/zfODR6hC3NzJ7kK5OCbMSWfctCKWxMwczxVYH/kw2WcReeqDGr7tE5iTSnI5suf8rFgdBqNVMIyQ4QZxPXdoaUQOPm0KWkUFv9TLiCdi7GJ40nfazXNFt80lLE8dQDHJqQ28MlevWTCH8WV12NzXjJ/jTm5UHHbdlMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739848657; c=relaxed/relaxed;
	bh=f3CbPlmh3sHKCr4h2q4NBJY7IFm6y5tBiOCFjrBwvTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2JUrwY1g86yYlknq4U4ZzKcd3ITh5Yj2ssjFphPgJSTxP2AbGMvGz9iLQlPYmxfqEXb6i1B4p2m+/dEHSZItP7U6SCi4e7aycXmRWjWaH7qXmL0NVl2YWfFN30myny2LL3zDlGWJDIfZnUr7v96tkJQZu0MkjfpsjRpJgMeGPLPc+bBubSVi+zhHwrFQH5plSLbXei5Vpak2UpVKOa3v+tWoZyuJvE8oW7JAc8tqLOkRJynRYnCa7uKpFTf6GVvWnGP8cEqixFdfXWtUst/SKqRUU/kkRF3uyRBOTRqQs83Tt06VDaF6Bwr+UGv4aBtNUkGzT9dtVMjU2sgpbRrXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x140p8+x; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x140p8+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxl801gD3z2yh2
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Feb 2025 14:17:34 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739848650; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=f3CbPlmh3sHKCr4h2q4NBJY7IFm6y5tBiOCFjrBwvTs=;
	b=x140p8+xQEm1iEqglQcy+a4RC4MO80Vfwtnf6Ppc4SLBjtgJPhX2Up0ctxaAP0yl+1LPpw2rRZx6ZIpL6gXqAQvo63jbH+H84Jv6Cq/5htIMoNaOLCMLPVkr0Pl1uJIuLvAjlu5HE8WfIV/g8Yp6bXl6wKpCt74YdyiMTs/ViNI=
Received: from 03382176d5c3.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPk8NtB_1739848638 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 11:17:28 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down logic
Date: Tue, 18 Feb 2025 11:16:58 +0800
Message-ID: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Aspeed watchdog uses counting down logic, so the value set to register
should be the value of subtracting pretimeout from total timeout.

Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Eddie James <eajames@linux.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..520d8aba12a5 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	u32 actual = pretimeout * WDT_RATE_1MHZ;
 	u32 s = wdt->cfg->irq_shift;
 	u32 m = wdt->cfg->irq_mask;
+	u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
+
+	if (actual >= reload)
+		return -EINVAL;
+
+	/* watchdog timer is counting down */
+	actual = reload - actual;
 
 	wdd->pretimeout = pretimeout;
 	wdt->ctrl &= ~m;
-- 
2.43.0


