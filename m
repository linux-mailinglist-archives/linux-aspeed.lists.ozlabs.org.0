Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A8360F73
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 17:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLkQZ4Hl7z30KF
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 01:53:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NIfyHh1/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NIfyHh1/; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLkQX1h5Jz2yxr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 01:53:22 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id f17so32921071lfu.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWC2MC72dgX7erfaiK0WF/mEIAVWPqcVzYbZe8V5Z1E=;
 b=NIfyHh1/PRmS+9vlJuhVugsnRZ6stFNyFEhxN5B4sVKKsp6mAb29+DAaFaoSGLzl+j
 kB7i0+Kdn1JaNr89rQ7uUjyZXvqBm3h02KWgcPFwvSCOMog9/ENOTM3CdQPTdEpMyME0
 W4f9ECChsCIsL8s8MwZG3O1IrDlEHDdkhrjiQctZFjP1FZRORvYCmpO8gg5H8YFAg8/7
 TgnjY/s/871YpFDhEU9bv76gJ3VwUe8cetHG3IbZQHk8uaCxfklBHn7mHSKbXCE8OmTv
 MFCjCXkgZVDC0p7rRjw3tqsPqQ+nS17Ri/cbBv+0JUHR1x+8rryyOdZ8zxExS15upiUa
 MJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWC2MC72dgX7erfaiK0WF/mEIAVWPqcVzYbZe8V5Z1E=;
 b=miF02KH5xcKxAePFDTx2WezZrWauEFKZXPmEipSo5Zvnhy3PV3XLb62BKmJAw8zep5
 t+nR8abtgj/Ni5BGPHvuMbToVomnBqVNV8Tw6m70Zdn5JJTHPJZY79xwXE/R/Dd0Qc5y
 VxdPM1wPyt63D3jim2olREJTtF9T+30zOWvXeYtoB/0RQHH+OWCgVYJJaSmaWPxFR0rW
 GUvyGJtF4gLcXdY2Z/3al+bxCh6MXTeZ6HjBNWhzgcURahIL0XtL4lvLciExD51EXAqI
 pE0J4XgJ1F0OV50IQbKYQXbl6Uje+cTaJ6K2UtfaMJnHPtIuOzDvLiwpRexOWxcbTyFq
 C4Zg==
X-Gm-Message-State: AOAM530RKYl2jIj6bkPAWOs2BA5NhvL0m4Nyw56r9A8xuD43szchSPR0
 WXeE7WfNDAuyqnDSTZvnR9E=
X-Google-Smtp-Source: ABdhPJw1hchhMCsax9EV0N/YbpI2KvNmp+q3ewQiaZLc00QNf4RW4J0wPjOl5hNgeyEJbgWUWIENVQ==
X-Received: by 2002:a19:3849:: with SMTP id d9mr2943775lfj.388.1618501999617; 
 Thu, 15 Apr 2021 08:53:19 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id s7sm674074ljg.31.2021.04.15.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:53:19 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses
Date: Thu, 15 Apr 2021 18:52:59 +0300
Message-Id: <20210415155300.1135-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable all I2C busses that are used in AMD EthanolX CRB:
 i2c0 - APML P0
 i2c1 - APML P1
 i2c2 - FPGA
 i2c3 - 24LC128 EEPROM
 i2c4 - P0 Power regulators
 i2c5 - P1 Power regulators
 i2c6 - P0/P1 Thermal diode
 i2c7 - Thermal Sensors
 i2c8 - BMC I2C

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index ac2d04cfaf2f..6aeb47c44eba 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -151,6 +151,31 @@ &i2c1 {
 	status = "okay";
 };
 
+//FPGA
+&i2c2 {
+	status = "okay";
+};
+
+//24LC128 EEPROM
+&i2c3 {
+	status = "okay";
+};
+
+//P0 Power regulators
+&i2c4 {
+	status = "okay";
+};
+
+//P1 Power regulators
+&i2c5 {
+	status = "okay";
+};
+
+//P0/P1 Thermal diode
+&i2c6 {
+	status = "okay";
+};
+
 // Thermal Sensors
 &i2c7 {
 	status = "okay";
@@ -196,6 +221,11 @@ lm75a@4f {
 	};
 };
 
+//BMC I2C
+&i2c8 {
+	status = "okay";
+};
+
 &kcs1 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0x60>;
-- 
2.25.1

