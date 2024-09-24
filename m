Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE46984737
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 16:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XChSJ3vHBz2ywM
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 00:04:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727186669;
	cv=none; b=K2cQfsBctJrOPa0Sg9hE7i7VQJ9jlzzTAsttIF98NBG/lcLrGzRyqG6gy8RqFGuw3p1I3S2TIq803ZpDNLnn5JR3I7Pss17KeuNknHp8CXF89bV3ugtebWDdjxuAEDTfkYv+tGUM8O+hFsC1oO5S7Nhh/Qh63ZqGOzP3o9svXo0MJyKHbWoLy9qh1ZuuV4JrrOSag+KxeYU2wsg0xAA/ux3LPn5Ojl/+VfOcOn0AaFmVkGffTkSeWXyO+v2RCL9V17YgVoRJnt4gWOJfpTZjg21sVTh+EDtewOcBItxyRNfVSLv6VFUXMDRJwIDzULW+dtCdAdjaZDleGGpRAM/FOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727186669; c=relaxed/relaxed;
	bh=t41RrvA9ibashCj3l3oDsqUmb7XQG+ol4j0yx1LSoJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3oSDycg1kVMHQqto6UMfOqfM2yFn8xOFK3thkqkhtsQ/gQP2auannbUjrxBVLezlI3kEapCKLcmQz/aLGb0aBGWYjItHpbxLSxNTIlQI7ZypUT72L+IDAQL2QsgG+dRTvZwpSpHRui6Gh9RJ9n5+TGsgTwFgg6yzVmlFiLqXL2L1oOtplSGyJ/uHwHwLS5K+UAxkmYw3OJuJ1P35j/62l4SDrKJcYwjAx2MicUgAh73TVNuYNzaDK2fITCBe1mVtlZwUvbzWtvk0wXyS9jlUVNK+CgHlXbcQZh4tFFpGezD4io4SrhqCxWa8THVWqVJIgJk0BeM/bbSc5Qf0h6BDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MyrIa672; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MyrIa672;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XChSF3HlZz2yGX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 00:04:29 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20688fbaeafso59384175ad.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727186667; x=1727791467; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t41RrvA9ibashCj3l3oDsqUmb7XQG+ol4j0yx1LSoJs=;
        b=MyrIa672L+EHxhME531I4KKSL1uDriqJU2ESJLknEW7oaLeIenV2A5Gje3z2kfOFme
         7IXRvmIEyiywobKvHt+O92YD0/DN0fbHHusBFcWsAIp7AGa1iUrGxQTURXjSk8zB3Jvh
         51RFPaVus8NZT9mXXY+gfXNC19uac3PdRVw2KAEc3DIZkN4Nbf3KR21bemVGm227Pxse
         rmrcPBgLT+9fbFzr75n8zdQl1oaUgn39jq2WLT2Xa+K7DhHAbyD35G21hi/0X2TTetXE
         +jOa89p7dakhMK7mgUET6eXaD4GA4V0WHyVuqA1Ry3bkoH5WazxicvE9XYG28ZoPY9eT
         T3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186667; x=1727791467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t41RrvA9ibashCj3l3oDsqUmb7XQG+ol4j0yx1LSoJs=;
        b=kKabEgGESbAassSZkeEY5Z1UsggCBWP6cMRbNpbiMLBJTYye4RFsTcNcAWdGIZNBbC
         UQ3GNRoaR086j5WYgFrxKKhvgskOIBipfpejlQb/WaZopGGJUL5tjzPVmdEnLnkEb8HM
         LIPM6CHqH9VH237No1uJuIMrVacY4gjkQGcclVHa06UUwKNmG+22tRTMz1TepgFSq5Ud
         xUjs4XqpMmIEHZY97VanzVHHgR0zllIA5LHe7z5WWFWw1RfkHbRomZDQuFimhSg9SH//
         RcZzPbSx0g6izNzANJH6nV9o6WRyACH9og+1mvdk/yiJvgsBt75l4rtQJKspuv7CZa7E
         KdNg==
X-Forwarded-Encrypted: i=1; AJvYcCXImTYINAwpr3qGgrgzGuPZnQ+HvN9ngUKyivEijZ/LVQSFM/B1JimKrJD0Q+TvYakYzJNyy8B/4Agl5Zw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxaafi8IbTBM5AdNXUKPyY/ClG/1uQcurzK3sX4mIYOuSDSDFZx
	W6Ibve14ocUsqkozrElQKef+1VifbTj8KfNY1qBQx6Wyfh+b3xEx
X-Google-Smtp-Source: AGHT+IHnzkG8P7QQgG9rKuqx66HrjkDX9178ig3DFr0CaK8vzpF07XzLy0C6tKxwVlqORq0CLbLAzQ==
X-Received: by 2002:a17:902:d4d2:b0:207:3a4a:de43 with SMTP id d9443c01a7336-208d83c8114mr188656825ad.34.1727186666859;
        Tue, 24 Sep 2024 07:04:26 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1821f33sm10678895ad.219.2024.09.24.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:04:26 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Subject: [PATCH v1 2/3] ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
Date: Tue, 24 Sep 2024 22:02:14 +0800
Message-Id: <20240924140215.2484170-3-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924140215.2484170-1-yangchen.openbmc@gmail.com>
References: <20240924140215.2484170-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Change the i2c mux channel to match the correct fan board location.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 38eb42aaa98b..c915db28a806 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -213,10 +213,11 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
 
-		imux16: i2c@0 {
+		// FCB 1
+		imux16: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0>;
+			reg = <1>;
 
 			eeprom@50 {
 				compatible = "atmel,24c128";
@@ -259,11 +260,11 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
-
-		imux17: i2c@1 {
+		// FCB 2
+		imux17: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <1>;
+			reg = <0>;
 
 			eeprom@50 {
 				compatible = "atmel,24c128";
@@ -306,11 +307,11 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
-
-		imux18: i2c@2 {
+		// FCB 3
+		imux18: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <2>;
+			reg = <3>;
 
 			eeprom@50 {
 				compatible = "atmel,24c128";
@@ -353,11 +354,11 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
-
-		imux19: i2c@3 {
+		// FCB 4
+		imux19: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <3>;
+			reg = <2>;
 
 			eeprom@50 {
 				compatible = "atmel,24c128";
@@ -400,8 +401,8 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
-
-		imux20: i2c@5 {
+		// FCB 5
+		imux20: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -446,8 +447,8 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
-
-		imux21: i2c@4 {
+		// FCB 6
+		imux21: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-- 
2.34.1

