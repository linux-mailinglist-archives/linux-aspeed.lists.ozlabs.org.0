Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1697D3F6
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 11:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97BW5W85z2yXd
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 19:58:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726826321;
	cv=none; b=n1/e0OAcCzsnv6VpZ8PV5paKbMysR+cXEjtaF+ca0C5bvRn2OVXbt6fzOzz0XFNHlrYUnVWy04abG+qEop4d4EjmaIHb4cPvq07RjulcLmdRmI6zCNtR5SB/cSkNYuExBxZtfwJWwiQ+wrrPuPeBReStz+3FDsa14L0iAYr1yW9se9g1HDxWe+sOX7Ia+RqhMcPhls12PJf4NTOVNDBDgijyY4IB5uXiJJW45z+O6dtyCLRn47IJeTz8mJ3ao2dCJtalyUDLrjinlbCqSfzXMlNtQQNpcJBGTeBMFTzD+i2HKigmnSw0z0CY0D6VVCeaY/Yi1ZavEmoRcqVSWh217w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726826321; c=relaxed/relaxed;
	bh=krJa0YHzRYesDBmJ71AnWCcrG4bSU9zriTKtOU/d2KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GJPPjnYy8JfwlSTttj/pky+0hXAm4A9suoBAzfXh3uA0mYL9fExUnR4mzOTirVGoezAynNh+qtsrlgDo3d31Rp9V+PN1JC5CaIusdljUjya10wppdCYZrkzPU3TsaBMpqxw8WdR4VyFmSvEKCd5RHsHgDMs3KozQaYwNQXhGuOnqqBfB73do6gnmkNZunJlVBXyzzvCEKt3iUD8riT2WNZVQJtW2CfI7tpH7xgjaVBOM/s6u5MK82u3K3oCmi9MXaTzP/JpudY6100oRqmwb1j9CImgTyla/6A1jVBAjLVd0igNN+06bLYBbxmKee3sUOCY4qrWKtsCB79R36L1zKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y7GTizDm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y7GTizDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97BS49nxz2xHW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 19:58:39 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20551e2f1f8so21918475ad.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726826315; x=1727431115; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krJa0YHzRYesDBmJ71AnWCcrG4bSU9zriTKtOU/d2KE=;
        b=Y7GTizDm9pxnotCFAnz0pDRdJrBqB3UeHOBWPQGc49zT5OLl0Hrke+jqJkvg1e5g9y
         EEUm/s7UnXKu+j+L+orXZDFxkRjGp4srTob2gprTrcmX9UhDvBT/3gin3kMr7GWKkE9m
         Qbksz67VFdHq4+XMeGTGGhONyOBz4ZB9ph2HGeVNaVDBBGhzZ9R4uKiX1PPCujAFnYrJ
         YMXCfS2oatBNMPZnD8hmUtk3f70+W94vBrJZyTk0mN4IKOTOOBbt5EV18ejpx56XeMTQ
         ogH6XF9Vv6stpea2oJXxK0/pK4O0ynyyPZsjcUF7YjJHtnwayRjvCbliy50OLfPc0VcO
         obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726826315; x=1727431115;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krJa0YHzRYesDBmJ71AnWCcrG4bSU9zriTKtOU/d2KE=;
        b=tRQts66cqtbQOpRMZoa2PmQrp3if5YenKF1GA/JLjbdZ4iWf9EXZ/fiWddExdgJUM6
         4hYOJMP/Q1wBx7uN5zEBk3aBbIR8JYp8YJuZl7zgsmckk+yOI+OIoTHNpy0qhagJPOvd
         EqIMEONj5+kS8Icl8w14erIzQhKI0W1OT+pf7aWcixJisElQ/Vn2kmXz2vRP0kKO4X9A
         c6uTn8DzilgfTYbnlHbERb6WcDBlzMRIr7QwEeLv6X5C/+xOuilzmaH0K8aoGWyIIaQ+
         VzFxjOgrc4XfC5Y+QLqpFrejRdKp0O7OCpWBiGOaGsE8oNru782Qb0zkL8/CWlTdi2Jl
         E0mw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHvOle5i116BoWyurvIu8OyHClF9xjT29rzyXcNqP3+6YJ9wwtToit/5hA9kq9EEXQx79THBKtPIJrcI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUHk1leEbfU1SBEqT92khA3ThEaZvDdFvznTaAB2tS3MFbd5aG
	PToabtH+brqq6wC5ucVR8P0NWoRHZeQifUK5pFBlHtgm6xAdoUdz
