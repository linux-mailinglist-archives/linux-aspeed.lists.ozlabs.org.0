Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A590E91677B
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ya0IRBWL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kSn1hZ7z3cyd
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:20:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ya0IRBWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSY35Mjz3d9t
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:45 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3762c172d9aso20469105ab.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318043; x=1719922843; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCdx3Zv6jgcLya0FbLGdFMlbTjbR1RWCyV9Cn/rMIPA=;
        b=Ya0IRBWLlDyI/cBEDsVn3JE5HtVEkzFD5JaCantuwfkGzNVa1w3Qi0/GeE+EC6Pmxy
         s9o2B5w1rK+XHR2TKVhvGNmAWZO9B9RuDruU26YwGP7bJxsiIvv55Q99GmQQoA9b8nS1
         oOgLoyhITqSGUSTZeEa8pU+B6mhoww2k+mxtTZ7jSMsc+wvC07f6dQGBbbovPjadi+ar
         HalbNw/+NbuQopqt/fETUuxgrSlNrhUN/nv2V0Rlh/bZjtyJFCr4nfklimhtwIpGRgPH
         d9ApE8wAbLSDjXsaROTL0Rs0+HAaEZBxH/GTGDZ6epKQya7q9STIgRegjGFAShU75qWi
         LDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318043; x=1719922843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCdx3Zv6jgcLya0FbLGdFMlbTjbR1RWCyV9Cn/rMIPA=;
        b=B1yNdOunxq4A1S/JoN/eGRpnj98OEG2lr463tWLyjY/YAIuH7tj+8szDVfAA3r0oaw
         FYGOoVT4ck2viWQ0CpzVsZI6EmlkZN3gXsH7TKMFUBKLOS71YZ7ifRiJNvY8borCN3rE
         oPNy9vzjeVL4vy/EtPvM7jblB5Tp8lx5XDxfmQ6670ZzfZ2Jsf5xsOqNfgcao+lanMX8
         u9fKMNy7KxrUBRfCITFCpTNlOfDrSDDxvpAbqvYzeZqlvvcfnYdm8pMG0C7JtGBfMlsi
         90+hYqA0fAxr9bcAqaiz121tA/Gt4ejVDYNNstdQ8hdIUOFRVixSb7jtpyWFfV9V0/+A
         z7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWqaZ9MIU8lIGa9BW6Hk57HnemHIJ619sz9xkGuEnFyT2sbJQgoyOUfRPYjFttKW+ht916N8Or59JVfebZk2lOTaIZswhqLDjEiu2e+xw==
X-Gm-Message-State: AOJu0YwYS8ITayj1FCSHvNGUb4lE6m2V5KavlwUdiWkxoJVKGPvdXCPn
	I5gzhe0MNFxFJlnbb75OjzfCs0fdOdmNkEAfstPPpFaANfGKOSk0
X-Google-Smtp-Source: AGHT+IEgWnQT8rOifzr8yavYSciazbSQFQ+ty+csNXNN7UfUlGZBVvmhX1LpNwnqHUTUFuAHvpbHkg==
X-Received: by 2002:a05:6e02:138f:b0:375:b4a3:9bc4 with SMTP id e9e14a558f8ab-3763f708ca7mr80967275ab.28.1719318043562;
        Tue, 25 Jun 2024 05:20:43 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:43 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 02/17] ARM: dts: aspeed: minerva: Add spi-gpio
Date: Tue, 25 Jun 2024 20:18:20 +0800
Message-Id: <20240625121835.751013-3-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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

Add spi-gpio for TPM device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index e20e31917d6c..7d96a3638448 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -22,6 +22,8 @@ aliases {
 		i2c19 = &imux19;
 		i2c20 = &imux20;
 		i2c21 = &imux21;
+
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -49,6 +51,25 @@ led-fan-fault {
 			default-state = "off";
 		};
 	};
+
+	spi_gpio: spi-gpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart6 {
-- 
2.34.1

