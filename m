Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A03D35DC
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 09:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMDC3SKVz307j
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:59:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=jdBRuHFM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ATQntg3w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=jdBRuHFM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ATQntg3w; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMD74bhfz2yMS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 17:59:35 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B51B0581634;
 Fri, 23 Jul 2021 03:59:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 23 Jul 2021 03:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=lCh2Ol//vFzVk
 VzvlKjdk4D6bA8X97QIfM65YqzjWeo=; b=jdBRuHFMnKFlOCCNQPKIEybqwAopa
 MEJ3HKX9ui5l16fPMib0XL8B8ANUoDow/9lbH8twqsnioQl9cU7y+BWGyIqEtt0L
 AveczEFwCGbBvoMOR9lAW8ZiH3Wrb/lRRLES/AerF3qmbrpjTVF9fRgcSXFuIn4m
 ogbYdRaUY/fNjDuxPgx1KX0KrQIpafK3Ru7/Afh2x5oPaTm1xdPArZiuajI0Yx82
 yG4wqkfk8EOw8aWyTEpHhhta6k7bLFBdyBwN4sm0z7e4qXiDIBIGecDlDGtWh/Pw
 c8ihOZ/ZIZ1wMXHqMkrsHMuEKRNSgfTTjCWiQUNG0mXS7oGdc/s0PKmNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lCh2Ol//vFzVkVzvlKjdk4D6bA8X97QIfM65YqzjWeo=; b=ATQntg3w
 725zYM152ggKUEOaWPIJouN2EHEi0cxWquoF1vurrPLcjFtIreXf5MvUrk59VspV
 qCv2DkxKsHziEuK+ZyuH2wYcaEsmQAkLxbL43vBcuKSu2Vhq1us3Pr1OvhRnn54K
 2n4KJGOK1m9COFN2wrw/VnQmcDwlZLW2nM3hBLJcukLN5Svwpn5Mbzp+2uiWh341
 BqlUz27ROp8KXFAJcSubcqV8w/S9PdAdpIdbkXvakO+3/N9VOGKeFBH196aM398L
 7M3p/UuzRylDkVKzHhLOXAPszuiZKCAM50xhEITRhBPhZ8YryV+PAHEp4rpfWFI5
 p4VkCCcMwZrQ0A==
X-ME-Sender: <xms:5Hb6YLM2ryW83dDNVeyO7V5pjTYKENSYInzHQRrw_GxPhXxS0Py2ew>
 <xme:5Hb6YF84uWUSzlKioi-ZwCRtfxq67fOpdXfV0tiLwjzxGBM_LkmEIfDQBbbe2jz4C
 WI1KL9qa_j1NHZ0UA>
X-ME-Received: <xmr:5Hb6YKSydgmA1Z6vRRHgCx43Qv-j4sE0Mv-ny5q8bifbPOvYwLym4Ifr1ORdoNvobN7on0Xp16iRn1qBrtaeuwzhd0XPtW0XQRqVYemA9kscpugqTdBjsZE2sO3z85Ecubll9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5Hb6YPvTHNhdGXf-FEDkyQFHKL5Hv8Z2FhCiG_55ABDe-M7FAzbo3g>
 <xmx:5Hb6YDeIYTwIL3qUlAhMjRaS3esjUGaXyHZBPzzwT3bfPJtboRuxzw>
 <xmx:5Hb6YL0Fgxt5s-xpGbyid91bS8qUr-Jmel2uPvknWTxUqPLFvs0C2A>
 <xmx:5Xb6YH7pymPX-h5ItyYPaxMLA2njgDswQi-uaBWopySU-dH76LKtPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 3/6] leds: pca955x: Relocate chipdef-related descriptors
Date: Fri, 23 Jul 2021 17:28:55 +0930
Message-Id: <20210723075858.376378-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Reduce code-motion noise when implementing pinctrl.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..6614291b288e 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -75,44 +75,6 @@ struct pca955x_chipdef {
 	int			slv_addr_shift;	/* Number of bits to ignore */
 };
 
-static struct pca955x_chipdef pca955x_chipdefs[] = {
-	[pca9550] = {
-		.bits		= 2,
-		.slv_addr	= /* 110000x */ 0x60,
-		.slv_addr_shift	= 1,
-	},
-	[pca9551] = {
-		.bits		= 8,
-		.slv_addr	= /* 1100xxx */ 0x60,
-		.slv_addr_shift	= 3,
-	},
-	[pca9552] = {
-		.bits		= 16,
-		.slv_addr	= /* 1100xxx */ 0x60,
-		.slv_addr_shift	= 3,
-	},
-	[ibm_pca9552] = {
-		.bits		= 16,
-		.slv_addr	= /* 0110xxx */ 0x30,
-		.slv_addr_shift	= 3,
-	},
-	[pca9553] = {
-		.bits		= 4,
-		.slv_addr	= /* 110001x */ 0x62,
-		.slv_addr_shift	= 1,
-	},
-};
-
-static const struct i2c_device_id pca955x_id[] = {
-	{ "pca9550", pca9550 },
-	{ "pca9551", pca9551 },
-	{ "pca9552", pca9552 },
-	{ "ibm-pca9552", ibm_pca9552 },
-	{ "pca9553", pca9553 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, pca955x_id);
-
 struct pca955x {
 	struct mutex lock;
 	struct pca955x_led *leds;
@@ -415,6 +377,44 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 	return pdata;
 }
 
+static struct pca955x_chipdef pca955x_chipdefs[] = {
+	[pca9550] = {
+		.bits		= 2,
+		.slv_addr	= /* 110000x */ 0x60,
+		.slv_addr_shift	= 1,
+	},
+	[pca9551] = {
+		.bits		= 8,
+		.slv_addr	= /* 1100xxx */ 0x60,
+		.slv_addr_shift	= 3,
+	},
+	[pca9552] = {
+		.bits		= 16,
+		.slv_addr	= /* 1100xxx */ 0x60,
+		.slv_addr_shift	= 3,
+	},
+	[ibm_pca9552] = {
+		.bits		= 16,
+		.slv_addr	= /* 0110xxx */ 0x30,
+		.slv_addr_shift	= 3,
+	},
+	[pca9553] = {
+		.bits		= 4,
+		.slv_addr	= /* 110001x */ 0x62,
+		.slv_addr_shift	= 1,
+	},
+};
+
+static const struct i2c_device_id pca955x_id[] = {
+	{ "pca9550", pca9550 },
+	{ "pca9551", pca9551 },
+	{ "pca9552", pca9552 },
+	{ "ibm-pca9552", ibm_pca9552 },
+	{ "pca9553", pca9553 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pca955x_id);
+
 static const struct of_device_id of_pca955x_match[] = {
 	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
 	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
-- 
2.30.2

