Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B51986D50
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 09:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDlFs4DW2z3054
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 17:14:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334847;
	cv=none; b=Va1JTIARi9Z83ZiB9XCgKnZQ8IvLOu4AOnTzSuUSLSzX9aLQal757YAouRnZ2zBkVSCrjnRH1hbw8XR2wyVn+VvwOwGtBDh6uPmUZN3AjZin1p+qKXl+IlIT9yE5/ebupwg/F+TlWRLlV5qAZ0qebtNWvL3OhPuq/JIB/PlbceiqfCkMrxU2685uoMxqzcQ4qvm/bA9QWxRdKxS04MEj16XY0an6UADzbCaVRNM9NO2VwixauJgA+Iqc/1eMeA6QbVgPS8gFK7KPnNLtu1jwmZv83FSnVx6j/53J/2jCFRWs6zcYGxa9jKv8bsMUhzL+6vAb89IUDpTon0qj/eyXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334847; c=relaxed/relaxed;
	bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcpoLW3Fnf8rOcc0m/cfuQE5iVq93CSu1i2E8zAcLokgzTa1BVA4f+7Lm0wO8q4wYiCyGL5xyg001UBAlZ93pop23iCUDFhFbMXiBjPVVVbfQ+7gZmlSsb3mYJ80lzwopU0Fri1K+MWmrfJgoBsZ2GmcjJx8Ny2YJzV0MG6u4S9BZDiaLqsdJLjkSFF9NOU113flgbfCVDQ77Hwa72k6MhL+7ifPn21SznMVI0QL1U+QEVh1brrJ1vA2AXw48OazNhqLljxZNB13ct6mIdHXQ+0IWdeLQP4UuZeNJFBoOsRJt3YhKGX+EOTs3jBLtfvmSsepDfIoCmNPqjrqdPdvow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HBj6QQ4O; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HBj6QQ4O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDlFq24htz2yps
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 17:14:07 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e078d28fe9so511099a91.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 00:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727334844; x=1727939644; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
        b=HBj6QQ4OUNNCJ264pH7IcvmLglNFCrUJc7jE/cdFMZFcixL6Oq21pFn8FyvYV4q/dP
         vp+9R6F7/maroQwUcO2WerSmjzVZL/cyVoh05lxOAkbzaPbC5YbZs/yJBwJLExd0JlMf
         m4j1J9+n0ULjc9RWmjKyhwgOLP5m3Y9wvwIlqjWfgHUQCawzpiGCJuM4iYAg//1shwWL
         EcxvkJZtN4ldze3bClzf/sZFBzn51mGDuJVsJt3ra+2s6rYIfi18dAu2JVY0tlukQShN
         DtanYWzr7RMPzGcSuFfqdhjp+GCUisIMbFWHjDPVr66PqIiXOZqXGx9bQgHwTIPbRiNT
         c4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334844; x=1727939644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
        b=pXZyZYIClMLpsFoC8+Ly8POc4WQBja1gHQnB2tRa3BXOPsVwHOoQhXsRu23trt1tas
         xYwHr0SE1R48jlBM+f0bVsMLl7z2NPjsTtJqbEe6cGpPsruJ1d/lSa+nWZFCf8+eIdGI
         uGmLpM0NW7OfJP815nJktg+wNbltZDeFCvw1y30LUHDLlKZiAv23C8eDQREB3VJF+skq
         QiGCrA/UnSrPfabEv1jQDWzqZAE4oBhHvzeTZbn05s76r1LVm7aLar+Jz7Dy5624ENdE
         8YQB6MOS1rkADUxT3+zMuqJvJ9MlIlXhK4uvDhGfF858o2vyaxqK39aAYpvZZSV1AOjb
         fQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUYdZGvFxSd0HKNL9juzsR3DVFFXG7kn0Wt2ssq3mbv3soB59xQYT5jr+bcuHdenbRfRI+gpZ8qHzD8XxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywc0/2gaWGzcprwujMBYS97Bxoc0NZiCA6W60JKJavS1ujqLFw0
	c+5d+XwUcPjRQoRPsgCWtda7JTJJ1OSPxNSmD/57M5kcRJG8unx1
