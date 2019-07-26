Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7EB75E8F
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:42:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vyf56lZWzDqPn
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:42:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N2ogfR9E"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HHIyDzef"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vycR6VbFzDqPv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:41:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 277D22224B;
 Fri, 26 Jul 2019 01:41:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gpQ1TBb0gwUJc
 OfeiYZ/1OgEUFC0/0yn8lBHazBW8Sk=; b=N2ogfR9EL8GAAUlIsTuOCcKcOu2l9
 fQksDy9ZkEpZghafwmcTx2Kwxh/Ox78H+HXCBaG7Y7NM98DQng9kSDAQqnuj+0wW
 Gc5bPsoDV89UuiGoVGThgfZ2J7tiZFdCvJI+aVNgWnl11h9/H9uCCCfUZByd7FTi
 jmUKFg2NEMazRmdiy9A6RC/TvBa2SloDsdwhVmxhaPoE++C5s+d2D772/h1ni1vP
 Qi1KrcS3s19YAmbWWZM8A+iEN/IHN4MIpg7WGxm60h9OupwgxqBOO8+vtPMWXx7L
 +wLvoW6aXzxAhUH7kM+03PwYHSUKDGifwbP4kwiyQhEH+YBwDGPEKrC8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gpQ1TBb0gwUJcOfeiYZ/1OgEUFC0/0yn8lBHazBW8Sk=; b=HHIyDzef
 AIIXwLiMxyIeoukhw9CgcKpL3tBMyfC3eHtSzAz8S6m60whuXhlcEVs/XXPHJS//
 Aog9P+GWBzZU9dCeqGi9/nAKQxZDLepEjeeefDnhIBNaaacUjvMQHLneTyZ56tj4
 zGDFgafejSYLie9J0H1mTORx1S4QhyDzb4oE+/DkuH4ch52OAtCSeVz3LkGjkHNJ
 sCq3xy0AdrDoHQDjCGGOa0Dn9XQTEz9ZbNXAOTykyWfnPx62b0QQi5uz0qJa9pST
 FSqjcyN4lb5pmcOrxPJppl2gGlkzKrBLzwHGAZxyLghCbyJRLurFUh+kbU5aywm0
 hLOh6EdQVUgqhA==
X-ME-Sender: <xms:cpI6XZEcbn3fSDDUFJ7lNu33qz7iK8ahZ5H2VMgwES4YKyvih6MsJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 ie
X-ME-Proxy: <xmx:c5I6XTl5N3jGXD3_pBBmB4V4DB1l1Qq3HKFT4ksPQf3NofmV2lr2eg>
 <xmx:c5I6Xc1ypw1ImXXi5AloArgD54VkaEzzJsc8zGMRBKtvFZWSO72nJQ>
 <xmx:c5I6XXQFtRDaiwYuAUuAE1rk-ii4_r5sIecq8TJdvy4ObiouTEGIgA>
 <xmx:c5I6Xdr3XglFJ_lg_o9iGf2V-HmM1M7MQi-zsP6lnilYk6b26gB9vw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3F6D380074;
 Fri, 26 Jul 2019 01:41:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 17/17] ARM: dts: aspeed-g5: Sort LPC child nodes by unit
 address
Date: Fri, 26 Jul 2019 15:09:59 +0930
Message-Id: <20190726053959.2003-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Lets try to maintain some sort of sanity.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 50ba58dc5093..99d2995a43db 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -423,17 +423,18 @@
 						status = "disabled";
 					};
 
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2500-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
-
 					lpc_reset: reset-controller@18 {
 						compatible = "aspeed,ast2500-lpc-reset";
 						reg = <0x18 0x4>;
 						#reset-cells = <1>;
 					};
 
+					lhc: lhc@20 {
+						compatible = "aspeed,ast2500-lhc";
+						reg = <0x20 0x24 0x48 0x8>;
+					};
+
+
 					ibt: ibt@c0 {
 						compatible = "aspeed,ast2500-ibt-bmc";
 						reg = <0xc0 0x18>;
-- 
2.20.1

