Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434595794D
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJB6pv0z30Nr
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MI3O+5e9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=zajec5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjSPg0tzrz3fpY
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 May 2024 16:31:02 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e428242a38so52201031fa.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 19 May 2024 23:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716186651; x=1716791451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rz+bZ02LFpOpWAtlLL58CncIUnYmXf+/Ztkgv4PNBmI=;
        b=MI3O+5e93c7MWOaBAghSPVEfxzr9D2lv2zag6VyK2eb/b5ao8jATcrPsF4U3uR0kHg
         sO/dUiiyemIRuid9oG8KhRkjOAZJG8T13MpRB9NJScRrOuD52ktPrJWa5lZN3fVvGmP1
         t2OcEdLBJs6cmWk6ihuhNR0e1klD/KYMyeoeTLfVmeTEoRcBKnmSY7yfkUYV7yVcWbIl
         BJn9CxLYsW2EWC7AgmUxarK5bemuLcrqCkjHpWvC8QENCzkIkgmwfomZoeFKaIcLJhF3
         o0m4rufdn08cS4Ni5Pyf9yuMIA83h20IOV6pS1EY0PzbSLfOf65faBPdulbAL9Ncu8va
         us8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716186651; x=1716791451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz+bZ02LFpOpWAtlLL58CncIUnYmXf+/Ztkgv4PNBmI=;
        b=I1jjd/odU09E2NL2ZIIxDkc3IMcCF4DQSPi4+YE4i2STecVntqPd8Hkzw05ppgOtUx
         6N9PY4oXGU5+G5Gz6JDlCDgOX4c4NeM7aHjkzxvtj7MLxfyYFTrfgyX9L92qGztumUyI
         NLzldd6JmgK2B/XehVbRym6qwu4dCnlMPLizOQoqDNCWIsSRKdf5gX3WQoZKfR1l0bAZ
         W9aUKHyKb/w9V5R7W9nwz8yEqYUxEzvM1JiDXH+WD7rHtaHRiySx5rrbjyNPEMPBu4jl
         K6z5Mh0oHnWCKy7yRqUj5O3dpnlrQlqN12g+i+8Qhe17Ug9goNinbbd5Pl5Y4i2/d/dU
         nn9A==
X-Forwarded-Encrypted: i=1; AJvYcCXRZADARmC8cYaBf95Rs26AG2Pt5wOIojkHLS7r4zhrqvm5qfyHCh+roexSzKDxT1IqB5cSFYX8/vjenVnBXRRSvWRfaQ0SvZUVNklUUA==
X-Gm-Message-State: AOJu0Yzs4kL0eCpRIDihHZCkT5OL3ZRPHwVlTmYEfDMJphsxDG/U6A2t
	v7jdHQ7Z5SzgnpZGrO0zgi6wPuwfE9ZrErg9vP3FKcJAnO3djI6L
X-Google-Smtp-Source: AGHT+IHVYvnvCXtm+95G/SYDMO0LSxZtBoXuchY1RlSE1t1WtKyDMgbJXZt4O2SbqjvxZyTfxOoH+g==
X-Received: by 2002:ac2:4c50:0:b0:51c:d1ac:c450 with SMTP id 2adb3069b0e04-5220fc7c5camr30222428e87.10.1716186651016;
        Sun, 19 May 2024 23:30:51 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdcd149c5sm579170666b.201.2024.05.19.23.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 23:30:50 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM content to layout syntax
Date: Mon, 20 May 2024 08:30:44 +0200
Message-Id: <20240520063044.4885-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Rafał Miłecki <rafal@milecki.pl>

Use cleaner (and non-deprecated) bindings syntax. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
index 555485871e7a..c4097e4f2ca4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
@@ -110,11 +110,15 @@ eeprom@50 {
 		compatible = "st,24c128", "atmel,24c128";
 		reg = <0x50>;
 		pagesize = <16>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
-		eth0_macaddress: macaddress@3f80 {
-			reg = <0x3f80 6>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
 		};
 	};
 
-- 
2.35.3

