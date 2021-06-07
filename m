Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09A39D353
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3d5trqz305k
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oJv32b0j;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oJv32b0j; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz3Z41pNz307B
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:46 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id l1so12767281pgm.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVCBVMc69erOuRG8XUaSGmJQO0+Pu+V6joDzV/LgecM=;
 b=oJv32b0j6blJ+a8HoYypEviWZI+3/t9/IhhXi60MHQT4w9km9CxFdZy/91ZUbNJyU5
 wNRQ0CoRIt6KhrdGsDuecrmpFE6hR4yg792INsJe3vYenL1hFjDEd+6a5SckfIbUMNnV
 ziBwd8APYWiktw8Fa5GXovo+2jP3ReBzYWox1piBNYVf3w5ivWKuntwySiZMfTrqKCsM
 XxWx5T11lvSQrYAZd3D8JfEf1xP4VZ/yL2kIbylJneGLlHR2UvORzvs0LkAA76GUgDSh
 jlQ2kejAdv+liV5WVxENsv5Tt0yszsE3OeYeolAhUTM0jtKpjEeVrFgCxIrZnN68xzKE
 sb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HVCBVMc69erOuRG8XUaSGmJQO0+Pu+V6joDzV/LgecM=;
 b=JDnssAAKMJxehFSJplDWjKWBJOyUwHnQTFQWwE1+tpqQWsxmnk/UG7FU/B3xpdH0uY
 9VaLsjoiKjYBVYDAtINuhRJc5CoB2fceT6a0cCSK0rfUjlvcbJHvQBi85iNkkPiZHU83
 5nUKmn7aJCj3bcL7o3ySXDtRwsmz5vgz5bAa0RrwoTx101D1YdSMz/ifstkC5ZSNAaH2
 yuaEbqZ7smuioGPJ5iW35dF34O9soMQM4mGpHZb+gHG5COsdowNTeZ/bCpUuQ1q6WcJT
 ignQMfZQ9j/TbIfoa60Ar8tB+dbnPPnm7u+h1NTZ2dsOPkz4uMzJvxPjYkjR4Ds288I5
 +Cow==
X-Gm-Message-State: AOAM532ayZG/3Cx4BRZDu9ftLvHTSZlP+W8u8npS4lvWNUKjS2YHx4MK
 YfBfjb+0TnwJfZkVyUciNIM=
X-Google-Smtp-Source: ABdhPJxsd71Rqr5dCUuG/RBhhd5tFjgfkSvewl41s4rp6wkwNC4NdACHAVnmW6xkAm6YRY8Xya07gg==
X-Received: by 2002:aa7:9118:0:b029:2eb:2ef3:f197 with SMTP id
 24-20020aa791180000b02902eb2ef3f197mr14984557pfh.27.1623035623650; 
 Sun, 06 Jun 2021 20:13:43 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:42 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 6/6] ARM: dts: aspeed: everest: Add pcie cable card indicator
 leds
Date: Mon,  7 Jun 2021 12:42:59 +0930
Message-Id: <20210607031259.475020-7-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607031259.475020-1-joel@jms.id.au>
References: <20210607031259.475020-1-joel@jms.id.au>
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

These are leds on the IBM proprietary PCIE cards called cable cards.
Cable cards have 2 ports on them and each port has an indicator led.

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 714 +++++++++++++++++--
 1 file changed, 665 insertions(+), 49 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 2bac7d1f8a03..d26a9e16ff7c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -508,6 +508,62 @@ eeprom@52 {
 				compatible = "atmel,24c64";
 				reg = <0x52>;
 			};
+
+			pca_cable_card_c01: pca9551@62 {
+				compatible = "nxp,pca9551";
+				reg = <0x62>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c01-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c01-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 
 		i2c4mux0chn1: i2c@1 {
@@ -518,6 +574,62 @@ eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 			};
+
+			pca_cable_card_c02: pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c02-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c02-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 
 		i2c4mux0chn2: i2c@2 {
@@ -528,6 +640,62 @@ eeprom@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
 			};
+
+			pca_cable_card_c03: pca9551@61 {
+				compatible = "nxp,pca9551";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c03-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c03-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 	};
 };
@@ -636,68 +804,404 @@ eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 			};
-		};
 
-		i2c5mux0chn1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-			eeprom@51 {
-				compatible = "atmel,24c64";
-				reg = <0x51>;
-			};
-		};
+			pca_cable_card_c04: pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-		i2c5mux0chn2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-			eeprom@52 {
-				compatible = "atmel,24c64";
-				reg = <0x52>;
-			};
-		};
+				gpio-controller;
+				#gpio-cells = <2>;
 
-		i2c5mux0chn3: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-			eeprom@53 {
-				compatible = "atmel,24c64";
-				reg = <0x53>;
-			};
-		};
-	};
-};
+				led@0 {
+					label = "cablecard-c04-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
 
-&i2c6 {
-	status = "okay";
+				led@1 {
+					label = "cablecard-c04-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
 
-	i2c-switch@70 {
-		compatible = "nxp,pca9546";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "okay";
-		i2c-mux-idle-disconnect;
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
 
-		i2c6mux0chn0: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-			eeprom@50 {
-				compatible = "atmel,24c64";
-				reg = <0x50>;
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
 			};
 		};
 
-		i2c6mux0chn1: i2c@1 {
+		i2c5mux0chn1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
-			eeprom@52 {
+			eeprom@51 {
 				compatible = "atmel,24c64";
-				reg = <0x52>;
+				reg = <0x51>;
+			};
+
+			pca_cable_card_c05: pca9551@61 {
+				compatible = "nxp,pca9551";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c05-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c05-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
+		};
+
+		i2c5mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+
+			pca_cable_card_c06: pca9551@62 {
+				compatible = "nxp,pca9551";
+				reg = <0x62>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c06-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c06-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
+		};
+
+		i2c5mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+
+			pca_cable_card_c07: pca9551@63 {
+				compatible = "nxp,pca9551";
+				reg = <0x63>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c07-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c07-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			eeprom@50 {
+			compatible = "atmel,24c64";
+			reg = <0x50>;
+			};
+
+			pca_cable_card_c08: pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c08-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c08-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+
+			pca_cable_card_c09: pca9551@62 {
+				compatible = "nxp,pca9551";
+				reg = <0x62>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c09-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c09-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
 			};
 		};
 
@@ -709,6 +1213,62 @@ eeprom@53 {
 				compatible = "atmel,24c64";
 				reg = <0x53>;
 			};
+
+			pca_cable_card_c10: pca9551@63 {
+				compatible = "nxp,pca9551";
+				reg = <0x63>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c10-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c10-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 
 		i2c6mux0chn3: i2c@3 {
@@ -719,6 +1279,62 @@ eeprom@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
 			};
+
+			pca_cable_card_c11: pca9551@61 {
+				compatible = "nxp,pca9551";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard-c11-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard-c11-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 	};
 
-- 
2.30.2

