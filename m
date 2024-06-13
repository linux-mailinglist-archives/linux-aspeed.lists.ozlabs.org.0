Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB290769C
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MTucUqWC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R9L6KH0z3cf7
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:27:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MTucUqWC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8q1p7nz3cYR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:51 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5bb36de2171so597425eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292409; x=1718897209; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwI/HNhW+KLaFfAR0mDxuIlHrsRtZCH23dDOp06Pu+Q=;
        b=MTucUqWCJ5Wrhvdwtt92m76+OGMUF6risZE/a3Z8sWD8RuM1bgCaaqeRP5TRv72kc0
         RtI0npljiZ/N2Dhr75ZHZtBjozspsFi8BB3WfLddRB+fVcOp12JJI32ZTococXuZWcYj
         2B22ZWXaKVbH5rG9Sfgqmrq8E2xRo1g4lxSpFQfWwTLOpR0360/V8341zy0n9lAaym7E
         7LeUCM+//9BiL5DvAb3vAlyACvtnNG91KL3DvvzJjQGdUN3qpZXtV626WNS1zxfisOt0
         cVprw9gw7Xzb1IYLvesvJx7MS/nYkTk/OsYlobSWBDmo65Oq1L5FdcWPpseh/FgN3biK
         sPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292409; x=1718897209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwI/HNhW+KLaFfAR0mDxuIlHrsRtZCH23dDOp06Pu+Q=;
        b=Q/cMHZZQKE6CF99R6ZIdbt/uiqs306CrjU53IC1S1xFScSJTAYx4qOyPwKhTZ+P+Yt
         T4j/abyD8vqGqkgCHiPq4yr3NNW20ix6Y2O3DL9jaHnJ4NsBZ3bhZA0Z5hx/d4dUQBmW
         01f1QAYjfAzx+a2xMo/G3nt9KdOrqUG1ujw4vg7cseBEGA4nFY653z7Af6HI8KMU1K++
         Llj52ljMywZRCdBljOt9xZ/i4dwF7Q/DP15jz5zwjdauomJ1doh7lrR11jaf3iReq2tr
         0ABI8Zrh1uxWvjAz/7EKnfBXqGqWPSf3oYLFiEfDKjNRcRNRDUp0StAjlyakx7JbKgE4
         JPgg==
X-Forwarded-Encrypted: i=1; AJvYcCVnzP/yX7gazINLQxEWe0ea/7wLsKi9zWUI2qMbhgVB5HdfGVeAc0aAa9PZNLyzUbFktP9L4GkBHRjKeuoFO4mtF9dvFnXE7iLhri7dgA==
X-Gm-Message-State: AOJu0YyhRNlrBMlPdqYM0+mYhrbV1TPtzt2WzdA4BJvIj1OX1Y86bnZ1
	p4WY9lPjK4cpk0NikzYChjyJxGez1hleoKmRhlfawGrD7rM1OlRD
X-Google-Smtp-Source: AGHT+IEb6jZiHrXtDO8lryaRnm7jdVVTAkWt5alb7bZewa05Z+A7qVZBuRcEhv6XaHOnlahOVxqFlA==
X-Received: by 2002:a05:6359:4c82:b0:19f:4fda:4163 with SMTP id e5c5f4694b2df-19fa9ddf24fmr11457155d.1.1718292409110;
        Thu, 13 Jun 2024 08:26:49 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:48 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] ARM: dts: aspeed: Harma: remove pca9546
Date: Thu, 13 Jun 2024 23:24:25 +0800
Message-Id: <20240613152425.1582059-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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

remove pca9546 and add Aegis fru device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 56 +++++++++----------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d892e646fced..4ff9e0104bbe 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -20,10 +20,6 @@ aliases {
 		i2c21 = &imux21;
 		i2c22 = &imux22;
 		i2c23 = &imux23;
-		i2c24 = &imux24;
-		i2c25 = &imux25;
-		i2c26 = &imux26;
-		i2c27 = &imux27;
 		i2c28 = &imux28;
 		i2c29 = &imux29;
 		i2c30 = &imux30;
@@ -391,33 +387,6 @@ gpio@31 {
 		"","","","";
 	};
 
-	i2c-mux@71 {
-		compatible = "nxp,pca9546";
-		reg = <0x71>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		imux24: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-		imux25: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-		imux26: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-		imux27: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-	};
 	// PTTV FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
@@ -427,6 +396,31 @@ eeprom@52 {
 
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

