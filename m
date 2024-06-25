Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D3916779
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:20:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TSnD0A3u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kSj0S5nz3dSV
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:20:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TSnD0A3u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSW2dkNz3d9t
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:43 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-37636c3872bso13148145ab.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318041; x=1719922841; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=TSnD0A3un8snjPaFfARHIo5VOzgTB3BnNsFjBjgHqZJ270L5yZGgk7D3djGrRcB3CP
         dJrmrUAy7wYfgjCFV4fjqph0LbsdJ25pAToGk9RNOHdUU20S1PrwdoT4psVJojqBTWLV
         QAZnjzEbubC3BirjzC/kzNV3aMOf8TUsFFud7jZQ1tnnSnFahAnKG2r3ikLkaJxtmiba
         U9WNMtsujrQOK4xw0r7pqdXSoRubnIxvzD/XQ9JVwIcnjOhrhEJJfMNyISCQKoNTvywJ
         gAm1xqBD0jjpQPTfilzs/1pcBQZqMgDLsBE3yGtbFv8EMb0lou5siIbbg6fFA/yZUVSz
         SzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318041; x=1719922841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=KTl2o4wrEtNXRaFsdlP9dQ+h0OvPvvklrIMf1Ai0wuWmGQ582QBnIca01bCgF5yp9/
         bI2vSllS/0I1vmgd+2B3NlgUbI1lvZXKgyzEh2gSBGpATxtUmDvCICnKYGpKsaP1FAAK
         MHhZFI9soSdKDUofLoqYG28Ohz+eVk1iCoNU/bV9l9fAs6Dr3j1KG2l2NB99CelxuffC
         fcup1TvmVR4RxyicdPs4fVK8XW4y113DKxk4Rq/YgvXMT7NtVtLqLXuCm0DBi4ad4YID
         aIxpEgrvmyHlzf4aWQexPAmbDLCYiBc+bqOl7oRl2hSKE8CVS7bf3FzFOSu5v591B0Av
         5/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dH/QtBWfS8EAWJ3vTB1vNG9Ji0X4vnkK1KjoK19SbpWWj5eX8/akaCOUhdYD18IsiHEo6wexHDpcqCx2nm5b1jSLLKG9SPEmYzXQFw==
X-Gm-Message-State: AOJu0YyRvRRk7ES2sjDam/cReZhRXCvheQu8f2RT3qb5qgh12WfAFS4U
	vR0bzDNcybC+PWectFCYYEGE5JTmklCk/5iZ5E7GT7d3k+ELE2e6
X-Google-Smtp-Source: AGHT+IFcrX7CdhR/pMxRJq0wZkjEjwEighbr46zUZPR2+WxUgh0dszolL86yFFIF60yzvDcpdXT/9g==
X-Received: by 2002:a05:6e02:b2f:b0:375:a85c:5fbb with SMTP id e9e14a558f8ab-3763f5f1d54mr94896725ab.17.1719318041267;
        Tue, 25 Jun 2024 05:20:41 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:40 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 01/17] ARM: dts: aspeed: minerva: change the address of tmp75
Date: Tue, 25 Jun 2024 20:18:19 +0800
Message-Id: <20240625121835.751013-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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

Revise the address of tmp75 on I2C bus 1 from 0x48 to 0x4f due to design
change.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 942e53d5c714..e20e31917d6c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -145,9 +145,9 @@ temperature-sensor@4b {
 		reg = <0x4b>;
 	};
 
-	temperature-sensor@48 {
+	temperature-sensor@4f {
 		compatible = "ti,tmp75";
-		reg = <0x48>;
+		reg = <0x4f>;
 	};
 
 	eeprom@54 {
-- 
2.34.1

