Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EA265AD9
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 09:52:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnnyn5LsYzDqnx
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 17:52:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=iS1elgHb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TvMKmdw9; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnnyG5DFgzDqkS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 17:51:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C29E1C38;
 Fri, 11 Sep 2020 03:45:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 11 Sep 2020 03:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wCrir7Nj5a6Sf
 jiU7ykDZoyQRg2FmImk7NG1eiROHdc=; b=iS1elgHbtQSPnOb33kz9zoK+IaPsq
 UCE2uaZnMVrKLnayOH4az+rcut4AO7S4jCewIwt0f1Ng4mZTlVNJRXIdxPKQ9PYQ
 pQ9GeVjDld2ergKtlGSgpYs52JXObYv0kHMe3bvCZjivugoEX5ATZxEK0SCs8WuD
 blUeQ1UZZPA0ZsLG/HxYQj1i0p4OXWTyeuRe0F3HOX2EFOzc2O7zXXMeyHsWYqju
 mniSv6d6Ycp01dS2FqYW3YdC1l5ZKcU1cUnFgrAoipm5m/Omh0HKo7t0tCfGy3wt
 PpkEGhBklJeBXm4dQmRxzFBIx9US53HlX9zcNBh4XLjKrSf8LveFWUVHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wCrir7Nj5a6SfjiU7ykDZoyQRg2FmImk7NG1eiROHdc=; b=TvMKmdw9
 DVeVOIGMluHTvnEZSqDjcmgxs1wlp3p5okgKRnA47slWJddjIzDLCO87JxT07zNl
 DdNgZHi+zPJsXVDUoPBsCwCA9XIDd6qNkqgmQvF/hJDtcSDLAiRd7MckCQt86nVC
 48R96nUF+6KBMdjXdyQGTmTeaog/5GTtAoOVIhwf/ri5dPvm7WVtIsEPsuOquIdR
 IlfQaPT77Q1M1rwngI2589HsAKMNbFWS8QTIvut4drtSw0aPpCC+PU1eftUPNJWN
 ZuOoPGdZUiZmPY4e4fUQSIG9Wq5MX8GGI/tftMSQh5Xj2eeSmJ1uIOyu5/4w+6v0
 Kgt1czQxRnc6eg==
X-ME-Sender: <xms:HCtbX1XNQJvO-ODfsNth057vjEoDIymWKZJ5nkWtYGyyUL69BzV-SA>
 <xme:HCtbX1nnY5shKT2eegAWAt7c6Ns4LUBj0p1XutlufqDnpLm3q5fHKqa4opH-tUHVt
 Opj2nykNN9GwHSG6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:HCtbXxbPz1aWdHxXNN9GA3OtP2pbVqrdKSBg0jHcpQamTOIK-radfA>
 <xmx:HCtbX4VctOuaEhBnAoHGqfPm3AVkgGcAzi8DtHpx5EgR2QczZSl9iw>
 <xmx:HCtbX_mmykPnTIB5XApdjSTY1uB4rbfpLQgjaPBlT65UtyiOyyeqmQ>
 <xmx:HCtbX4Dy2mrbSEgiadwJ9QeLLynofN80aAQ-z7Wp7AIaRa_61U68DA>
Received: from mistburn.lan
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7725B3064685;
 Fri, 11 Sep 2020 03:45:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 1/3] dt: bindings: mmc: Add phase control properties for
 the Aspeed SDHCI
Date: Fri, 11 Sep 2020 17:14:50 +0930
Message-Id: <20200911074452.3148259-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911074452.3148259-1-andrew@aj.id.au>
References: <20200911074452.3148259-1-andrew@aj.id.au>
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add properties to control the phase delay for input and output data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index 987b287f3bff..d7b605968c8a 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -61,6 +61,14 @@ patternProperties:
       sdhci,auto-cmd12:
         type: boolean
         description: Specifies that controller should use auto CMD12
+      "aspeed,input-phase":
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description:
+          The input phase delay value.
+      "aspeed,output-phase":
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description:
+          The output phase delay value.
     required:
       - compatible
       - reg
-- 
2.25.1

