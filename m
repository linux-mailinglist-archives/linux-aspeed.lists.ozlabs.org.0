Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF16412DFD
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Sep 2021 06:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD7yM6rWkz2yK6
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Sep 2021 14:40:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=R0T9Pb5S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cP6M/PE0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=R0T9Pb5S; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cP6M/PE0; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD7yJ1RPLz2yZv
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Sep 2021 14:40:08 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id BC2DB2B01433;
 Tue, 21 Sep 2021 00:40:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 21 Sep 2021 00:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UMFOw7vbwhDOl
 T/6/dntbRu7oRn9RKWKLkg+EamTaYY=; b=R0T9Pb5SZ+4yxZc07SWcc2cgpW4Ei
 GjRBNl5luMuLSwhYzK0M6b4O289/LCQp1YHlC1W2v3LQddoi8xObda/Y2niNBp5V
 49NjstgoULPBXBGG4raqp7ZGi0WOLB1QinMIJjco4FEPiQF23tX8AYBU4uHqbJ+V
 Y7OOMrRJybrTUutdYNN/Eha1NPKA3wCLg1S3Va8/7VPH8lv9rjrZpIZILWWAyGyq
 deFa4Sfrt0hUTPR7xAX9m7Oi+wWq8j1wzQHa1sHU+byowM/jhZbmkjx9/Ix94rmt
 joVqLmpMmure/uZsOj4Iinzxj9oWVG0iajwAwh7GblgnhjowH+QI43mXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UMFOw7vbwhDOlT/6/dntbRu7oRn9RKWKLkg+EamTaYY=; b=cP6M/PE0
 +9ReKlONMlBaU4X07LBpC8imUWgWAK9IG8zLrxXudSrHJyk45CWJJlIC6GSTheja
 ILwrsx2fV+f2rYMMOyHJ/9iXEA/eCs1AA8ENhiktkJJOTtY8E913vz0FPJr4lOl/
 3doxcADRUGKCz5fSN6pmRs0NKFdHEYKkeT6vCEqZzIhhR6xRprclTwjyc2+fgq6k
 FulVx6ZayP7FhtrjdAdAL+swUjsFq9ok9fLko7cXdRO5brAGvPuDb9c1eFuvg/HQ
 0NuaOs8FZwZtDRDDln1CWHFlh44+zdDWe5C1YMIDFx33lFm4IkvIBPFM5cbln/n9
 k1+IDCcCYiervw==
X-ME-Sender: <xms:JGJJYb_Kwwv4eSON9kMtZgL4XlO-k9KVjFA_GBxA6jJ01IpFYnmH8A>
 <xme:JGJJYXsJj7z-thxhTufz1LOe7G4gqyNLBLpOlvOVa3dlVTpq6FKsfcxWfysznQq6y
 Z61OWF52fJiVH92Wg>
X-ME-Received: <xmr:JGJJYZDjLyqMOsUmLsVP-bZxEwfwyqCiOUgn_vPs0C2tlEw-F1EMtOrlHC6wohm4R1qxsmtqtr15XD4WEdX2Ba-2G0ojaEGW0-sVbajYiwWqd9_Mi405OPIWCU4n8GKu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JGJJYXeweurpS3bg_med2GjX-hkOd-RGQsVJNTqGMedrftvykvTqqg>
 <xmx:JGJJYQPRvyyFL5x-W5q3xP66PldTCvNzinPdpqwjbXtybc0BK96Gng>
 <xmx:JGJJYZlMHy0zp36jc4j0EfiL5s4e_GTiTlg7dWVrymXEF0rJmFgYig>
 <xmx:JWJJYRGqGEJw5XxS3fK35STFU730lNNhdDrCFz2M23SRYMA6N5UKk0Q-e2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Sep 2021 00:40:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] leds: pca955x: Allow zero LEDs to be specified
Date: Tue, 21 Sep 2021 14:09:36 +0930
Message-Id: <20210921043936.468001-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
References: <20210921043936.468001-1-andrew@aj.id.au>
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
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, clg@kaod.org, pavel@ucw.cz,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

It's valid to use the PCA955x devices just for GPIOs and not for LEDs.
In this case, as PCA955X_TYPE_GPIO is now equivalent to
PCA955X_TYPE_NONE, remove the test for whether we have any child nodes
specified in the devicetree.

A consequence of this is it's now possible to bind the driver to a
PCA955x device when dynamically instantiated through the I2C subsystem's
`new_device` interface.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 77c0f461ab95..81aaf21212d7 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -429,7 +429,7 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 	int count;
 
 	count = device_get_child_node_count(&client->dev);
-	if (!count || count > chip->bits)
+	if (count > chip->bits)
 		return ERR_PTR(-ENODEV);
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-- 
2.30.2

