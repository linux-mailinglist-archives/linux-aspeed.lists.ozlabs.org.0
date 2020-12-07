Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D142D138F
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 15:27:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqQcf6VswzDqXL
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 01:27:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=HKGlpZwg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ejjyHRBw; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqQbp5lZGzDqW7
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 01:26:30 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B9695C0106;
 Mon,  7 Dec 2020 09:26:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Dec 2020 09:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3IBtn55EkJHpw
 BMNVFMzrRkc/Dri1oJfvyFIx80EIec=; b=HKGlpZwgfkD+3mI4G6pHi4YYxLKiv
 a2gxRrHz3kWnMZLiCAfzmtdfj5O3VxnbqlZyHZbpc9+shNer5IUs9dfODfDbDwqU
 Lo3cLt4PrERWoH6NO1r4yc8q9y3nlP6IlYKb7XVMWtvRlI4L1gY/4U4yZ2IZ6Y9R
 ZrDsweyEgh6upeOQMPWCuKMy9CdUASw3KKJuYVzaTiy9lwIZCcMcIUJaXdlh+nhQ
 oQogx0TZxmjYwcsrAzLsrR4UPMbPb+h9OMINEzdpBcPxx23KMeC0R8AcWf+8/bsc
 7gYWDWSJQ4LkY8WHbrHtlEvrF0hRyH5LwfVtCcrv1ZVnlNcunSS0vSPUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3IBtn55EkJHpwBMNVFMzrRkc/Dri1oJfvyFIx80EIec=; b=ejjyHRBw
 q/OEzNxYnwNv3XHwPA90+tNsXTZub7YDKSsf8k7EzkVV6P6NNa+e4DJ+seGfTKaF
 L18QPCS0ZDGPT3qh2mgupwsTDFwF7JTfgaJLr4tDD4ZiacEClA0mlJQOms6qnv2f
 OehKlw/HR/N35n4+UOw7D5xdMPVmILeLkyWTD/mPrR/YeklJ88bTUuwnvPGEbgoM
 D1IJG6NGGp8hEyTcxPsMHv3Nm9/kaDfpvS4/aSkNeAkjtMe1Tc3GTY0eu5njUlv5
 +na1FXVFQH4ewXzt14qrvm/+zg+5GWLfqaUiAflDhGXevMwrkyu6cyXaAdh2t9SW
 ZGwXnjkOkTBYYw==
X-ME-Sender: <xms:lDvOXyC3qVhuqURbhlF4d7_aGpObGPrbVQN4sUsn3KK2e7YEB3lMVQ>
 <xme:lDvOX1XGA0s5MOb0DQiU2SY94LM0b9vR2kLVRPmwARXPh3UTO3SQLaupUEZ-n-mnc
 7kAZxAISPEKuA8wTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvddtkedrudeg
 ieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lDvOX26B-X7JWIyz0NYtHR588UJRKZPchluDWPXLPM8a_bsLLV4QJw>
 <xmx:lDvOX2D0G4vVmkHnRXi6-KLwAIhGRQxwADcMsM5zeCS3R8aU1uuaeg>
 <xmx:lDvOX7D0sItBSAJe36oaO5Zkqno1nrRn_y4bhclpwa2z1-zgxSyrlA>
 <xmx:lDvOX1Kz4QjMg2abqf7mBZEUFKSHTauOc56G45XZ0ZpFAO_aT68nBw>
Received: from localhost.localdomain (203-57-208-146.dyn.iinet.net.au
 [203.57.208.146])
 by mail.messagingengine.com (Postfix) with ESMTPA id C71CE108005B;
 Mon,  7 Dec 2020 09:26:24 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v4 5/6] MAINTAINERS: Add entry for the ASPEED SD/MMC driver
Date: Tue,  8 Dec 2020 00:55:55 +1030
Message-Id: <20201207142556.2045481-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201207142556.2045481-1-andrew@aj.id.au>
References: <20201207142556.2045481-1-andrew@aj.id.au>
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

Add myself as the maintainer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f..eae4322aae67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2826,6 +2826,15 @@ F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.
 F:	drivers/irqchip/irq-aspeed-scu-ic.c
 F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
 
+ASPEED SD/MMC DRIVER
+M:	Andrew Jeffery <andrew@aj.id.au>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-mmc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+F:	drivers/mmc/host/sdhci-of-aspeed*
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
-- 
2.27.0

