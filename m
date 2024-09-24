Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B295C984738
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 16:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XChSL5X40z2yks
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 00:04:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727186672;
	cv=none; b=NDfoMoq6QHtEUGr612ruLIojBYUGdl1WdZpbCR54cUrMPJ3VAQ7f39CLsL6pgjmR3TuZ/fcGEQ+hUnfMYbrnPlIpz5NAm2miyLRg8DolhZRycRwyb7hSTECYXC7OUEBxO4BYCgJnwyakxGLBm2vFfsrBg6SUhlPOmPj2kA6ixAPrm95jlxnG+AfdSQse8uXX42tunTYP6q5ZtqWQMQF5UD8Jo7QcL7/ItpCKmYddR5krnaHZj+o7q9cTXy3j94jel1OQxQ4VP2OL4phh9GT0ansW0PsqJUZNMye5GLqAYb+KZa5HB3j4a/D6d5KB1cujJ2sIosEw5KHSCQqaviLI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727186672; c=relaxed/relaxed;
	bh=1nx5Xbta+5PnRWKrihSqO2loHlGD3cDUR+R9/JM+v/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ot2diKK6An7taJ6auHJFQ7AXhIiIwtku1EVIiYNYbqSY5UJLL7z9efFWO0J50GhFXvzygR1/QrKVRrhiIN0bvOM0aAJZaIblQSjRqXTR1+vltmH+2U960J7wC2cfWLGude0rvypdkXtOdwK6T5bN4+aqB6uodMw/92lj4JeexZJdDOiB8k9bVuDIqgIQ6o7a8Y2Oz7feYq+cAttnmi8bVw9WtnxEAtH/4cormoLGHOk0KbQy47GdbhuBoBhuILJFgyF2bJNbDhYC77dSZhGnZ6R6Vb1HezQjPxLmhIROsVyMcxiPKaiUz70UnyEm6VrZkk07vrztACd8gtU+tt6lQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NSjKWI7z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NSjKWI7z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XChSJ2N6hz2yFK
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 00:04:32 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-207397d1000so49977755ad.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727186670; x=1727791470; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nx5Xbta+5PnRWKrihSqO2loHlGD3cDUR+R9/JM+v/8=;
        b=NSjKWI7zv84/wFM7nLZNTMebx/GJ5iGx3gv8nYXIs4eAXrJQFkWKtdFdHIi8vozoZW
         OZdcqIuJBzasP/MbB2gkFmskmTII8KhkOKujXz1ZUtf99IovJ6pBlpJsBo6DcfYm9BM1
         3TBNuGryNFFpis41bK4f1Cqt8SrKUgidm5Uq0eGvT1CeJBHDWmJvM/k3/dRZ+DjwDC9L
         APgFE2PCILBM48C8eoLiYnkjKNZ1PGErClrpD8PVHF1kNjOrxTaOJhWF8rVNhxTuOf2t
         Rpm4KGvzT+bGiQAMOT62Amxlvg4+7isTPUOhoz6ku6aA8xHR9DZ3iJOaielatbB18Cjg
         XAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186670; x=1727791470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nx5Xbta+5PnRWKrihSqO2loHlGD3cDUR+R9/JM+v/8=;
        b=QdTth9XlZpN1pCZelLK65eUx3oRT7mVz5kD8Z9XAgiyFgdoQy2ax/jJvoPbSGGcQ5a
         WmhfAOn5q8/q7WqpFGhK9Vxyy3Hb70GvFxpbtWF7tx4JoZN1qVA+Vs55fW5eTWwtXvkB
         MJ7h0S2WGn2hxlsKnTpE2xQxNtdo19ITqWXD4kmCNxoH13cQvw0qoGVRH2MwTJsBEvb7
         nx4+pGPsmeh7/uiagmSsFfnvlX5xBo9bmFMZpcjgb2ai4IfrCJXtZvb+TbSOW5e/jBzq
         Oep+Sq3Nyor3GH+cGtCSE9rr3XoMyTjfmJddUN6vOqRvz7zMcTJfcANnx0PoRD3hzuWq
         Loqw==
X-Forwarded-Encrypted: i=1; AJvYcCXiyU6Fy1n+opy0tIHxSsMWHvzbhh1o65ip+wrX71T4C4g0gYij08Eap9+L1wTxUxhSfZo8VdNs2IrChSw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKpkGTq2XwWEvUu9w0u7Kq9bMXBrVj5WYwFTtjvvgJst8LhJN0
	9EnerImnWfHGFQo+EnOMy+mrwAa2dgXKvsn6qAjk+iwOhlNEVKne
X-Google-Smtp-Source: AGHT+IHq5h/XO80kmONWk0SB4WxBpcrYJRobQWQjI/0AHEaOTReNvD49VFdzL/HURKTd1LRSBu7zgw==
X-Received: by 2002:a17:902:d4cf:b0:207:3a4c:8c6f with SMTP id d9443c01a7336-20aed16ee23mr46292545ad.29.1727186669627;
        Tue, 24 Sep 2024 07:04:29 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1821f33sm10678895ad.219.2024.09.24.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:04:29 -0700 (PDT)
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
Subject: [PATCH v1 3/3] ARM: dts: aspeed: minerva: add fru device for other blades
Date: Tue, 24 Sep 2024 22:02:15 +0800
Message-Id: <20240924140215.2484170-4-yangchen.openbmc@gmail.com>
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

The Minerva platform has 16 compute blades and 6 network blades, each with
an EEPROM that can be operated by the CMM. This commit adds support for
each FRU.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 334 ++++++++++++++++++
 1 file changed, 334 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index c915db28a806..468a33f50ef2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -23,6 +23,32 @@ aliases {
 		i2c19 = &imux19;
 		i2c20 = &imux20;
 		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+		i2c32 = &imux32;
+		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
+		i2c38 = &imux38;
+		i2c39 = &imux39;
+		i2c40 = &imux40;
+		i2c41 = &imux41;
+		i2c42 = &imux42;
+		i2c43 = &imux43;
+		i2c44 = &imux44;
+		i2c45 = &imux45;
+		i2c46 = &imux46;
+		i2c47 = &imux47;
 
 		spi1 = &spi_gpio;
 	};
@@ -493,23 +519,239 @@ temperature-sensor@4b {
 				reg = <0x4b>;
 			};
 		};
+
+		imux22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux23: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
 	};
 };
 
 &i2c3 {
 	status = "okay";
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9545";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
 };
 
 &i2c4 {
 	status = "okay";
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9545";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux28: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux29: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux30: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux31: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
 };
 
 &i2c5 {
 	status = "okay";
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9545";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux32: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
 };
 
 &i2c6 {
 	status = "okay";
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9545";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux36: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux37: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux38: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux39: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
 };
 
 &i2c7 {
@@ -536,10 +778,102 @@ rtc@51 {
 
 &i2c12 {
 	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux40: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux41: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux42: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux43: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
 };
 
 &i2c13 {
 	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux44: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux45: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux46: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		imux47: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
 };
 
 &i2c14 {
-- 
2.34.1

