Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B3BE598
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2019 21:22:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dnyQ16qDzDqkp
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2019 05:22:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dny16rBjzDqlB
 for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2019 05:22:33 +1000 (AEST)
X-AuditID: ac10606f-371ff7000000187d-cf-5d8bbe782d8d
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 8B.7C.06269.87EBB8D5; Wed, 25 Sep 2019 15:22:33 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:22:32 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, Joel Stanley
 <joel@jms.id.au>
Subject: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 15:22:17 -0400
Message-ID: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
References: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA02RbUhTYRzFee69u7vOZtcl9KAlNXoBU1cS+ZAhToge+hB+jMj0khcdTSeb
 zSzKZfm2wsSXcmO+pA5hDcJJFMuVThFdw2XiUhEJliUI6jSTmlJtM/DbOZzfOf8Pf4aU9FKx
 jKKohFcXcUopLaKsbG59Utm7R9knvw1GItNLK43skwz6s/oWoM33RgHabhgRogqni0Y/Wl0U
 ah8eF6CAZ5tETVs9BLL5vAL04MU4ifratwCatJto5Gx2AGT+PEGglbVaAlU6hoVouklHI8f8
 OsiIwVPVdiG2tlkBnvROkDjwuwHglelKIZ7wj5DYZqml8Zy3n8ajLQEK13cOANzXXY49Lc8B
 3r6/IcSjzzYpvG6Lz9p7RXQuj1cqtLxalp4rKvB4N6jiMdEtz8NEHZhj9CCCgexpuNBdIdQD
 ESNh7QRc9nTRYTMEYG/1FBmkaPYYdPSZiGAQwz4BsMPUGjIk+0oAXw9UCILUPvYMNLc8FQY1
 xR6F024zFdRiNgMON8yA8L14ODNeG1qNYOXQ0zYf0pJ/jN0Q2OGj4Zjha0iTLISDi4s7zEE4
 6/QR4Z1D8Hudj6oHrHFXxbir0gEIC5BwJcpCTqHML01J5goVyddVhTYQfqvqDfD7U52AYIAT
 QIaUxoiNB/TZEnEeV3abV6ty1DeVvMYJ4hhKul9ssf68KmHzuRL+Bs8X8+r/KcFExOqA8/D5
 Dm90naa8332pK3J51W2W5nRlx8ma5XeSfLNnldfSopaOpMusjaqeqONVinsfOf1FLNqqTlvU
 DiYuRV0wDWldVaWGtSr5ngFfZmfjgqxc+0knycvMYg0fEmpS/MZfkr2+mhPypbtpbaYsl/my
 xa1LVX7Jly5bimLrHkspTQF3KoFUa7i/wVaWXMQCAAA=
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
 Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Hongwei Zhang <hongweiz@ami.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add SGPIO driver support for Aspeed AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/gpio/Kconfig             |  8 ++++++++
 drivers/gpio/Makefile            |  1 +

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb13c26..e94f903 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -120,6 +120,14 @@ config GPIO_ASPEED
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
+config SGPIO_ASPEED
+	bool "Aspeed SGPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2500 SGPIO functionality.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a4e9117..bebbd82 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
 obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+obj-$(CONFIG_SGPIO_ASPEED)		+= sgpio-aspeed.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
-- 
2.7.4

