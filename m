Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 766066A14C3
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 03:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNCtk2xYTz3cjF
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 13:06:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNCtb70lYz3cXX
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Feb 2023 13:06:28 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31O1qK9V007233;
	Fri, 24 Feb 2023 09:52:20 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 24 Feb
 2023 10:05:24 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Neal Liu
	<neal_liu@aspeedtech.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S
 . Miller" <davem@davemloft.net>
Subject: [PATCH v2] crypto: aspeed: add error handling if dmam_alloc_coherent() failed
Date: Fri, 24 Feb 2023 10:05:21 +0800
Message-ID: <20230224020521.3158285-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31O1qK9V007233
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
Cc: linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since the acry_dev->buf_addr may be NULL, add error handling to
prevent any additional access to avoid potential issues.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
Change since v1: remove memzero_explicit() as dmam_alloc_coherent()
returns memory that's already zeroed.

 drivers/crypto/aspeed/aspeed-acry.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 1f77ebd73489..eb30649ea7b3 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -782,7 +782,10 @@ static int aspeed_acry_probe(struct platform_device *pdev)
 	acry_dev->buf_addr = dmam_alloc_coherent(dev, ASPEED_ACRY_BUFF_SIZE,
 						 &acry_dev->buf_dma_addr,
 						 GFP_KERNEL);
-	memzero_explicit(acry_dev->buf_addr, ASPEED_ACRY_BUFF_SIZE);
+	if (!acry_dev->buf_addr) {
+		rc = -ENOMEM;
+		goto err_engine_rsa_start;
+	}
 
 	aspeed_acry_register(acry_dev);
 
-- 
2.25.1

