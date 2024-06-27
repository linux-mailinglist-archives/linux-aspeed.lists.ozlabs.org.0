Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D9919FD7
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L98sPMOg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qHH2yjfz3cVq
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L98sPMOg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGX6v93z3cXb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:52 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fab03d2eecso1329595ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471651; x=1720076451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dzaqkiR2ify4Vskwae+HmUaR4MwIa3K/TPMIOUHQcw=;
        b=L98sPMOgPJrT/sDKy+2Zeg831nmTvxjUGnkcsBHkVVrEDtAdmYQwiYhL8SJ7MTzDRP
         +wT1ooOb4zfkzPbvIJ7xInfhOeBDTDZF5PzzuteiZubaAZcit1m/moc3DeK56AeX88h9
         YZfsqHu80A/bUEMAhxfGqzpPz68Ux+r6Om6y31XFPkAf2tVW/eOVW7YX6QEF122zTYGF
         PsxiQtE7ZN4STRPGcvwINYBuGkOb2N9nwMztbCNYJ+wRZS9FSUEWHH8GzJ/Iwn5B9poj
         S1w1/PtdH2FnV1gLli6smuoByQ7hQt/2ycnNnHWlEtWfSNdPROwyPDIpYoHSJtlmdg+h
         /GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471651; x=1720076451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dzaqkiR2ify4Vskwae+HmUaR4MwIa3K/TPMIOUHQcw=;
        b=bLxQd/2+7FlkNjxYKCZkm9QMG2A0KK7nWMAUFNiUYgkC3AKivtI7K+Agxm5+Zca9ly
         DEfDt0LY3aDeotkeow0IPAq5aEvNnDi4x1yOBaSU60dSJe+Gh18InCOmkt5XN0iVDslx
         SvLk2GT8n3D/yod5N4a7NuJ8rA+a8tWrCwiglgK/28c9Fy+naYXvAvM12os3EatARS9P
         JVjrIoMobCXs1qjp/tN+dVryKydnoFcak9zDaM6vnSABZp/d0G9yTkq3AFstaghgfZ5Y
         D4HaRNQdSUULNSCArwjblGE7lviebXgxpBfNV/zhAsDj0jpJY5BfUxISfexj0Tnr/ED1
         3Fuw==
X-Forwarded-Encrypted: i=1; AJvYcCVgtzYa3MWba7ykcU/F+i2mSdo1VWtzowQSHXiWEvkPpzCGc/k3yI5sVkLczVecRCnkkfRwo+ZsWQ1e61C97m51uhLHySQDsPrEtR2F4Q==
X-Gm-Message-State: AOJu0Yz01UTH5MZEzpfd+zkLGp88izCJsdAgOwADuJMHOPszLz6bEnll
	0NdUvd2i7p7JY8L8++7ULUvWDVvbth342rXkseiHps2QoRIPtJ/J
X-Google-Smtp-Source: AGHT+IEC7Ygr0pioIKKRbqWm3kRv8g7wmdoUnBAyVJDURMtcNT/d33EnEqVuDE4hLtrf3M80ksmcwA==
X-Received: by 2002:a17:902:e812:b0:1f7:1ba3:b91c with SMTP id d9443c01a7336-1fa1d3de7cbmr155406425ad.1.1719471651197;
        Thu, 27 Jun 2024 00:00:51 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:50 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] ARM: dts: aspeed: Harma: fixed dtb_check warning
Date: Thu, 27 Jun 2024 15:00:12 +0800
Message-Id: <20240627070013.2509150-11-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

1. revise spi-gpio node and property name.
2. revise tpm node name
3. remove max-ngpios

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0dd0566bbf27..4421822eb134 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -70,19 +70,19 @@ led-2 {
 		};
 	};
 
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		status = "okay";
 		compatible = "spi-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
 
-		tpmdev@0 {
+		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 			spi-max-frequency = <33000000>;
 			reg = <0>;
@@ -640,7 +640,6 @@ &gpio1 {
 
 &sgpiom0 {
 	status = "okay";
-	max-ngpios = <128>;
 	ngpios = <128>;
 	bus-frequency = <2000000>;
 	gpio-line-names =
-- 
2.25.1

