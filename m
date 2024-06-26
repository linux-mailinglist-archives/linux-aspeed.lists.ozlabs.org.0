Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFC19181B8
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=liBA2YAD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MRD40hxz3d3Z
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=liBA2YAD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQW50k4z3cZB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:11 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fa07e4f44eso37476545ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407169; x=1720011969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFnW83iqY1HB4cJgk5aFgy/mNrqSGdVHCnuN+DvNVUw=;
        b=liBA2YAD0+8v0iIB2jaocH+oVGWD+jMxAHk3LemVuXMRiPzjnbFgESq3OmtKz3ihi/
         VmcJSlt2oiZkrt9ToyWwzS+/Y1oj2wpte3TLAN59Z0izeSkNgSItKmZNEIKFI4GqkOmL
         2JZIuA79amYnSgiFsmRe9iVZ0elb6wIs3SlQFsofjCVr7+p0m2MEYtfBV1Xmc8K9wF/T
         nbenNifdEbyE2o+ZHR1RFKdVJZLNo1R3i1k9LR1zPDQ1qxA5bhHdGAzjJmo7riexkMel
         NOENg09WhmNllgOLDh62pm2T3K7WYzrirEZUBZJ1TLixuwl/4o5zkg+e9F+1eVTs8ScD
         cmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407169; x=1720011969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFnW83iqY1HB4cJgk5aFgy/mNrqSGdVHCnuN+DvNVUw=;
        b=e1OSM5/dH59VKhy+RZyupbCj21XzjNsLKkAlRc3LMbriT16bYiMQz3hIMfFLgw3wHk
         Gx/3iuxpfEykaGxMpX/ORlos71O1/bsiVwEIp1vXPm09gC8Ym3Ii/YgybnAXZCrfuc6B
         1tci2TtKHwCw91GU0d8I1rAXXFDv+8iWhINJgr8DfxY7iKpmXQ+LPumylLTSOWQXiEwQ
         6J/xskK6Enq19bhkCVEE+OfH/w8UwblP9ftxTkhP/Yat/pDLVfJdQQgMvxdhIOHVLCWF
         lc4wrsuncbOjfKXBPEkXwv080jJ2hJ/e2pmMFa+EZvRc/Wfp5ocWOiwf70BzUog+u/Ur
         CiMw==
X-Forwarded-Encrypted: i=1; AJvYcCUnF/3qNaCQIV7IWVpF2HnfbKSNpBKqU5Bqmb4uhQczDxrBbwBj9r/KoKc4c6vVdNPn5hAeOrX+hTy6h0ncfjSrZ/MkcEljmfahxRkDEg==
X-Gm-Message-State: AOJu0YzH6Aab9nvlQQt6EmhdP24qCSpjjOcsdAmsbS++fI/pIGxtZDuo
	n99DcATq7Icz+KyYr+6n9cIxq8j4WP/4ppvZGLazEtBqEjuZJDDN
X-Google-Smtp-Source: AGHT+IFeBZwy86KZEpCK3n/9ui+XuYe5Qb45WMT4j4hAALaIMnXMsThc4P2m+jtGaaLf5MCgG59eUA==
X-Received: by 2002:a17:902:f685:b0:1f9:b121:35f0 with SMTP id d9443c01a7336-1fa23ef7c14mr124369565ad.54.1719407168973;
        Wed, 26 Jun 2024 06:06:08 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:08 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 13/17] ARM: dts: aspeed: minerva: revise sgpio line name
Date: Wed, 26 Jun 2024 21:03:28 +0800
Message-Id: <20240626130332.929534-14-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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

From: Yang Chen <yang.chen@quantatw.com>