X-Google-Smtp-Source: AGHT+IEr0OC5xf4XAI3Bau5P0hFkvteHeXyqqWZcfhKPX6p6ofsNIC/S6xM3sQSJY+w10o33KtGTAA==
X-Received: by 2002:a17:90b:3e82:b0:2cd:4100:ef17 with SMTP id 98e67ed59e1d1-2e06afbdcb8mr6503278a91.31.1727334843941;
        Thu, 26 Sep 2024 00:14:03 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d3e79sm2662906a91.27.2024.09.26.00.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:14:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 26 Sep 2024 15:10:44 +0800
Subject: [PATCH v2 1/3] ARM: dts: aspeed: catalina: move hdd board i2c mux
 bus to i2c5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-catalina-evt-dvt-system-modify-v2-1-a861daeba059@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727334839; l=4559;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=bVHCPsMjz6la14pOQHSDdWP8VOORoHkUheYAAgbPX2g=;
 b=jFN+8gsBzVgcOwW0viNvRHj9cunW7PBxpzL8bSdIfiZIhjeAe7cw9Kia+Gk829Txp1vVUUdSs
 emHkvv+vd5eA2c1EnETLQKtLyxhQfFqqPVMUZ9cV1z+mpmwqbVUZ82E
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

From: Potin Lai <potin.lai@quantatw.com>

Due to EVT hardware changes, move HDD board i2c mux bus from i2c30 to i2c5.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 165 +++++++++++----------
 1 file changed, 83 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index fa0921a4afe2..eac6e33e98f4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -50,14 +50,14 @@ aliases {
 		i2c45 = &i2c0mux5ch1;
 		i2c46 = &i2c0mux5ch2;
 		i2c47 = &i2c0mux5ch3;
-		i2c48 = &i2c30mux0ch0;
-		i2c49 = &i2c30mux0ch1;
-		i2c50 = &i2c30mux0ch2;
-		i2c51 = &i2c30mux0ch3;
-		i2c52 = &i2c30mux0ch4;
-		i2c53 = &i2c30mux0ch5;
-		i2c54 = &i2c30mux0ch6;
-		i2c55 = &i2c30mux0ch7;
+		i2c48 = &i2c5mux0ch0;
+		i2c49 = &i2c5mux0ch1;
+		i2c50 = &i2c5mux0ch2;
+		i2c51 = &i2c5mux0ch3;
+		i2c52 = &i2c5mux0ch4;
+		i2c53 = &i2c5mux0ch5;
+		i2c54 = &i2c5mux0ch6;
+		i2c55 = &i2c5mux0ch7;
 	};
 
 	chosen {
@@ -244,80 +244,6 @@ i2c0mux1ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
-			i2c-mux@70 {
-				compatible = "nxp,pca9548";
-				reg = <0x70>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				i2c-mux-idle-disconnect;
-
-				i2c30mux0ch0: i2c@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-				};
-				i2c30mux0ch1: i2c@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-				};
-				i2c30mux0ch2: i2c@2 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <2>;
-				};
-				i2c30mux0ch3: i2c@3 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <3>;
-				};
-				i2c30mux0ch4: i2c@4 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <4>;
-				};
-				i2c30mux0ch5: i2c@5 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <5>;
-				};
-				i2c30mux0ch6: i2c@6 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <6>;
-					// HDD FRU EEPROM
-					eeprom@52 {
-						compatible = "atmel,24c64";
-						reg = <0x52>;
-					};
-				};
-				i2c30mux0ch7: i2c@7 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <7>;
-
-					power-sensor@40 {
-						compatible = "ti,ina230";
-						reg = <0x40>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@41 {
-						compatible = "ti,ina230";
-						reg = <0x41>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@44 {
-						compatible = "ti,ina230";
-						reg = <0x44>;
-						shunt-resistor = <2000>;
-					};
-					power-sensor@45 {
-						compatible = "ti,ina230";
-						reg = <0x45>;
-						shunt-resistor = <2000>;
-					};
-				};
-			};
 		};
 		i2c0mux1ch3: i2c@3 {
 			#address-cells = <1>;
@@ -647,6 +573,81 @@ &i2c4 {
 
 &i2c5 {
 	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c5mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c5mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c5mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+		i2c5mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+		i2c5mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+		i2c5mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			// HDD FRU EEPROM
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+		i2c5mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			power-sensor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@41 {
+				compatible = "ti,ina230";
+				reg = <0x41>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+				shunt-resistor = <2000>;
+			};
+		};
+	};
 };
 
 &i2c6 {

-- 
2.31.1

