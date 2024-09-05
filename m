Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740D96F476
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTT686bz3cLG
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725536942;
	cv=none; b=TAXG0nxBFT1loxxyFqEcrb2PId6+R5Ce5dSARUOOFsRH7YOUoHNDPK559UKAYzN7xnua410pGK3Q/csRKnDDjiHZ/D5UUV+Fg5LgCrz3F4EtqC4smz+xp86It1wwNy8eEcqt7EjjslztaKflCqbyVpmmbytF/swvO4lsdAgNiVMOmVKBEDBemFk5Kj47W5JEAU9M0A0Kvx6g7ipJWmrmKMJHl0iRBavJGyhYijbWWbBLFAuJmaNpx/HfiYS3Y57PETvYKKq2GJqx9fiQDulDURdd+T+6IRfCMiMGzfZqgDj4oFVGli8VPrnQVJYWwtMKcI/tnZYC88Ps0DMsD0q72w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725536942; c=relaxed/relaxed;
	bh=hDfl7UI4/IQKHyKQ6quNOw8kPk0KUnUdrxhBABpP8E8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSvQ1kv3UZd0X6qIoM2Is1aaq8IWBxRTnJxOIcCOCclfuzM5a/6PZw2EMR7iKO2twurDo96A+Rka5ZEGv7W5tUrJPnGbcXepDRxXvIE9+xNpckwbQlG3cS/f1JTVwoVjfcRG16QkpQ8h4tOz+3rvuVSzk4YHPpOobWOgT2dERVZlmDW5dUNmxcuhIJALKq23POihYbnArDDainhtQVXCGpmZAeBeZabBcx1qYVWt7r151qVIaiarG94mH7eJ6rLzBHsDt0833ergS6pFZFTsihYqvv+6j87UIN2SezqgIMJQGrDOG0976+XREvC+HRkZyGQobSN4+IeXpiOkEDJ8Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzyLj4KHrz2ysh
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2024 21:49:01 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 5 Sep
 2024 19:47:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 5 Sep 2024 19:47:54 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <andrew@lunn.ch>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>
Subject: [PATCH 2/2] net: mdio: aspeed: Add AST2700 support
Date: Thu, 5 Sep 2024 19:47:54 +0800
Message-ID: <20240905114754.519609-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905114754.519609-1-jacky_chou@aspeedtech.com>
References: <20240905114754.519609-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: jacky_chou@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add AST2700 compatible for Aspeed MDIO driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/mdio/mdio-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index c2170650415c..607e5c56434f 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -188,6 +188,7 @@ static void aspeed_mdio_remove(struct platform_device *pdev)
 
 static const struct of_device_id aspeed_mdio_of_match[] = {
 	{ .compatible = "aspeed,ast2600-mdio", },
+	{ .compatible = "aspeed,ast2700-mdio", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_mdio_of_match);
-- 
2.25.1

