Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EF944FEE
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iF1tGppu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgV6BN3z3dVX
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iF1tGppu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYg56zBfz3dT4
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:04:01 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso26065625ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528240; x=1723133040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMUkek2hVzU0p0l016s6b0CKb/s4GTG52EiEP4PKD44=;
        b=iF1tGppu7MxHBerilBJ+OgJF9oFtYKPIBclhAePz5xol6gyLvWcH7tSs9HuCg1Inm+
         8LunkRHl9qHu2SRmADfSO3PJMPNvQuTmAT3/cWE2feg96+vrwiiD09uySMJnjhDDYxpQ
         1ZuFgc7mi/tGN7j8btpUOGLkDwP2Ld6gvY7zWe894gePKayJMM86bNDM0nu20tgNOIZO
         R9iS1q//E2ifXrOooPsAfxDKBffDoZvflynikAFEiCU49xcNIaNZIjX+XJIe+k8nq9L6
         afAZWOsRMf67dsqQMhdu4HJTBOdTiV+Ml1C65BXr/misz7B8YKPT0x1PgBDUcxExkzF/
         4Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528240; x=1723133040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMUkek2hVzU0p0l016s6b0CKb/s4GTG52EiEP4PKD44=;
        b=sv3uSrTFC9/1b0YJSgGRVP4+jqbWmt4X+bL7eXBdQPg1VkHD/vzThIcmu4vrJ2X+cB
         pcX1Wa/Z/P6wfbRqy5ykPCx4d65iVk0B8eKwwevdAwkx/Nd0xbP9bOlgiU408mE62W2p
         lFmYa1GhJWqBiJjJlin7NjjHm1Qr2rPL6gN4GU40mrIIjRiSsvyFmepQom9MWcgWUqxj
         Zio20xw6T3l7xVwKTXx33pbTYQg5U1TUlxPLGVzOIJiW/aaVdNbE9h31gQWFgw5Ukbhw
         i0HxwaJAZ3LdrnQuaXFz14Kd37vlma2GUWAdm9lr5WbASuURD/ekWJ9eKVhom7xm4SKk
         N8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUhEwFs9QuMLL8u8Q/sauD6jWQjPAkKGYFwnmdux37x+tV1i5+ZnbLN0qRiyY4+4GWHV/U6Nuka4RGQQ/JPJlowi2jZjLAubpb9/6/w==
X-Gm-Message-State: AOJu0YwFoQ6yCivgOLBAs40Jyy0+YUk0WE3VubefJA/+aHMB7KlfS4ZJ
	vV1fWE3mhXfqu24/x3BSQX3nXWdZ7YQHA0abRhVZWCdzF7/J75aB
X-Google-Smtp-Source: AGHT+IH0JtqqECKHnudAUXqhOjRTWHB80HJL81jyDNQofXWGUg5tNgWs/U7hOX2Nsy2Ud8Tz78eT4w==
X-Received: by 2002:a17:90b:4c05:b0:2c8:85c:750b with SMTP id 98e67ed59e1d1-2cff952f21emr765328a91.34.1722528239873;
        Thu, 01 Aug 2024 09:03:59 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:59 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/11] ARM: dts: aspeed: Harma: add fru device
Date: Fri,  2 Aug 2024 00:01:31 +0800
Message-Id: <20240801160136.1281291-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

