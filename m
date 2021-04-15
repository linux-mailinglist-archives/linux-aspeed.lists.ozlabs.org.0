Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8948360B70
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 16:06:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLh2k3svSz30J6
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 00:06:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Bm/MilRS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bm/MilRS; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLh2g1QZHz2yyK
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 00:06:02 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id r8so39253975lfp.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPiY+FwH2gRVnDBLwBz7oG10TpGLnHGvMx4jxp9Wvb0=;
 b=Bm/MilRSFScyxsdyRbsaFklFyVzW5XBChpPpkddUspJnlJHDAHL2WaNfbwL4YYzeYf
 HY97f36MnQnI4+C3p3BFnwKUPY+1weOoouiJrlc7atEw+PTHqEAas7g9rZ+EJGfkzfk6
 6Lph8E6+JfDGxLl97XzI/+uTehOYt/rkI8rNVq8BFD+UUfsYBjNvL1urIVvpyHkLc5ui
 gN273E+h4hVoopBQdRdbl/jOH/7IivhCEr1YYsvo7geoP64CBvyU8eJT9Pe4eBn+QCPC
 pS7Wk1a//Fib5HW41jbelDx2/DguRhnZxYp215mcPHca397Su/a1Tyn4W3LNklKhrJVX
 kh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gPiY+FwH2gRVnDBLwBz7oG10TpGLnHGvMx4jxp9Wvb0=;
 b=SUF5/UZZs+rHgLYDtugHKAnzRiqraZxPFN4ZpfLWm0eVAvwgx8RQdx6x22h3xvRwMW
 rO29EDRKT7/4h4arMYnjY7T8YaA5MLvjCBGAGoyKeViwWhBJ2Hyv2Pz+PTogQ8P51472
 StFXBWv3O6vQno+K/8oDzpYZVV3bNGW9uRk9sBhIvH/nTHgNYGwYXkNBKN5KBDEQwEbx
 m8IBbn3rjgkBRmRRVy8n7LfusaxoDjLuQvvgzfyefvAqylpfb5wVBE7IiHKkgbkbLpH0
 q7LsVpwRwVgyhnthWORkxpY3Ze3UdDTRvwQSsujs3+vfEXuI+PlqoVlz1eiJWJKmzLvs
 a/HQ==
X-Gm-Message-State: AOAM531EqVBJAiB/h9UPYSlDxnbya7A4mdpO0hOdGX2LCvDbSbmhbDFI
 W0Rj3UhNzBZ2aXClIhfD0erbH73i5vWWKQ==
X-Google-Smtp-Source: ABdhPJxAeJyOtPFkQla5RZUI+PSioepyRmiAJnqiyvMHao6fbwWN5/M8/Izt4TBFrDdx2Ps0RJLv6Q==
X-Received: by 2002:ac2:520a:: with SMTP id a10mr2814536lfl.362.1618495548924; 
 Thu, 15 Apr 2021 07:05:48 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id l11sm679210lfh.16.2021.04.15.07.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 07:05:48 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 13FE5jxN011398; Thu, 15 Apr 2021 17:05:46 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 13FE5hEH011397;
 Thu, 15 Apr 2021 17:05:43 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] arm: dts: aspeed: tiogapass: add hotplug controller
Date: Thu, 15 Apr 2021 17:05:00 +0300
Message-Id: <20210415140521.11352-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: devicetree@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ADM1278 IC is accessible on I2C bus and on both Wiwynn and Quanta
Tioga Pass implementations a pair of parallel 0.5 mOhm resistors is used
for current measurement.

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 3cc2004fa2f2..500661956dea 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -591,6 +591,11 @@
 &i2c7 {
 	status = "okay";
 	//HSC, AirMax Conn A
+	adm1278@0x45 {
+		compatible = "adm1275";
+		reg = <0x45>;
+		shunt-resistor-micro-ohms = <250>;
+	};
 };
 
 &i2c8 {
-- 
2.17.1

