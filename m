Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194D88F4A8
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:33:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZwuSzKtc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4mJK0LlDz3vXW
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 12:33:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZwuSzKtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4mJC0PDDz3cB2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 12:32:56 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0ae065d24so4136795ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589575; x=1712194375; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwzVZ+IWpczySSp2ln+6XuuWUjbpq64nflGUKemUacE=;
        b=ZwuSzKtcA1kgp4dHQQw88Ye5KbBvJUTKR5Zs20UJv4EIBYayI4LBS9c+PxfRberHnd
         FWvx8EaEdMXUe1yShVYQi/EUcU8U2sojfa5p9jhm7qQz1OC+8M6rEKhbrPLvpXVFd8cL
         s8PpFpdnc0SO3J6D25E03lGujmyX6vBxf61ytPk9cDeHNusrMe3jV6m2c3ueTfu1rtLD
         yHZtWXuu17DegEVOETGsnvWhR5fL5nUO1+ld6QcW64X+Z4wtI1DDRAH++p9LVg0GAJWb
         ou06OrEic5fHtSstHXImGX2lB7juDXAm8kRZU6sCuRhDrYpz4HV9YXtTmEuehUhD4zGU
         yFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589575; x=1712194375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwzVZ+IWpczySSp2ln+6XuuWUjbpq64nflGUKemUacE=;
        b=CLM9bTZbja5+k4CdmxPk3pkhg6jzNZ2QxjLmpAE++xIwEREKk47zHQxbhKf9SSehwi
         z61PZCS1dpGKSMBIfk8ls1U2NLwZPhkr6cwLEM2QzlVLv5ZovISMyNikpyRnSGF6Y2s4
         kXsRY87yPhbHBNXk2QoKlOQcesPqcolSSyD4U/4UxpXkod6oBsL+UlDfjYkXBGETUlGc
         DbciEUnS60OizJePD8b9PCn4vmGtmfw52dIkhzLiZgjJtignJUhktAMlOYk+tetn2mfw
         ZUN4O86rj9OiCxA7cEDevtx9reOB4z9jSpUUieIGVnXaogbdtF+E9HR+2vDSSt48DWbU
         ktzg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/6/Y4VLXJiHojaBGsCLJMhDnvwpou0+aq/rN2xFb2TvXq2Fqy/P5FQ7l/0fAN8jMxvm72ffFp0fm8Po7m2NJiUdVLE9bwTzSS1ogHw==
X-Gm-Message-State: AOJu0Yy4q0WCwMUmSm7lG8cIf/qO1Tm1r8ZD36CM1N/enhfReSs+/baf
	joR8a15StnGeeNRw7WXPCdz40HKc3vsibefLpbZ6ah0yUnIsPIaB
X-Google-Smtp-Source: AGHT+IGJiNm3BXlzN6cmEh56HkRazQmE2ErJ3ixpcojiNRSHT7tBktTULxMZ3pGOAZ0k6cV3jsh6qQ==
X-Received: by 2002:a17:903:24d:b0:1e0:f5df:277c with SMTP id j13-20020a170903024d00b001e0f5df277cmr1426217plh.69.1711589574850;
        Wed, 27 Mar 2024 18:32:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-b4d0-66d2-2269-ef6c.emome-ip6.hinet.net. [2001:b400:e355:7eb0:b4d0:66d2:2269:ef6c])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b001e0a2cf62bfsm191904plx.201.2024.03.27.18.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:32:54 -0700 (PDT)
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
Subject: [PATCH v5 0/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Thu, 28 Mar 2024 09:32:45 +0800
Message-Id: <20240328013249.3609225-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2500/ast2600

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set.

Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
ast2500 SCU3C when bit1 is set.

v4 -> v5
  - Revert indentation. 

v3 -> v4
  - Add error handling for syscon_regmap_lookup_by_phandle and
  regmap_read.

v2 -> v3
  - Fixed WDIOF_CARDRESET status bit check and added support
  for WDIOF_EXTERN1 on ast2500 and ast2600.

v1 -> v2
  - Add comment and support WDIOF_CARDRESET in ast2600

v1
  - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
---

Peter Yin (4):
  ARM: dts: aspeed: Add the AST2500 WDT with SCU register
  ARM: dts: aspeed: Add the AST2600 WDT with SCU register
  dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
  drivers: watchdog: ast2500 and ast2600 support bootstatus

 .../bindings/watchdog/aspeed-wdt.txt          |  4 +++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  3 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 +++
 drivers/watchdog/aspeed_wdt.c                 | 34 ++++++++++++++++---
 4 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.25.1