Revise the SGPIO naming to mapping the SGPIO from the CPLD.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 236 +++++++++---------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 0c305ddf7011..7a790e347853 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -610,118 +610,118 @@ &sgpiom0 {
 	gpio-line-names =
 	/*"input pin","output pin"*/
 	/*A0 - A7*/
-	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN",
-	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN",
-	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN",
-	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN",
-	"PRSNT_MTIA_BLADE4_N","PWREN_MTIA_BLADE4_EN",
-	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN",
-	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN",
-	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN",
+	"PRSNT_MTIA_BLADE0_N","PWREN_MTIA_BLADE0_EN_N",
+	"PRSNT_MTIA_BLADE1_N","PWREN_MTIA_BLADE1_EN_N",
+	"PRSNT_MTIA_BLADE2_N","PWREN_MTIA_BLADE2_EN_N",
+	"PRSNT_MTIA_BLADE3_N","PWREN_MTIA_BLADE3_EN_N",
+	"PRSNT_MTIA_BLADE4_N","PWREN_MTIA_BLADE4_EN_N",
+	"PRSNT_MTIA_BLADE5_N","PWREN_MTIA_BLADE5_EN_N",
+	"PRSNT_MTIA_BLADE6_N","PWREN_MTIA_BLADE6_EN_N",
+	"PRSNT_MTIA_BLADE7_N","PWREN_MTIA_BLADE7_EN_N",
 	/*B0 - B7*/
-	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN",
-	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN",
-	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN",
-	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN",
-	"PRSNT_MTIA_BLADE12_N","PWREN_MTIA_BLADE12_EN",
-	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN",
-	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN",
-	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN",
+	"PRSNT_MTIA_BLADE8_N","PWREN_MTIA_BLADE8_EN_N",
+	"PRSNT_MTIA_BLADE9_N","PWREN_MTIA_BLADE9_EN_N",
+	"PRSNT_MTIA_BLADE10_N","PWREN_MTIA_BLADE10_EN_N",
+	"PRSNT_MTIA_BLADE11_N","PWREN_MTIA_BLADE11_EN_N",
+	"PRSNT_MTIA_BLADE12_N","PWREN_MTIA_BLADE12_EN_N",
+	"PRSNT_MTIA_BLADE13_N","PWREN_MTIA_BLADE13_EN_N",
+	"PRSNT_MTIA_BLADE14_N","PWREN_MTIA_BLADE14_EN_N",
+	"PRSNT_MTIA_BLADE15_N","PWREN_MTIA_BLADE15_EN_N",
 	/*C0 - C7*/
-	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN",
-	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN",
-	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN",
-	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN",
-	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN",
-	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN",
-	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN",
-	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN",
+	"PRSNT_NW_BLADE0_N","PWREN_NW_BLADE0_EN_N",
+	"PRSNT_NW_BLADE1_N","PWREN_NW_BLADE1_EN_N",
+	"PRSNT_NW_BLADE2_N","PWREN_NW_BLADE2_EN_N",
+	"PRSNT_NW_BLADE3_N","PWREN_NW_BLADE3_EN_N",
+	"PRSNT_NW_BLADE4_N","PWREN_NW_BLADE4_EN_N",
+	"PRSNT_NW_BLADE5_N","PWREN_NW_BLADE5_EN_N",
+	"PRSNT_FCB_TOP_0_N","PWREN_MTIA_BLADE0_HSC_EN_N",
+	"PRSNT_FCB_TOP_1_N","PWREN_MTIA_BLADE1_HSC_EN_N",
 	/*D0 - D7*/
-	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN",
-	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN",
-	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE4_HSC_EN",
-	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE5_HSC_EN",
-	"PWRGD_MTIA_BLADE0_PWROK_L_BUF","PWREN_MTIA_BLADE6_HSC_EN",
-	"PWRGD_MTIA_BLADE1_PWROK_L_BUF","PWREN_MTIA_BLADE7_HSC_EN",
-	"PWRGD_MTIA_BLADE2_PWROK_L_BUF","PWREN_MTIA_BLADE8_HSC_EN",
-	"PWRGD_MTIA_BLADE3_PWROK_L_BUF","PWREN_MTIA_BLADE9_HSC_EN",
+	"PRSNT_FCB_MIDDLE_0_N","PWREN_MTIA_BLADE2_HSC_EN_N",
+	"PRSNT_FCB_MIDDLE_1_N","PWREN_MTIA_BLADE3_HSC_EN_N",
+	"PRSNT_FCB_BOTTOM_1_N","PWREN_MTIA_BLADE4_HSC_EN_N",
+	"PRSNT_FCB_BOTTOM_0_N","PWREN_MTIA_BLADE5_HSC_EN_N",
+	"PWRGD_MTIA_BLADE0_PWROK_N","PWREN_MTIA_BLADE6_HSC_EN_N",
+	"PWRGD_MTIA_BLADE1_PWROK_N","PWREN_MTIA_BLADE7_HSC_EN_N",
+	"PWRGD_MTIA_BLADE2_PWROK_N","PWREN_MTIA_BLADE8_HSC_EN_N",
+	"PWRGD_MTIA_BLADE3_PWROK_N","PWREN_MTIA_BLADE9_HSC_EN_N",
 	/*E0 - E7*/
-	"PWRGD_MTIA_BLADE4_PWROK_L_BUF","PWREN_MTIA_BLADE10_HSC_EN",
-	"PWRGD_MTIA_BLADE5_PWROK_L_BUF","PWREN_MTIA_BLADE11_HSC_EN",
-	"PWRGD_MTIA_BLADE6_PWROK_L_BUF","PWREN_MTIA_BLADE12_HSC_EN",
-	"PWRGD_MTIA_BLADE7_PWROK_L_BUF","PWREN_MTIA_BLADE13_HSC_EN",
-	"PWRGD_MTIA_BLADE8_PWROK_L_BUF","PWREN_MTIA_BLADE14_HSC_EN",
-	"PWRGD_MTIA_BLADE9_PWROK_L_BUF","PWREN_MTIA_BLADE15_HSC_EN",
-	"PWRGD_MTIA_BLADE10_PWROK_L_BUF","PWREN_NW_BLADE0_HSC_EN",
-	"PWRGD_MTIA_BLADE11_PWROK_L_BUF","PWREN_NW_BLADE1_HSC_EN",
+	"PWRGD_MTIA_BLADE4_PWROK_N","PWREN_MTIA_BLADE10_HSC_EN_N",
+	"PWRGD_MTIA_BLADE5_PWROK_N","PWREN_MTIA_BLADE11_HSC_EN_N",
+	"PWRGD_MTIA_BLADE6_PWROK_N","PWREN_MTIA_BLADE12_HSC_EN_N",
+	"PWRGD_MTIA_BLADE7_PWROK_N","PWREN_MTIA_BLADE13_HSC_EN_N",
+	"PWRGD_MTIA_BLADE8_PWROK_N","PWREN_MTIA_BLADE14_HSC_EN_N",
+	"PWRGD_MTIA_BLADE9_PWROK_N","PWREN_MTIA_BLADE15_HSC_EN_N",
+	"PWRGD_MTIA_BLADE10_PWROK_N","PWREN_NW_BLADE0_HSC_EN_N",
+	"PWRGD_MTIA_BLADE11_PWROK_N","PWREN_NW_BLADE1_HSC_EN_N",
 	/*F0 - F7*/
-	"PWRGD_MTIA_BLADE12_PWROK_L_BUF","PWREN_NW_BLADE2_HSC_EN",
-	"PWRGD_MTIA_BLADE13_PWROK_L_BUF","PWREN_NW_BLADE3_HSC_EN",
-	"PWRGD_MTIA_BLADE14_PWROK_L_BUF","PWREN_NW_BLADE4_HSC_EN",
-	"PWRGD_MTIA_BLADE15_PWROK_L_BUF","PWREN_NW_BLADE5_HSC_EN",
-	"PWRGD_NW_BLADE0_PWROK_L_BUF","PWREN_FCB_TOP_L_EN",
-	"PWRGD_NW_BLADE1_PWROK_L_BUF","PWREN_FCB_TOP_R_EN",
-	"PWRGD_NW_BLADE2_PWROK_L_BUF","PWREN_FCB_MIDDLE_L_EN",
-	"PWRGD_NW_BLADE3_PWROK_L_BUF","PWREN_FCB_MIDDLE_R_EN",
+	"PWRGD_MTIA_BLADE12_PWROK_N","PWREN_NW_BLADE2_HSC_EN_N",
+	"PWRGD_MTIA_BLADE13_PWROK_N","PWREN_NW_BLADE3_HSC_EN_N",
+	"PWRGD_MTIA_BLADE14_PWROK_N","PWREN_NW_BLADE4_HSC_EN_N",
+	"PWRGD_MTIA_BLADE15_PWROK_N","PWREN_NW_BLADE5_HSC_EN_N",
+	"PWRGD_NW_BLADE0_PWROK_N","PWREN_FCB_TOP_0_EN_N",
+	"PWRGD_NW_BLADE1_PWROK_N","PWREN_FCB_TOP_1_EN_N",
+	"PWRGD_NW_BLADE2_PWROK_N","PWREN_FCB_MIDDLE_0_EN_N",
+	"PWRGD_NW_BLADE3_PWROK_N","PWREN_FCB_MIDDLE_1_EN_N",
 	/*G0 - G7*/
-	"PWRGD_NW_BLADE4_PWROK_L_BUF","PWREN_FCB_BOTTOM_L_EN",
-	"PWRGD_NW_BLADE5_PWROK_L_BUF","PWREN_FCB_BOTTOM_R_EN",
-	"PWRGD_FCB_TOP_0_PWROK_L_BUF","FM_CMM_AC_CYCLE_N",
-	"PWRGD_FCB_TOP_1_PWROK_L_BUF","MGMT_SFP_TX_DIS",
-	"PWRGD_FCB_MIDDLE_0_PWROK_L_BUF","",
-	"PWRGD_FCB_MIDDLE_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE0_1_N",
-	"PWRGD_FCB_BOTTOM_0_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE2_3_N",
-	"PWRGD_FCB_BOTTOM_1_PWROK_L_BUF","RST_I2CRST_MTIA_BLADE4_5_N",
+	"PWRGD_NW_BLADE4_PWROK_N","PWREN_FCB_BOTTOM_1_EN_N",
+	"PWRGD_NW_BLADE5_PWROK_N","PWREN_FCB_BOTTOM_0_EN_N",
+	"PWRGD_FCB_TOP_0_PWROK_N","FM_CMM_AC_CYCLE_N",
+	"PWRGD_FCB_TOP_1_PWROK_N","MGMT_SFP_TX_DIS",
+	"PWRGD_FCB_MIDDLE_0_PWROK_N","FM_MDIO_SW_SEL",
+	"PWRGD_FCB_MIDDLE_1_PWROK_N","FM_P24V_SMPWR_EN",
+	"PWRGD_FCB_BOTTOM_1_PWROK_N","",
+	"PWRGD_FCB_BOTTOM_0_PWROK_N","",
 	/*H0 - H7*/
-	"LEAK_DETECT_MTIA_BLADE0_N_BUF","RST_I2CRST_MTIA_BLADE6_7_N",
-	"LEAK_DETECT_MTIA_BLADE1_N_BUF","RST_I2CRST_MTIA_BLADE8_9_N",
-	"LEAK_DETECT_MTIA_BLADE2_N_BUF","RST_I2CRST_MTIA_BLADE10_11_N",
-	"LEAK_DETECT_MTIA_BLADE3_N_BUF","RST_I2CRST_MTIA_BLADE12_13_N",
-	"LEAK_DETECT_MTIA_BLADE4_N_BUF","RST_I2CRST_MTIA_BLADE14_15_N",
-	"LEAK_DETECT_MTIA_BLADE5_N_BUF","RST_I2CRST_NW_BLADE0_1_2_N",
-	"LEAK_DETECT_MTIA_BLADE6_N_BUF","RST_I2CRST_NW_BLADE3_4_5_N",
-	"LEAK_DETECT_MTIA_BLADE7_N_BUF","RST_I2CRST_FCB_N",
+	"LEAK_DETECT_MTIA_BLADE0_N","",
+	"LEAK_DETECT_MTIA_BLADE1_N","",
+	"LEAK_DETECT_MTIA_BLADE2_N","",
+	"LEAK_DETECT_MTIA_BLADE3_N","",
+	"LEAK_DETECT_MTIA_BLADE4_N","",
+	"LEAK_DETECT_MTIA_BLADE5_N","",
+	"LEAK_DETECT_MTIA_BLADE6_N","",
+	"LEAK_DETECT_MTIA_BLADE7_N","",
 	/*I0 - I7*/
-	"LEAK_DETECT_MTIA_BLADE8_N_BUF","RST_I2CRST_FCB_B_L_N",
-	"LEAK_DETECT_MTIA_BLADE9_N_BUF","RST_I2CRST_FCB_B_R_N",
-	"LEAK_DETECT_MTIA_BLADE10_N_BUF","RST_I2CRST_FCB_M_L_N",
-	"LEAK_DETECT_MTIA_BLADE11_N_BUF","RST_I2CRST_FCB_M_R_N",
-	"LEAK_DETECT_MTIA_BLADE12_N_BUF","RST_I2CRST_FCB_T_L_N",
-	"LEAK_DETECT_MTIA_BLADE13_N_BUF","RST_I2CRST_FCB_T_R_N",
-	"LEAK_DETECT_MTIA_BLADE14_N_BUF","BMC_READY",
-	"LEAK_DETECT_MTIA_BLADE15_N_BUF","wFM_88E6393X_BIN_UPDATE_EN_N",
+	"LEAK_DETECT_MTIA_BLADE8_N","RST_I2CRST_FCB_BOTTOM_1_N",
+	"LEAK_DETECT_MTIA_BLADE9_N","RST_I2CRST_FCB_BOTTOM_0_N",
+	"LEAK_DETECT_MTIA_BLADE10_N","RST_I2CRST_FCB_MIDDLE_0_N",
+	"LEAK_DETECT_MTIA_BLADE11_N","RST_I2CRST_FCB_MIDDLE_1_N",
+	"LEAK_DETECT_MTIA_BLADE12_N","RST_I2CRST_FCB_TOP_0_N",
+	"LEAK_DETECT_MTIA_BLADE13_N","RST_I2CRST_FCB_TOP_1_N",
+	"LEAK_DETECT_MTIA_BLADE14_N","BMC_READY",
+	"LEAK_DETECT_MTIA_BLADE15_N","FM_88E6393X_BIN_UPDATE_EN_N",
 	/*J0 - J7*/
-	"LEAK_DETECT_NW_BLADE0_N_BUF","WATER_VALVE_CLOSED_N",
-	"LEAK_DETECT_NW_BLADE1_N_BUF","",
-	"LEAK_DETECT_NW_BLADE2_N_BUF","",
-	"LEAK_DETECT_NW_BLADE3_N_BUF","",
-	"LEAK_DETECT_NW_BLADE4_N_BUF","",
-	"LEAK_DETECT_NW_BLADE5_N_BUF","",
-	"MTIA_BLADE0_STATUS_LED","",
-	"MTIA_BLADE1_STATUS_LED","",
+	"LEAK_DETECT_NW_BLADE0_N","WATER_VALVE_CLOSED_N",
+	"LEAK_DETECT_NW_BLADE1_N","",
+	"LEAK_DETECT_NW_BLADE2_N","",
+	"LEAK_DETECT_NW_BLADE3_N","",
+	"LEAK_DETECT_NW_BLADE4_N","",
+	"LEAK_DETECT_NW_BLADE5_N","",
+	"PWRGD_MTIA_BLADE0_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE1_HSC_PWROK_N","",
 	/*K0 - K7*/
-	"MTIA_BLADE2_STATUS_LED","",
-	"MTIA_BLADE3_STATUS_LED","",
-	"MTIA_BLADE4_STATUS_LED","",
-	"MTIA_BLADE5_STATUS_LED","",
-	"MTIA_BLADE6_STATUS_LED","",
-	"MTIA_BLADE7_STATUS_LED","",
-	"MTIA_BLADE8_STATUS_LED","",
-	"MTIA_BLADE9_STATUS_LED","",
+	"PWRGD_MTIA_BLADE2_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE3_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE4_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE5_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE6_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE7_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE8_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE9_HSC_PWROK_N","",
 	/*L0 - L7*/
-	"MTIA_BLADE10_STATUS_LED","",
-	"MTIA_BLADE11_STATUS_LED","",
-	"MTIA_BLADE12_STATUS_LED","",
-	"MTIA_BLADE13_STATUS_LED","",
-	"MTIA_BLADE14_STATUS_LED","",
-	"MTIA_BLADE15_STATUS_LED","",
-	"NW_BLADE0_STATUS_LED","",
-	"NW_BLADE1_STATUS_LED","",
+	"PWRGD_MTIA_BLADE10_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE11_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE12_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE13_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE14_HSC_PWROK_N","",
+	"PWRGD_MTIA_BLADE15_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE0_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE1_HSC_PWROK_N","",
 	/*M0 - M7*/
-	"NW_BLADE2_STATUS_LED","",
-	"NW_BLADE3_STATUS_LED","",
-	"NW_BLADE4_STATUS_LED","",
-	"NW_BLADE5_STATUS_LED","",
+	"PWRGD_NW_BLADE2_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE3_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE4_HSC_PWROK_N","",
+	"PWRGD_NW_BLADE5_HSC_PWROK_N","",
 	"RPU_READY","",
 	"IT_GEAR_RPU_LINK_N","",
 	"IT_GEAR_LEAK","",
@@ -729,28 +729,28 @@ &sgpiom0 {
 	/*N0 - N7*/
 	"VALVE_STS0","",
 	"VALVE_STS1","",
-	"VALVE_STS2","",
-	"VALVE_STS3","",
-	"CR_TOGGLE_BOOT_BUF_N","",
-	"CMM_LC_RDY_LED_N","",
-	"CMM_LC_UNRDY_LED_N","",
+	"PCA9555_IRQ0_N","",
+	"PCA9555_IRQ1_N","",
+	"CR_TOGGLE_BOOT_N","",
+	"IRQ_FCB_TOP0_N","",
+	"IRQ_FCB_TOP1_N","",
 	"CMM_CABLE_CARTRIDGE_PRSNT_BOT_N","",
 	/*O0 - O7*/
 	"CMM_CABLE_CARTRIDGE_PRSNT_TOP_N","",
 	"BOT_BCB_CABLE_PRSNT_N","",
 	"TOP_BCB_CABLE_PRSNT_N","",
-	"CHASSIS0_LEAK_Q_N","",
-	"CHASSIS1_LEAK_Q_N","",
-	"LEAK0_DETECT","",
-	"LEAK1_DETECT","",
-	"MGMT_SFP_PRSNT_N","",
+	"IRQ_FCB_MID0_N","",
+	"IRQ_FCB_MID1_N","",
+	"CHASSIS_LEAK0_DETECT_N","",
+	"CHASSIS_LEAK1_DETECT_N","",
+	"VALVE_RMON_A_1","",
 	/*P0 - P7*/
-	"MGMT_SFP_TX_FAULT","",
-	"MGMT_SFP_RX_LOS","",
-	"","",
-	"","",
-	"","",
-	"","",
-	"","",
-	"","";
+	"VALVE_RMON_A_2","",
+	"VALVE_RMON_B_1","",
+	"VALVE_RMON_B_2","",
+	"RPU_READY_SPARE","",
+	"IT_GEAR_LEAK_SPARE","",
+	"IT_GEAR_RPU_LINK_SPARE_N","",
+	"IRQ_FCB_BOT0_N","",
+	"IRQ_FCB_BOT0_N","";
 };
-- 
2.34.1

