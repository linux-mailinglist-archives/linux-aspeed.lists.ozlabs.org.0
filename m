Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B832980E546
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:55:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TwAWIQi9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9rT1rPhz3cJW
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:55:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TwAWIQi9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qx3t9jz3c8W
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:37 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-286f8ee27aeso5568495a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367675; x=1702972475; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFRZUoAD4VFKEOVifbbDQ7RKmVNtR05fvh+zOM0+EOs=;
        b=TwAWIQi9qY4aS+VHRlLFA81trMjf/tFrIbYld6dLAH46mXoFY5XYI8xSoJuRg1KZq9
         FJghXdQj0+MynxWgQsuh8Qy+I6t+GDDFrgf4XfIu1/Fze0o7TuriTBjkAs7oczzj7ABQ
         K9tUSekF8T5NTZoDva0TwLep1pVDtx/t/Ul/i3Ljrjw1+R/Zj/ElWSp57LlSDGgTbTeU
         0IUSKATvfmnAvGBx71ZDRaj2uCsVj6d7aOjg1zoUcmRQhclYe0mnI3bbinD8u9qAvpFu
         pKDgNy3bCoj0VfGlCVEcAdaJ5+UxBwMn6g5T768VB08Y3g7v3wrpExHIGegjxiA/ql5N
         6hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367675; x=1702972475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFRZUoAD4VFKEOVifbbDQ7RKmVNtR05fvh+zOM0+EOs=;
        b=TLuhe+ANcEZ0sgySKVGYWsajU49sG+3JN2gxvvFvSCrczFMYq9I3J6Ey48qJywGLRv
         mpjvT9gzJIBIttGwmIzDVcn6M2zxLG78uVl7NOLWkk4RAQllReiVkdNedcvESvGkZcnO
         lt39/9TQXcJWuw0CTrLnlY66LXUS4Y4AFAQMtW46e2kIfmvKCeyC+4s+tEOAFpApsjyp
         Vv1GlX7ySqrr10UH55CqakWIxZgkHD0HmMWu+LlJ4NMS9Yb1l8SZd1L0njFYjgxGaopP
         vao7vflZAowRMTlj4F3MERRcvtcuDgKa/2npRUQPpY3MJWaHa3E+/kq3igID4/Yxlr+X
         bdQQ==
X-Gm-Message-State: AOJu0YxulioXcQfyFxRIDPdPgcLKquPPukM4x6eIC6FbKYrkpFvGZ0II
	CHbzwTgfXX5H5eCcpaiMFs8=
X-Google-Smtp-Source: AGHT+IGNAVQ6JcEmb2IpiIKEKpUDOC/kTTABVCLMRPQ9qM4CLq1mSFUgTd84yieq+ST8JziA0dPmqw==
X-Received: by 2002:a17:90a:31c1:b0:286:f3ec:2a1 with SMTP id j1-20020a17090a31c100b00286f3ec02a1mr4511497pjf.31.1702367674864;
        Mon, 11 Dec 2023 23:54:34 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:34 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] ARM: dts: aspeed: minerva: add sgpio line name
