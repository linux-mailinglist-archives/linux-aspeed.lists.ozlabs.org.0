Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEA647F9
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:16:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLnw5QPzzDqPW
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:16:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hEfa8IVJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V3UszYlB"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLn96p9tzDqV6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:15:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A98BF2213D;
 Wed, 10 Jul 2019 10:15:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Mo4UV5dPvBvsW
 DVJmnWOkPJbV5m2bJ8R6q784AbeQ54=; b=hEfa8IVJ+15tuBHc0n2ceaDlQ9zcO
 CfUNB9QjGJmWlfc/RpHLfgPwDxLi8Yf85w1Nlbvx650ALoE6QDHBmzrkYOzF66qR
 /KSnzIEeOZWK3Vsqxn6RdGJxr/EFzaTXxbDeiHzztvAb58Qyxtpe7xFjoMAsahD6
 bQsTPJD3XsKeeeJvL9wSH4jQliATIOiT+9GNXvtr7+Wo+bvaiJ61xhZW5cJRcip/
 6nTAdZnpSRuXM71a99w+mvIKfE1utOEfuybhe0LtJiJS8gGvR29KlEr5JLXhz3o9
 iX96fk5ieclv3PW1iI2lEq4WxMJRQCJZMAKmjBI2OJvph0bh19H9rdnsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Mo4UV5dPvBvsWDVJmnWOkPJbV5m2bJ8R6q784AbeQ54=; b=V3UszYlB
 ZsNKJKc8MbcYlz04Aa5EolyEbND3/BFFGdKV4aUFk80+QNpj4GUI1aoYz9rY3Pqg
 txFxw4+qzJJtMap7RNE+nTE2M4OvOdc36Ov+iV5VSQVqE1STuT7KwIht5W/xzibX
 Ve5a5gQ20lhq2Xm2tR/Ul67WUXG8HDro6Tqhzq5rEDGt56kGYirv0mspcs7pwX7f
 rRo6ltTa+QIxoKPpnhTQmu4N+r3D/LIub4ebXAphjjP6axn32GU9uTSAHePVzKDG
 8iEt8o8vM5FMFZ+AImoUqee2fqm/pAQzzFhqR7nQq1po9MglXGK4we4KxQH912Gj
 qSHySg+V1v1eRA==
X-ME-Sender: <xms:-_IlXdW5Oz0xFMwoPIBOInbYEV481NzzXz5eDWrU7fLmdCas2aK8jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedugedrvd
 drkeehrddvvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:-_IlXZusYRqbHjy6HT_F_XsYUlKgtJuq90TMag3Hk7t1wTPGXlIgbQ>
 <xmx:-_IlXVMM2K08bDyYCvGcY7mKdV23t9mL1vaqj1VzetOud36qF2nklQ>
 <xmx:-_IlXZps8AmqWEFWktmZndVzpExwgEcKXOcplxYaAdFy8OHvgPX6kQ>
 <xmx:-_IlXZUh7OlZSnpRhXBXXi0sRg1e1pDmzW1nZqkuQqWEQPJiN6dz2g>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D20680059;
 Wed, 10 Jul 2019 10:15:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/3] ARM: dts: aspeed: Enable both MMC slots on Swift
Date: Wed, 10 Jul 2019 23:45:03 +0930
Message-Id: <20190710141503.21026-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710141503.21026-1-andrew@aj.id.au>
References: <20190710141503.21026-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

Swift will provide at least its rootfs on eMMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f1356ca794d8..fcaeae2dd0a8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -640,3 +640,21 @@
 &vhub {
 	status = "okay";
 };
+
+&sdc {
+	status = "okay";
+};
+
+&sdhci0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+&sdhci1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+};
-- 
2.20.1

