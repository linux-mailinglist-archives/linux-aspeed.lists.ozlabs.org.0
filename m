Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 085AE75E65
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:40:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vybl490WzDqQ1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:40:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M+KYS3fI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KPnevW2V"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybG1NxSzDqPN
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5774A22316;
 Fri, 26 Jul 2019 01:40:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VAmBJkwQa1nYT
 pHvlFa8arKTnGNAQUEikNjCfoiyH7k=; b=M+KYS3fIgpccxDg6Bt8b417HA/8Pa
 ViI/Pj8uR70BP4qQdmk4CWNSeTi2+Mir125FcJXOubW3H+wSacsMByWLSWY+lv52
 eaMQplbbdVNJlu7CovN0d4DM40ypBfxr3ei6cLjoQsU+83PJ0kN3IUcEexO4tD2E
 4Ma6MZ2xNzxjnnb1VyFJF9i25V4qa+juWAdF/5Au4oWyq7tMmoJOrDM3sR5OzvKm
 DTwkhzSjm8aWW+mlYtqgqMbHEP98b9ugm7jKu4y7Cv25lM3H+thEqpEnFIn/L+xc
 1d5tnlJC4HJXNNbDuZk+aCuO2VTSHdc6O/2XaYt5qz7baZqjYrdn2k+ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VAmBJkwQa1nYTpHvlFa8arKTnGNAQUEikNjCfoiyH7k=; b=KPnevW2V
 15OyMrFxm/AWEprcvIdfXTegs2XLJiRD8SbodqUrNvN2jMMy158zHhfnhE5OPql4
 YbZn9Y1i33yWWm81SA9xwbxsnM5Ckkks5WE/o5bzEl+JC+Enq/nTJU8cvmQJuL9w
 yQyxfVao/F1RXKo7UGhiiCMSKD8bFqpd51hENGDXp36FagtWCiMsd3sQmN9No5Uy
 OZbCKPADFXOQDy1AnaRc7cCJ8KtC6oxtfH+xg9uDsq6J0i/tlo5o5oWvoP0d99jb
 59hdjcWt+cnD8MxwkV6gS2KsRhfqYqwTLPCYsQamq1lUwyMwxXmPDnWGf9HISMbi
 wEpTOqicHUjc8g==
X-ME-Sender: <xms:NZI6Xesl5S-e6ZI7uh9yHfozUDtEmLupzewlhplTvWd9AEldPBoS1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NZI6Xfwz8cSWL501sAtmmtbyDGvvMlVHjnZjsnIb_nhDybMaRMqKeQ>
 <xmx:NZI6XciTthIgiUfCNGVrm1kk_d25ZhzKM-UFFMrDk9m2LdQqqY6BSw>
 <xmx:NZI6XbA7doWG1_bHK1UYKoE-RMa97OE4Wa-IZlteBtpmqWtiX0iQgw>
 <xmx:NZI6XU3b05Szt3ND7HdHAufRZqdUJYv-fhN3nnUR3Ww3D31VW9hLbA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 22F61380084;
 Fri, 26 Jul 2019 01:40:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 01/17] ARM: dts: aspeed-g5: Move EDAC node to APB
Date: Fri, 26 Jul 2019 15:09:43 +0930
Message-Id: <20190726053959.2003-2-andrew@aj.id.au>
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
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Previously the register interface was not attached to any internal bus,
which is not correct - it lives on the APB.

Cc: Stefan M Schaeckeler <sschaeck@cisco.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5b1ca265c2ce..7723afc7c249 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -47,13 +47,6 @@
 		reg = <0x80000000 0>;
 	};
 
-	edac: sdram@1e6e0000 {
-		compatible = "aspeed,ast2500-sdram-edac";
-		reg = <0x1e6e0000 0x174>;
-		interrupts = <0>;
-		status = "disabled";
-	};
-
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -206,6 +199,13 @@
 			#size-cells = <1>;
 			ranges;
 
+			edac: sdram@1e6e0000 {
+				compatible = "aspeed,ast2500-sdram-edac";
+				reg = <0x1e6e0000 0x174>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
 			syscon: syscon@1e6e2000 {
 				compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
 				reg = <0x1e6e2000 0x1a8>;
-- 
2.20.1

