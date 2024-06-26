Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD749181B0
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED5CkpwP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQp25qdz3clf
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED5CkpwP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQJ2Wh4z3cVq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:00 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f47f07aceaso52158105ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407160; x=1720011960; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFnpTkD+iTiggxR5yfNrPNsib0iELLQcb0TdrQtKxFU=;
        b=ED5CkpwPkCbZMfRSzlKL08YvxpOwMw30+zxfhrCiRIjEd0h+FBQLhD2YHzLEuV2gaK
         DRMib3tGEjGEj+mE8Wj9As+gh/4mbxCCL8tXtcOGE4OrLQ2m7/HpBfZMp7aHsSGxBMNs
         s4IZCrZrAkmxrF6jhsXIgc6P6J+PMwhE0rWNyH+aTs1fO84id2O9Mxqpgi/ajQ4uR+M1
         KGo4ZSbSVQsocM4IhJXTJbq/YlQ2NPpvLgXEHJU0+HXGd6SZZ7MW5R1UbdPTScyHgEwA
         6CaBXfU9xY4Z+wfsDCd7bajTpiqszcB01c0h1q866foxCrVvSoRMROYLlCMAUsk8gHUM
         VLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407160; x=1720011960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFnpTkD+iTiggxR5yfNrPNsib0iELLQcb0TdrQtKxFU=;
        b=LWAlJ57TxBHykE3aaqPhan2TuuChhP462YtUU+r6Wo0UHj27+y/wYAHrUa79UqHiB9
         lj8nWVCVsou0Qy/3Xja/u51RouJW5bLfb9w7MmgihFQh9pSFQGkaVXJx9R6pcGeeJd73
         xwEh91ZXZ4Tb/z6bK4hK4Otd1jC47lRlIIBmzb2WOGiTNtxFCVsMKNS1HbaC6OL9T0F8
         +4SsD4ZWTDGQTUATMbeNCHLmcIs8nuCGmxr1Zv938JRcHqL5fDaiBiG3FSEbbfpGMMyq
         bxTmnNS6iRM7/OX+4UMAypw25oFuLlID3454nhYbN9Rf5IfmEys5mNv8FanmwJlgnhiG
         p6kA==
X-Forwarded-Encrypted: i=1; AJvYcCVvLk7pT9w5dgg3Xx4yKmbMkWi4Tg8OlnnUGN5awikanfjNMXZfJlMth6TrCCaVEOpbTx7a9hEn2By1jZw+f2f0X/QUr7DRSpkoRMz3Ag==
X-Gm-Message-State: AOJu0Yzu9hmBkUjxq9+GpV0BtklqpenaUL0Byja/VZh5BY0vJyGCA9Q2
	vIQLu9em7gVWsL5iHq6McW4OVz6TSBCvg4Rxfh/TsmI2MRwl/r17zSDz5ni/
X-Google-Smtp-Source: AGHT+IF0MYsNOPgWi/B2q9qWKBjg8KngP+dLJdfsLdFvkLJLv7uuoSdGL6vBY/ETaxf+BTvqzMuIbA==
X-Received: by 2002:a17:902:e88a:b0:1f7:1ae1:cd7a with SMTP id d9443c01a7336-1fa15943bfemr120975575ad.62.1719407159960;
        Wed, 26 Jun 2024 06:05:59 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:59 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 09/17] ARM: dts: aspeed: minerva: add linename of two pins
Date: Wed, 26 Jun 2024 21:03:24 +0800
Message-Id: <20240626130332.929534-10-yangchen.openbmc@gmail.com>
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

Add linename of two pins for power good/control.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 86d319d7edcd..f41dcb36243a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -557,12 +557,12 @@ &gpio0 {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","","","","BAT_DETECT","","","",
+	/*V0-V7*/	"","","","","BAT_DETECT","","power-chassis-good","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","BLADE_UART_SEL3","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-- 
2.34.1

