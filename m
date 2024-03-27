Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0488D988
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 09:53:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UiaSGkkk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4L7G4SrMz3dgN
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 19:53:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UiaSGkkk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4L783ssbz3cGK
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:53:39 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so5187507b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711529616; x=1712134416; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L27nwRy0B54L75c8FppdsQdbbGjzrBj54QC46XAQ3Bg=;
        b=UiaSGkkkVqZXYviBpgQT2fk7308W4hQXnEpWw710hugIXc2alOuWiLp70mfbHicmUX
         rIkv33GYlGLVSLHGgKum/djWa+TzypQP+fRn5DHIiGbTq+GYrFeA0VVsMzY0ox8X3IvI
         BHGoRAZ4GshRJyFRDJg+woZ+eFPhygRqfaQZGLCEcWEFYVpG90J4dH0RWmgbPIKyj/Lv
         3SAdP+iDKqMqcJVHQlss8AJm4Awj68MSZ//JoSCQLtiXliO2JrGHt/cNKvVINOFudZkA
         V3ES60U8hxZPUA1+06UoS0uT2iHnvRSdLQhQI6NP5T6Hfx5y6YtD6fKUVnBrTcwfFnRi
         h8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529616; x=1712134416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L27nwRy0B54L75c8FppdsQdbbGjzrBj54QC46XAQ3Bg=;
        b=f3tD+obXS/Jy2vl63chM8pIa1cU3xhbrg9lmIfq0uxPRk/lY37lTx2orSJRStdVmW2
         cQ+72mrVt6xrQIHi6wtBxhXNMEUFNrxWFKhTBpseXFKWchQPwKYSCxJINTtT9elsrYR6
         lXsYihqjdrFCyAsrI+Wi5gAy3IZlymUVcfQCmD+Ph+rkeKwL/SbaFDnAT1x6kA7xskVY
         uoT75myzeeLYB/7k3A2WL2e0BYKSB93tSBp1dpCO3hXDFi/hoKTaEAwpoLV90Wy9OfXk
         pyFIC4ugEuTRBdXRkLRbOonuTPXNdBuNAD2r1v5jkdAAJgcq3K/sbzpe8mF6uRbiLm6T
         LKCA==
X-Forwarded-Encrypted: i=1; AJvYcCU6LNxIpqYUTqLLqzuetigitkFN3IBBg1fPW/biXCv4PlPEQy6am3+YxAtUIizpLRiE8D7Jkp2eTMYc8LO0lujzIScYydj2/rVpQeV7Lw==
X-Gm-Message-State: AOJu0YzUbpA0yJkbI+Ud47/O/mRl606lYumM8AxVSPii3SvsEcMv1snf
	nYXyn2u/+Fda3pvBcPFOuPZ8vOc+pTEVe+euGPcfzYdPp5VV4Cxp
X-Google-Smtp-Source: AGHT+IHqmkt9OtAKUxJa0j6kyiCFEtGlMxKMALqNdU/nVhjmwEQ9JXHQc5PYrKjshaxLA5zvrZJpTQ==
X-Received: by 2002:a05:6a21:2d8f:b0:1a3:e28b:e574 with SMTP id ty15-20020a056a212d8f00b001a3e28be574mr1652139pzb.26.1711529616478;
        Wed, 27 Mar 2024 01:53:36 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e383-3566-013c-5a87-9abc-381e.emome-ip6.hinet.net. [2001:b400:e383:3566:13c:5a87:9abc:381e])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001e0501d3058sm8356848plb.63.2024.03.27.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:53:36 -0700 (PDT)
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
Subject: [PATCH v4 0/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Wed, 27 Mar 2024 16:53:26 +0800
Message-Id: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
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

 .../bindings/watchdog/aspeed-wdt.txt          |  4 ++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  3 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 ++
 drivers/watchdog/aspeed_wdt.c                 | 60 ++++++++++++++-----
 4 files changed, 55 insertions(+), 16 deletions(-)

-- 
2.25.1