Date: Tue, 12 Dec 2023 15:52:00 +0800
Message-Id: <20231212075200.983536-12-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the SGPIO line name that the project's function can use by the
meaningful name.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 31197183cc59..942e53d5c714 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -392,3 +392,152 @@ &gpio0 {
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 };
+
+&sgpiom0 {
+	gpio-line-names =
+	/*"input pin","output pin"*/
+	/*A0 - A7*/
+	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN",
+	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN",
+	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN",
+	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN",
+	"PRSNT_MTIA_BLADE4_N","PWREN_MTIA_BLADE4_EN",
+	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN",
+	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN",
+	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN",
+	/*B0 - B7*/
+	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN",
+	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN",
+	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN",
+	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN",
+	"PRSNT_MTIA_BLADE12_N","PWREN_MTIA_BLADE12_EN",
+	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN",
+	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN",
+	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN",
+	/*C0 - C7*/
+	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN",
+	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN",
+	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN",
+	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN",
+	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN",
+	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN",
+	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN",
+	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN",
+	/*D0 - D7*/
+	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN",
+	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN",
+	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE4_HSC_EN",
+	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE5_HSC_EN",
+	"PWRGD_MTIA_BLADE0_PWROK_L_BUF","PWREN_MTIA_BLADE6_HSC_EN",
+	"PWRGD_MTIA_BLADE1_PWROK_L_BUF","PWREN_MTIA_BLADE7_HSC_EN",
+	"PWRGD_MTIA_BLADE2_PWROK_L_BUF","PWREN_MTIA_BLADE8_HSC_EN",
+	"PWRGD_MTIA_BLADE3_PWROK_L_BUF","PWREN_MTIA_BLADE9_HSC_EN",
+	/*E0 - E7*/
+	"PWRGD_MTIA_BLADE4_PWROK_L_BUF","PWREN_MTIA_BLADE10_HSC_EN",
+	"PWRGD_MTIA_BLADE5_PWROK_L_BUF","PWREN_MTIA_BLADE11_HSC_EN",
+	"PWRGD_MTIA_BLADE6_PWROK_L_BUF","PWREN_MTIA_BLADE12_HSC_EN",
+	"PWRGD_MTIA_BLADE7_PWROK_L_BUF","PWREN_MTIA_BLADE13_HSC_EN",
+	"PWRGD_MTIA_BLADE8_PWROK_L_BUF","PWREN_MTIA_BLADE14_HSC_EN",
+	"PWRGD_MTIA_BLADE9_PWROK_L_BUF","PWREN_MTIA_BLADE15_HSC_EN",
+	"PWRGD_MTIA_BLADE10_PWROK_L_BUF","PWREN_NW_BLADE0_HSC_EN",
+	"PWRGD_MTIA_BLADE11_PWROK_L_BUF","PWREN_NW_BLADE1_HSC_EN",
+	/*F0 - F7*/
+	"PWRGD_MTIA_BLADE12_PWROK_L_BUF","PWREN_NW_BLADE2_HSC_EN",
+	"PWRGD_MTIA_BLADE13_PWROK_L_BUF","PWREN_NW_BLADE3_HSC_EN",
+	"PWRGD_MTIA_BLADE14_PWROK_L_BUF","PWREN_NW_BLADE4_HSC_EN",
+	"PWRGD_MTIA_BLADE15_PWROK_L_BUF","PWREN_NW_BLADE5_HSC_EN",
+	"PWRGD_NW_BLADE0_PWROK_L_BUF","PWREN_FCB_TOP_L_EN",
+	"PWRGD_NW_BLADE1_PWROK_L_BUF","PWREN_FCB_TOP_R_EN",
+	"PWRGD_NW_BLADE2_PWROK_L_BUF","PWREN_FCB_MIDDLE_L_EN",
+	"PWRGD_NW_BLADE3_PWROK_L_BUF","PWREN_FCB_MIDDLE_R_EN",
+	/*G0 - G7*/
+	"PWRGD_NW_BLADE4_PWROK_L_BUF","PWREN_FCB_BOTTOM_L_EN",
+	"PWRGD_NW_BLADE5_PWROK_L_BUF","PWREN_FCB_BOTTOM_R_EN",
+	"PWRGD_FCB_TOP_0_PWROK_L_BUF","FM_CMM_AC_CYCLE_N",
+	"PWRGD_FCB_TOP_1_PWROK_L_BUF","MGMT_SFP_TX_DIS",
+	"PWRGD_FCB_MIDDLE_0_PWROK_L_BUF","",
+	"PWRGD_FCB_MIDDLE_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE0_1_N",
+	"PWRGD_FCB_BOTTOM_0_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE2_3_N",
+	"PWRGD_FCB_BOTTOM_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE4_5_N",
+	/*H0 - H7*/
+	"LEAK_DETECT_MTIA_BLADE0_N_BUF","RST_I2CRST_MTIA_BLADE6_7_N",
+	"LEAK_DETECT_MTIA_BLADE1_N_BUF","RST_I2CRST_MTIA_BLADE8_9_N",
+	"LEAK_DETECT_MTIA_BLADE2_N_BUF","RST_I2CRST_MTIA_BLADE10_11_N",
+	"LEAK_DETECT_MTIA_BLADE3_N_BUF","RST_I2CRST_MTIA_BLADE12_13_N",
+	"LEAK_DETECT_MTIA_BLADE4_N_BUF","RST_I2CRST_MTIA_BLADE14_15_N",
+	"LEAK_DETECT_MTIA_BLADE5_N_BUF","RST_I2CRST_NW_BLADE0_1_2_N",
+	"LEAK_DETECT_MTIA_BLADE6_N_BUF","RST_I2CRST_NW_BLADE3_4_5_N",
+	"LEAK_DETECT_MTIA_BLADE7_N_BUF","RST_I2CRST_FCB_N",
+	/*I0 - I7*/
+	"LEAK_DETECT_MTIA_BLADE8_N_BUF","RST_I2CRST_FCB_B_L_N",
+	"LEAK_DETECT_MTIA_BLADE9_N_BUF","RST_I2CRST_FCB_B_R_N",
+	"LEAK_DETECT_MTIA_BLADE10_N_BUF","RST_I2CRST_FCB_M_L_N",
+	"LEAK_DETECT_MTIA_BLADE11_N_BUF","RST_I2CRST_FCB_M_R_N",
+	"LEAK_DETECT_MTIA_BLADE12_N_BUF","RST_I2CRST_FCB_T_L_N",
+	"LEAK_DETECT_MTIA_BLADE13_N_BUF","RST_I2CRST_FCB_T_R_N",
+	"LEAK_DETECT_MTIA_BLADE14_N_BUF","BMC_READY",
+	"LEAK_DETECT_MTIA_BLADE15_N_BUF","wFM_88E6393X_BIN_UPDATE_EN_N",
+	/*J0 - J7*/
+	"LEAK_DETECT_NW_BLADE0_N_BUF","WATER_VALVE_CLOSED_N",
+	"LEAK_DETECT_NW_BLADE1_N_BUF","",
+	"LEAK_DETECT_NW_BLADE2_N_BUF","",
+	"LEAK_DETECT_NW_BLADE3_N_BUF","",
+	"LEAK_DETECT_NW_BLADE4_N_BUF","",
+	"LEAK_DETECT_NW_BLADE5_N_BUF","",
+	"MTIA_BLADE0_STATUS_LED","",
+	"MTIA_BLADE1_STATUS_LED","",
+	/*K0 - K7*/
+	"MTIA_BLADE2_STATUS_LED","",
+	"MTIA_BLADE3_STATUS_LED","",
+	"MTIA_BLADE4_STATUS_LED","",
+	"MTIA_BLADE5_STATUS_LED","",
+	"MTIA_BLADE6_STATUS_LED","",
+	"MTIA_BLADE7_STATUS_LED","",
+	"MTIA_BLADE8_STATUS_LED","",
+	"MTIA_BLADE9_STATUS_LED","",
+	/*L0 - L7*/
+	"MTIA_BLADE10_STATUS_LED","",
+	"MTIA_BLADE11_STATUS_LED","",
+	"MTIA_BLADE12_STATUS_LED","",
+	"MTIA_BLADE13_STATUS_LED","",
+	"MTIA_BLADE14_STATUS_LED","",
+	"MTIA_BLADE15_STATUS_LED","",
+	"NW_BLADE0_STATUS_LED","",
+	"NW_BLADE1_STATUS_LED","",
+	/*M0 - M7*/
+	"NW_BLADE2_STATUS_LED","",
+	"NW_BLADE3_STATUS_LED","",
+	"NW_BLADE4_STATUS_LED","",
+	"NW_BLADE5_STATUS_LED","",
+	"RPU_READY","",
+	"IT_GEAR_RPU_LINK_N","",
+	"IT_GEAR_LEAK","",
+	"WATER_VALVE_CLOSED_N","",
+	/*N0 - N7*/
+	"VALVE_STS0","",
+	"VALVE_STS1","",
+	"VALVE_STS2","",
+	"VALVE_STS3","",
+	"CR_TOGGLE_BOOT_BUF_N","",
+	"CMM_LC_RDY_LED_N","",
+	"CMM_LC_UNRDY_LED_N","",
+	"CMM_CABLE_CARTRIDGE_PRSNT_BOT_N","",
+	/*O0 - O7*/
+	"CMM_CABLE_CARTRIDGE_PRSNT_TOP_N","",
+	"BOT_BCB_CABLE_PRSNT_N","",
+	"TOP_BCB_CABLE_PRSNT_N","",
+	"CHASSIS0_LEAK_Q_N","",
+	"CHASSIS1_LEAK_Q_N","",
+	"LEAK0_DETECT","",
+	"LEAK1_DETECT","",
+	"MGMT_SFP_PRSNT_N","",
+	/*P0 - P7*/
+	"MGMT_SFP_TX_FAULT","",
+	"MGMT_SFP_RX_LOS","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","";
+};
-- 
2.34.1

