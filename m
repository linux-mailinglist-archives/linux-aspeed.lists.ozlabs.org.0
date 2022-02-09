Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364104AE5B9
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 01:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtg956x3Qz30Mj
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 11:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fj8+V+ZI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fj8+V+ZI; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtg8y12Jcz2y7J
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 11:04:15 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id u12so707649plq.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Feb 2022 16:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UR8Hoj++hLizXbkIm5wOyud8pL+F8/SV8OcvlCkhNk=;
 b=fj8+V+ZIJlwArR9RUm+UYtaBvHOz99DHFrvMrvUAC074WO5vMpVjx+uXICrsbgaibr
 ZSH0ArXZQPUWkoD9oTX7h/tcN+jCRjarsPXhnhGov/jaczeGDJ6i2mD2cbmPYB8Ygqgv
 VNTO/rFcfOJsEe8gknccj2Sf+uvOgCt7ZtHUkn6SN0HS3lE+kXqI4GKZZuvaI/XQxCrS
 z5Yy/Yq5yzlPEXi/6XQI4/BZBaywJyZETs3/OKMYPJMQGudSe/5XLzNeerAGlKE5gPFR
 x7c42epks5hkFkepxRz8Lg1797rws51Js+jOYpbQfqYaz6JLxfDszLZWbh3LPgZTveAC
 5z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1UR8Hoj++hLizXbkIm5wOyud8pL+F8/SV8OcvlCkhNk=;
 b=fgVKDYtJvFByF9riHjuhzqMBM1t0gYSf+vl6I1VV3ciZSfaY05fPJU0E2S/GFi4F0n
 uR0VACgidE4+GzUdF2I7Jzn7esGE/f/BKDkBWkE7aryDosb2yyG8KjUqVtMngO1sU4W0
 mYVXSpcXPE6fgAnMCECp+D68Z1Bwlg2G51Ex2EE4RGTtucIVkR6UOXgpMIXxAMJmBwvi
 DYpij53EJfEEm/WcKHoeqrrb2GYzgT9EbHW1oLCY8MvB0eDSWu/jpi/eok9KNf5yzTa7
 fXzAUqQKVYEV7YL5tSYNL9Ujb2WSfvwG1ce7+me0Azicjl+DOQvwZ2UNI553mx6E3aLB
 bREA==
X-Gm-Message-State: AOAM533ddU2rSIoe1JVhE/J9k2Qo763NcJuGMWNhS7gvFRaXqhOqtsmu
 o7tC2/aOimwyTG01OK8m0TQ=
X-Google-Smtp-Source: ABdhPJzJBl/kUmdOmVBJaysJdFoZVb+5gQmDyBFDMp/vWuYKv3bc8M2D/TZXe7106RRHwDjADhcf5Q==
X-Received: by 2002:a17:902:f64a:: with SMTP id
 m10mr6813233plg.46.1644365053509; 
 Tue, 08 Feb 2022 16:04:13 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d21sm17984536pfv.141.2022.02.08.16.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 16:04:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH net] net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
Date: Wed,  9 Feb 2022 10:33:59 +1030
Message-Id: <20220209000359.372978-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix loading of the driver when built as a module.

Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/mdio/mdio-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index 966c3b4ad59d..e2273588c75b 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -148,6 +148,7 @@ static const struct of_device_id aspeed_mdio_of_match[] = {
 	{ .compatible = "aspeed,ast2600-mdio", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, aspeed_mdio_of_match);
 
 static struct platform_driver aspeed_mdio_driver = {
 	.driver = {
-- 
2.34.1

