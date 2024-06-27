Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B6919FD3
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+ndOaWm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qH20Lbmz3cXd
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+ndOaWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGN0XxNz3cVB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:43 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so5550409a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471643; x=1720076443; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMUkek2hVzU0p0l016s6b0CKb/s4GTG52EiEP4PKD44=;
        b=X+ndOaWmi2626CGFjSTaenb1TcxSf4DJQ/RS1NCUtXqh3VfN9gzeMNxTJDTeY7b5nu
         csf8OwB/ktV1/uOEOOvG0gS+8TvNdJsJQ6Tr4nnd9eU8iQn0s4ko/tKzZ+wUCku7WtN/
         n1uh+pvyTTkrJVbzTBK+oDgBKHMLxjY+NJyGJubDmXPBp7zdoqvk7nbJqQ44M6X6gWga
         xIzWUj0FJCQON+lQtJUZuWg/zJk/53FYySqfMwjjwdAiOi1CVSwjdAQehb2EkmopXT3I
         HH4lFPZ0Djhjmva/VdwFX4N69+AR9dbYL35ovN9xCnEt2psHJKiydWipIMWbjphS+Y8V
         xNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471643; x=1720076443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMUkek2hVzU0p0l016s6b0CKb/s4GTG52EiEP4PKD44=;
        b=a7Vm0w9J03VU8q7z0saMOVpsrWZOK71f/4Os+uLYKFwOZsYJfBHrBHIgl40GzGT201
         zz6RTljt37dC/JruIf72xKn2XA1YCpB6+whnXAsJTrx7FOAZbA4W36BxiR4uvkwC+Jpp
         Ze/ewDHnL0/DdEWbeq63dCldadc0xVp+FA0NRhCn0Zgd53czbRRUOSAISwMSHCZ/RXs3
         CJfHHoLWOR/PiON0zFW8gOJ5RI7OznqRKEycZ3XUAd6Eq2R5DDj/s+f2C1TXh2rahpzI
         13pjizepSPTqsve/aFYMLbM8nYuxzFl/bJStC2npwPIVDOBkhFjZBjtpGlUKFR3g21f8
         SqLw==
X-Forwarded-Encrypted: i=1; AJvYcCUyXRNu2NtoNE/WkZK6H9u32CqnFZgYu2W1NS+gNZSLgV1mvdPy5cemyxz+9hWSXGHRRMTe+OaNVAGCpImOGXArKxIDcs6fWLu3aE+5CQ==
X-Gm-Message-State: AOJu0Yyvz4DfJ5FYG2vlurhMxKBFarOgDfYQk85RqzdARu/559tHHeYf
	pbSJ3vB4Kg7zThncv4Pe5j7sQZcWS+LPXp7MCX5lozxJnCJ5y79p
X-Google-Smtp-Source: AGHT+IHsrtkGtJf3xPmmh/936pA9VAPgzA04MqHFj6mjiEydE+Q23/XOX3ENFthF9sGCv9bORrzWtQ==
X-Received: by 2002:a05:6a20:2a24:b0:1be:c1c0:b8de with SMTP id adf61e73a8af0-1bec1c0ba08mr3209791637.42.1719471641187;
        Thu, 27 Jun 2024 00:00:41 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:40 -0700 (PDT)
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
Subject: [PATCH v2 07/10] ARM: dts: aspeed: Harma: add fru device
Date: Thu, 27 Jun 2024 15:00:09 +0800
Message-Id: <20240627070013.2509150-8-peteryin.openbmc@gmail.com>
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

Add Aegis fru device and gpio expander device in bus 11.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index e10ee54fe472..f55ffe9c4d89 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -427,6 +427,31 @@ eeprom@52 {
 
 &i2c11 {
 	status = "okay";
+
+	gpio@30 {
+		compatible = "nxp,pca9555";
+		reg = <0x30>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+	gpio@31 {
+		compatible = "nxp,pca9555";
+		reg = <0x31>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","","","",
+		"","","presence-cmm","",
+		"","","","",
+		"","","","";
+	};
+
+	// Aegis FRU
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1

