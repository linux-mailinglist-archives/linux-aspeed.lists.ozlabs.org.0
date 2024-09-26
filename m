Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BC986D13
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 08:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkvM0wKXz303B
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 16:58:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333884;
	cv=none; b=XgBBn0ath25eP06+8NuhJvDuDXNCV1FCWMKP9GcN2miLgfNr0zd9PYj443pDa0SMDjIjgHRGORgokxXsy59eY8DXB/NM3UP2Ee7tRNYCWzG466BmFLLoEqcj52fq3QFqm0j/oGb6BldTfJPVwtH/yu/i/dnBh4+xiGjGpJqvXa+VZxoXePjL/uyDCd94grEbvaOmygGlfroTszbs9ed37/K+H1xKBDvU6MKMuz84CkKn0xG5NtXASWENgojUZ3eSuRJDvlGwPznyjGhd8OfmqwTNU7FWVojRms6xrAOO+exHRknPzX9HRQxLnlugL4HUBjPmYchrsIBjeU7VeElVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333884; c=relaxed/relaxed;
	bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8jdFY7BjfXJoIIN/4AhL9mlBbL2cxgQREPrKNpoQFTaMjgz4WtJb2KQWNva+/tsbG3QTuRJ+PY/fzT+6Z81FdoS+zCBD3bLGHmfWB0sG/VgCa2+bqovLFkQUavulKnJk885Mc80BjebTOEQ+2K2Z4loE6l4NABi2mPXLK6+OV7WGZkuJEJtqtV+Xc3eegRAp8UAXXWreWnP7vzKfvxoEp0kkpTBFr+m3uVoDVoPfbJ64ezDhSqlwhhWmpX0zWLlCe5eUwfrP+yjUw42erW7LUydCXioo5DLc1VPvE6dU6rGO3vvEQ9cq3aj5e93Go89OXc01hmnLKl3+zIqW9enyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XM6+PAvs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XM6+PAvs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkvJ3YDjz2yFJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 16:58:04 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-709346604a7so329817a34.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727333880; x=1727938680; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
        b=XM6+PAvsShkvlxfv1UI/ulMcxwzTEK+Cb5P+OwRA94K/oOqAPN7GW0dGbQwONyO1f/
         Qsv+segVmMQIUUqhPMcxyAjKPsyk50ExC6OX7XHTdbMtlZL9YlMcuxhX05hA5NZw2JmQ
         7KoVlV/n+COF3SikTULeKI0/WhcO6jySw/7zxq95W7UIv++zk5ZRsavKp7idTTr3izut
         jh9Xr1f38OCeqCNg6Rv9xFvbphtvwfnETl8ev3H9MbytM6mVD26t8kVEYlRQt0ztZt6z
         aZD6Cp4e7JuW5w7jFEOcAQzoT0OD3/BaCyl0NPbo5G90ERCc9a1FWHQTQcSWZozjcalV
         XGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333880; x=1727938680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOJeAQBgJ2clDphyw+PZwbFI1eIa6mgTGdFOxyjksqw=;
        b=qWo3t/P9DwtTox3MsYZej/xwtlRPMGYyJgK6gzQv3d1+w3VaeUEb8TKIaooLsje02q
         xnIhdJhJMOaGhA+lFA1DKs/TJwLFIdo7H789d1Si7HtWDmcZzbRTJT1ozhIuCSb8UonF
         a2sZqjNtbCjbeSPxEjsicYonNCXfa1zEBlK/PpLC0QYawLFA305Kj9vijfuz3wWhyee7
         cTy2MBAUIgJNyH6I0S7O+Wlr37EEa7cDNRZCv0whUEAFDGow8QRUzbOAheHk45ZBA/CK
         YACkE6tffSD3hEtuoQMiL6QTTmS9GiJlD1SivzArYeAOF9SVWfm1kPwbqgQ2ob6g6mrU
         RJQw==
X-Forwarded-Encrypted: i=1; AJvYcCXNixgw0xYrVTAMdYY3JcSgUzq/8rm+4n1wBQFX69a6SC9jJx1kZcuq9oIAtmzBhXSS+dd9rkXSYQB4qaI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVY8uyhX+jYX8Uz1ahED5e3BVQewDAYNEdBLeNu52gCTtkFQpm
	jOxPnsYZUUfP6EOhv4FIFInq/QZ0qe5rYByKENj4DT1ZTwLU4tBI9p6D/Q==
X-Google-Smtp-Source: AGHT+IExWK+57Nv4bnkY6Z4Z3F5Ia4gqBkNVZyx9LkGlgz4UdeGz9WEEAh9zY+ip9cLnrr+1vzswXQ==
X-Received: by 2002:a05:6359:5fa6:b0:1b8:32b5:4e90 with SMTP id e5c5f4694b2df-1bea86a70f4mr220637455d.27.1727333880448;
        Wed, 25 Sep 2024 23:58:00 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c51112sm3656709a12.42.2024.09.25.23.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:58:00 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 26 Sep 2024 14:55:31 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: catalina: move hdd board i2c mux bus
 to i2c5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-catalina-evt-dvt-system-modify-v1-1-84a27b47040b@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333875; l=4559;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=bVHCPsMjz6la14pOQHSDdWP8VOORoHkUheYAAgbPX2g=;
 b=FbMAYYDOp4IUOZBWRvqxzcluqfEkK3cvoWaLbUyyAfYkdWaLSpyoH9naFSdYvHzf267hQ/ODN
 x7ArvoNb9IjA4UYMRfxxklZG8nU5hR9CtEpfEF29lKp+7dzbysU8416
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

