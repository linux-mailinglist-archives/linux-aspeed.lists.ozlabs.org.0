Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE462965CAA
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 11:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwCQC52Lqz30V7
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 19:24:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725009840;
	cv=none; b=TBQPUpJ5gnRnV80GVlxqi42bNnBJaTWgcIcMpK3u5URZrk3uWfsqzTGrscQArO6YLqIFBg+DaatRuWRXAj1vg4XMtzemy08nQbTcPMpIXprPeNFIMgpJAD49RG9gYpe5pphp8HapnYzmjN6yYH37QoD15KSFMHoTHL6vxtFb0bM6l/Eavf/NjZKl0LaDJoM/2N07XxGpuY+tfY71wbLH+10SlkkXxV/LFNwUOyqVVfzhnSa2MvHjUNmNqtOWsKDQKhKBttM2XBpiEYgGrTxxU362OqoV2DgdZw2DqQhtAIP5GKeTAcXYE2X6kMQjmlDj3s8Kqjolz0y6Ntkfsx9mPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725009840; c=relaxed/relaxed;
	bh=2qJ5H4TeLGmSdfoWP7b3jAie759gREUlRrWmjjXFdQw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=fU+ZxxuJ64NdAofitz4SXngNUzVoBjzY7OL3PkMZaY1n02XC/JWx+ZAKbI1jYm2Lw3KnAyUwIGP1pnNVbDg9M63TDWbBlC+j9ShJbTGtrxYGA8axtBSAnmZfdZsT54HOnKg0tv6uUFkKEPSBWM2N+S3ZF+KcVUUpsHqi792+Boo8PphwhLiTJ3QpYeczDp/i85Wc0FWHVaB5zPdS+KO0cnkIOB0pA6G2nC5A/OkxfSm6444i33z51PWDx068zcfJ+LIo2TKW9CH40cmCr1CDklyvDZZ5cl8cAOcQ4OQNGJRIcNhmWmEaTLBW/ImFKyKRsQIXGTMWARzOX3ki5mOq+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OT+5sQbH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OT+5sQbH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwCQ82blyz307f
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 19:24:00 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3df121f7088so365452b6e.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725009837; x=1725614637; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qJ5H4TeLGmSdfoWP7b3jAie759gREUlRrWmjjXFdQw=;
        b=OT+5sQbHdnUUU3twB7b+eyxejw3Ig5hMBdiuqc3JHRgEQiExpRcMoCHc8uxFmYwyPa
         sqUIIlAciNFvVqbunAeVA0GopGTlKJT43pqzK7W+hw67bBVvhES+b8YF2TqvfOk12AKl
         8J1V1Jic8NU3By/j9ZVubg8umIyWF9PVesx+sCOrQIRSXW0mVMCgNgIGRqURoHAOjmvr
         x87GX4/g6WxW6ZbCfy5wqWaymSXINIQddsxn0SszHuS9I3aMVLa5nyba3rVtnXN72U5g
         JC33yvDfqaEWqS0hjscMlVjJ7yyA0fOemCvJTeNvNNlP05EMoI1oeIuKDBvQIKlxs1Q4
         a74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009837; x=1725614637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qJ5H4TeLGmSdfoWP7b3jAie759gREUlRrWmjjXFdQw=;
        b=pJ4hKXqG3TAPYzcACe66o2ubU6N0FQanQlGsMBgaqwrKgjgpaML6bHLl3noL6mZbHl
         hBaTz4wkASu05X10dFAhY1STlpTD6lmMGBpWPYPlxNpv36xqQYCpFIm93QUFI3L5QaZ3
         JL5myWcbpfXq2XnH0n9OvM3HLZ56QMgNTZwOjy4G5QsFyb7rGDk5EteGO4hynRR/FeA2
         ial45mH60eNJy4p1RArX6kiF/3A51OHB0ATw2bJCNbfyIekkU1BKaX4FbQ78daEnuVrB
         U3l3P693ssLrGWISGGXDBBqCXxQgjTIwrHYuVFQJ9+z61Skg5o4CVEqX01x0EG/DV9Ej
         COnw==
X-Forwarded-Encrypted: i=1; AJvYcCUjKrG4v7Sii0rDsnmcsfFuqZJjLzfLTQdFxlEsN8sgPQf9DnHjDGjA4YL8Fz8VWTYS9GK4QyIBTAYj4Jw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN7/X6LBZal9GHdUzTT3fCSFiqVmjNhBqtEjKvH5i73AIbp5ft
	Fpn/WSE5TYMTjH8EyjfcDvaEM/iVzO/nfImj/4cSAz1Ld31121qU
X-Google-Smtp-Source: AGHT+IFM1tLoimDRFy3xRY0N39UW6MPxB6ovxXNeLIg6sw1fC7i7BPyaqG7A6GRFXJb8TCfCa6tCXQ==
X-Received: by 2002:a05:6808:178c:b0:3db:2070:909d with SMTP id 5614622812f47-3df05d7b3bdmr6260766b6e.19.1725009837322;
        Fri, 30 Aug 2024 02:23:57 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e66d8f4sm2566744a12.0.2024.08.30.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:23:56 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Harma: update sgpio line name
Date: Fri, 30 Aug 2024 17:21:47 +0800
Message-Id: <20240830092148.1574520-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830092148.1574520-1-peteryin.openbmc@gmail.com>
References: <20240830092148.1574520-1-peteryin.openbmc@gmail.com>
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

power-card-enable
uart-switch-button
power-fault-n
asic0-card-type-detection0-n
asic0-card-type-detection1-n
asic0-card-type-detection2-n
uart-switch-lsb
uart-switch-msb
presence-cmm

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 32 ++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 92068c65eae4..5440181730f6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -393,12 +393,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// PTTV FRU
@@ -422,12 +416,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// Aegis FRU
@@ -566,7 +554,7 @@ &gpio0 {
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
 	/*C0-C7*/	"reset-cause-platrst","","","","",
-			"cpu0-err-alert","","",
+			"cpu0-err-alert","power-card-enable","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -585,7 +573,9 @@ &gpio0 {
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
@@ -673,7 +663,7 @@ &sgpiom0 {
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
 	"","uart-control-buffer-select",
-	"","ac-control-n",
+	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
 	"FM_CPU_CORETYPE1","",
@@ -685,7 +675,7 @@ &sgpiom0 {
 	"FM_BOARD_REV_ID2","",
 	"FM_BOARD_REV_ID1","",
 	/*H0-H3 line 112-119*/
-	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
 	"","","","","","",
 	/*H4-H7 line 120-127*/
 	"","",
@@ -716,9 +706,15 @@ &sgpiom0 {
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

