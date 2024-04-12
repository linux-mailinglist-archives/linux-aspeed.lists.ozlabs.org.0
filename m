Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1938A2ADD
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:19:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JcZoM+YV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9x76hVXz3vfq
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:19:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JcZoM+YV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wb1YR7z3vbk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:39 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so487831a12.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913516; x=1713518316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLhEm1cQTgYq4Cay+gDZBnFx7MCkPnHfSrf0in79+7k=;
        b=JcZoM+YVl/v7Kl3SU/bohAV1jvLcL2L5bZEe6n3wS/MYJ9jEEZ22K/0qH2NX6EqdNv
         b49BA/JUxfxWqvVNHFAXoXa7MwlnW3JH+ftJsWzs485jDdNZQpQ/Sv0HB4nOcOIXDpV+
         RvEcvwfLVCdVKZHK3aCWimURvVt4frsAHodT4fGBdKIsNOz4ZThTwxtu+19x8U+SQEIE
         JIHyiGZ2hvYSJyHlqidfksPuoahFkC3vStFVSXGsSVYZNqmgmc+qIuGvr2Lw4E4myQBN
         LRe6QpA3npz/lJWEYcJzP02S7A4tpOr3g7g55knhn08YLRHsDiZyOu17WBfu79MbQkjO
         NINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913516; x=1713518316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLhEm1cQTgYq4Cay+gDZBnFx7MCkPnHfSrf0in79+7k=;
        b=Bx+klEahUJtDEHhQCnqjzfTS9/6kfOrM5jEJWaf6+HTnGE8iIY39syJipDtKf8auHl
         7SNkXYbDjlZCvLmsyqKamc1/s6SSnAwV6jOAMgA/7rXgC36zlk2HU/gZoPZDDEiMEKXW
         E7kzAVJcGLoSbcq4j7B25Vn/Dd+d0nG6APnZLvIXSvn1uslNs+yU7QY/muEhuwsDOj+9
         x9P0Q71B1JZPP+5Xk08ArE+daWGEPUIex/v6dn2PMNqTkKHf9VZa1ARMG9XCqDJrf4qE
         5yh9kOuvyrmIk0mOLQ7QMuzLyeR9t+IueJ461nDitpu+m2cbQs7ft3Ig2QAhyKvJwZ2O
         RaeA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSkUK/nb9N94Kl44YMQR1qI1l1/LlKsCgyBzgpvZOm7fX1oe3p6ioqWhX3uO7pwbGWS9/1IzGSEytu87qxnqmCukb8b4QdkIPOwA2HQ==
X-Gm-Message-State: AOJu0Ywq7rVDYog31C6BgaWtzGB9QLC3eIdXrcY4pt+gqZxy4MJ+hg8b
	V3IEQa0IAVXftEBNJStwCEmYfMcskzXtJoDVuzh/THuOAc+avFrc
X-Google-Smtp-Source: AGHT+IGlb1alqgq8RG5vCcKY5zvrVt/1FkUs9Nblo1e0iPMP4ckeJANiyp3bwgt0kBCN42Zklkd+bA==
X-Received: by 2002:a05:6a20:a11e:b0:1a7:54b4:8e84 with SMTP id q30-20020a056a20a11e00b001a754b48e84mr2667412pzk.10.1712913516383;
        Fri, 12 Apr 2024 02:18:36 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:36 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/12] ARM: dts: aspeed: Harma: Modify GPIO line name
Date: Fri, 12 Apr 2024 17:16:00 +0800
Message-Id: <20240412091600.2534693-13-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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

Add:
"reset-cause-platrst", "cpu0-err-alert", "leakage-detect-alert",
"presence-post-card", "ac-power-button", "P0_I3C_APML_ALERT_L",
"irq-uv-detect-alert", "irq-hsc-alert", "cpu0-prochot-alert",
"cpu0-thermtrip-alert", "reset-cause-pcie", "pvdd11-ocp-alert"

Rename:
"power-cpu-good" to "host0-ready",
"host-ready-n" to "post-end-n

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index a5abb16e5d8b..e7f4823ca4b3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -332,6 +332,12 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","","","",
+		"","","presence-cmm","",
+		"","","","",
+		"","","","";
 	};
 
 	i2c-mux@71 {
@@ -471,7 +477,8 @@ &gpio0 {
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
-	/*C0-C7*/	"","","","","","","","",
+	/*C0-C7*/	"reset-cause-platrst","","","","",
+			"cpu0-err-alert","","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -480,7 +487,8 @@ &gpio0 {
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","",
+			"leakage-detect-alert","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"led-postcode-0","led-postcode-1",
 			"led-postcode-2","led-postcode-3",
@@ -499,7 +507,16 @@ &gpio0 {
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"","","","","","","","";
+	/*Z0-Z7*/	"","","","","","","presence-post-card","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/ "ac-power-button","","","","","","","",
+	/*18B0-18B7*/ "","","","","","","","",
+	/*18C0-18C7*/ "","","","","","","","",
+	/*18D0-18D7*/ "","","","","","","","",
+	/*18E0-18E3*/ "","","","","","","","";
 };
 
 &sgpiom0 {
@@ -548,10 +565,10 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"power-cpu-good","reset-control-smb-e1s-0",
+	"host0-ready","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
-	"host-ready-n","reset-control-srst",
+	"post-end-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
 	/*E4-E7 line 72-79*/
@@ -602,13 +619,16 @@ &sgpiom0 {
 	"SLOT_ID_BCB_2","",
 	"SLOT_ID_BCB_3","",
 	/*K0-K3 line 160-167*/
-	"","","","","","","","",
+	"","","","","","","P0_I3C_APML_ALERT_L","",
 	/*K4-K7 line 168-175*/
-	"","","","","","","","",
+	"","","","","","","irq-uv-detect-alert","",
 	/*L0-L3 line 176-183*/
-	"","","","","","","","",
+	"irq-hsc-alert","",
+	"cpu0-prochot-alert","",
+	"cpu0-thermtrip-alert","",
+	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"","","","","","","","",
+	"pvdd11-ocp-alert","","","","","","","",
 	/*M0-M3 line 192-199*/
 	"","","","","","","","",
 	/*M4-M7 line 200-207*/
-- 
2.25.1

