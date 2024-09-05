Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08996F475
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTT4ZFVz3cGc
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725536938;
	cv=none; b=UDG1TEkS2Sr6tUKmK1dQNhPiutLxQX6BiGV3fJMcwXkyYLrpUlNrGrM5GohItonXgtpJTjC8DJ2ArLQIE21IRIsuWdVjOVJtH76e3P2KG6LdAdTBjLll070Rvu3VSa8W2VLavzt+jJDsScWfOeHA7s2ZpHP+KWw3eZIjQSPjMnJbdiLZz6ZH+eFdT4/L1ncu1CTSlmiCuBzumfr9+94VilUInrYQIae4KvCcrI9ozq8ute0wTvk1MdumhGDGd/sjVpJMi5flkFg+n8YQEeBM0nU9X9q+pYXP1ikBSRmK+iL5k8C0RergmRBAwzyrGNgF6bj/2HCGFSNyDOR8D4xvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725536938; c=relaxed/relaxed;
	bh=l2IprJX3TWwyWaHuDSpOfJW57PDunnmDGYNsbn8zPBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGbCe/KXSEhhihWkQkakhsfaTaHL4jENuFIagnRoE552ayez4dL6rjv0gT8dXX7q306hCLrOcuwTjlwO6SAOpNpqlfeEZRCdY0Z2JbMIoKqhu1jwrctZ6/q6pEZi0a7yMe2ROFTMzhpBz4sleI3jaPmhyJqpjRWihWT4m/aKturY67dsa+FAt+RJiG1MDMdq7NmDRx+Fm8qUEW5uFqZornsk0/8ZtWFNNM5f9wR2Uf+q2YdfaOwRN4BEkRSF8l3dc+DuhcHJVn4KGltQpcuk/HCZsE2+1RdUaNVL9zicEi+xLOGn9olSXD7et5s8SAiVzV9iwt1XAfTnsiC0H5Bubw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzyLJ6GJBz2ytV
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2024 21:48:35 +1000 (AEST)
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
Subject: [PATCH 1/2] dt-bindings: net: aspeed: Add binding for ASPEED AST2700 MDIO
Date: Thu, 5 Sep 2024 19:47:53 +0800
Message-ID: <20240905114754.519609-2-jacky_chou@aspeedtech.com>
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

Add a new compatible for ASPEED AST2700 MDIO.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
index d6ef468495c5..6dadca099875 100644
--- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: aspeed,ast2600-mdio
+    enum:
+      - aspeed,ast2600-mdio
+      - aspeed,ast2700-mdio
 
   reg:
     maxItems: 1
-- 
2.25.1

