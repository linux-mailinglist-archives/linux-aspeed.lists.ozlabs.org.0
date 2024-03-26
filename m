Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67288C61F
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 16:01:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E0ShvcNZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tKX2L64z3vct
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 02:01:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E0ShvcNZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3tKD4sZsz3vbs
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 02:00:48 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c37d50adecso3697655b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711465245; x=1712070045; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=E0ShvcNZjyZ8f75C17A47LyxqYVkeDIqprOv/suGeilQpbrhEVdGtdT9RYIc6/UyNL
         2Eg+aEYqzngzhIL5JdfcXxHrnUwtUwohYtG0pE8U7AOWOEA/R6ieXrOhqxPCmvzpKgP1
         kRYi0tOCLMq57JjYwNFVxPYaTvdAtBK9sejoisLO5vsqSABogx65Kla3BGAVz6Z4U3I0
         tuVF+7EedjKGx+OugmlujQu7EIkZW1+9fcS8wdmxTkznq3rmiE3SmFM/nxNKO1b2zBnf
         OHFXzlVRhaRNyOlO77pLOSLq7psUNCz9+0YLBiK/Ca8xO4MD1/XV+nr92GE4pGZGgRHc
         7VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465245; x=1712070045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=nDxnmThhdCi/pNmKC91Vluqlqc6UH17gjIiIm942q4pLynwu+mRhZUBGD+BXAB1+O+
         1RzmyffA0PizyZDFULGPONkm+DBNirbRXbYStA7djYwJ/QpXj/Zo6iQODW6sarGjbiKG
         gIsY59j1XgAr7cY6Iystl1Nu+tFfcOnk6b7fuF5fQ1aYiKyfFB5GiOHdVMpwYW9Ueg4I
         LcGVeYkWmPHkEdjC0fDv1i2Fz8uk2K8EcwtaorhHrzBV+3AzPkvg1iDSFEz7L8XyNTm8
         B3l38UKZTYw/m6j8ySUzeggIWJIAH/6nwGxsj66JTkSnYGgT976tSdUF/KTIxO0wWE7l
         a3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWNQcF+Kad076nnTKYQ+ppwu0fCpCoywm+tLmYU3TVQ/9XVzrjFPcH+mcJsYUYWxEiy/cKzdiQBXDn9+3eVdIhxWKXREbVDGf5J/ubQ6A==
X-Gm-Message-State: AOJu0Yy+uJM14lCJjAPIL1EhL1AdfXGCGYZOEnKdK1lxxb6FnnEIWf5U
	uIlUs0ARc/qZLtONmF3G3uJ0y07rE++HawLeEKWN4p4iajdgxb1V
X-Google-Smtp-Source: AGHT+IHN+fopr69FJ89Yh2+C9kaCZwgQMMF/ZNQmyQw3jN0rS6V6fpUrceswbHdxV8p2In3aXxih/w==
X-Received: by 2002:a05:6359:4c1b:b0:17f:5a02:e938 with SMTP id kj27-20020a0563594c1b00b0017f5a02e938mr12309821rwc.1.1711465245390;
        Tue, 26 Mar 2024 08:00:45 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l27-20020a635b5b000000b005dcbb855530sm7658404pgm.76.2024.03.26.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:00:44 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
Date: Tue, 26 Mar 2024 23:00:26 +0800
Message-Id: <20240326150027.3015958-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
References: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
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

