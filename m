Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC6984736
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 16:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XChSF1n9Gz2ynn
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 00:04:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727186667;
	cv=none; b=GEyArqeoFdAwReOH2Kx1OHoIl4wPwDveJPQZqFDwSm1qujr8R9LliZrSZX7c7CukMp+UzJAz2d08G+YzTim8O9r79HdEqzy4BgfyHl5wI9HRLeIkI1m04j8o0rTaM1Hr6LZQ7RfSz09p7Ax11HFg5UqzfsHgKSwDO3IOR07n6ZO3hF3eGsR/9uhrmWcpTGyfTGYx7c7/RSjKg1CpRjOf51pcEBt6Y0OgpES1uG7F5vU7MFBkiLu8Ue0TfHF9djkhEOq0/yxnwq3YPW+mFMi9aKJO1O/nbifHhC0wv+XgDNasuueVRqEfRs6kGnKtCNDqvJ4+UDWA7zWuwckDRLOUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727186667; c=relaxed/relaxed;
	bh=YJb8aZABYSBmntQ+6UkADO5FAAy4u7a9s+TPCadQ0vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VegQr02aaLX3zrrIqhN4y8gkZD8wzR3cuwhg0lJyIhUetywR1LhTK1K3kGDjCpgIN8CfZNFJfOUmE1kqg3a82DGgabK15bkzitHQw0WsQ0/j52Dlumu27zimASYR2Jphs60bwhlWxeM9THUCB1gt1H6ldsw7Lu5lCoqg5JPFRnp5/WxgbI3Rc8pZOLKZpWA788kxlm7sSp+LyT4GjM5NqR+fh/M1Dpo9fJEOvJGv7/76qE0fjWMfoi2VllLI6NKYNo85hLgC1OI0K806Y8I2QiTv4bfdK1t9vo3OPNaTL4KkqhzX6CY8nEFB9RCvknFEhlEJ77jFIGULP9GOWpECnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU6GXKHk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU6GXKHk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XChSB6xJcz2xdY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 00:04:26 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2055a3f80a4so34978005ad.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727186664; x=1727791464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJb8aZABYSBmntQ+6UkADO5FAAy4u7a9s+TPCadQ0vs=;
        b=bU6GXKHkda738qthd12Lao8Nmm7pDRh/1h6maO4z6CgCUAoARdr6wC3Nw18DnaMzz9
         0TMgzAO3OukJp84aN2S6qwTmWHdwDfZvU3F7R4DvF8EXlwWSt8YSY9homIjTWeW58A17
         3BIKvonrsvR+a2ZItXGstMC5ISRLga3vjM58UTy6jhXeCfcKX3E2sdVvbq7w6di0Hi+5
         VPbV29nlPUGeuaz7PJrmRoLX0Nhu46szCst//IL3Zn/8dELqFSJB35LrSRsYZqIv+Jr/
         aJyuqLN5zc085m0rLO7Ct/G7jIzyzqlhN98MeiUkV/jZ8/s+ovsXeN/jdj5UTWswNI/U
         pDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186664; x=1727791464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJb8aZABYSBmntQ+6UkADO5FAAy4u7a9s+TPCadQ0vs=;
        b=tOVYv5k+2e4P1FywlwOuBRa0gTjAqkxdla+7+mkmAvyKshK9Sqi/yvpKRSedQ2WaDx
         y47OQUcX8z3PHQSygWepPQxOzkVqj04SrpxcLJFfNNbtgqDPl8jc+jvX9AUrmNpKhdZI
         yoVrWajUngESIrwePHPgxfE4syoEx0d5OPP0ORtQnizro1aLVBROVaatnd6UR2aEqNia
         4OI2Cs3P2UnOzqS+YxB2q5z+QBpBq6YBIiE5lpILm9U3CsmJMVCB/KDQ8OqaynNeIgs7
         dYURAItl0fYjN9xU0i1qPHpJKYC3qtWmz+g+Ra32d15a5gwr4/uAIs75JYLjmt7YKpDn
         5lJA==
