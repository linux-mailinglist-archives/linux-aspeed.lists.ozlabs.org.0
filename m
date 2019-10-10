Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28AD1E27
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 04:06:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pZFl3RfGzDqc3
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 13:06:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RjaegqIh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lgrKLx3T"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pZFb3Zw2zDqZH
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 13:06:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D5CC21F5A;
 Wed,  9 Oct 2019 22:06:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 22:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=KDItDJsFBQom2
 Sf6FH9mRJIzJqOmoka2T+mY3RP2gCM=; b=RjaegqIhn6V4Zt4cnx4uS4cdLpbfn
 ryAhRPfao/9aKkwIjisqSrX6TdaM9NEkH6Plsvtiok/i9uKURq3zOG/a2JFngjaC
 deki3bF3YOKQqhJZUjF13JvExcrGpkfGS7u+KDzRxUgl7UEXcnvfu42gNU7yMWub
 1+Q/zx4GMvbSmh09TSYoESFjdF6e5wcGsC6Oi68joyYjcXZPrXG1Xw3cAZyVW8IE
 6FkdLCLeUKYLBDkbqBJP7eeYykC9lSu9/iFFKYiDvTuKTEOn6E3N56/nIkkOXs2N
 +hyjnjd4bdlWJUiorMr0f2DTL/mD3npoYXqtJ1aih45FqGaUQr+0hX/iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KDItDJsFBQom2Sf6FH9mRJIzJqOmoka2T+mY3RP2gCM=; b=lgrKLx3T
 Hi1Z09ZVQ04453umwSVXmkcM8rPzleABmLS9RzGzEV09BQzIPgQLNEsPM6WG1ZzP
 XwMgAT3DULxIMtxYZuFmDAALhQZxm2pLefsOBGDrt2btwa2aJYeUPfmHnaHsp1Q2
 +ccVkEm222Pn5zjFk1VgscWqqnIbki+1lGu3obvu2yA18VZpZeFaKcSM8HnlEG5f
 C/YQLGjnc61WzREOWrT63sfffvgfyF8lQueuBLEZvpGCPSte18HsCsF8ljT32vfn
 fxyMWhlK4u9fu00eQTD1w1Yh4xEUupixt7zCi13apucxocEI0coitL8bcFgQak8y
 zrCnk4P2W1XdOg==
X-ME-Sender: <xms:IZKeXcEnjHcV79PDuAnKbgf1T8EPepXIPIE3Z5gM_iRCrQMSJ1_OlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 vd
X-ME-Proxy: <xmx:IZKeXZlIdXdQ6xA39TGEW6Y75K1Su2jknNhwnbWMmYIBlD9yR-avhg>
 <xmx:IZKeXRJM4JjJWZWj-8d0zaNar4vj8MmrZB46gtM8WF8esrnwymVjhw>
 <xmx:IZKeXSaZb2f4g9gbnz6SQrKFHwM3-_7y3o4x-iMT30ZiLV7j3_l9fA>
 <xmx:IZKeXXPpTThZZiexiCDrU3DFYN_r6UI1vi7-ukS1sW6BmHn5Xh2SZg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id C2E6A80061;
 Wed,  9 Oct 2019 22:06:21 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
Date: Thu, 10 Oct 2019 12:37:24 +1030
Message-Id: <20191010020725.3990-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010020725.3990-1-andrew@aj.id.au>
References: <20191010020725.3990-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 has an explicit gate for the RMII RCLK for each of the four
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 38074a5f7296..62b9520a00fd 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -83,6 +83,10 @@
 #define ASPEED_CLK_MAC12		64
 #define ASPEED_CLK_MAC34		65
 #define ASPEED_CLK_USBPHY_40M		66
+#define ASPEED_CLK_MAC1RCLK		67
+#define ASPEED_CLK_MAC2RCLK		68
+#define ASPEED_CLK_MAC3RCLK		69
+#define ASPEED_CLK_MAC4RCLK		70
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.20.1

