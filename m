Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725983EF722
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Aug 2021 03:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq8pt1zMTz3bPV
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Aug 2021 11:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bRoUi9vN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bRoUi9vN; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq8pn0JjYz2yWR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 11:05:50 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id r2so519189pgl.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Aug 2021 18:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=igQyjQEDsE8KCNtPH25+5iy9F0754XhA9uaInC4OogY=;
 b=bRoUi9vNbc9sVqT33EDW09xJUaQJshq4N/A6oocvtk/a+DPWyn7yfYJjxj3f7NTW3W
 5SXkaSxnlG7FiE6bWz4HJjnGTsoMR4FAnuDWA9rDNCvCrfgSnDq6uOvKb4OfeIGJMpP0
 blR73nE4Xeu1l4wSkWbsrL6gXdkdFAq0cK4sTXsjdyY3ltTzx+B0pgEjxC7kOKdXvg8q
 6grwcWUybNR6vAh3fzisXtKf0z+SPhAeBJ694n2YJmql++HEN4nzsgJ0IgJVRUMbSDqy
 LzfpN80fQGQoGndG7j7KQyz2VboF0tMU3B7vSFJKZJE9nVw6eJ39+SvyUA5ZaHtjtViu
 pGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=igQyjQEDsE8KCNtPH25+5iy9F0754XhA9uaInC4OogY=;
 b=iQTgw1gZmylILEt3ybp2MzSOPrPX8LiBpq5d7bhnsAi9ncUPY73LszLVVG5/2Py7FG
 CMSTi6cRsDSHCqU3BJYBRxNWlHMJPeEhrSCKYYRxJgAI+hsKPhSvvAByLgNW0NhKKvKv
 z4XKr1sXz6BT3a2Ikir7A6Uus+qvmC1cSJBrUTjPZn62s741whLv03fOei2ZEVoDueHa
 3fpul8ReYWKscMnvjIVbGTOU2MjLtDXBmOCJLEMYlhon7ScEpYGzuoJkB1pJuicspzS4
 bBZERN3ySoipVJWbwtc/HHhMl/rleEZfJmfGexhjNvxslgWEP+5k+DuxNCucvj4l1X/2
 +XAA==
X-Gm-Message-State: AOAM530yxUKWbBGK0MLp/KX9zU3k6gAwr4ntpLTXTTScIVuf7lJ8M+oJ
 dDX2Dqx5Z2Tbn53Pda8eTFY=
X-Google-Smtp-Source: ABdhPJz8ji8qJtCm6gxsY72qLhN3WZNe19tXCK8Xwh3UpZkr9aoHwvUn4oE3BfTMt2XeZQ8z3fWrsw==
X-Received: by 2002:a05:6a00:1a49:b029:3e0:3b2c:c9c7 with SMTP id
 h9-20020a056a001a49b02903e03b2cc9c7mr6530188pfv.8.1629248746397; 
 Tue, 17 Aug 2021 18:05:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 17sm3307670pjd.3.2021.08.17.18.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:05:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] soc: aspeed: socinfo: Add AST2625 variant
Date: Wed, 18 Aug 2021 10:35:34 +0930
Message-Id: <20210818010534.2508122-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add AST26XX series AST2625-A3 SOC ID, taken from the vendor u-boot SDK:

 arch/arm/mach-aspeed/ast2600/scu_info.c
 +       SOC_ID("AST2625-A3", 0x0503040305030403),

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Dylan, can you please review this for me?

 drivers/soc/aspeed/aspeed-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index e3215f826d17..1ca140356a08 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -26,6 +26,7 @@ static struct {
 	{ "AST2600", 0x05000303 },
 	{ "AST2620", 0x05010203 },
 	{ "AST2605", 0x05030103 },
+	{ "AST2625", 0x05030403 },
 };
 
 static const char *siliconid_to_name(u32 siliconid)
-- 
2.32.0