X-Google-Smtp-Source: AGHT+IE9C39w5Iba/YHQXZXIMA8mOji+ut7xuUk6fgcjEZj2VVfu1BCkhcqolvGF9lg8xcaB5dYOpA==
X-Received: by 2002:a17:902:e888:b0:205:8407:6321 with SMTP id d9443c01a7336-208d833b333mr35304595ad.9.1726826315420;
        Fri, 20 Sep 2024 02:58:35 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794767891sm91909615ad.300.2024.09.20.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 02:58:35 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 20 Sep 2024 17:55:52 +0800
Subject: [PATCH] ARM: dts: aspeed: catalina: add i2c-mux-idle-disconnect to
 all mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-catalina-i2c-mux-fix-2-v1-1-66cce7c54188@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKdG7WYC/x2MSQqAMAwAvyI5G6hB3L4iHkKNGtAqrYpQ/LvF4
 zDMRAjiVQJ0WQQvtwbdXYIiz8Au7GZBHRMDGSpNSwYtn7yqY1SyuF0PTvogYTXasmmoZjIMKT6
 8JPGP++F9PxaCMxBoAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726826312; l=2479;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=88gDVpnA6PhWT5LuFMIcdjhzh9mXo979fV+FwMxeJSs=;
 b=RKgxX3dZqhkSkyCu75khWXpwggC3ECCrTel6ZpW5RF7y7Bz1hO3BitmgqL/Wfc6DGzusH8C1N
 Ng6yO4CLdJzBDWeRFQZM5aTBOna40W/Bsp0x5Man2zawENBRxcR1y4J
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the `i2c-mux-idle-disconnect` property to all i2c-mux nodes to
ensure proper behavior when switching between multiple I2C buses.
This avoids potential confusion caused by device addresses appearing on
multiple buses when they are not actively selected.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Add the i2c-mux-idle-disconnect property to all i2c-mux nodes to
ensure proper behavior when switching between multiple I2C buses.
This avoids potential confusion caused by device addresses appearing on
multiple buses when they are not actively selected.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 82835e96317d..fa0921a4afe2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -185,6 +185,7 @@ i2c-mux@71 {
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
@@ -213,6 +214,7 @@ i2c-mux@72 {
 		reg = <0x72>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux1ch0: i2c@0 {
 			#address-cells = <1>;
@@ -247,6 +249,7 @@ i2c-mux@70 {
 				reg = <0x70>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
 
 				i2c30mux0ch0: i2c@0 {
 					#address-cells = <1>;
@@ -328,6 +331,7 @@ i2c-mux@73 {
 		reg = <0x73>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux2ch0: i2c@0 {
 			#address-cells = <1>;
@@ -356,6 +360,7 @@ i2c-mux@75 {
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
@@ -384,6 +389,7 @@ i2c-mux@76 {
 		reg = <0x76>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux4ch0: i2c@0 {
 			#address-cells = <1>;
@@ -426,6 +432,7 @@ i2c-mux@77 {
 		reg = <0x77>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c0mux5ch0: i2c@0 {
 			#address-cells = <1>;

---
base-commit: baeb9a7d8b60b021d907127509c44507539c15e5
change-id: 20240920-catalina-i2c-mux-fix-2-6dc48827a20a

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

