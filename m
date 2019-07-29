Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D8784CC
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 07:58:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xpsG4CqLzDqN0
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 15:58:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EUGH7THd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bNjOWRxl"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xppS4XCVzDqM6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 15:56:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C153622A8;
 Mon, 29 Jul 2019 01:56:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 01:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=X7ftRY0n/ppqJ
 obOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=EUGH7THdAQOM3iG1Id8jiHV8FZjwQ
 C3hzDk4fQZDzd+y44ucWCSN1MuY8302J8cKFOZzRVdt0+RIQGc2rdP7z/EpcNg5Y
 XPZpBXVjHrwzA7IQTfjYBO3x2IVhNCf3LSN+DYr83pokjOtN6LeMJaKe6kF4dH9m
 A4QXFeik6mO16MK9zyb+uRYJlaHRab+1lz7BXfkmOfQDPAi5jKaKs0GUeFr++qGH
 BsdTMvMQDX04Z4ONup731fYihnUtIbwnJmvJwVut8bFpfGZLGYsltG6bdPnovrod
 Vf0+5JzAuWphnJ1oYY3kn8wFYD0kbxL8/lujjpEmCXQfa4gbCs4qeMECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=X7ftRY0n/ppqJobOZqCX51ux9OAohStr29ZTJLcVjmQ=; b=bNjOWRxl
 25J8pw0RHXBsJOEzEhKiCTz2e0jvKKsXnTFpEwT2m8t8HYArZNbhVdmMSHPTgCc3
 02RPkuJMhPctf2DMZcNhNfhEmVAXMoqhq7mhiZYHj6EOEFycTLdnYFoDBPRrAJ3R
 JJ8dBmGxv3yEsy/PQcfBG3CwkdR5FWIooFUkIlCIyaDgqHjL095cfmIqm3irHfiu
 xlBhERNxGpo16htg6+Y5YRGUxOjDlc5mZr8XCU+FsHroNfcBodODrV8Fuo93Dgi6
 Qw0QsuCeckuTzNIS7FGu+JBjUBPgQkxr5iXnG0FAsmTAhAuxUpXuLXRRtjgVCABd
 OPbUG7u1bvEIGw==
X-ME-Sender: <xms:fIo-XTzWFpMswbo4cgeSSr5i0Nt4KNTeCNoecqnCLpCXL1ixKtS0AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedu
X-ME-Proxy: <xmx:fIo-XR1gy1Lz874ZpvXOjqMDKi5SkSSwgg-ti5Aup7l8Uq9V3c6upQ>
 <xmx:fIo-XagmNyvH2cujLiMIaAkxCaoneW69btXVUbkATWQapf_xWk0hog>
 <xmx:fIo-XflGS1NUezg5Ah4iVwiVa5_Je1JmckekKwoHacTS-j2T5gGlFw>
 <xmx:fIo-XYkfdj7PEE7V22i8z8udPQ20GZlls2bNk-XeJQ-8-jNUZnXScA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2DCD8005B;
 Mon, 29 Jul 2019 01:56:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/6] pinctrl: aspeed: Add PIN_DECL_3() helper
Date: Mon, 29 Jul 2019 15:26:01 +0930
Message-Id: <20190729055604.13239-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729055604.13239-1-andrew@aj.id.au>
References: <20190729055604.13239-1-andrew@aj.id.au>
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
 johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This case is common in the AST2600, so add to the collection.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 72 ++++++++++++++------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 0406beedd5ba..964dd5b242ac 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -604,38 +604,6 @@ struct aspeed_pin_desc {
 	static const struct aspeed_pin_desc PIN_SYM(pin) = \
 		{ #pin, PIN_EXPRS_PTR(pin) }
 
-/**
- * Declare a two-signal pin
- *
- * @pin: The pin number
- * @other: Macro name for "other" functionality (subjected to stringification)
- * @high: Macro name for the highest priority signal functions
- * @low: Macro name for the low signal functions
- *
- * For example:
- *
- *     #define A8 56
- *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
- *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
- *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
- *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
- *              SIG_EXPR_PTR(ROMD8, ROM16S));
- *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
- *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
- */
-#define PIN_DECL_2(pin, other, high, low) \
-	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
-	PIN_DECL_(pin, \
-			SIG_EXPR_LIST_PTR(high), \
-			SIG_EXPR_LIST_PTR(low), \
-			SIG_EXPR_LIST_PTR(other))
-
-#define PIN_GROUP_SYM(func) pins_ ## func
-#define FUNC_GROUP_SYM(func) groups_ ## func
-#define FUNC_GROUP_DECL(func, ...) \
-	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
-	static const char *FUNC_GROUP_SYM(func)[] = { #func }
-
 /**
  * Declare a single signal pin
  *
@@ -670,6 +638,46 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
 	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other)); \
 	FUNC_GROUP_DECL(sig, pin)
+/**
+ * Declare a two-signal pin
+ *
+ * @pin: The pin number
+ * @other: Macro name for "other" functionality (subjected to stringification)
+ * @high: Macro name for the highest priority signal functions
+ * @low: Macro name for the low signal functions
+ *
+ * For example:
+ *
+ *     #define A8 56
+ *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
+ *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
+ *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
+ *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
+ *              SIG_EXPR_PTR(ROMD8, ROM16S));
+ *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
+ *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
+ */
+#define PIN_DECL_2(pin, other, high, low) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(high), \
+			SIG_EXPR_LIST_PTR(low), \
+			SIG_EXPR_LIST_PTR(other))
+
+#define PIN_DECL_3(pin, other, high, medium, low) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(high), \
+			SIG_EXPR_LIST_PTR(medium), \
+			SIG_EXPR_LIST_PTR(low), \
+			SIG_EXPR_LIST_PTR(other))
+
+#define PIN_GROUP_SYM(func) pins_ ## func
+#define FUNC_GROUP_SYM(func) groups_ ## func
+#define FUNC_GROUP_DECL(func, ...) \
+	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
+	static const char *FUNC_GROUP_SYM(func)[] = { #func }
+
 
 #define GPIO_PIN_DECL(pin, gpio) \
 	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
-- 
2.20.1

