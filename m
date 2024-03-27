Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F254088D98F
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 09:54:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lUZYei26;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4L7W57Lqz3dTw
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 19:53:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lUZYei26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4L7M716Nz3fQH
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:53:51 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dee27acf7aso45724725ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711529629; x=1712134429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=lUZYei26nEbDhwqbKYEx3por+C9aDo1/JNuHA7jUOL7zt0nWD00aVSb3DoC/geZqXz
         j0SUFKUEzPbLbFUna9eydseNM7ScRqcF8m8Yqi+qhTqphSSGuS/TkgUP6OT3odAtHQVr
         FZi1N3Dahf66i61Mso6u02Ql+EkpVSRptmR/XvtZRPvsWMINcaktz/nMFwoI4mFam+Bx
         pHcETN2HJHU5hPtfIjVWiY+rteLl8zqzvlPFVWHJ5xGe5KVGxOzbCLCACGaJOT0zcYG9
         jAbW8VWRR8uRoarq0hmZSOXnT+PD1tB45dhH3J3bK0OkiqjxOOKwhCciLUzLwVxuh5C6
         LNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529629; x=1712134429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=MtJTLwaRzeEKYOVD28k+K3jvVR0ZiE2WpEOmV473wtzzv4qdQVW9aleROmAfVKhkQR
         xnZ01LRwfoDfzc1Da4iFsj98orjOi41iS6qo+62bycIvzzMOXAiHohRxcD5rMlIOtgGU
         v7mK0XMLbWPCnv2+D44jFMJO7M/BcM2ntQjzM8NvkY6iBmnzZJ+Httw5rInO08/4yKNj
         hTY4etJs+G9vxG8GW7So2KQ9+SsI5fc8iiZ5m9V4vm/n9CNq8hfhidRo4XxohMu9hksG
         UYLNxWavpjuZekbHkcrF1I83BisbpKeQ32OVq07/HPQGciHw3l1JcPGVkWDl/cm2RpcY
         58KA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7x8BvQItbUNh9DPi3DnCCymp/6zHD5Hh23SOpEG7h44lYWkBsXmq/TFI30GUNF/BOOWKNDRRM8gA2v4vfopnPPslow8y+KduSOx9PQ==
X-Gm-Message-State: AOJu0YyYnjADTL/AwBYL1cUklGOm2PBUxEF3MOu6tmh+Nkbp5Av5QTNK
	/Uy8TuBm4JViEyBHjsASyCPhxuUiad3bIyb+46IudRjci6eggABI
X-Google-Smtp-Source: AGHT+IHMtf+g4HCFGxUFbq7vGIja15S+RN2FfG532r/JlKdvx3ne3MqOCeZu8bYoa6cKVVkgxKSGoQ==
X-Received: by 2002:a17:902:a3c6:b0:1de:e5aa:5ce with SMTP id q6-20020a170902a3c600b001dee5aa05cemr1931176plb.41.1711529629258;
        Wed, 27 Mar 2024 01:53:49 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e383-3566-013c-5a87-9abc-381e.emome-ip6.hinet.net. [2001:b400:e383:3566:13c:5a87:9abc:381e])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001e0501d3058sm8356848plb.63.2024.03.27.01.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:53:48 -0700 (PDT)
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
Subject: [PATCH v4 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
Date: Wed, 27 Mar 2024 16:53:29 +0800
Message-Id: <20240327085330.3281697-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
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

