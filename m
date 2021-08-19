Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F473F13D0
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqwSK6mVgz3bXx
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:52:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NRo7JhDr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NRo7JhDr; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqwS80Lgtz2yYd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:52:23 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso4105660pjb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 23:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aM9/lVcDyxcnxVnQ4ELwNbT7wLssN1gHH2orR8gRKDc=;
 b=NRo7JhDr2MFy6/1iP6yCK1tgMqpPqDH2AFC1vnu99I+RcF0h/EDeUuuHu6Z2xrAtoQ
 c3kjG5WlQHQlFyjK8zHMxdv6GVgOojNrFEMcP98wpmftcUtxSwAo78oTgUfy2jgNAb5A
 aMRDbKbw5Xd5gYlbnQ+bPZU9D80Ux7kbeywZoQYk0QnAzbZNKTMXd7BWbEU02+FcH2Fv
 zc4sET+Nl5ntTZaimvKPChZlmj1fW/Q+VTjp2jBzHOhf03rskUzoVTOxVEs/tMjeKsYb
 Vd5KHIXyj7fcn6yN1K3d1ltdy07HGP3ogWoTonp13b5AM9s0wo8QI7roK5nCBmPKOmmh
 GCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aM9/lVcDyxcnxVnQ4ELwNbT7wLssN1gHH2orR8gRKDc=;
 b=G3jBafRCJxY3QO2pBlsKTK4kZnTflKiEYw5SaZTUAgcIsSNFnHUy3M8CUJrpgpBxHt
 yS/CU9V1XIloj8YRaf0OVshMKm4C76JrA40d5dkxMWp+Ee0uG0a7pYVZ1jyGpdhg51zN
 hEw0YY90AR0I6dER+j+jI6grPTz+rALAncACvC1UCOR7/YaLw+xH6WTBKE9rkXWqFoLZ
 /34l3Y1QbFz4Zg/kKnGOGQiFREEmg/p+j2fMMv1TU5FyIZjzxmML0HxWAEQQ/KorjALC
 HG5M8+Ef76BURSsi1WyRdQ25VIx/AbyRERgTxC73cTGgVZbgJQYrHwh7NgUK6GYQRDHl
 Dvog==
X-Gm-Message-State: AOAM532EDER1sUuxLOHW6vyadoZh+iyyASOsfOg0QyTTBBkirj85Af+W
 iJnwqQiZYYdgYSxYwmVxdsI=
X-Google-Smtp-Source: ABdhPJwU0QOyM7N5l/wMmI9M5V9ZKpaIMaNWj/cQ68UmJPeZxmr3RzW5Le4g7VYE2iE15h2NXDqXLQ==
X-Received: by 2002:a17:90a:6502:: with SMTP id
 i2mr7621536pjj.129.1629355941816; 
 Wed, 18 Aug 2021 23:52:21 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm1860035pjb.21.2021.08.18.23.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:52:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/4] ARM: config: aspeed: Enable KCS adapter for raw SerIO
Date: Thu, 19 Aug 2021 16:22:01 +0930
Message-Id: <20210819065203.2620911-3-joel@jms.id.au>
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

Raw SerIO is used by the OpenBMC debug-trigger application to take
signals from the host that applications are unresponsive on the BMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 3f81146a9c0e..6ba30b212bda 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -130,7 +130,7 @@ CONFIG_KEYBOARD_GPIO_POLLED=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_IBM_PANEL=y
-# CONFIG_SERIO is not set
+CONFIG_SERIO_RAW=y
 # CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_8250=y
@@ -144,6 +144,7 @@ CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
+CONFIG_IPMI_KCS_BMC_SERIO=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
-- 
2.32.0

