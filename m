Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C99181BD
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:07:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aPXN+KN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MRV1l6yz3dBx
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:07:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aPXN+KN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQf21wlz3cfm
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:18 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f9b52ef481so54432095ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407178; x=1720011978; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDIfl9HjVykS0hpfBMS083uA+ZwP9ghS/a+IaSxCQC8=;
        b=aPXN+KN8qRxtxdB+Fzhe13CVhrCrR2ARCkH7Ph+Zuk5zxCWinYkT97VneKY4Qpc6AM
         4OB1mWBG7JzOGXeunparjCVDcb6xQUNHk5ZaY+k9MER8PKQUcA9wyTn05ZIQaqDUxLkl
         ArbnKxKBQJS58+zvHVVe0UtDVhiXDnn2BUXzvrRN2v1wmuT70hgZg87Pl4AehvxxVl6Y
         vHrIetmkaaYkF0Wmp54AOC9EuJIlJA1WYB6T6ETqSuQ9ITIfspcWM0pp4Bi+77C8mY14
         HF342ielozCB6/sbygRHxodluvqJxgYj+/6Jl9U2wcjNt/qH5OscyXeLh0OFmmeCv1hT
         hVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407178; x=1720011978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDIfl9HjVykS0hpfBMS083uA+ZwP9ghS/a+IaSxCQC8=;
        b=RUoWEB84U8yvcmqJUA209/EJ2kE4iTj+5RE9vxrAiqaw4DMNFBAEtBGstBsOvEECIA
         /RSBwb0yXWufgWLYXTBo4kk05Kc6M+9DKsYeFIbtqVEyqQJHC/dHcraJ7zpXtBJetWid
         Ara+piQbk8gPsf3ZAYuAS0BSEOA98TXO05Ke6s88u9HTOAlAIJOO5D0AOrOsBjbROntW
         TTbk/AbPUpzCOipR4nVNE900vPmbdbJgFRvjNZdrcWgAnZ9vjSWCQhBFhybU6odCsI0Y
         U2MBFbgXoaRxbdFXMpZeO/SZzB9hGTKgF+U6DU8h6Qvsxm/g73ipZ5LrWctWdQtZIVNG
         YB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYbUIdOcdhRm7/1gMPbOZKn7LtKzv3IzD8EnPj2RKLVtJf8sFWcVQghk27oREO6Zv5zWEQQqRf+KXuhSoQpgFLTLfRrSnUCnZ8w5DPQQ==
X-Gm-Message-State: AOJu0YzLPNAEAWvTICgUuDAlLbtRRevkZuXW4Rv59ayBeosxyHUOKeHr
	L2h39jzaAV5vUVKE12vhElFpKb5HADBnCx7iufdNIVTsgvMgVWos
X-Google-Smtp-Source: AGHT+IHthDBOZr+7elbb4+CJeS0BtO+9g/S/qAkS2jeCnmIU2XDj0g/LungcZqjqJ9JdKSYcUusrig==
X-Received: by 2002:a17:902:ce81:b0:1f6:ef5a:7740 with SMTP id d9443c01a7336-1fa23ee4f1dmr103650935ad.34.1719407177938;
        Wed, 26 Jun 2024 06:06:17 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:17 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 17/17] ARM: dts: aspeed: minerva: Add spi-gpio
Date: Wed, 26 Jun 2024 21:03:32 +0800
Message-Id: <20240626130332.929534-18-yangchen.openbmc@gmail.com>
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

Add spi-gpio for TPM device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 8180fa5c1854..f5ac248097b4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -23,6 +23,8 @@ aliases {
 		i2c19 = &imux19;
 		i2c20 = &imux20;
 		i2c21 = &imux21;
+
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -74,6 +76,25 @@ led-4 {
 			default-state = "off";
 		};
 	};
+
+	spi_gpio: spi {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart6 {
-- 
2.34.1