X-Forwarded-Encrypted: i=1; AJvYcCUgfaQcL1sBCXIqnFesGHtxkrW0DtdPhmxHGVlNXFWIagKju3JL96pHfKcgEfNvCzoT9a2REy7YV/ZreoQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0cloKUsmtXcvOUt5r3yw56OXLmW/5f5dOavZcqhl624Cz0xSG
	d9GoN9nnEsGjQFNOZYplVuhBHM3jZrwgIh4QDDQ1Oxg+tDb6GXqC
X-Google-Smtp-Source: AGHT+IEXdHTFlXFnRj377KtPfrX+3HJ7gnHzUxpEdufujqHROMYcYl3UGjRF7iJb1ZzzBRKU2AZZ4w==
X-Received: by 2002:a17:902:f68d:b0:206:ae88:417f with SMTP id d9443c01a7336-208d97f3346mr242164065ad.6.1727186664021;
        Tue, 24 Sep 2024 07:04:24 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1821f33sm10678895ad.219.2024.09.24.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:04:23 -0700 (PDT)
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
Subject: [PATCH v1 1/3] ARM: dts: aspeed: minerva: Revise the SGPIO line name
Date: Tue, 24 Sep 2024 22:02:13 +0800
Message-Id: <20240924140215.2484170-2-yangchen.openbmc@gmail.com>
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

Modify the SGPIO line names sent from the CMM CPLD in the DVT version and
map the blade and FCB numbers to match the silkscreen labels on the rack as
follows:

