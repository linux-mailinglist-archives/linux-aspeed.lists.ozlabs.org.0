Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF19181BB
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:07:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eVTt2XFI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MRP0xVjz3dBX
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eVTt2XFI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQc2zQFz3cfQ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:16 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f9ffd24262so35490885ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407176; x=1720011976; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=770f2s193tecuqJzO0rEDeOzzz/M/ipXn0oDb/92wqA=;
        b=eVTt2XFIYF4QGJnEyurPgo/shcDIM8T3MY/mE33nE+kgzplrPrphacysv1Ooddk3Ut
         8yCzxhxMfBD0pdo5xEVun/5dgJLdjose+Xs6no6X/AshaJT0YeI9U1wo3Z8n61yhq0RQ
         xP06PH5dZ5UlPmpeRrhTWT7LC9p65hQ9PY4Blrf8isghqQA+ryF0IFZzWYPW9+S4k4zH
         73o9DY3f4GeC5JhQLflalz8YgcCMIVWhZvPfstCu7NZ+4Kqy+s71Ps2E+eutFZmJdOS1
         GS9IJNcy5bpMIP1pxj9Njjwtwc7xlaQ7Z64tp0nnu44CguWPgnWt0DJ01yKQvjP6oVxZ
         Y7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407176; x=1720011976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=770f2s193tecuqJzO0rEDeOzzz/M/ipXn0oDb/92wqA=;
        b=Nma8MhA15EFd6Kl29KODicIh5bLXPocm835RUr7TLhp51NpcSiwTH1tb5C2S1Wuj8g
         RL4WRXXm395VZC50hkYc1UNR26Lfd+CL9j+OfOtlhOAnljAYwueDD2oX8GFUneadbPiT
         GcpNeQE6zdB0FT8FMg1mO6uzmHlmAIT69qErDUPuhYDI7KTFCkHl6KzWipG3uWEq9CSn
         b6tw1JyTmQlROhEsehcoMwsybSBwpBsb3/3EmxuuaIPVjflTia2HzWVdjw24SeSImpGj
         Y3KI1KtEzxEMym0w/qtu2urxCMY49kpvNtHESfAVNnTMwGEs+M1C603RnQQ4Kh0RdPVn
         YQLg==
X-Forwarded-Encrypted: i=1; AJvYcCVxUYbK7mD4VzGDSb3CXy6MpXUbr7kVxfNzkOdXNoVMc5ZedY3iDAtofDc7uVpftGfMUJlQS+B7wdfiCbCIKIcLmdtVjtFYTVEo2vv3TQ==
X-Gm-Message-State: AOJu0Yy+MYtzJeIcKT8o16o4uK2mcJCiMSSZ8V1YOSZS26mnuXxlicZp
	9ZaK1pc4oW3Z0cKo5cRVJxSCKPHdQWl6OS299GhSy6nHaMO8rE5S
X-Google-Smtp-Source: AGHT+IFpFuRVXmzDU+6hiLsXKZf0R17rd/F3pxpvF8hL9473AzT35b5mBF8q9rmvLOIWAt7I6H0XhA==
X-Received: by 2002:a17:902:d4cc:b0:1f9:9d40:c9bf with SMTP id d9443c01a7336-1fa23f610b3mr120876115ad.18.1719407175639;
        Wed, 26 Jun 2024 06:06:15 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:15 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 16/17] ARM: dts: aspeed: minerva: add ltc4287 device
Date: Wed, 26 Jun 2024 21:03:31 +0800
Message-Id: <20240626130332.929534-17-yangchen.openbmc@gmail.com>
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

Enable LTC4287 device on i2c-0.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 093305b598dc..8180fa5c1854 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -144,6 +144,12 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <2000>;
+	};
+
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

