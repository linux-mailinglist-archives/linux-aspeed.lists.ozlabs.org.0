Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D9588F4B2
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:33:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jhb24PLa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4mJq3kd1z3vXR
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 12:33:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jhb24PLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4mJf1Dqsz3vXJ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 12:33:21 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1dff837d674so3841115ad.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 18:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589600; x=1712194400; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=jhb24PLahBQPM9cm57oKaTezj6LHJPyrHoBVo7xsfWKV3oUNoxCtwYvhpy5TdTO6K4
         t6O0oTb+DKMWDaN5V3ovUGJYmJNlxn+oiVjFE4VhpHkgsYBNrjdGBiUJDszSpk1ePOSN
         ybjAur7hUi+029z5co/5LKBAEubXmn7WLXS7z4xcF0L11W8l0b9QPHcinUvYmRDj+9IF
         rPiMQpq0s6vZHAew9BfYCGWcZKPwC4YinF6s3hYexrMe/W3x+oIh/clSA/bRQ+6FOhzn
         nK/Wum/NRiu+sKjeysJGS4VrSPy11hgmW94eP3+GpsoMka+Zxw00rEWoJiIGmqhDEcqu
         qDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589600; x=1712194400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=ZycbPeIsYMQVc2spdfvjRav2RY864ayhK05+wxoJvLskFoHDZ3T5seeiJzNgPasdCo
         UUFDImKODnLkqvDSNrI7STyaey4mA7r4garll3pAlLdAJAIdcJ0ik8WcZtt8PYBHmkro
         ybzWdYcp5YqSIZiXRjMkn5p5+gTdEXPFmCZbrJLyuyUXImQjzNG+GMFjUo5JVBAWpCAB
         Dkq9CKJwdnEuSYPriuVKTtFdG1kW5IL7/J1WK2DEljULVn4YxA/oYlImjc6xnM1kOgyo
         lWzcohWqwi3dLdiiDJ52rX8jjPRE920j1q3ni7M22XXWRMla8GdAZCiKUDMmabzA+RHK
         0xZw==
X-Forwarded-Encrypted: i=1; AJvYcCWkwZC6efUChLMWTcsvBpRXXvka7XunxVi1lgbmGHSCBPRMkmwmCkjVxMz1UbgCfFQ2oekcrLAfRKHpQszu2FfxDFADwmglTtBa8IIQDw==
X-Gm-Message-State: AOJu0YzH+NA9fhamGVQru3wQ/K/sFCalbHT6mtY/qNi9zQTl7xzkT5SY
	NKA0LvS0+h1j4NGl9XsmQyxeTLqoU95waMwD+PVVqMCGyIVyMe3O
X-Google-Smtp-Source: AGHT+IHiJqaLeX1ZdgNRMa9pBlR+bhPRua5gteIelUWkWhnVizBcWhV4cIRYRWVS82I9hJrHDaThDg==
X-Received: by 2002:a17:902:d503:b0:1e0:11a4:30e0 with SMTP id b3-20020a170902d50300b001e011a430e0mr1966819plg.19.1711589600090;
        Wed, 27 Mar 2024 18:33:20 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-b4d0-66d2-2269-ef6c.emome-ip6.hinet.net. [2001:b400:e355:7eb0:b4d0:66d2:2269:ef6c])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001e0e85a21f5sm201338plg.32.2024.03.27.18.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:33:19 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
Date: Thu, 28 Mar 2024 09:33:01 +0800
Message-Id: <20240328013303.3609385-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
References: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
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

To use the SCU register to obtain reset flags for supporting
bootstatus.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index 3208adb3e52e..80a1f58b5a2e 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -8,6 +8,8 @@ Required properties:
 
  - reg: physical base address of the controller and length of memory mapped
    region
+ - aspeed,scu: a reference to the System Control Unit node of the Aspeed
+   SOC.
 
 Optional properties:
 
@@ -62,6 +64,7 @@ Examples:
 		reg = <0x1e785000 0x1c>;
 		aspeed,reset-type = "system";
 		aspeed,external-signal;
+		aspeed,scu = <&syscon>;
 	};
 
 	#include <dt-bindings/watchdog/aspeed-wdt.h>
@@ -70,4 +73,5 @@ Examples:
 		reg = <0x1e785040 0x40>;
 		aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
 				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
+		aspeed,scu = <&syscon>;
 	};
-- 
2.25.1

