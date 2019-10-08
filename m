Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1ECF1D9
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 06:42:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nPp26LLXzDqNS
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 15:42:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bLl54rP1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NKMT+W9+"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nPnQ5qRgzDqMH
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 15:41:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B90DCEDE;
 Tue,  8 Oct 2019 00:41:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M6CdlY9WjEBXg
 l7K1ZF2GhMiCG6h+wPB9CjXBLMviWo=; b=bLl54rP1u4xHD/H3AHONF++eW/FSr
 HJS6jSOAZ+cdoKdPwiEeVRH8Qhuf4gghBpXcj2TEKpp3janpJmjn4nNXe0dDYFlX
 f5Xymlt1rmvf58lkUbSL/e113iNzJs4b/QQN1SQSC7WqFhqESvsmMXLwvlMPlFFO
 B0s2rSfwXj/pZMQj4WDaMt6Rv78TUz4oxIRphUsY6UpcRSXhpbdnjzI+qCzRJ0tf
 vNMiGdQYja0OZz70UcylnuythvIb1L43+AjT2Jmvhr2oP9K0qTwQQK92k/AlEikR
 7SBqyGSrtw5wO0iPVQCoFbqRUa7iWoMynZWSnkJvK8qtB8Ic1oUdT6i/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M6CdlY9WjEBXgl7K1ZF2GhMiCG6h+wPB9CjXBLMviWo=; b=NKMT+W9+
 Os55z9FwiSq0QonnwU6VQvCPgKndMFZMhNr0kjwJB6K30yv1eHADzGSdJQh3e8fV
 e409Wz4AUpHSro4HRSNd7pBWpaXmJfVfPLueuw/EU5X3pVQJZIpRC9b3SaCJhHn3
 QLHsxTfsjDVQ4wiyE48Mnadr2bS4QmOHcSqBqQKkgKwUp0uo+uw8UifmUDbzKynC
 pEfJE0zDCtcvJBkDtcGtkgJtr2ZEMXVYeNroIEYuNcE1aUu7vRp7Ciwd9uQQrpMt
 GKGxPhB2LC7C0AqfVRVpy9Za/gcgopzHcUnuj0OnChxe2p6D1jhpFE6jRQ3PSC9n
 23eLGJynzNPfZA==
X-ME-Sender: <xms:dxOcXYmstCkt2rtLMtnqE9puVxu0Xb5-b0nFiOItEibpAPRz2NaN6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:dxOcXSuWD19ivJcEz6PBr-UmMVLXja6Q9ispfp3kpGvq6DDevZusDw>
 <xmx:dxOcXedSYJc1rnU6OlpflsnJI7IK1D9WD5pK4RlWqC24LdYiAHgEcg>
 <xmx:dxOcXSzkXCss4r-AiE7-_X5lXzW8xr5WMB7Ew3W1wN8ItQOChR0Z-A>
 <xmx:dxOcXRIWUAWTXBvGtYAUlNXxZFqNPinxlluIYaBdSOxLRwm5Yw-ktw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16FD780062;
 Tue,  8 Oct 2019 00:41:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 2/7] pinctrl: aspeed-g6: Sort pins for sanity
Date: Tue,  8 Oct 2019 15:11:48 +1030
Message-Id: <20191008044153.12734-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
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

Some pins crept in that weren't ordered in the list.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 648ddb7f038a..ff208b7c75a8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1574,6 +1574,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(AA11),
 	ASPEED_PINCTRL_PIN(AA12),
+	ASPEED_PINCTRL_PIN(AA16),
+	ASPEED_PINCTRL_PIN(AA17),
 	ASPEED_PINCTRL_PIN(AA23),
 	ASPEED_PINCTRL_PIN(AA24),
 	ASPEED_PINCTRL_PIN(AA25),
@@ -1585,6 +1587,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AB11),
 	ASPEED_PINCTRL_PIN(AB12),
 	ASPEED_PINCTRL_PIN(AB15),
+	ASPEED_PINCTRL_PIN(AB16),
+	ASPEED_PINCTRL_PIN(AB17),
 	ASPEED_PINCTRL_PIN(AB18),
 	ASPEED_PINCTRL_PIN(AB19),
 	ASPEED_PINCTRL_PIN(AB22),
@@ -1602,6 +1606,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AC11),
 	ASPEED_PINCTRL_PIN(AC12),
 	ASPEED_PINCTRL_PIN(AC15),
+	ASPEED_PINCTRL_PIN(AC16),
 	ASPEED_PINCTRL_PIN(AC17),
 	ASPEED_PINCTRL_PIN(AC18),
 	ASPEED_PINCTRL_PIN(AC19),
@@ -1619,6 +1624,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AD12),
 	ASPEED_PINCTRL_PIN(AD14),
 	ASPEED_PINCTRL_PIN(AD15),
+	ASPEED_PINCTRL_PIN(AD16),
 	ASPEED_PINCTRL_PIN(AD19),
 	ASPEED_PINCTRL_PIN(AD20),
 	ASPEED_PINCTRL_PIN(AD22),
@@ -1634,8 +1640,11 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AE12),
 	ASPEED_PINCTRL_PIN(AE14),
 	ASPEED_PINCTRL_PIN(AE15),
+	ASPEED_PINCTRL_PIN(AE16),
 	ASPEED_PINCTRL_PIN(AE18),
 	ASPEED_PINCTRL_PIN(AE19),
+	ASPEED_PINCTRL_PIN(AE25),
+	ASPEED_PINCTRL_PIN(AE26),
 	ASPEED_PINCTRL_PIN(AE7),
 	ASPEED_PINCTRL_PIN(AE8),
 	ASPEED_PINCTRL_PIN(AF10),
@@ -1643,6 +1652,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AF12),
 	ASPEED_PINCTRL_PIN(AF14),
 	ASPEED_PINCTRL_PIN(AF15),
+	ASPEED_PINCTRL_PIN(AF24),
+	ASPEED_PINCTRL_PIN(AF25),
 	ASPEED_PINCTRL_PIN(AF7),
 	ASPEED_PINCTRL_PIN(AF8),
 	ASPEED_PINCTRL_PIN(AF9),
@@ -1792,17 +1803,6 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(Y3),
 	ASPEED_PINCTRL_PIN(Y4),
 	ASPEED_PINCTRL_PIN(Y5),
-	ASPEED_PINCTRL_PIN(AB16),
-	ASPEED_PINCTRL_PIN(AA17),
-	ASPEED_PINCTRL_PIN(AB17),
-	ASPEED_PINCTRL_PIN(AE16),
-	ASPEED_PINCTRL_PIN(AC16),
-	ASPEED_PINCTRL_PIN(AA16),
-	ASPEED_PINCTRL_PIN(AD16),
-	ASPEED_PINCTRL_PIN(AF25),
-	ASPEED_PINCTRL_PIN(AE26),
-	ASPEED_PINCTRL_PIN(AE25),
-	ASPEED_PINCTRL_PIN(AF24),
 };
 
 static const struct aspeed_pin_group aspeed_g6_groups[] = {
-- 
2.20.1

