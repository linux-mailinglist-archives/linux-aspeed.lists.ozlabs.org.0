Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D313F13CF
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqwSG3Q4tz3bhk
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:52:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H526agwf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H526agwf; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqwS54GsDz302G
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:52:21 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id x16so4594513pfh.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1lq7dkwQtvGOASE5d3elXdTuJ61FzeoaQEdWqV8aoA=;
 b=H526agwfyZ/NtOClI+SMbMNWxYseIZPQJtMvkG/xDBwGwPVWrAl8B6DVSmhtJplbkL
 bxNE7cY/XetnsmJsRfpDqRwHKCzefVS+y2SA/C814WAbM0frz4aOVTADCbFeUOv6luK2
 0lQjfitesHa+XS457Wvih/1hxD1RvxUH1xGSavbD3U5XZtVTQQQGZDlgSb6JlooiVwk0
 dx1ckjrI3teEFK5RHSikmspHYSFJ+3CAWec4ryZW8fXOoWHBRwkXdrxP3tadd8cs9Ca3
 uc+FnaOnFMnShgxTYMciK/yAzV93AdOdC/RCbtYunUY2/0ZNUE5FOwiETRrdz0gssU/K
 lUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S1lq7dkwQtvGOASE5d3elXdTuJ61FzeoaQEdWqV8aoA=;
 b=sRoRWjc+Dy4fEWDzz9AcGpCEKDW/Xn1n7zLVAj4f+6qFaspacBehkd44JEwawh/siW
 sIayOJlj8XOvXKEj9nJyI+f+leyU58BUY/s1sWgKg72vPlOSrJ+duCNH4ZthBYbJ/vAg
 GyewQYcqDyuVHpO/yQu8Z2llRdSB87Es094XQiNvVaHCqJMJmafp9+54wP+Mi9Vp/12p
 MGhvzMypTWHdkg0Tm51m68BDXVGtgQ+CO2ElWtuRN4mbrmYj3nHr37yV4o77X7ldPREC
 Nxjqx0NbAHSXCF3VmhEBppCs3G8x9yOMJrTWe0//yz6EvK+BJ34wvW9Cz2yXSfAPTX2/
 qEOg==
X-Gm-Message-State: AOAM532DerHFirTlqAbIT2qU/h4eMfdNt9eyLy1zT8rBUzHtSAt8+wX/
 iMnKsGuQS444jua2nXhsSEw=
X-Google-Smtp-Source: ABdhPJwQjy4wi+KrWzyzSz9XdaX6KTga5WMJOMryZVdsibsp3KSv6XGkTb+vHinJZwlTtUaOMuCYoQ==
X-Received: by 2002:a63:215c:: with SMTP id s28mr12531414pgm.99.1629355938746; 
 Wed, 18 Aug 2021 23:52:18 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm1860035pjb.21.2021.08.18.23.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:52:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/4] ARM: config: aspeed: Enable hardened allocator feature
Date: Thu, 19 Aug 2021 16:22:00 +0930
Message-Id: <20210819065203.2620911-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819065203.2620911-1-joel@jms.id.au>
References: <20210819065203.2620911-1-joel@jms.id.au>
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

SLAB_FREELIST_HARDENED can protect from freelist overwrite attacks with
really small overhead.

It works best with the SLUB allocator, so make SLUB the default by
removing SLAB=y.

      total   used           free           shared        buff/cache    available
SLAB  425596  44065.3+/-220  311099+/-3800  14864+/-3900  70432+/-3700  352767+/-3900

SLUB  425592  44225.3+/-280  313275+/-600   12132+/-3.3   68092+/-530   355295+/-280

These figures are the average memory usage from three boots of each
option in qemu, running the Romulus userspace. The output is from
free(1), reported in kilobytes.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 2 +-
 arch/arm/configs/aspeed_g5_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index a3ee647b1ebb..397c57e94743 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -18,8 +18,8 @@ CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G4=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 2db48438c5d2..3f81146a9c0e 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -18,8 +18,8 @@ CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_MACH_ASPEED_G5=y
-- 
2.32.0