1. Change the compute blade numbering from 0-15 to 1-16.
2. Change the network blade numbering from 0-5 to 1-6.
3. Update the FCB numbering from TOP0/1, MID0/1, and BOT0/1 to FCB1-6.
4. Revise the SGPIO line name for DVT changed.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 110 +++++++++---------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 41e2246cfbd1..38eb42aaa98b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -627,7 +627,6 @@ &sgpiom0 {
 	gpio-line-names =
 	/*"input pin","output pin"*/
 	/*A0 - A7*/
-	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN_N",
 	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN_N",
 	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN_N",
 	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN_N",
@@ -635,8 +634,8 @@ &sgpiom0 {
 	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN_N",
 	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN_N",
 	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN_N",
-	/*B0 - B7*/
 	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN_N",
+	/*B0 - B7*/
 	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN_N",
 	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN_N",
 	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN_N",
@@ -644,80 +643,80 @@ &sgpiom0 {
 	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN_N",
 	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN_N",
 	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN_N",
+	"PRSNT_MTIA_BLADE16_N","PWREN_MTIA_BLADE16_EN_N",
 	/*C0 - C7*/
-	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN_N",
 	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN_N",
 	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN_N",
 	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN_N",
 	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN_N",
 	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN_N",
-	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN_N",
-	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN_N",
+	"PRSNT_NW_BLADE6_N","PWREN_NW_BLADE6_EN_N",
+	"PRSNT_FCB_1_N","PWREN_MTIA_BLADE1_HSC_EN_N",
+	"PRSNT_FCB_2_N","PWREN_MTIA_BLADE2_HSC_EN_N",
 	/*D0 - D7*/
-	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN_N",
-	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN_N",
-	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE4_HSC_EN_N",
-	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE5_HSC_EN_N",
-	"PWRGD_MTIA_BLADE0_PWROK_N","PWREN_MTIA_BLADE6_HSC_EN_N",
+	"PRSNT_FCB_3_N","PWREN_MTIA_BLADE3_HSC_EN_N",
+	"PRSNT_FCB_4_N","PWREN_MTIA_BLADE4_HSC_EN_N",
+	"PRSNT_FCB_6_N","PWREN_MTIA_BLADE5_HSC_EN_N",
+	"PRSNT_FCB_5_N","PWREN_MTIA_BLADE6_HSC_EN_N",
 	"PWRGD_MTIA_BLADE1_PWROK_N","PWREN_MTIA_BLADE7_HSC_EN_N",
 	"PWRGD_MTIA_BLADE2_PWROK_N","PWREN_MTIA_BLADE8_HSC_EN_N",
 	"PWRGD_MTIA_BLADE3_PWROK_N","PWREN_MTIA_BLADE9_HSC_EN_N",
-	/*E0 - E7*/
 	"PWRGD_MTIA_BLADE4_PWROK_N","PWREN_MTIA_BLADE10_HSC_EN_N",
+	/*E0 - E7*/
 	"PWRGD_MTIA_BLADE5_PWROK_N","PWREN_MTIA_BLADE11_HSC_EN_N",
 	"PWRGD_MTIA_BLADE6_PWROK_N","PWREN_MTIA_BLADE12_HSC_EN_N",
 	"PWRGD_MTIA_BLADE7_PWROK_N","PWREN_MTIA_BLADE13_HSC_EN_N",
 	"PWRGD_MTIA_BLADE8_PWROK_N","PWREN_MTIA_BLADE14_HSC_EN_N",
 	"PWRGD_MTIA_BLADE9_PWROK_N","PWREN_MTIA_BLADE15_HSC_EN_N",
-	"PWRGD_MTIA_BLADE10_PWROK_N","PWREN_NW_BLADE0_HSC_EN_N",
+	"PWRGD_MTIA_BLADE10_PWROK_N","PWREN_MTIA_BLADE16_HSC_EN_N",
 	"PWRGD_MTIA_BLADE11_PWROK_N","PWREN_NW_BLADE1_HSC_EN_N",
-	/*F0 - F7*/
 	"PWRGD_MTIA_BLADE12_PWROK_N","PWREN_NW_BLADE2_HSC_EN_N",
+	/*F0 - F7*/
 	"PWRGD_MTIA_BLADE13_PWROK_N","PWREN_NW_BLADE3_HSC_EN_N",
 	"PWRGD_MTIA_BLADE14_PWROK_N","PWREN_NW_BLADE4_HSC_EN_N",
 	"PWRGD_MTIA_BLADE15_PWROK_N","PWREN_NW_BLADE5_HSC_EN_N",
-	"PWRGD_NW_BLADE0_PWROK_N","PWREN_FCB_TOP_0_EN_N",
-	"PWRGD_NW_BLADE1_PWROK_N","PWREN_FCB_TOP_1_EN_N",
-	"PWRGD_NW_BLADE2_PWROK_N","PWREN_FCB_MIDDLE_0_EN_N",
-	"PWRGD_NW_BLADE3_PWROK_N","PWREN_FCB_MIDDLE_1_EN_N",
+	"PWRGD_MTIA_BLADE16_PWROK_N","PWREN_NW_BLADE6_HSC_EN_N",
+	"PWRGD_NW_BLADE1_PWROK_N","PWREN_SGPIO_FCB_2_EN_N",
+	"PWRGD_NW_BLADE2_PWROK_N","PWREN_SGPIO_FCB_1_EN_N",
+	"PWRGD_NW_BLADE3_PWROK_N","PWREN_SGPIO_FCB_4_EN_N",
+	"PWRGD_NW_BLADE4_PWROK_N","PWREN_SGPIO_FCB_3_EN_N",
 	/*G0 - G7*/
-	"PWRGD_NW_BLADE4_PWROK_N","PWREN_FCB_BOTTOM_1_EN_N",
-	"PWRGD_NW_BLADE5_PWROK_N","PWREN_FCB_BOTTOM_0_EN_N",
-	"PWRGD_FCB_TOP_0_PWROK_N","FM_CMM_AC_CYCLE_N",
-	"PWRGD_FCB_TOP_1_PWROK_N","MGMT_SFP_TX_DIS",
-	"PWRGD_FCB_MIDDLE_0_PWROK_N","FM_MDIO_SW_SEL",
-	"PWRGD_FCB_MIDDLE_1_PWROK_N","FM_P24V_SMPWR_EN",
-	"PWRGD_FCB_BOTTOM_1_PWROK_N","",
-	"PWRGD_FCB_BOTTOM_0_PWROK_N","",
+	"PWRGD_NW_BLADE5_PWROK_N","PWREN_SGPIO_FCB_5_EN_N",
+	"PWRGD_NW_BLADE6_PWROK_N","PWREN_SGPIO_FCB_6_EN_N",
+	"PWRGD_FCB_1","FM_BMC_RST_RTCRST_R",
+	"PWRGD_FCB_2","",
+	"PWRGD_FCB_3","FM_MDIO_SW_SEL",
+	"PWRGD_FCB_4","FM_P24V_SMPWR_EN",
+	"PWRGD_FCB_6","",
+	"PWRGD_FCB_5","",
 	/*H0 - H7*/
-	"LEAK_DETECT_MTIA_BLADE0_N","",
 	"LEAK_DETECT_MTIA_BLADE1_N","",
 	"LEAK_DETECT_MTIA_BLADE2_N","",
 	"LEAK_DETECT_MTIA_BLADE3_N","",
 	"LEAK_DETECT_MTIA_BLADE4_N","",
 	"LEAK_DETECT_MTIA_BLADE5_N","",
 	"LEAK_DETECT_MTIA_BLADE6_N","",
-	"LEAK_DETECT_MTIA_BLADE7_N","",
+	"LEAK_DETECT_MTIA_BLADE7_N","ERR_INJECT_CMM_PWR_FAIL_N",
+	"LEAK_DETECT_MTIA_BLADE8_N","",
 	/*I0 - I7*/
-	"LEAK_DETECT_MTIA_BLADE8_N","RST_I2CRST_FCB_BOTTOM_1_N",
-	"LEAK_DETECT_MTIA_BLADE9_N","RST_I2CRST_FCB_BOTTOM_0_N",
-	"LEAK_DETECT_MTIA_BLADE10_N","RST_I2CRST_FCB_MIDDLE_0_N",
-	"LEAK_DETECT_MTIA_BLADE11_N","RST_I2CRST_FCB_MIDDLE_1_N",
-	"LEAK_DETECT_MTIA_BLADE12_N","RST_I2CRST_FCB_TOP_0_N",
-	"LEAK_DETECT_MTIA_BLADE13_N","RST_I2CRST_FCB_TOP_1_N",
-	"LEAK_DETECT_MTIA_BLADE14_N","BMC_READY",
-	"LEAK_DETECT_MTIA_BLADE15_N","FM_88E6393X_BIN_UPDATE_EN_N",
+	"LEAK_DETECT_MTIA_BLADE9_N","RST_I2CRST_FCB_5_N",
+	"LEAK_DETECT_MTIA_BLADE10_N","RST_I2CRST_FCB_6_N",
+	"LEAK_DETECT_MTIA_BLADE11_N","RST_I2CRST_FCB_4_N",
+	"LEAK_DETECT_MTIA_BLADE12_N","RST_I2CRST_FCB_3_N",
+	"LEAK_DETECT_MTIA_BLADE13_N","RST_I2CRST_FCB_2_N",
+	"LEAK_DETECT_MTIA_BLADE14_N","RST_I2CRST_FCB_1_N",
+	"LEAK_DETECT_MTIA_BLADE15_N","BMC_READY",
+	"LEAK_DETECT_MTIA_BLADE16_N","FM_88E6393X_BIN_UPDATE_EN_N",
 	/*J0 - J7*/
-	"LEAK_DETECT_NW_BLADE0_N","WATER_VALVE_CLOSED_N",
-	"LEAK_DETECT_NW_BLADE1_N","",
+	"LEAK_DETECT_NW_BLADE1_N","WATER_VALVE_CLOSED_N",
 	"LEAK_DETECT_NW_BLADE2_N","",
 	"LEAK_DETECT_NW_BLADE3_N","",
 	"LEAK_DETECT_NW_BLADE4_N","",
 	"LEAK_DETECT_NW_BLADE5_N","",
-	"PWRGD_MTIA_BLADE0_HSC_PWROK_N","",
+	"LEAK_DETECT_NW_BLADE6_N","",
 	"PWRGD_MTIA_BLADE1_HSC_PWROK_N","",
-	/*K0 - K7*/
 	"PWRGD_MTIA_BLADE2_HSC_PWROK_N","",
+	/*K0 - K7*/
 	"PWRGD_MTIA_BLADE3_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE4_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE5_HSC_PWROK_N","",
@@ -725,49 +724,50 @@ &sgpiom0 {
 	"PWRGD_MTIA_BLADE7_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE8_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE9_HSC_PWROK_N","",
-	/*L0 - L7*/
 	"PWRGD_MTIA_BLADE10_HSC_PWROK_N","",
+	/*L0 - L7*/
 	"PWRGD_MTIA_BLADE11_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE12_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE13_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE14_HSC_PWROK_N","",
 	"PWRGD_MTIA_BLADE15_HSC_PWROK_N","",
-	"PWRGD_NW_BLADE0_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE16_HSC_PWROK_N","",
 	"PWRGD_NW_BLADE1_HSC_PWROK_N","",
-	/*M0 - M7*/
 	"PWRGD_NW_BLADE2_HSC_PWROK_N","",
+	/*M0 - M7*/
 	"PWRGD_NW_BLADE3_HSC_PWROK_N","",
 	"PWRGD_NW_BLADE4_HSC_PWROK_N","",
 	"PWRGD_NW_BLADE5_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE6_HSC_PWROK_N","",
 	"RPU_READY","",
 	"IT_GEAR_RPU_LINK_N","",
 	"IT_GEAR_LEAK","",
 	"WATER_VALVE_CLOSED_N","",
 	/*N0 - N7*/
-	"VALVE_STS0","",
-	"VALVE_STS1","",
-	"PCA9555_IRQ0_N","",
+	"VALVE_STATUS_0","",
+	"VALVE_STATUS_1","",
 	"PCA9555_IRQ1_N","",
+	"PCA9555_IRQ2_N","",
 	"CR_TOGGLE_BOOT_N","",
-	"IRQ_FCB_TOP0_N","",
-	"IRQ_FCB_TOP1_N","",
+	"IRQ_FCB_1_N","",
+	"IRQ_FCB_2_N","",
 	"CMM_CABLE_CARTRIDGE_PRSNT_BOT_N","",
 	/*O0 - O7*/
 	"CMM_CABLE_CARTRIDGE_PRSNT_TOP_N","",
 	"BOT_BCB_CABLE_PRSNT_N","",
 	"TOP_BCB_CABLE_PRSNT_N","",
-	"IRQ_FCB_MID0_N","",
-	"IRQ_FCB_MID1_N","",
+	"IRQ_FCB_3_N","",
+	"IRQ_FCB_4_N","",
 	"CHASSIS_LEAK0_DETECT_N","",
 	"CHASSIS_LEAK1_DETECT_N","",
-	"VALVE_RMON_A_1","",
+	"PCA9555_IRQ3_N","",
 	/*P0 - P7*/
-	"VALVE_RMON_A_2","",
-	"VALVE_RMON_B_1","",
-	"VALVE_RMON_B_2","",
+	"PCA9555_IRQ4_N","",
+	"PCA9555_IRQ5_N","",
+	"CMM_AC_PWR_BTN_N","",
 	"RPU_READY_SPARE","",
 	"IT_GEAR_LEAK_SPARE","",
 	"IT_GEAR_RPU_LINK_SPARE_N","",
-	"IRQ_FCB_BOT0_N","",
-	"IRQ_FCB_BOT0_N","";
+	"IRQ_FCB_6_N","",
+	"IRQ_FCB_5_N","";
 };
-- 
2.34.1

