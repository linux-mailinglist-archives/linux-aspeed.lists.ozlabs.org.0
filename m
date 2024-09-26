Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B107986D52
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 09:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDlFy0kd7z30Bp
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 17:14:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334852;
	cv=none; b=l/tw6vtOozQvFWqYM7lPcJDuTXoUh1eGTz3UaSUTxRirWOdt2Gkxj2jRp+9ax66e1J2NUZOC/ZSr89l5meAL1NXVSJLv+mHAYQxU9Y4IbJSx/5K6wfl4x4yTugxgqkpNTkq+plcXhYLR5L3z/4V0kQFGl7tL8FkupknKwlaZG3uBiBew1iLaJBQpoI7RjKmwGbI6703o4yqNiitIFv+Xp0qHVbuKqaaH+CNX4GMuuVVg1QqD0HxRXDhrUjFDhNwc93tdwmfBmM3lyWVZhfpl0cg83X409zjUDEeb4YB8d1ArUWQo5tvDgLPW9KUzo2wlLHYfZdI8BFzlIdXDSnmCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334852; c=relaxed/relaxed;
	bh=0br9xx+1hI12eeylaPicMIvQh3OEXvDraYoSk45RdRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7QUemIx1iXsrpNb8au01SSKTQdD2cGm+yVvBFkG0ttTCsbblElSuXGmohEfwz0OEhP4yDueG1G1SdeqgrnY57Z0oOFPM/FDR6JHVLRFFaBmZwmRCtao4AME3LV4JZlyPycmqYvCwsaTe57H9LGpR/BrlnHLFAyvGEC7P2JZSNsGbCaXUs1BXn+AJLO0vCjGh9k/RFpejun+Bs8hHHYZ419EYslPoPix4Bj34Vj1Nz1TCr0ojsioaaismRWaycRyIs5/Ca9zBBuf1dSv9vxGC/qqnjmjeN6fi6+ys2lrmF02kHG4iPd5beE/7nWu/Z7HbXJ3i3fLaNRsXkTa4M80uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AoE9oFAa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AoE9oFAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDlFv6Dvdz309h
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 17:14:11 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20551eeba95so5749125ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 00:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727334849; x=1727939649; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0br9xx+1hI12eeylaPicMIvQh3OEXvDraYoSk45RdRg=;
        b=AoE9oFAaJtiQoIAh5EgmV6CWLPYEq8pEJ0mwFfDTQs9YRl9lwS1eWCjDh19yLdH3kZ
         O8tBg9Sne43nIh/ozbim3s1eBhokld2mKTONNKt8cs1igLpvst8Tihap/lRstooGaG3/
         CMGDXa/sKjl1GOhALjmEC4n9uYb13gRl2jQ5scQKxchi6tK7OzOBaj3VdzboGHmIABgg
         zdC4OAw4g2DWqFIkHwQN3gJXcQRBTRBgT7IjNCJcdYpp5EL5Y3eyytLXptvgQa7n489u
         YNdTKe3DgYAEGlT3Ad+c/HV6rj/eiyIE+RVQSuMkTIAWxHMgpzfLdBp/nRSwuX0TVDUg
         JFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334849; x=1727939649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0br9xx+1hI12eeylaPicMIvQh3OEXvDraYoSk45RdRg=;
        b=OsPO1fKz6ktExHTUIQ5yI4ChCy8zqOzSZwZ4frPGwb76oPVk7/35LWRpXUgTM0KiGL
         ssNzvFcKvs0gGBAPYh51aPamG7xduYxfOV0KP896iYi3W7OinX4krMj5O8W062gskJ7B
         sLi2AH8IOcwtrqu0ss7Ox/866u6L7Fz3TPM3eaahh0kjrypmLR8ipuMz1Lh+VxcFED80
         lSioqHKof+qaJEJGv3jrrnGwe1ev8baf99NpX9+LmzcdOEFgQ/8I6+PnjOe5Xh0gvKzT
         jNwaHO2P1/NNZbQHAoVzoW8XgedLrEIDmQoMjkIFlj/vAcUrO+qjT5DAh0/uFU1F7b4o
         wuAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUadpT6H6XCuoBp8uZxCZ3yTgmViXgqafNqNMorLSdkFVdOVcwJdezkGqXNx8YN+DaNgWKeGsXUV1iG7fI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwB2mhC/bBfIirsMeeL5ilXYDt13YIUlN1w1OgYryZtRh8haYvt
	Y4zCtqIiHF49xVTLq+y+X6vAC1MlNENgsZDPEbChhQNUpx8Pm507
X-Google-Smtp-Source: AGHT+IGT9OKPl5lRL+by+mzm0cbQ+9A5WLrLoLDoEAWmMG8YT88P6yuMnUfWS9wkVwna4rdG+ZJ6TQ==
X-Received: by 2002:a17:90a:c794:b0:2e0:9275:b4a8 with SMTP id 98e67ed59e1d1-2e09275b4ebmr2359982a91.11.1727334848898;
        Thu, 26 Sep 2024 00:14:08 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d3e79sm2662906a91.27.2024.09.26.00.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:14:08 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 26 Sep 2024 15:10:46 +0800
Subject: [PATCH v2 3/3] ARM: dts: aspeed: catalina: update NIC1 fru address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-catalina-evt-dvt-system-modify-v2-3-a861daeba059@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727334839; l=751;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=0V6FLE+281a37oceNMtY2U44AQDVLVbnwlBShqJIfHk=;
 b=/KusJNCpvze1qMVWT1zgxWylSTjPwplzIUaPlkXMWaDr2lQP2HQOs/1jhHwb4x8ay9eDIiVQD
 pnpOYdPA/uCC6FEH9mid+pbfr67O+F3ICVhSoKYZxVvTCE2G9IlFgJo
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update NIC1 FRU EEPROM address to 0x52 based on EVT changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 9502d483e738..ac3e57e9c99e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -849,9 +849,9 @@ temperature-sensor@1f {
 	};
 
 	// OCP NIC1 FRU EEPROM
-	eeprom@50 {
+	eeprom@52 {
 		compatible = "atmel,24c64";
-		reg = <0x50>;
+		reg = <0x52>;
 	};
 };
 

-- 
2.31.1

