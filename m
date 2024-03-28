Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0FF88F53D
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:23:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuJDp9HV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4nPv4Sjjz3vYL
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 13:22:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuJDp9HV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4nPl47Z1z3vYj
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 13:22:51 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso528563b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711592569; x=1712197369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=LuJDp9HVXtw0MSk+lb6eJ6xvRfNXwAPml8SwrvnAEHJDXwqvpiREtVtdMIGUOtsbMk
         ty2S9X/C95dsXENbYXWiLGA6+KlWxpNmyw747u9SU7nbUbaUpz4M8esLiUfymrGiEPPp
         q3+NH+y7mjt/jrW61eXMmvEDCGulVmgHsYOcTcSNc8U2L5l5bRhnA5gH/vriJlA1kVYq
         ZcXI6BRwtDKKRQ9RiyRrvVzgcAKJCiGqAS5lJdEY+jmGKzRyzHD0RsEwstxcrtXPhvlN
         1dxRHqPBqV6uExzcoyPuIykfuvirsLLhWEHCkc1ASiGLrYO/ZwifkVKiEZnpyTxlrymF
         Jztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592569; x=1712197369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9G+01fnYmsgdrsm4iyF3y0ufJf0ihC4vR7iu7tY8Oc=;
        b=WXnous73pUVfSV5Vwc7tMejLrdwtGotYhGxhab+vPhJ5lB8h4o/iUaQROnWtqv1D+6
         6fsRzwPlaj5zDaGgvqdAGpjCbFMSi9wFSDIysoOdHh/xTFyqTc+x8ES1gVQZ6h6p7i53
         nqzLfBpHEVwWUa8J3koApTKaDC+wYQpKKTIu/hh7VebLeB68uP4+EsId7UjvBgiEyMwg
         i30Sa1uRzFya4KS5WD/qEtFQc9IlZBNIipBcEvWuppk+Ixvv7umakB25H7yrJb4YFV9z
         3sYdMkUszVeY519CgKBnSj2dq8iRmASgjeI1y6GW+nv4XbBL61ybW5a6wcganBFMKV0h
         couA==
X-Forwarded-Encrypted: i=1; AJvYcCUxxh1uK1pzzU4Ee9K35MHntB/0yrzl9HCV4aQkEbWs5r8WQ5X5bxr9x0F+IRbgoJEGNkfGSLgQT7VzjXKYWn8g+kiuMs8qBtFr23uKjA==
X-Gm-Message-State: AOJu0YwBzwL+A1oLknONtjo5fNR0ZBKSuRtU9vWKzPazeXfcbwzw9orH
	T7y3il5B8EKVEeUSquxJrLrLvgtgHy3CdKnEv6WumsZzQ+xp0kg/
X-Google-Smtp-Source: AGHT+IHEYik3ANtnRa6lUOZjg98pWEyljQMpLalhqqnQpsJMdrecpYww0XTbhYN2Vm8Jo6MXl+PZ+A==
X-Received: by 2002:a05:6a00:1a89:b0:6ea:bb00:dba6 with SMTP id e9-20020a056a001a8900b006eabb00dba6mr1983301pfv.26.1711592568937;
        Wed, 27 Mar 2024 19:22:48 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78699000000b006ea858ea901sm229256pfo.210.2024.03.27.19.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:22:48 -0700 (PDT)
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
Subject: [PATCH v6 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
Date: Thu, 28 Mar 2024 10:22:30 +0800
Message-Id: <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
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

