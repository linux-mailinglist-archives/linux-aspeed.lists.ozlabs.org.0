Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE325483C5
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 11:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6NX08TGz3c8S
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 19:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qEH2xUwt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qEH2xUwt;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6NK00Yxz3c8c
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 19:54:08 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso8332578pjl.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=erc0cF0H69wNUT+Fr3YuZFhUNW2gCbs/AEVN/v4U6VE=;
        b=qEH2xUwt6QE+bDHotqWVLLYfc+6yrZjyHxzXPLyeUfRXD5Zzzaxh9lLTofaAc4EP0U
         lbj+KyYoi+7cnBpus7ALuZ67EHXdxxlKghYCoZyfL0RLL3AWsjxDfaXNX+U9nD6uaxfr
         J3VGgciJXyMaYrurVsPoufT94gGlVA3JNfgNQmsB9Gn/cVFdgZA7BGjAS8AmUKRD8LJh
         4sAHKg1hApMuoylXtEFyiNndh3XhAvNbeXr89nHQ+5/D62hmZMCYHveJCfyvqEcMO0eq
         WliT9Mv69nv8DdXG6gg3/JuyZEnsVq+lN8gitIcSKv1+R2Doafq08kjeQPvcx8LBwO6U
         n1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=erc0cF0H69wNUT+Fr3YuZFhUNW2gCbs/AEVN/v4U6VE=;
        b=4Qs+1Hk4kqFlwz5NlDhBa39ba/n8LYeD4/bjKU6dgr4S75twktUFXAzoZWzrwmVCrA
         zN3AhWFUf+iUzWwyrhV9Z2HmICjFr4BjpuZjBz9BTt+29QqLYafpg5OgVG/OsTHrkcEL
         /O0DO1TxVV1nc0hzJSAN2z/sFscLOUM9M0AQnSWxD6MBOI86VIaSP0FAUGVrnBmK65Iw
         T2KdRRbLTRi+gD+bUYKrNG7eD6yO3hK1+X9iJntLChmB/x2Vjrbj0D441G3HtM14gJ/t
         tBlVg7TmdZ7ymNrpqulsVuYZ/MnxN92U1ZcC6w5Y+S1Rr6vzij1yfOwOqIoddfDS511F
         7ZjA==
X-Gm-Message-State: AOAM5335Y8t/Tc0Wm43H5NvX3RNF98Sx24Mjf/W5pQxizFfBUKr26Xo1
	jQvQg9tvEZV7Oz+/VJ4ym4o=
X-Google-Smtp-Source: ABdhPJwgoF4t8LjwUPn6oaVyQHoakaWUU1XeGOYjr2dzzXgmP4s+IQ6ppGbNq4FSt7nL1UhQ/pW6Yg==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id m12-20020a170902f64c00b0015643497e9bmr58999092plg.139.1655114046570;
        Mon, 13 Jun 2022 02:54:06 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b001639f038250sm4639754plk.220.2022.06.13.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 02:54:06 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 4/4] ARM: dts: aspeed: bletchley: update fusb302 nodes
Date: Mon, 13 Jun 2022 17:51:50 +0800
Message-Id: <20220613095150.21917-5-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220613095150.21917-1-potin.lai.pt@gmail.com>
References: <20220613095150.21917-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

1. Add interrupt pin of fusb302 on each sled.
2. Add vbus-supply property in each fusb302 node.
3. Fix BMC power-role at source and data-role at host.
4. Disable PD to avoid "HARD Reset" due to incompatible PD ver.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 150 ++++++++++++------
 1 file changed, 102 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 7b6de9b51547..9fdb3d17596b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -225,6 +225,60 @@
 			linux,code = <ASPEED_GPIO(H, 7)>;
 		};
 	};
+
+	vbus_sled1: vbus_sled1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled2: vbus_sled2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled3: vbus_sled3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled3";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled4: vbus_sled4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled4";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled5: vbus_sled5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled5";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled6: vbus_sled6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled6";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &mac2 {
@@ -336,17 +390,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled1>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -422,17 +476,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled2>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -508,17 +562,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled3>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -594,17 +648,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled4>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -680,17 +734,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled5>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -766,17 +820,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled6>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
-- 
2.17.1

