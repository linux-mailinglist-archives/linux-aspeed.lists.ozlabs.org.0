Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F995848C
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 12:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp5NN3QnYz2yVt
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 20:31:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X5VLo7Sd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp5NL6qjGz2yDj
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 20:31:14 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-201fbd0d7c2so33198865ad.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724149873; x=1724754673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTyPLFrq0EUm/GtouTOsZKz2XgR6IlJiL/XQEMTvFnc=;
        b=X5VLo7SdoFmQ6JXXxn4Wkk7UlrRw4CKZXeLYrB0SzC9jPkD59u8GNTO7bpwVaFmqDz
         FzdbIFK0jk4sO7XeoQNYSI1Od5lXnmuwfs2klGJGt1BHQZ5+kmlE75GOq/xI0qXQtvDv
         /3cAqjrrsxUVOzQ4x4SSYBL17M5Of9VSrdh2mCF+vh9+UjV7p1Q7kG1yzfqHb13uug1V
         Ol0HP8kPwa8rDy2j3wRmbjOJMRfudG0FneDejNPo4JsI/8tIMHxeU5vosxfOpzeHOq+t
         u7ktZ/d/2lvNLBqK4am8tnxNnviv0OHJDCIcB+5ArOm2038vxNIt7d/qUq4pfcsS9HZv
         VUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149873; x=1724754673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTyPLFrq0EUm/GtouTOsZKz2XgR6IlJiL/XQEMTvFnc=;
        b=wxjgjp/cSRiyyNIWyT0cs5XKm0EQF00hh3TtATRfuwlu6IKZIikLV0JJMfXq5jjK+E
         +66+DyppSXHA/+2PhYK5XA6pl7/ZmoiWG2FoLxDW9Lbot/kEccy3Lm3H7bPMRu1SJyUX
         9X1IosKEwJZ99MiU1z6/4QMDx+2r7y9P5wXDzQ16WRrdwvsSoYBp+ie3lkgyyvWYKMF6
         dUevpDyHCJkzZMFP23vqoEVNbYEROgWRoyR8XQv2xGtHfnSQU5TdaGNRC0wQXeHk2sRR
         FJY8jeBUojM5s5vYXjaJoYIfiTBpKfD/r/rFKmLxU/7D3xnYodJLdVwzmdW1Xc03Aw/N
         o3qg==
X-Forwarded-Encrypted: i=1; AJvYcCVELu4HPxmgKKe7J6O3bBYHQ9xVvmENywJ2DDXFKnmeBSaRZ/xsWiHCXdRR90YXYLtniUbSR+A6pFFQgATShJA+BvWdff+OGrGiMvet1A==
X-Gm-Message-State: AOJu0YxQuXg8WTiUw/lFtk7TulufkTybP10xSAAFriXy/RKqUiLlOXNh
	9j/J9qdPh55ES4ulc/hithHtjRUOZ7sEeF1tMHXtPSGOUjOm2iKJ
X-Google-Smtp-Source: AGHT+IF28HPdbzKluxqfocEuK8zyLeXo+mM26BKkQHj+7PAhu+8wajGr/92NbNQoZbYgiqDyMz8AKg==
X-Received: by 2002:a17:902:ea0a:b0:202:32cf:5dbe with SMTP id d9443c01a7336-20232cf5e3emr64763775ad.58.1724149873281;
        Tue, 20 Aug 2024 03:31:13 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02faa5dsm75444115ad.2.2024.08.20.03.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:31:12 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: aspeed: Harma: update sgpio line name
Date: Tue, 20 Aug 2024 18:29:03 +0800
Message-Id: <20240820102904.1756785-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
References: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Peter Yin <peter.yin@quantatw.com>

power-card-enable
uart-switch-button
power-fault-n
asic0-card-type-detection0-n
asic0-card-type-detection1-n
asic0-card-type-detection2-n
uart-switch-lsb
uart-switch-msb

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts   | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 92068c65eae4..9db95a791128 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -566,7 +566,7 @@ &gpio0 {
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
 	/*C0-C7*/	"reset-cause-platrst","","","","",
-			"cpu0-err-alert","","",
+			"cpu0-err-alert","power-card-enable","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -585,7 +585,9 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"power-button","power-host-control",
 			"reset-button","","led-power","","","",
-	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
+	/*Q0-Q7*/
+			"","","","",
+			"","power-chassis-control","","uart-switch-button",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
@@ -685,7 +687,7 @@ &sgpiom0 {
 	"FM_BOARD_REV_ID2","",
 	"FM_BOARD_REV_ID1","",
 	/*H0-H3 line 112-119*/
-	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
 	"","","","","","",
 	/*H4-H7 line 120-127*/
 	"","",
@@ -716,9 +718,15 @@ &sgpiom0 {
 	"cpu0-thermtrip-alert","",
 	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"pvdd11-ocp-alert","","","","","","","",
+	"pvdd11-ocp-alert","",
+	"power-fault-n","",
+	"asic0-card-type-detection0-n","",
+	"asic0-card-type-detection1-n","",
 	/*M0-M3 line 192-199*/
-	"","","","","","","","",
+	"asic0-card-type-detection2-n","",
+	"uart-switch-lsb","",
+	"uart-switch-msb","",
+	"","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
-- 
2.25.1

