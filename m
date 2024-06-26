Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD609181A6
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QJFHaRRY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQH58V7z3cTb
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:05:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QJFHaRRY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQ30HL4z3cHP
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fa2ea1c443so30078655ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407145; x=1720011945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzrCq55dKnidKKqWO6gxlx5gu7pwGXx0Jy9uGAk4Shk=;
        b=QJFHaRRYNLp7wKNwSWcY6jq3R2R2BLBCG31bnP8ynNIDXkcpQezthazPQXMmuxb2+c
         qeaMKB2F0Agj1zNH+oL+Ku7YZJ0Jv8Z7Q5Q5MqjM4j/+nqywPY/6O49YK04/pN5DfooK
         2+0P3akZ4Lg0YYzRQB1asyUMSwRnaKf0MPZ7VMfkzP8yIOHSUIh1COvvmjTULBPtBaE7
         n6JFnfZe+/A8wbRQTTpyGBAERzzIzIBz6Nywjnrbou3i1LGnGc6k+g5Q3ieI0a+WDmBl
         olJ/Mx1VQTr0KDcEfgCbviVs3LfU+Tca7B4BOOuuW1Sw8Pun5Byi8jxl9yb3PG12L6x/
         +shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407145; x=1720011945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzrCq55dKnidKKqWO6gxlx5gu7pwGXx0Jy9uGAk4Shk=;
        b=l+ph7H7wP3jkL5BFIOEq9i2FPAh0zuuraV+f93RJk/r8wj/1bC2Yr4XqsLoy28MBFc
         wdm/+3vPT7Z4ibmj1WtDMnEe3iCgTYvoshfmHlBxttZvOet8ry4P9ETWgEpgFZUfXEQ/
         Okl1Ydfg6PC6eA/1BOVqoBKJXHhIhBFTnPy/U031AeZw7HsvlnSlRARz9V6Tr8xO5gaB
         xaIii+jK4AGMyMCFZT8FAT5PrAMrckl5X9S6cUYdHiLGDnlZ8VnMvBIxRnPyPRCne0UT
         kS2bn3AdAHCf5GY0b8O9pv5eV/5Qqnrh5ILtxzd7BaGx0Lpoa6s/CpQCCXhuZXG1B6W9
         GeMw==
X-Forwarded-Encrypted: i=1; AJvYcCW0pgqeQ6QkgYIA+gkmenD7+QdkHZhtvSl88lMxSlVMVXE2xh1wP/X5hxiTiUGY3ap9jY8ObFK+Q+R9J1yUxGpjOTfqeV3+JPjbCyVLWw==
X-Gm-Message-State: AOJu0Yw158L8IIoQCfY5HvJxKbu8n9NfGLU57Te04ZDEtzNlipPuDRi+
	GPZUTGQsv7ou0u16rHIyWW6SmPEFQsanX6If3fbXGykrzqADtcVM
X-Google-Smtp-Source: AGHT+IHf7+ogxtkMxGD1pJSDaWrkFB7juf0VolxR1uwEtOkvyARWQpS0ooJkVqMwWl6G58i8mN3xuw==
X-Received: by 2002:a17:902:c40e:b0:1fa:2568:5895 with SMTP id d9443c01a7336-1fa256858femr115768095ad.63.1719407145216;
        Wed, 26 Jun 2024 06:05:45 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:44 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 03/17] ARM: dts: aspeed: minerva: add eeprom on i2c bus
Date: Wed, 26 Jun 2024 21:03:18 +0800
Message-Id: <20240626130332.929534-4-yangchen.openbmc@gmail.com>
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

Add eeprom on the i2c-9 address 0x50 and i2c-15 address 0x56.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ca3e417d2c7e..60002b8cffc6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -303,6 +303,11 @@ &i2c8 {
 
 &i2c9 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &i2c10 {
@@ -339,6 +344,11 @@ eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &adc0 {
-- 
2.34.1

