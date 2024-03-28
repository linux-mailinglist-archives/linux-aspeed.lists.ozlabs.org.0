Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5288F53A
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:22:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KrPIwSgL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4nPf3z16z3dWg
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 13:22:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KrPIwSgL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4nPY6PP6z3c12
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 13:22:40 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c3bc867eaaso373117b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711592557; x=1712197357; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj+WYWAhqjw7xLvVT8giLYQdLcc7zs4jwkGM88zeFSU=;
        b=KrPIwSgL4/oH0RjOjdeXdcVXDuRXfMJomG5qcjSMRlNPBoKi4JyR2gJjxnNaSrLIQk
         46sRUCX5wmjrp6cUCFvthFP5u2X5bPvbrgv6wKMpzRjJHxsy9apvMBcixVCA53+S4OdE
         bZHEC4tvphPtL6+WixI1UAdN2aG2S3MSRGUPv4Q5kL/7qJykAMEbIHtLIPvlynjY1ClM
         npVksebYvRVTh0MLf4l+XgagLDcEyaIBAsM4qpMNCj6yuj0C1ILbkLuZx7epobGGpUOy
         hzMkEhgCa/TXUPMdfoZ2+vxYeLd2gtnnkLeIJXS8+qyuzOavgyoDL/Q8SOSRcjaqdWuN
         RIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592557; x=1712197357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj+WYWAhqjw7xLvVT8giLYQdLcc7zs4jwkGM88zeFSU=;
        b=dRdxxQDKWaxnhIEVkXVhwr7QZiUIL+ie6MpuAEojjSpI9BrSNuA3bQgWdqO2ZDIF0J
         OYH4zNiCPDLWdTJ+5WZilT8DuyGe2yoFuJlXIpfcQc5JNS1K2j3DxSJaVDPxyb49xouB
         GSXSxP7THImzEAiQuGvr3RwLOJeHZbbjCSuKc93s3xfK630bZkThDEx9IjAic9tDtjIy
         Rl3KxptODQVwMq1syyZ+fFPAjQzjmy2N6K1rRtXGNoLTdJrWydLUx46hCuM6Z0CrScsV
         904npcXH28IM+nnydfioVhEO8Fc/Zr+3KDIXT1Ujc8dntWJYVMEJRHTFqUyEEFRHkaCA
         EmmA==
X-Forwarded-Encrypted: i=1; AJvYcCVbCD7RS4M4jZxNpbi9ytFWgKntxb7GcAgwRdERh5VobSDIu8oeibZzjMfGYGKD+njwgtOGh/s3DliqSw5YOByizD4D1hh/ahK5a1Nh8g==
X-Gm-Message-State: AOJu0YzQk8LbqPVmILmAPW9NmVAnFsU4xa/zPgaiFTMsCWfNShRDtdSv
	AGJZvFomyr2Mxl0Ee7soG5Zcfdd2k+Eo9Jbgs35U4PsdUl0rOzUD
X-Google-Smtp-Source: AGHT+IE8ZzQ2gr87ufaZX9Ve6iQlcEly34B9ZC4/VnAKww459oP0Tv9uUglaABvQbe7WYWRki2abqQ==
X-Received: by 2002:a05:6808:1706:b0:3c3:e78d:f1be with SMTP id bc6-20020a056808170600b003c3e78df1bemr147151oib.57.1711592557102;
        Wed, 27 Mar 2024 19:22:37 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78699000000b006ea858ea901sm229256pfo.210.2024.03.27.19.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:22:36 -0700 (PDT)
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
Subject: [PATCH v6 0/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Thu, 28 Mar 2024 10:22:27 +0800
Message-Id: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
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

Change Log:

v5 -> v6
  - Fixed missing WDT_TIMEOUT_STATUS_EVENT.

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
 drivers/watchdog/aspeed_wdt.c                 | 35 ++++++++++++++++---
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.25.1

