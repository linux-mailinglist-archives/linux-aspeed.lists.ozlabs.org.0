Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9558A2AD2
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dD3tVBjp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wY2Fp4z3vZW
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dD3tVBjp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wD4MCYz3vbV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:20 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6eb50c13f44so440569a34.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913498; x=1713518298; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=dD3tVBjpzUxDYXX50bkg2MJ+FmW2U8QSanUA3xGKWBpmGyCiLmCYJUcK8AJHt05vNU
         XyoGPSt5+ueeeVf3qHICMlNIR48Q4FGsBO01CRI6Qv4wEPlNO/coyhkT4zWePLg8skYE
         FTiMuhF1n9e3aYsb5omHhbg52dUv6WdcEAq282bPzdYhBTddEb2coCEnuApP0jct1iav
         wwUQKXmy4fQZAGu1/BrNnxTF+svK3hrkq7FPd7YqtkDNf55A7hk747lXn9o3n30Sbv4l
         IiyfCa1Um0mpp4dO2cKpw8nfOXuHYoazcR8KQo4FNerTxldyH8SeqyOjnhOHXtaP5gA9
         LiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913498; x=1713518298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=rd6LuIjGTmZdZlJLpL9qsIzvn0NypCa0klPNWrpNKn05P/n8cVbHVRoMUceQqtZQQ7
         3MjzJZ6LocduwhV1aoqD6hnuBADEnneg7Q9po0cxTAUNBOyLu76BS/oxoi95+5CxQXIi
         dNBSk/5Q5duhGMLuBwf9v0xR0aBBORHs8vgG3udMv91vjKMy5dHOuO8SXj+fRdYsoQhg
         yPw3XDD8ytC4Tv2dKAX/aeKGXqs+Q8zfB/MiBzWay1Rt05M+niYkLsgkyoGuSEBUBIPh
         nqf4+3m/sWcgFnvVLFXGZWyKqg8ODeklK2DVlv08oLL86UhaZoAkthYdjSyWqx55VL/m
         b+gA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/SUipHf62qYi6gWysD0XHBC/2VldUaDJrwMmmP25I/4RmSbB1YR+vgUKPZ4/lebWdyXwaZdrjEAR1VeJLmiKkmGUz4eS4VWXf1O/mw==
X-Gm-Message-State: AOJu0YzsFOQufdupGDneTVCeUyVnE6CgVxg0EVB8ZW4TyUHPulRbxTWW
	zx3QVgoRGIVPgeY/e4fuA5+lTqLIuTbRF3n4oNrDkxQJXeIPML9R
X-Google-Smtp-Source: AGHT+IF7wJIWrxBXDGre2KaDfG+Umj6T8KelYCmPYrslfD82jg2/QK85jfSzGd5FWv0aHhTq77ZZPQ==
X-Received: by 2002:a05:6830:1692:b0:6ea:d43:9db2 with SMTP id k18-20020a056830169200b006ea0d439db2mr2024550otr.4.1712913497944;
        Fri, 12 Apr 2024 02:18:17 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:17 -0700 (PDT)
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
Subject: [PATCH v5 05/12] ARM: dts: aspeed: Harma: Add spi-gpio
Date: Fri, 12 Apr 2024 17:15:53 +0800
Message-Id: <20240412091600.2534693-6-peteryin.openbmc@gmail.com>
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

Add spi-gpio for tpm device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 36aad01dda20..ca3052cce0e0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -28,6 +28,8 @@ aliases {
 		i2c29 = &imux29;
 		i2c30 = &imux30;
 		i2c31 = &imux31;
+
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -67,6 +69,25 @@ led-2 {
 			gpios = <&gpio0 124 GPIO_ACTIVE_HIGH>;
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
 
 // HOST BIOS Debug
-- 
2.25.1

