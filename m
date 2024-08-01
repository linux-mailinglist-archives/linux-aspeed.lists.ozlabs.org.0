Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E7944FE8
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kztzuuTw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYg73qpfz3dTM
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kztzuuTw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYft39Kpz3dTC
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:50 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7a0c6ab3354so4901196a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528228; x=1723133028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOmTqjVkRHQxfRmStHQPSM5D9RFozJWPKk5wjb7WZYo=;
        b=kztzuuTwKESrQ1jbW+13OgkFGOcxCBUEAJM++ApbQNHTxYzmuEpQdd2YtFKFMR/gef
         +ohgeGfmgqtakYTPwE7IElONpO1i+7xz5G8FjyliHufXFOBjrn7TZ7MdKWlxG/v9I5pq
         ISKTtr+SFyuI7XHmcDF5emzf+lX8fV7Op0MgJaGTgY5Bx1o+pzZMbjOi+xalBP7h8bvn
         7abY+RVd/pSauOaf2jmnjDkdiVaCAEsTssjQocIKhCw+Fk/YO5gMw9QOeFH3Jna98NDp
         M5HXW3BejSjuI24pDef/UJZmkB6CHBdYkJkgLb85vZA97teEapw9u4GWFctTVEsVyh51
         XVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528228; x=1723133028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOmTqjVkRHQxfRmStHQPSM5D9RFozJWPKk5wjb7WZYo=;
        b=ROnVP+jwmeqKoQm8oNoy8pOK43sRoqQX+NQUCbdrdXSxzb9EBUQR70wQIyrhRGwsjJ
         boEPN6qnMyMKIJEpfNlCwNnrZel6lt3d/37kZ6MYOTDKI92/yZgyFUOJNj8IBv5DTI7A
         /W8VRpoDYpdcU+5WyIHtdMKa9jWhZbIl1Qs+1m9LGeGeHQpz7VDbZm2IapnQeZBYbAlO
         WDnX5YU7NJkhsyxqlWWrXWYEaLZkXtWLRcnL1WHsHAK2885m/4Q+CFWbQgZeGqlk+hFN
         IH72ncmt07nY0SQv/VmXRl5E1E+W0zBqpgR5TPqKCayr90K0xYV1FH5bsJMg0i+IwuTu
         F4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp5MgPPcXZ0XbfScrTAXwqrBES6iC7nSU6uqejNGQth8do/yDlolRWm1iPXas2R03hvreGLLYlv2apnz5U6lVG+Q0F8HhbYTJQ/VlI9A==
X-Gm-Message-State: AOJu0YzCO/RsJ1Sb9iwrFqkskDUJFEmuavEprPLYa/qOte4ZpzoeyHeE
	LKiImZ5VHTpM1nXo8L1AKGYhgKO03p7Z/rV3AzL6YLT09qRNjF6q
X-Google-Smtp-Source: AGHT+IGu/QE6FSqPxWJP1pk6Fr6YnPMd+a/LbHhX+IELdNYtdMoUdbIVX7IKtor7Cm7rJEKbppJlCw==
X-Received: by 2002:a17:90b:1e04:b0:2c9:8b33:318f with SMTP id 98e67ed59e1d1-2cff94143damr808215a91.11.1722528228133;
        Thu, 01 Aug 2024 09:03:48 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:47 -0700 (PDT)
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
Subject: [PATCH v3 03/11] ARM: dts: aspeed: Harma: add sgpio name
Date: Fri,  2 Aug 2024 00:01:27 +0800
Message-Id: <20240801160136.1281291-4-peteryin.openbmc@gmail.com>
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

