Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B90222C001B
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Nov 2020 07:31:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfck04tPhzDqMX
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Nov 2020 17:31:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Alh0lgjk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=h/xw1DKA; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfcjS3fTfzDqM7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Nov 2020 17:30:52 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BC025C00E1;
 Mon, 23 Nov 2020 01:30:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 23 Nov 2020 01:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R9UFuHjtAK1qQ
 YI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=Alh0lgjkO4bfrp7qVq4o+Ca9an7iM
 vJtnZ8NskadtMFu6Y24s0BYZKg9yF0CSpPPf1bg5LKiSCkdP5/bgYgiIvkjnrhwk
 wwouJxfJa0zWnJfDUTpUvG08IxTieZBsYdcl052WH4jjSBeG25l01oHIrzdVx/eQ
 AbWUZPLgq4f8sG43Jmx0KpijObnhdOQbUxQvdV6HbVbD6ZzVi/mW7vfkO6FnJKJc
 c+FSArxgDKyR4dOtR6GJzEYA/EX9lU0fGKr7y+PrJG8igABbxcha077ROxgmOA84
 EafBP2O83bFYtM+4Ct+mnIVXSv86MdRb/qQBudXkooVJte2HICn0Bfazw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R9UFuHjtAK1qQYI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=h/xw1DKA
 h13Fzmqm89P65yyArRzLOKysgizzUezLkDIBHBbpKikxuT2I+XXDTEreuQCzPicq
 /c9HxPz79tHM073l00IpB5cDAhKrdIqC2JUAOc8L6efA6g5duALgweCWhMCtgj1A
 uhfhtQFvJJT56ozYKZ/HklAI1x0LT7VrL54YzUfPNAZ7SQrhAGinHvSBp9dpvLfS
 np2TgeTBN0C9rFjLWA4JK5u+OvFzmtI5QR0QxVf2mxs1Q24vH9TrbBnigo/CxZSf
 yA1kz6hdAnkyBo4cAMa31+Cd8kK587vbn/Cpw6GxU098Xz8+cDGlyeqNuwR7JKNU
 99be9d8lpeSmRw==
X-ME-Sender: <xms:Gle7Xx5YR4ENmBGQkqahZLmlnvZ4MkrGJXNwXLs30ErVv7R7N3JFXw>
 <xme:Gle7X-6UKayXpW8JEbtuXCrnc9CRaeNfEeBufCzH2FKygvfDj0XzX3yCmAyuKGysC
 ON1rhsZ2hCqmlnA4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvddtkedrudeg
 ieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Gle7X4eVSlCxgKDRcOMc4DnP9U1IBqcez-0L5fY2KT24pS3sie2ptw>
 <xmx:Gle7X6JgcGHDd1qYUP-tWtCZG3-JxLDLAhqjw4yWoUIizvr9FYl7NA>
 <xmx:Gle7X1J1RkF1Pa6zRotcEVia-MebtTcCVU6fO4kDY0fyKBr3hr_nIQ>
 <xmx:Gle7X6o2-rfpMnwBPE5_mpEa8Oo6wByVsRDbE3IWDdz_81xlGVCSHQ>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B13E3064AA7;
 Mon, 23 Nov 2020 01:30:45 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: dts: rainier: Add eMMC clock phase compensation
Date: Mon, 23 Nov 2020 17:00:04 +1030
Message-Id: <20201123063004.337345-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201123063004.337345-1-andrew@aj.id.au>
References: <20201123063004.337345-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Determined by scope measurements at speed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 21ae880c7530..ab8d37d49f30 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -186,6 +186,7 @@ &pinctrl_emmc_default {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
 &fsim0 {
-- 
2.27.0

