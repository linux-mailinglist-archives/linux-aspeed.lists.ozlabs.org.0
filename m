Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7526698DEB
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 08:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHRjZ4srHz3chp
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 18:42:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eEytakf3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eEytakf3;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHRjR2TxRz3bTq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 18:42:02 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 294F9202BB; Thu, 16 Feb 2023 15:42:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533322;
	bh=WryB2GO2zbrBH8W+AuZGRUy0IPCfawW4rexCATxsMBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eEytakf3bWKJmEVJAsaqrNdZ4Yrkak1X/toUToOL/S3SqugAS2GUyL4iSuDNq/x94
	 ZRWUanKtpochL1PbTtn78MvlZxxMX59bsowwH5jjoMG+dEu00Iq0cFpzK+bMmxhKt6
	 P9mO2HzWrRRVyMdpNS/hhKrH5AzFapkgKUEew6wDO2MW+svjKBhPSH+cChFZPL9wNg
	 13t6mgcYwSe8qpqjL7CIgEqrZxCXWGl98/J3NuusTKbzmX9JRCt89+8mQAvsLInAEu
	 dsEdEOmVHwVlAeTkoOxtU2S+NDdLOo6kg2VmiUxXf/b4W3JLq9cVHKLm2RVpi8QtFQ
	 k86uz5pgQJRwA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH 4/4] i3c: dw: Add compatible string for ASPEED AST2600 BMC platform
Date: Thu, 16 Feb 2023 15:41:55 +0800
Message-Id: <90e8fd66b42bc27e6b8c01085c40721232217a5d.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Now that we have platform-specific code for the ast2600, enable it
through a new compatible string.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9be3348cba0e..5ac226e0c558 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1269,6 +1269,7 @@ static const struct dw_i3c_platform_ops ast2600_platform_ops = {
 
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
+	{ .compatible = "aspeed,ast2600-i3c", .data = &ast2600_platform_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
-- 
2.39.1

