Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0A66568
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 05:56:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJxm4SmZzDqcv
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 13:56:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hvOUJDaV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iSHTMVXU"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lJXP103bzDqnD
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 13:37:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DEF8221B6;
 Thu, 11 Jul 2019 23:37:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jul 2019 23:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dffcCV/HTGPbH
 G4a1USO9iem8eItTEWWhc5RSmq1hAI=; b=hvOUJDaVw0E64wvrHZXP1Oes8M/Fc
 RWnfW0PU0RGjOCCcKtXjhH/sw2Dn13C+j4QO8441uGf4whyBHjDMAKEWN9dFXKEg
 hei+yYCk7xmjZZBTfQowq6AVzp2VjFDvEIAnWUc5r+ALtfLWW7hbVMVtd/uDvAeK
 hrdEeDohrhBEdacYfD5RooOQj6g0XX1cLswOSqLx8LIReIBatfumsqWHj1vX6iqg
 bmNDVIu6ckUNRb9o1K0GJVp+J7C1Oz/IbKp4pTdBSbgKszKPSrK+ZmJ0EiLdBVMA
 VWujdfhMLOHJOqPEh5XRZuQxv2T2gMpth1BnDebYCNOaBojm5NmAHON6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dffcCV/HTGPbHG4a1USO9iem8eItTEWWhc5RSmq1hAI=; b=iSHTMVXU
 mxV3vmRFRmVVW+mit5S5ZMXNozoqSQWJcublB6670A9pjyweeXDBZbqkqeUFNZPX
 eyJHXGl+t+RpztWiGfpSQub/BVtKD/55DKFgPwhBzUCJwEXcHrNSIx/NSyTkvtJr
 UxVESKXOZ5utwVkEQh7Luhr1d16d9tbmhsq2s6g05Lqd5PFqv+fdygQReH0PKFsL
 M8VIbkBg5rdLXhP+pCaScFMbUF6/Z9RpZCVBDdLwwFjSW69iuzlUKlvHGmpTBMtm
 Vyf3tKLOX8bavFOPWYF9u3xzV0Hn4puLy9uHB3KylNUyBFGTPcqrqjXxklWHbYCx
 4cgIXtTiol9zMg==
X-ME-Sender: <xms:ggAoXaGyefVf42dXhHEOtBxgoSN6aycfHZr92g4z7pxQBUPew1MFmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:ggAoXWC6ZgShKWOurnS3nvIiJVjIknyj_BY69a-iCWxzewPPwyPZSg>
 <xmx:ggAoXc1kMekmbsBEoRlxOszKa5zqTL-YSbGEyxbr-GNhFugkv7g3Bw>
 <xmx:ggAoXbO7iRegCKzyPLiAhLh2wreM1z15yRzETjDCyMljg4m2GwQ2vw>
 <xmx:ggAoXdUEevS5f6CffUvq58wmgzNzadHCRaxWf-1u1EYK460jZVXcsQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 921D9380084;
 Thu, 11 Jul 2019 23:37:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Enable first MMC slot on AST2500 EVB
Date: Fri, 12 Jul 2019 13:07:26 +0930
Message-Id: <20190712033726.25237-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712033726.25237-1-andrew@aj.id.au>
References: <20190712033726.25237-1-andrew@aj.id.au>
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
In v2:

* Leave sdhci1 disabled

 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 556ed469830c..5279b1040c37 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -94,6 +94,17 @@
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
 /*
  * Enable port A as device (via the virtual hub) and port B as
  * host by default on the eval board. This can be easily changed
-- 
2.20.1

