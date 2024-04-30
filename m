Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824A8B79C1
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 16:33:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hWhX1Kpu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTN3X04lSz30N8
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 00:33:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hWhX1Kpu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTN3Q5Rn2z2yts
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 00:33:22 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so25828165ad.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2024 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714487598; x=1715092398; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbWyXy7tzUTKU9Yx8i3878cyT6cwUmzUpkwL6XCiHGA=;
        b=hWhX1Kpuf/mYaw7PRlOMmZ6Yr7DSyytXzdu+dpcuvSckIV8NyQTixf36cD7+BFAbgX
         aBNd2ojWftD6sOP95StJjnt8UTnLtEbJ8KTNIZ4rm5Kb1cJXWb8VfdqDsHS/zNyaKwCK
         PL6WtlaUY1pvKX3vyyOQcvEjZD3K1cB87+Pam+Ne24VE7D0EtEMTFTjMf5C2CJzSmZd6
         nst4Zq8s71oH9S95ASUatA+noGHJi4KmxFGZlGWhkf1HBrjgIm3yzfNHyTSsujZIuHmq
         I5YrO9SmgFqvL56dkIs5mM2XCTuX64kYQdHYVCKxwipVUEwki9+iQoDsgZ6aRCuYrBsi
         sw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714487598; x=1715092398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbWyXy7tzUTKU9Yx8i3878cyT6cwUmzUpkwL6XCiHGA=;
        b=BvLGguYCXglPfTViE/4VltiVJH+HCtjod6rM5/hal5md280lILSGynysR16KzM1O6p
         THYS2ISwt+j83v/KNOQei+SNSpxBYXe3AhdDBBZIbP19APt0dzlukmpvH8Wg1eo3dssd
         BPzc258Z15exTrZlGmcKhufOlnwq0DZXm34S2/4HxBcwBOqV3VQkLbjDDZPaA35YjWf0
         4q5YuWOP0lU5hkkkIZKlUnr6pHAk0liK8JIIOfD8/pbQ8vz+ZH/R0TbuTmHjGqNTCtih
         kbvmhwiOh682sbOoijsSmXyQDVWXTnCTNaix6OSwC1z0lN2KyueW/rCq2wu+Lr747ktD
         og8A==
X-Forwarded-Encrypted: i=1; AJvYcCVpqkVaMyYKHKcQW6eyEHPiCqOFe615hGuLBs7tT9wfodFHGTDC21EFoFR1ftR7oWyBJWd2f31XkXaDCRWVtVmOxIWUtEoXRdvmEKA+3Q==
X-Gm-Message-State: AOJu0YwjsKVYR+P7G57LmA7J5jRDpXKjcqehsrPViHE7ObsOpigBh8NR
	ICtblYscNqL61krLxaRLk53pAS9KiEeDZdIE5/fDmx3bba9ou3a6
X-Google-Smtp-Source: AGHT+IF50zEbOnAs+x7qO5H4ytE8qglKw79WJLKnIPd4tguVAA/lYC9ixRtuKAvGTVIN3+mdp7kasQ==
X-Received: by 2002:a17:902:d648:b0:1e7:89af:f267 with SMTP id y8-20020a170902d64800b001e789aff267mr12052976plh.37.1714487598039;
        Tue, 30 Apr 2024 07:33:18 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001e47972a2casm1682431plx.96.2024.04.30.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:33:17 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eddie James <eajames@linux.vnet.ibm.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/1] watchdog: aspeed: Revise handling of bootstatus
Date: Tue, 30 Apr 2024 22:31:13 +0800
Message-Id: <20240430143114.1323686-1-peteryin.openbmc@gmail.com>
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

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set. However, this bit can be clear when
watchdog register 0x0c bit1(Reset System after timeout) is enabled.
Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRESET
in ast2600 SCU74 or ast2400/ast2500 SCU3C.

Change Log:

v8 -> v9
   - Rename and restructure the SCU.

v7 -> v8
   - Simplify the code.

v6 -> v7
   - To use syscon_regmap_lookup_by_compatibleys to get scu base
   - Power on reset is set when triggered by AC or SRSRST.
     Thereforce, we clear flag to ensure next boot cause is a real watchdog case.
     We use the external reset flag to determine
     if it is an external reset or card reset.

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
 drivers/watchdog/aspeed_wdt.c | 90 +++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 8 deletions(-)

-- 
2.25.1

