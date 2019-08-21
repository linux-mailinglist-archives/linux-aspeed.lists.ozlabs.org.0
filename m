Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E84971C2
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxjs6YqnzDqwy
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIuoBZCR"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxjg2Y2NzDqc5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:07 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n9so682701pgc.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGzXZK4zikEN4TxWRvQDpen5CEPMtDK0toXHnI7EWGQ=;
 b=lIuoBZCRnm33wF3mp82iFhcZCsLLsq4fMk40MMbfdJnsjqOLDVP53jXHSSyq3ZQazA
 bno688xMHYc2s1CVzoPSqMvi8sKN9g/hjFLuFeuHOAuJnQVwhBWMTkaQObYOc36G77ud
 4zd/yF+VIX3F5ZZbihbJ+dGFnlmLxYCqdTSyK/JyM8j1afqJKBfSycymSCMCB8cgl1yj
 qxorMRS5duqLnExx9vo9Tjnxm4dO4qKF3zj+9dRnCcdvLfeBMN4b7GlufLafuSAwRoQf
 SDdMNdAqObcuEA7qC6yXGz1ueGzZNtEmYfFXLbMyxkhXBVyx8jHl5G25dAohLOgL2V9t
 V67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CGzXZK4zikEN4TxWRvQDpen5CEPMtDK0toXHnI7EWGQ=;
 b=VYjrWLOIf0yfVsYZmYf/gNe7ZBQFoU4BWaSiyUCiixfbZ2M2vJrmyHM8tewKsCYEZy
 M3AuCOyKlG7dspWX4kyc2q3oC7uUKADbrS6xiVgbjJAc3gJ64OQ9fJ+O0ZeMn3aYSeyv
 441J4QR9TlDd1V+KvLoavLwkyAV6ExaJ+pzFpMzWtLzb71rshdcmkejXd+7EjReCTsxP
 A+1iSwG+sNY0TsxyHjwMO3KG1ZsrnAhLsPD3UmekutxeN1VBOau8Jj7w1jin16RTgY+I
 7m6NnD84+VWQOyZraINXLao29FhrUt/dvoHzrON07gcSzK2UV1ooud7mGnj68x9l1XPP
 w66g==
X-Gm-Message-State: APjAAAWHb9igb/W62ZAS/h7mVXcp9Qc8T0jvxdBn+6UziDpoNBE3IPZl
 vCxXiJKMYyjU4dODZIV8e9Y=
X-Google-Smtp-Source: APXvYqzYQ0JMPmykoZ2pidi+Eu/vt3Wt6Pi8aoiHcXBeHnBsKVP3bx5fquxF8TzvRcAZsV6OsETtuA==
X-Received: by 2002:a63:5945:: with SMTP id j5mr27559844pgm.452.1566366965125; 
 Tue, 20 Aug 2019 22:56:05 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 3/7] ARM: aspeed: Add ASPEED AST2600 architecture
Date: Wed, 21 Aug 2019 15:25:26 +0930
Message-Id: <20190821055530.8720-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 is a Cortex A7 dual core CPU that uses the ARM GIC for
interrupts and ARM timer as a clocksource.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 2979aa4daeea..56007b0b6120 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_ASPEED
 	bool "Aspeed BMC architectures"
-	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6
+	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6 || ARCH_MULTI_V7
 	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
@@ -33,4 +33,16 @@ config MACH_ASPEED_G5
 	 Say yes if you intend to run on an Aspeed ast2500 or similar
 	 fifth generation Aspeed BMCs.
 
+config MACH_ASPEED_G6
+	bool "Aspeed SoC 6th Generation"
+	depends on ARCH_MULTI_V7
+	select CPU_V7
+	select PINCTRL_ASPEED_G6
+	select ARM_GIC
+	select HAVE_ARM_ARCH_TIMER
+	select HAVE_SMP
+	help
+	 Say yes if you intend to run on an Aspeed ast2600 or similar
+	 sixth generation Aspeed BMCs.
+
 endif
-- 
2.23.0.rc1

