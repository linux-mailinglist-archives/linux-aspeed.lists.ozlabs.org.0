Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F127907695
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DJgJjJrv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R906lsHz3cTS
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:27:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DJgJjJrv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8c3TxLz3cVG
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:40 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6f95be3d4c4so439862a34.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292398; x=1718897198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iX8aCdLeiSd9q28ms9w1B6bv8MCufq0seR2PtHpfUk=;
        b=DJgJjJrvyBD3gFcjfqLrBo8dlxyNMd9KRLvmEvpPmqlbBrj4mmofMy3LtfTUynOkbU
         inzzYAhUCmkJfWwM5Z4UB3gCR4A5OVpj1rFGlAh6SflFoO6A4XXUWIs1jPhD1E/r2tc4
         xhgTusAlCmZ8+0an99QjY2TPgjusDYbLHvqSo/HsYWE0Yc7C6IoQf7c1ZuAS01BhCFpb
         W+Qc+Cpa8iPRxbA7C4nSeYu1QcCKYy7HF967sOAg6t55CwwtArd5PCVskH992Rp48Elq
         VlrmzVTtWJYzFdLupZrnCR1QbRJC8tlCEgmM1yAmroRwbE4rZRuKVVCU1HH7GIIcRHeR
         vztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292398; x=1718897198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iX8aCdLeiSd9q28ms9w1B6bv8MCufq0seR2PtHpfUk=;
        b=wyEEX5JHbvNlON5ihypN66JYevUYjevhTDljDnyrKOx+MIQTJ5Ydw/dUhw7/4y7/N7
         NWUggYgNUNdEsZoAvN4clOj9T+jKru87dNMEQxGcg/NUCI1HzydTyRkWvoOryOV6rd+/
         /PHJx+Su4fE/jGZCM/TT9lbtLAJOKltdllv2qgiaGNRdjOjQBPbwrRO+yppl6hjHECF0
         eh0+WIkbCvU1AEmLlbbT1fVmLcBM0DWIExFnHc7g1fu4lhhuk9Vh7Vb6vAauMwzS+KLE
         hLKdHOpAc8WoHlDfa4lptlvVKcqa+3N/DmuCW8deNK9bcQKrh6jchfcKfOzC23uixFR7
         Shcg==
X-Forwarded-Encrypted: i=1; AJvYcCVK7QVO5O9dzkpxnqBkrpMueY3WSdvmiwFe2IOdDl2QSO9SYLZSWel0sb5aT3wXHgAIU+eIOrESobAtlRIv32YAAdDV8/jP5r+QR6hZdg==
X-Gm-Message-State: AOJu0YzuiRnAAV6db5CRhnax3dq5dT8bdd6KYqGlPHB2MyUqbVFnnzty
	ZohNH18CF76f/70eOVCrLnAm7cf0vDTAUGeTvMW4OvKcWj1QUGtx
X-Google-Smtp-Source: AGHT+IEj3DrHn3ST/RUxDPjwBzLIUyUdRzaBpzGlYtxwv9jX4plp5kdttH1p22qdwS0sdbs8pkEyzw==
X-Received: by 2002:a05:6358:7e0e:b0:19f:174c:7fa0 with SMTP id e5c5f4694b2df-19fb500f43fmr7937055d.24.1718292397778;
        Thu, 13 Jun 2024 08:26:37 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:37 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] ARM: dts: aspeed: Harma: add sgpio name
Date: Thu, 13 Jun 2024 23:24:21 +0800
Message-Id: <20240613152425.1582059-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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
index ef5ffe190445..06c8b5ff1125 100644
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

