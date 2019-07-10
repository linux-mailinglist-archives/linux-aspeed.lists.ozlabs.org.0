Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B666647F2
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:15:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLnb0yLhzDqSs
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:15:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ohoIueS1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Z6qjLuOk"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLn53FBwzDqJj
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:15:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 42BBD22171;
 Wed, 10 Jul 2019 10:15:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/nuJnxVDzRhoS
 VxlYKo/BeplUiN6nooOgbT9w/0IY+k=; b=ohoIueS1t1j0S89EU/3VnCYNiGAQQ
 ThW7HV0YRygHvhObUuMl20MSosAa9SCrs/d2TV514GpoOqpuLzNobHBB4kXV1Kp6
 8QwxT2XoCiBuTIqWR5yGCqzsN+sYYbVe+fQfNFAt9uboZAcSIYJMDqlOeugot1Fb
 3qwP0RJQEbJa5GEjcdiCXyDU+6nwT5ST3qB3fG8x7V1YET7iiOHhUxq6jqqXhlrI
 WXlx5r0j8IQ7rFsizdUm7nQ0z9FwqJ4L+RfGOtDMGPR4CIA0LEgbuC8f3ivxlhm0
 3wdokRDiEfAQ3ZNU6uf3U+kgldOh6SrLdWV0rDDMtjLMfy1kbNUDX1JRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/nuJnxVDzRhoSVxlYKo/BeplUiN6nooOgbT9w/0IY+k=; b=Z6qjLuOk
 TCzwieLNJe0YVNj4WIPp8WQa0x9Njozlj74mLU/0JW7ry6f5cKc3nvaHyx1h+TRy
 U21p5qBXLAUfF7HoPW/g5cYgfYYIUlecluXW+Y8fPWTJWnEWdYU/eFUOC3OLf0eP
 jdfGFkwozxTOLCKsyehr1em6n0Dtvh3z5l32ZfwZn2ZIHF5ZHQsNsT3Gom5J8GOL
 G72lPq6yktsmrSnsOnRD7Nbfasm2Txu6RBG/Nsg64U6WhVtRzwQmPG0OEDlCGpsC
 tzkH8d0K7YO1887VP19I2S6Z949VC3l2BXMmC7UuHbz+SoiWclinipZhiNz2e47D
 9AToIPTI85DS+Q==
X-ME-Sender: <xms:9_IlXWBLKssUsguJc2GqUPOe86fv4Id8vMSzZ-DCn3sfXnLJWvCTaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:9_IlXWDuxIMqVC6KPSXXQxYHn2GpmvLI6CeP_NwJG50hJXhNMax64A>
 <xmx:9_IlXYqQgjQUJ_mmNIQhgBIMUX5gSRrrULhcIjLHMsuZmKeFm-8tzg>
 <xmx:9_IlXZGURF6rMC8o2CRRKhnEVoQTsuhWflcx0TrmttcMCRrLRj0Bhg>
 <xmx:9_IlXRnmIfQ1Nzdx4NvxHjjewlW1k8xASkuU0viHSyu1hbM5bc2Olw>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id D950A8005B;
 Wed, 10 Jul 2019 10:15:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/3] ARM: dts: aspeed: Enable both MMC slots on AST2500 EVB
Date: Wed, 10 Jul 2019 23:45:02 +0930
Message-Id: <20190710141503.21026-3-andrew@aj.id.au>
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

Enabled for testing purposes.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 556ed469830c..429904e401ee 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -94,6 +94,24 @@
 	};
 };
 
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
+
 /*
  * Enable port A as device (via the virtual hub) and port B as
  * host by default on the eval board. This can be easily changed
-- 
2.20.1

