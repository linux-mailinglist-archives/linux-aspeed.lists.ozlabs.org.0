Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B055D3998DA
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 06:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwXTg58Fxz2yyj
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 14:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CthlleVQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CthlleVQ; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwXTd368Yz2xv2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 14:09:25 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id t21so2225592plo.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Jun 2021 21:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hn28gfY/rqh3HZRGgCSSf4lUCmrnecLtv3YwUWPk4Y=;
 b=CthlleVQh5+NmNfNczLpIRPC8AnZ8ORb9uyitX3+d8cKjnh4LGIr0jAWL6B7dqoypi
 KhAKPKZWWXTyN424pYZi2AkE7u9ISSXh9UcUaxN6gS3MpPsL7vtVgiV1rF34GT8jtfeU
 qHuVN3KF/nw6pWbdNSiD2scRYkdpu8NZKBb+VdOCVkiF/yGYbJ+iv69rF7resj0hvjJm
 Ct4Uwk7hC9YDq7oRWdvpwuzBy218Gv/NAJFb0Lwb9Hrih/X+SYFs2clyEPlWmDISwpIe
 M4CH+OYKQzy6zKf5/sEnogNsIc6hD4nGpbqZHQjobEIACGIHFZ3lOWcBvIQlH6dJvfm/
 ytvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3hn28gfY/rqh3HZRGgCSSf4lUCmrnecLtv3YwUWPk4Y=;
 b=HmxOeZdP93hCcpOyadWn7hqxUfve+mqLF7y5MpSkWIob6eSlXXdYQES25lkpQ2Qj2H
 9gHEAYdtqr0vLwiCRyjvIHd+EsO4G1PSjNxMDMopoqIXY2HL9GfprekzWiRG2Q4ZxKXJ
 HsaELoFmlMScrid7u6tXJUgL4lWUK/xdURZ2romxolwKqoddHB7M0YjqYpGmldLF/tnw
 KcLE5r4smbtauipp6eFGVmNX8HS9iBwtj9RPjHvYuv7JGzHoKfO0GZQvLKy6lXxEsqBw
 TP5F2scKqxHjeaUi1x6TgkR8w/mEvDUlug4c+RhGsXhJey4Gws6oPWAzpDgXwAxoSGOs
 iEqA==
X-Gm-Message-State: AOAM532fb0u50TPnJ6FR+UwWVRgPMu4g88vjmGqTYpv0zFQ1D19y3sfw
 4Hxwl13dm3/zS2gE5ql7+nc=
X-Google-Smtp-Source: ABdhPJzRdzRQP9QQixdOP42voj4dRjnWgKAfCX8OUmZV7dRrOloYx/MGFvIaHwH7kNXlqTzFXr8AFg==
X-Received: by 2002:a17:902:e74d:b029:10d:9cd0:2c69 with SMTP id
 p13-20020a170902e74db029010d9cd02c69mr2250121plf.82.1622693361531; 
 Wed, 02 Jun 2021 21:09:21 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q68sm797036pjq.45.2021.06.02.21.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:09:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: config: aspeed: Add DEBUG_FS and EXT4
Date: Thu,  3 Jun 2021 13:39:06 +0930
Message-Id: <20210603040906.125109-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DEBUG_FS was lost way back in v5.5, and EXT4 is used by ast2600 systems
that have MMC.

Fixes: 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 1 +
 arch/arm/configs/aspeed_g5_defconfig | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 58d293b63581..a3ee647b1ebb 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -254,6 +254,7 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
 CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=-1
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 047975eccefb..2db48438c5d2 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -247,6 +247,7 @@ CONFIG_FSI_MASTER_ASPEED=y
 CONFIG_FSI_SCOM=y
 CONFIG_FSI_SBEFIFO=y
 CONFIG_FSI_OCC=y
+CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
@@ -276,6 +277,7 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_GDB_SCRIPTS=y
 CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DETECT_HUNG_TASK is not set
 CONFIG_WQ_WATCHDOG=y
-- 
2.30.2

