Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A54A835C
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 12:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqHBv1W4Bz3bYw
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 22:54:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bzyKo9LH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bzyKo9LH; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqHBj3fCXz30Qy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Feb 2022 22:54:05 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 192so2037078pfz.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 03:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y24EP6xKeEvQOAjkdyxZutWXu4m6B4k+YDqTIaEEINs=;
 b=bzyKo9LHZxuywZ/Lpjaf+94nxTw259Cln/iVI82pP+PjBcxhKdD8DexmKafK+gizYv
 uARgrFIK04qrjpwyvnYXazPXOjeOJHy43FfOC4Bfi/1lcNls/5j7g1zs+4DpTCP5wDhb
 QtbHk/4RQQuRx2HQx0vPulkcoVyIfq8tKiLjXV4XREQ/rrPS6HqIXCArBuQ4WdS1oko/
 oCa5nUnENvmUrV+kZ21wuIMIuNfppLYVdwrK848DccuRcOsZh+0IvrfDh5HjhDXXDmru
 ilhBR4JnSFXIE46L+No+vigF+0dbkXxD3Qem/NmmLGxGxy+ctMxEl4gk7bNrHoQ/u3Oz
 yPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y24EP6xKeEvQOAjkdyxZutWXu4m6B4k+YDqTIaEEINs=;
 b=6wy5Agm+O05GvvZk6oJtgG86jP+ErFUygf4UyLBadYOHCEZmwvyToWtvTPnADZJ3hb
 ELFiWGu6elsbMDRqvlMAz4tHts6C0P7yVDpl3QGbHfw6H4Viq1MPHSSkWENjFuB4dIQ6
 SO0klEE1gEkJBrbIh6CE5wUdYcvRd4TgGJUi6ceUEJSxIoTOVItA1uTsy7TXnky3t6zO
 bOzTEdkiWvhxXWuNarAqk/12MIZbOjeAwSrqmdcwxyzZUioxM1WL9bzjWwK3z4ok376V
 5dFAU3Hj3ewcjGUuCtbXmhcnfwfq5vfqYufUFQtsy+C3PyfZb4kyjem6mwRXXN9ZOc4s
 btnA==
X-Gm-Message-State: AOAM532j5VhZopw+qhvXl5g4RCPoR8z0hWGJ/r1/EG+PQkCP+DvrSJgx
 FxkkQAMsMW1I/tX8iFyMmPE=
X-Google-Smtp-Source: ABdhPJwtY9ZHwe8+DA5oX4k6u3MXHenJR9U4RjnvG/Nbl5tLA8d1Q7wrRjYWEupqZ5sEJdkknt7Smw==
X-Received: by 2002:a65:4bc9:: with SMTP id p9mr27620862pgr.168.1643889243359; 
 Thu, 03 Feb 2022 03:54:03 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm9586389pjb.28.2022.02.03.03.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:54:02 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 2/3] ARM: aspeed: Add secure boot controller support
Date: Thu,  3 Feb 2022 22:23:43 +1030
Message-Id: <20220203115344.267159-3-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203115344.267159-1-joel@jms.id.au>
References: <20220203115344.267159-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This reads out the status of the secure boot controller and exposes it
in sysfs using the bootinfo sysfs api.

An example on a AST2600A3 QEMU model:

 # grep -r . /sys/firmware/bootinfo/*
 /sys/firmware/bootinfo/abr_image:0
 /sys/firmware/bootinfo/low_security_key:0
 /sys/firmware/bootinfo/otp_protected:0
 /sys/firmware/bootinfo/secure_boot:1
 /sys/firmware/bootinfo/uart_boot:0

On boot the state of the system according to the secure boot controller
will be printed:

 [    0.037634] AST2600 secure boot enabled

or

 [    0.037935] AST2600 secure boot disabled

The initialisation is changed from early_initcall to subsys_initcall
because we need the firmware_kobj to be initialised, and because there's
no requirement to print this information early.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
   - Rewrite to new bootinfo api
   - Get rid of unused return values
---
 drivers/soc/aspeed/aspeed-socinfo.c | 46 ++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 1ca140356a08..dc4dfd3df55f 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
+#include <linux/firmware_bootinfo.h>
 
 static struct {
 	const char *name;
@@ -74,6 +75,47 @@ static const char *siliconid_to_rev(u32 siliconid)
 	return "??";
 }
 
+/* Secure Boot Controller register */
+#define SEC_STATUS		0x14
+#define ABR_IMAGE_SOURCE	BIT(13)
+#define OTP_PROTECTED		BIT(8)
+#define LOW_SEC_KEY		BIT(7)
+#define SECURE_BOOT		BIT(6)
+#define UART_BOOT		BIT(5)
+
+static void __init aspeed_bootinfo_init(void)
+{
+	struct device_node *np;
+	void __iomem *base;
+	struct bootinfo bootinfo = {};
+	u32 reg;
+
+	/* AST2600 only */
+	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
+	if (!of_device_is_available(np))
+		return;
+
+	base = of_iomap(np, 0);
+	if (!base)
+		of_node_put(np);
+
+	reg = readl(base + SEC_STATUS);
+
+	iounmap(base);
+	of_node_put(np);
+
+	BOOTINFO_SET(bootinfo, abr_image,        reg & ABR_IMAGE_SOURCE);
+	BOOTINFO_SET(bootinfo, low_security_key, reg & LOW_SEC_KEY);
+	BOOTINFO_SET(bootinfo, otp_protected,    reg & OTP_PROTECTED);
+	BOOTINFO_SET(bootinfo, secure_boot,      reg & SECURE_BOOT);
+	/* Invert the bit; as 1 is boot from SPI/eMMC */
+	BOOTINFO_SET(bootinfo, uart_boot,        !(reg & UART_BOOT));
+
+	firmware_bootinfo_init(&bootinfo);
+
+	pr_info("AST2600 secure boot %s\n", (reg & SECURE_BOOT) ? "enabled" : "disabled");
+}
+
 static int __init aspeed_socinfo_init(void)
 {
 	struct soc_device_attribute *attrs;
@@ -148,6 +190,8 @@ static int __init aspeed_socinfo_init(void)
 			attrs->revision,
 			attrs->soc_id);
 
+	aspeed_bootinfo_init();
+
 	return 0;
 }
-early_initcall(aspeed_socinfo_init);
+subsys_initcall(aspeed_socinfo_init);
-- 
2.34.1

