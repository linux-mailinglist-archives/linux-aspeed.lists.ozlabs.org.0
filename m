Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A0944FF1
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XH4BZHBm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgb0XHSz3dRP
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XH4BZHBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYg91RMrz3dTm
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:04:05 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7a1c7857a49so4619756a12.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528243; x=1723133043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmQLM6kfiLLNztCoNImQmMNq24bv1cMMrdxlIFr9qpY=;
        b=XH4BZHBmdVQFWaLIvukwYuA6dfesv5OlCHIiYt+HS0He1hyb8U6F9+KAtX2UUXdEpf
         KgasjEc2Eiz2SLdNDOX6lUtRMn6FT7vA7BupZcQ9zpA7B15VPsqPWyHEdLv3nJX0KYWk
         SqDAlkMfqErZDXcJFqMIVR7F4IbdTsIlX5uCjXh1fgoLYowylIVPtajB8ghIXLX9PpPx
         04RvgdUZlDdGx7JIPQuIZoqHwxhjLvQP6CqyJcW5C38QVQiNfJ0s7a4Dh6m3M4fEG1cq
         KhKc+jIGW4IeKWwadt6VRjZuEy1BrK2YIDg3sTZ9xwA5okJPM7GzfQVfXS7FMGgqUjU+
         GdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528243; x=1723133043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmQLM6kfiLLNztCoNImQmMNq24bv1cMMrdxlIFr9qpY=;
        b=DbWt63+RViWg646kh9HDc6XrJowCBbpEoXpNYZrJlZa7vZhnv/ZpgS0q1GBiDuKvpP
         5q+k2eHdlTvTzxXk6Div7P7Lpqaiu+1DOhENCU7r3J9UcUk6b2ZxrEuy6i5rOVB5KEEZ
         u5u1/m2Cqwjp+Dsi9IpiduMsIWIY/PFIKMGWsAx+p1BL4NnzZkjcwSYBYxnkdcbbXRNb
         LEdcbSot5BkwjN/QcvcQP80lYdBAwm9jqccVu0DIP+19P8AE3iR71elJ38iJTn4KGfGv
         hs7kjlm5PLZzKp8H0N24ACI7qjBIY4cICGSNPslYdpupTzt92GgkbWj1+67aPagBUg6/
         ecfA==
X-Forwarded-Encrypted: i=1; AJvYcCW343q6hW2kbV4d15DIX0w2d8cBYW0SNXPIIg0igDBOEbX/glXEYZJq7DM4JnTdJHcJOxuVMFV+xe3y4pH4kvo2ZCQY5XgmkhYDCnUVcw==
X-Gm-Message-State: AOJu0Yz5Bs38LsUXCfWpe/ssNrHFjQlwPt5t/Wd1gwIiwBd3XRXqcUVo
	7us8Yqci7vokS23VVjz6IK+fCA0u3aA1C4WAjyZ+wkdbNb+IUP3Y
X-Google-Smtp-Source: AGHT+IGacSfUc+jZigXDS3pnYcE+ooJgAO1Jg6x2FCMXCSrqHjkRPminlU51RhY9nQJp/KUM382d4g==
X-Received: by 2002:a17:90a:fa85:b0:2cd:410a:b010 with SMTP id 98e67ed59e1d1-2cff93c59fdmr795183a91.2.1722528242665;
        Thu, 01 Aug 2024 09:04:02 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:04:02 -0700 (PDT)
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
Subject: [PATCH v3 08/11] ARM: dts: aspeed: Harma: add temperature device
Date: Fri,  2 Aug 2024 00:01:32 +0800
Message-Id: <20240801160136.1281291-9-peteryin.openbmc@gmail.com>
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

Add temperature deivce in i2c0 and i2c2

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index f55ffe9c4d89..0455475fbcff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -221,6 +221,11 @@ power-sensor@45 {
 		reg = <0x45>;
 		shunt-resistor = <1000>;
 	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
 };
 
 &i2c1 {
@@ -271,6 +276,11 @@ power-sensor@45 {
 		reg = <0x45>;
 		shunt-resistor = <1000>;
 	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
 };
 
 &i2c3 {
-- 
2.25.1

