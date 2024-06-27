Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC7919FCC
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f++2UyHu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGg5dddz3cVq
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:00:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f++2UyHu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qG43x9Zz3cXL
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:28 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fa55dbf2e7so29891615ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471628; x=1720076428; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOmTqjVkRHQxfRmStHQPSM5D9RFozJWPKk5wjb7WZYo=;
        b=f++2UyHuS/kq6kuSuiJsm+b61J0Y6uS9XEICrjD5/g94am2Ryhep0YWvxRJrEvNQ/0
         diWTI5yUusLShF1100fk2CkMmBXlDsagn9knuYfRECJdjSC310UzfcSeW4cJidI2aAtU
         wjs1XFjsHiTuzZdSyZfbnLxG3KeIMWqOD+K4hW25X5VYYdBc6bXCnuuejBHKeb3HKegY
         gXxrPqiULmD8zc+WttUb2DBVj1B9deY5njTifWk/HsoCGfJHvLv85djmgmIAYNEMhFxj
         3uuCmYcObYZ7fZG5ZK6SJOK8TPjfJLnaefXaA8nUkmSP+1BFxat4uobMMMd1ar/1iqGO
         DU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471628; x=1720076428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOmTqjVkRHQxfRmStHQPSM5D9RFozJWPKk5wjb7WZYo=;
        b=I41AZCsrbYe4ht10hRUlOszbT0WfZpUESzqLTxrQCap3Pu9bJ1Ip/AaLJRntpU8uBd
         mcCh3NaYiuucvh+vDa7sBkHFhtKvPcIZ/d3cXJOMPhS04khOVQ6Dqtqb09hB7lVjcUsK
         uT+RYg8yzakAFvmnSOlF4H/n8MvMbLwjqJAcsVr2cbSOxTb9SCNZxTW7xQYHVmHEIGBH
         tXrIrTNaz3PgyTmZs5+ZX6qXxigkhY/Zw97govisCPGn3a9UBzFKzpGLSDixoqpv6iQr
         JNr4SM5QbUWANEni9DnRVgsLyzBHPSXZclY+7OEmEmUOeVlyuMpwxJskgJ5FcEbhFoty
         GMNA==
X-Forwarded-Encrypted: i=1; AJvYcCWaejychrhuQ5HG7oO0oQ9QR9/bkMdrtCspjjyENN0XMxGSPa0McYfZDWpa27KkxJnr4R0UVsdYgiF4KgrDpxYoT1ps3vxiHawBDZFE2g==
X-Gm-Message-State: AOJu0YxQmKX4GYK6zhDvWqhtWPSu71hH01A2UwNzuToVV+c4hTcsIBxN
	7oyrZ04XjwmTa0VAJdWWLvxeQgHZOzlPbdMPtP+z1o/WlKke7YPs
X-Google-Smtp-Source: AGHT+IHuq2KBDjCkeD9/vorD5v6rBDJnyOHsVWTzHXkPod42z8BY6fxj1j5BMEPxjygAKr4Ijqxy5A==
X-Received: by 2002:a17:902:ea08:b0:1f9:c52f:d9b5 with SMTP id d9443c01a7336-1fa15944ecbmr150184135ad.66.1719471627892;
        Thu, 27 Jun 2024 00:00:27 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:27 -0700 (PDT)
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
Subject: [PATCH v2 03/10] ARM: dts: aspeed: Harma: add sgpio name
Date: Thu, 27 Jun 2024 15:00:05 +0800
Message-Id: <20240627070013.2509150-4-peteryin.openbmc@gmail.com>
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

Add power-chassis-control and power-chassis-power
for phosphor-power

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8fb30029e46c..0c4bf165d0b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -520,13 +520,14 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"power-button","power-host-control",
 			"reset-button","","led-power","","","",
-	/*Q0-Q7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
-			"rtc-battery-voltage-read-enable","","","",
+			"rtc-battery-voltage-read-enable","",
+			"power-chassis-good","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-- 
2.25.1

