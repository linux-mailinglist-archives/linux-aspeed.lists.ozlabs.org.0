Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45626C313
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 15:04:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs0gR1175zDq5b
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 23:04:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s0ZjKlEW; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs0WK1hWkzDqTJ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 22:57:49 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id k13so3149088plk.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dJA1uVe0UwJ9j+G3rPsxZvQe5x8LCuXQ+8c9AMCh68=;
 b=s0ZjKlEWPCePHMQjJUeiQuXVLyAZcEpyCJCe3Jy1W+Qhp/VFeqJuHPGEyFp+7puWiy
 ydJxzkNMJh/iZIRQ4KHRzLnv+v+4Wlyrq4V6ck57gRP/twsEP8zBzEqQtwkhZ1aZyEIp
 jqL5KiM3ZxZ2AL5np5zdG2G1FfX3xEbrwcGgE3h2xgcEUtNrFmLSYik5CotNp1jf9avw
 Nn/MDzIK3KR+ECHd7r3PIzLV7KdCknO3I8WpHqgQHky6kaSKcaLBA028OvuwGZx6wp9e
 +zB3PZT5IqZR8xNZ9/571Npn1NQ6frG2zhQx91FOLOvYXfZPQVexj+a4Uk62oUS2ztgg
 oY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+dJA1uVe0UwJ9j+G3rPsxZvQe5x8LCuXQ+8c9AMCh68=;
 b=oBgTr42SELRl1Wamh/KGH7wWlO6s4fhm1IEyp30mjn2BwAoACcTFO9oI/ehKmN5bk5
 AaVprt5aZ5+2rOXzC55IYYIipi5W3iJPBmRQi9LerSSvIIsr7NRV7Yjs05mPxvbeUIb/
 ILO1UpPXt0w8nKwXKlSyw+5fD/GpuFwsymNObQj9NTPrksGJVZaghC/9pzfKsB9cdj50
 474D7t/MjCGcymT7oPudV7uZ+Go/2w7IzMSpu7hhTqWFsFkXcgcFdDRM+xkgzp+qIOmp
 uq34Di3aMcIDfXkW3IJ2t3Ju4OAYXSgQ0lwEgYewyEqCj9VhNoAqxWBGBiebViSba9r8
 PWXw==
X-Gm-Message-State: AOAM531opDjcr0gcjBNI/22p/ngsgy2ay5ngTszw283zFokxse4MpBBJ
 q5CyQzXwon5RmnB22DO+cpQ=
X-Google-Smtp-Source: ABdhPJyNsrtOLXJkKhPYLevPGZikNQW08kONdspYFoTQt2i0v77jpmd8k3EADKmqWWmZ60I1T/kTZQ==
X-Received: by 2002:a17:90a:e981:: with SMTP id
 v1mr3823610pjy.177.1600261065222; 
 Wed, 16 Sep 2020 05:57:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id s24sm2682910pjp.53.2020.09.16.05.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:57:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] soc: aspeed: Improve kconfig
Date: Wed, 16 Sep 2020 22:27:31 +0930
Message-Id: <20200916125731.784527-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
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

Reword the kconfig text to be consistent and reflect that most drivers
are available for all supported ASPEED chips (2400, 2500 and 2600).

Rearrange the symbols the SoC drivers depend on so the menu doesn't
appear unless you are building for ASPEED for compile testing.

The SYSCON_MFD and REGMAP options are usually selected by drivers that
need them, so do this.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/Kconfig | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index c95fa30f1a76..9ce252445605 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -1,32 +1,36 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Aspeed SoC drivers"
 
-config SOC_ASPEED
-	def_bool y
-	depends on ARCH_ASPEED || COMPILE_TEST
+if ARCH_ASPEED || COMPILE_TEST
+
+menu "ASPEED SoC drivers"
 
 config ASPEED_LPC_CTRL
-	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
-	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
+	tristate "ASPEED LPC firmware cycle control"
+	select REGMAP
+	select MFD_SYSCON
 	help
-	  Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
-	  ioctl()s, the driver also provides a read/write interface to a BMC ram
-	  region where the host LPC read/write region can be buffered.
+	  Control LPC firmware cycle mappings through ioctl()s. The driver
+	  also provides a read/write interface to a BMC ram region where the
+	  host LPC read/write region can be buffered.
 
 config ASPEED_LPC_SNOOP
-	tristate "Aspeed ast2500 HOST LPC snoop support"
-	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
+	tristate "ASPEED LPC snoop support"
+	select REGMAP
+	select MFD_SYSCON
 	help
 	  Provides a driver to control the LPC snoop interface which
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
 config ASPEED_P2A_CTRL
-	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
-	tristate "Aspeed ast2400/2500 HOST P2A VGA MMIO to BMC bridge control"
+	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
+	select REGMAP
+	select MFD_SYSCON
 	help
-	  Control Aspeed ast2400/2500 HOST P2A VGA MMIO to BMC mappings through
-	  ioctl()s, the driver also provides an interface for userspace mappings to
-	  a pre-defined region.
+	  Control ASPEED P2A VGA MMIO to BMC mappings through ioctl()s.  The
+	  driver also provides an interface for userspace mappings to a
+	  pre-defined region.
 
 endmenu
+
+endif
-- 
2.28.0

