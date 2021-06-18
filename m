Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504F3AC30D
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 08:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5pJM5FhVz3bxj
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 16:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=gHnChd0A;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JtppSal1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=gHnChd0A; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JtppSal1; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5pJD0TPKz3bvv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Jun 2021 16:03:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F2BB5C0138;
 Fri, 18 Jun 2021 02:03:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Jun 2021 02:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=rFN1Isa+gtwR+R9fDmDDjGykid
 10VpuGsivirIWLYTc=; b=gHnChd0AppeS/zLSfPThfZJ8XJ3JOHpVGyw76G9LgZ
 zX7DQiFiFVR+iRxruvwLMNIu7BcaBai1LwdSz2v9JD5GQAIJ2iK+dPGKcdo+sb/D
 7cNRZPRIRFuKFsTwtk8bLNvL+9/2EvprhyTS81vQL2CwRV9PfkOu6Q8Whd/tH4A3
 ivf70XYcK+QD2EryLoeHIqnaPhzxCKeJBsEYCtqK5Jy59ubt4SfBSmtVV/aiWrZV
 qF9806UiM1yINbvT5xTJ6x6ZJR1uD9Lsf0ZQcUhTb9FnGvyxERA3CrBmhnLsDxLw
 FH4IDBBjcgvMPVqGNNz5r7Y1eM5YYb5s2L2kLfcjfxCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rFN1Isa+gtwR+R9fD
 mDDjGykid10VpuGsivirIWLYTc=; b=JtppSal1I0GnycNhJdo/PhzOn8h6ZFFBD
 nLhZjKw1UqWNdhA5idN4L/11bOsJ0+2PiU0NQ74XISYwoSC0cJblfxK85O+C7xSc
 ABryj8L28vRjI7Ytx2dKqdtUzikxn9/nJ1+Pg4L377oKx7Pr8wE1FVG+a7G0VaST
 JdqIK6y3eJsWCcKxSlh+52aem+MPDcQ1wlExAQQHs9yQrGPetLjv/4zW4InATC4W
 AfzBpAWuuUBoRatFo6EHf7JSgXSoYxZu6/EP3aUV5kC5SWvvAIDW0hqTSt2TLCus
 hTzmpljlXHMjTNPwN4Wp/NMC+iEIaKmJe9z6tFGWYSgKhuWXOo5BQ==
X-ME-Sender: <xms:JjfMYIp4o58s19lHc2EQRVdNN2OdW6XKqdJZUQkjjlcP8Ca89bekPg>
 <xme:JjfMYOpqFOo8AvIwK9pTSZEQbE9ZN8aN1ki8r4zA5H0Spoc3IvT9k4dcQKfdXvHIx
 yU9ibDyAZ6b9nk1SA>
X-ME-Received: <xmr:JjfMYNMZ2HUbGkVUb5lYmyKKGbUxWBkxLYBlRahSMkkLElo-UiTXhR6wu4rxxMgMIKvCZpVEFJMJS_UHqLibAeOB9_CE1hYbPDXrtsnMtKvtwgaTw5h_3_CR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JjfMYP78nWFeeCR1CwsUxcE5UeRLRdVpgaUP-Yof5kYo5mTZQOaB2g>
 <xmx:JjfMYH6w_DtttQp7toWUqC4FzzbN323B46-uCLPDMu792YREYNy9Lg>
 <xmx:JjfMYPj1NgpwO5wx15u8FZv4DbpUxAPZe4iR7oEifJ6WLbY3kAQrvg>
 <xmx:JzfMYK3Qgsnsdc5-eSNAQo24c5QBg4DOZnDzq_Zk__c_ywESKiybuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jun 2021 02:03:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH] ARM: dts: rainier: Enable KCS channels 2 and 3
Date: Fri, 18 Jun 2021 15:33:05 +0930
Message-Id: <20210618060305.4031224-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

KCS 2 and 3 are used as out-of-band signalling channels between the host
and the BMC on the Rainier platform.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 941c0489479a..38aad878d482 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1780,3 +1780,14 @@ &xdma {
 	status = "okay";
 	memory-region = <&vga_memory>;
 };
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.30.2

