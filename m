Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF89181B7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NUgCKacp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MR82q6Yz3d28
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NUgCKacp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQW43msz3cVq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:11 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f6da06ba24so49022725ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407171; x=1720011971; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvFxbMreeuSo/wVfgiSYE826uiYtvaR7mJSAkGu1qGI=;
        b=NUgCKacpNyniVMkmjZTfFmcNYLtSJa2byK1caj6Rq/uPeSR5QgNkswmrftnv/cc+W/
         PKtTZLBjjiurP8eHbvikvZyWs9mDtRFRXZjKC/LzhG+8mR/j2qOdn2kz3pmhLMHx/YOO
         oacq4+hBBRAY2ZCAy8YeiOVXVSswhRSpRa/IJBddDTZSmlJpeJFqoaqMgZ0bJ7H7hceI
         zVur0EA0R1jZRMqOmeR+zqJPNbNzGUUbANP3arUBevlXPLghjTtCRdV4qerAikonjz1V
         +tHxjrRmHpg/qWN4wh1VF63xyXZk77AvD7zSxjKh7MBIQ0Z0HhsxvI/O5pIsYQHf1Uwf
         K3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407171; x=1720011971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvFxbMreeuSo/wVfgiSYE826uiYtvaR7mJSAkGu1qGI=;
        b=SPFq3OgxpfMTdJgRjtaPNd+IFbllfxoGRUgyUEtVBMIrB8b78x6nsJhtOCK60BCxfk
         uX9hWMLnE4DSjKgaxe3a5eZIeNUvic/DdE6J6yxhfp5ihCpc3CxiIgX8y1b9H26Ra8lP
         0Up6d7b0ecHE3E5Jziz5Q+tijeedUsxoscihSwUNNzc4J60ljgMBxMrq3OzY7utEpIKR
         /GYbV4tK+W0l1zbX5i4XjD1JnNwQhc42mtA426KTvdLRt47jtUPGooS/LF6V3XE0/pxm
         f29Tm4E2ASz4+aHRSNZ0/JVq6zBfZF24GHXCbuVTr9r+n6breJiuuDLZALT4iS1Y+sqH
         yMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOwDsQq9RFPvGdeS6vE88+AezOFStryYKdcQxU25l0Qk/recKUGtlXGPshBv0hM0P4BD5VqL/ZrcckCdPuZPsJDYO1vuTBOk0ZKVJ3rQ==
X-Gm-Message-State: AOJu0YyHq33eNoc/K7deIUMB/L9AEKPMvn+eByvnoNzH+URMxZU2eVem
	+7rNg3rx8N5A14SxFlRyi7+fqEp3jwuwNzvcDUJbsEwgVQPgP46n
X-Google-Smtp-Source: AGHT+IGueZvTrYwVA/faedHrbTl2mOgWOsC1cuMKwfkCZai5FZoLoKDrXojgNWmol/DIiaCQiA5EgA==
X-Received: by 2002:a17:902:ea01:b0:1f9:8f8d:cc8f with SMTP id d9443c01a7336-1fa23f07230mr127107075ad.11.1719407171209;
        Wed, 26 Jun 2024 06:06:11 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:10 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 14/17] ARM: dts: aspeed: minerva: Switch the i2c bus number
Date: Wed, 26 Jun 2024 21:03:29 +0800
Message-Id: <20240626130332.929534-15-yangchen.openbmc@gmail.com>
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

Switch the i2c bus number to map the i2c tag according to the hardware design.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 7a790e347853..8f3f15a5c148 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -384,7 +384,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux20: i2c@4 {
+		imux20: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -430,7 +430,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux21: i2c@5 {
+		imux21: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-- 
2.34.1

