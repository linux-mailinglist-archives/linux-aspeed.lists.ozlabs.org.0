Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F1971C1
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxjm1ZTyzDqyh
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+G/+Kd4"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxjc1ZfSzDqZw
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:03 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id v12so677151pfn.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRbutwMNPGCcUP4XySCkZI7pdAkUQ3GbmpQv+hp9+4c=;
 b=N+G/+Kd48L+jZ6o/fh73xp/mvKfke7JJ7JPGZJsuzEWn3YO92SpGNDtMZtXQd1yk7t
 /TcD60fht7i0+XwrmcNWyPf8WjO/Lv9z9BIzsTbucr5CKKzgIhEgylC2A2JYU/Su6VWi
 POYuMnJIX+9gfsnoyO5Pdw+hqhI9GTSybTlMGSH4kPlTPUvztTFE/BgZavxTmEjTYoR5
 cQpolg/xXw8hm79XwpuSMp435mSrUQoqLq4lYD5Fpitd8fLzl/QdtZp+huD4s+QHoBbU
 br0eaXacICeU2eSRhyj6TvMghpemugnptuEla8w9XZ2jqeeDp2m4AkV0bHBqxUVxbMZs
 sKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LRbutwMNPGCcUP4XySCkZI7pdAkUQ3GbmpQv+hp9+4c=;
 b=nIMCiYgfymqwEEY+MzWVkK6jONqJasmoXTLIJk43UeX+K9xcbmgeFeNtbX4js2MVUb
 3NUuXmCnihmfSDPviAT+6J6qi4QektXLhJl6sPYHgS5zeqc1bMGIud1zldyS5CWJxAsT
 ws70BHNeBo/hGbS8Mg8kZw63X16qjeMDwMz56WcdJI56G06TwMPwRCuw0eYdIqLOlLUW
 vXg5bqtJAjqu6spnDBWHRmUiIlwqC3CHr0FjzIbMeuVyh2j5zzRASdXh/ARyYDWMPDIR
 3HxISqnqAJoFyj9U5eK+X07p5Y62rJWi0JojkaFBpx1Trfm7yBIwkf1aT2d9EVpPjyPZ
 iK6w==
X-Gm-Message-State: APjAAAWxKi20XsPKnoYo8zp8jFZkLBsq8sZBNKKAD9kfT4cgJ/MCbECS
 4tDA9GRxUL7tuda3q4qWF+4=
X-Google-Smtp-Source: APXvYqzr/PrY+iSpy/Ko5UjPD7BNJVFwxG0vGqhgQJH5ScpnxINdgIEcUBhvY2O7dE7gdnnQxlcFfw==
X-Received: by 2002:a17:90a:342d:: with SMTP id
 o42mr3727142pjb.27.1566366960863; 
 Tue, 20 Aug 2019 22:56:00 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:00 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 2/7] ARM: aspeed: Select timer in each SoC
Date: Wed, 21 Aug 2019 15:25:25 +0930
Message-Id: <20190821055530.8720-3-joel@jms.id.au>
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

In preparation for adding the ast2600 which does not use this timer.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index a15c3a291386..2979aa4daeea 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -5,7 +5,6 @@ menuconfig ARCH_ASPEED
 	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
-	select FTTMR010_TIMER
 	select MFD_SYSCON
 	select PINCTRL
 	help
@@ -18,6 +17,7 @@ config MACH_ASPEED_G4
 	depends on ARCH_MULTI_V5
 	select CPU_ARM926T
 	select PINCTRL_ASPEED_G4
+	select FTTMR010_TIMER
 	help
 	 Say yes if you intend to run on an Aspeed ast2400 or similar
 	 fourth generation BMCs, such as those used by OpenPower Power8
@@ -28,6 +28,7 @@ config MACH_ASPEED_G5
 	depends on ARCH_MULTI_V6
 	select CPU_V6
 	select PINCTRL_ASPEED_G5
+	select FTTMR010_TIMER
 	help
 	 Say yes if you intend to run on an Aspeed ast2500 or similar
 	 fifth generation Aspeed BMCs.
-- 
2.23.0.rc1

