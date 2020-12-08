Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E69382D1FF7
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 02:27:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqjGb3mqSzDqby
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 12:27:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=CB4B5WBp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=rnqoeTLi; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqjFp2QQCzDqbB
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 12:26:54 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 862C25C01C2;
 Mon,  7 Dec 2020 20:26:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Dec 2020 20:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R9UFuHjtAK1qQ
 YI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=CB4B5WBpU5PRnXh6D5dJU0njXoZ6L
 tUXluZyWKu+xmDzAl8s1iQc0jcIVinmfbvQdwDizxvm6CPcmsNl/4r/lsThRnQ8m
 fuw5DF0aU1A/TEDkQTfEXpg0I1FctmODsXqgjWYSJmoSCi0XtB96TSkuAr4w/Jn0
 KnndiOVgtHXOmzr1sXeaUJh3mTDViEENUkxKGDyn9IUIKRH5RFZ/O1MxoaX4t8By
 edWp34YMkFqozlw6SoIfjMsDEduKoz8y0wigzN8ngYFI8QStqfRgHSjgD7h797Tq
 H1lZg98rg+HHl0MDonM3B8rRMC7/iSGtdZM6gy8zqGClnOYZR/l6oG2hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R9UFuHjtAK1qQYI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=rnqoeTLi
 r4PnuJaD/397smYmsTkLYT3t3UBVMyQMZ/zU+Tph0w7lMvN3NfRBEsMrcFKVxo+I
 iXw4a1UyuipUU0SuqPAG0tkGplRKmtSnHHE7kQ3vxapaNCzGUr775F9tX3csxopc
 2lpqFPFfgPcZYaTyNzDapBEnSvQEZasjnMlOkHACLSuKm2O0Uj3ExLabQYdmd5VB
 p+lKwOM2r0nKX63qQUR5kmhqvAzxfTROmf7KZg42BheeExIuVchyu4H63303kptw
 aOup8k8UMS+CwQux0PMB90Dca5oI4zkS9n5879bP40MAXi0hMVK+eH1yXYFnYj8z
 3L0+M7UUDatKWg==
X-ME-Sender: <xms:W9bOX9ou9hefyOvzn3e4_sXUbmZqb580zlYmTdTABlvDB-p5aVCI5w>
 <xme:W9bOX_rq1-bSW9yiLqY59P0lLFZ8kByIUvoZyx3kEdRHUntrTUVY5RfMvahk-09qn
 az1-MpcRmd8qDsUsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvddtkedrudeg
 ieenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:W9bOX6MA5KiyQxjPr2tryr71LYy0UTEt6aeKSxyScBkQErPcOP90Bg>
 <xmx:W9bOX44jzvZYxVHOXYkAPCE9oldodWnkXAUPYiievg5BzgwatIluKw>
 <xmx:W9bOX8574nAlS1Lqve19-5F1OT_aJr1HOYyu2rIMdJOL_Qm_41J48w>
 <xmx:W9bOX7YnWng6L6RYUlGEX2KBQjg8xaSdjwIvi6vMQ2_TotI8MsoGCw>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id 073701080063;
 Mon,  7 Dec 2020 20:26:47 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v5 6/6] ARM: dts: rainier: Add eMMC clock phase compensation
Date: Tue,  8 Dec 2020 11:56:15 +1030
Message-Id: <20201208012615.2717412-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201208012615.2717412-1-andrew@aj.id.au>
References: <20201208012615.2717412-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, robh+dt@kernel.org,
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

