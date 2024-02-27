Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC286864E
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IdwURT2M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3K00D5z3dRt
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IdwURT2M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL313K80z3dS0
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:41 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1db6e0996ceso28176385ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998459; x=1709603259; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=IdwURT2MSh+Eu+Zk5p2Yec08JJENDsjb06aozmuWu1VKbfO7vx43IXE5Bw15AZ97Rm
         QqDKGWaoVHHcdzqb7eY2ZAszQNmYCvH/rmwSZP5TukgFdBRXj06BTXn+9wM4RTsNDSbm
         7j5372UaJV+d0yZe3HhDuvyE24ZJBe83lx6zbHB/mPHMq0ZmCef4LSRgZA7BYm8YuypP
         87RBcB9bdUkvv83oq9q/qgzIWQlQsQ0WLR5iRSYveEIJ50lHMYOSsGnqRnC3y0O3VOM6
         ptgFeTsFeJRuURaSZzHRQg/wWf/EEqEFLmpnHY5pKtbCkauTmFW+MDaUtMivdV7dMj4i
         Z5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998459; x=1709603259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+fqIWtBV/T+80XSNaZFcmZX/ftnbYEEAJ0ueKG+0WM=;
        b=YLbi6ZGGQSkB2BKfQQr7PQqljwdAKnOaC14v5Jr25KlWGfWYbA2rJX521XUM2CdwU4
         uCBYC5Qj4KaJseM64/K3etpLup0TEENv9usfpxt1qLLwf7h8IFyVbttp4lljiNMRjWvD
         JMC1vtnFX6HkOYjM4ZYAuZtTGyDwgXdnzVEVDZnORcOLbwnmTv+l08iXZMWXT+c7Yf9f
         RMcWeD+QLH6q7VhR3znmRMDkOTyL/dK3SZUuBy4Awfjod889wUDkM4bf5QyGT3n+dD06
         C41vXm4y+IT0S/b2l89UHuTLwCpPH2khyHG1PKaDWneC8AK8qlgZkKgbzozMuekkeons
         Qf4g==
X-Forwarded-Encrypted: i=1; AJvYcCUUylY6QZ/L2Y4QY8wP82ChLd9j3rYuchT/Wb9pAglmtbROZEvjpe+VRjS31GMYzchnT/8PqwC0z/l+xge227uPk2uywB5OExwM4i9DFQ==
X-Gm-Message-State: AOJu0YyZGgXX9qmz+KkWekrsp4GvAqJGGRB6+8oQuQBiOWBOEbt4h31h
	t7Gnl2YVVWTNiuX05VdBzsP35bXVjQYZvwOV2l1lN/vmnhKtrfSI
X-Google-Smtp-Source: AGHT+IEZepgeDkUT9RDJvALOKsdiZXgwdG6lSfCTNXsWgnFPt2uDjmBS4/7sgyCrveGYIUTBsjSkzw==
X-Received: by 2002:a17:902:9a4b:b0:1db:f952:eebf with SMTP id x11-20020a1709029a4b00b001dbf952eebfmr7108683plv.44.1708998458872;
        Mon, 26 Feb 2024 17:47:38 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:38 -0800 (PST)
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
Subject: [PATCH v4 05/10] ARM: dts: aspeed: Harma: Add spi-gpio
Date: Tue, 27 Feb 2024 09:47:14 +0800
Message-Id: <20240227014719.3037588-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

