Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EF453F26
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 04:51:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv8B31z57z2yfb
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 14:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gkHqnj51;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gkHqnj51; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv89x3NSTz2xXs
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 14:51:33 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id x5so1413144pfr.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 19:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/EBS/tohVgrX5ms5+y7t3q/IQj9zXKjUfmpO5XUvbw=;
 b=gkHqnj51RMoaImsqO+NQa+fJQeU7RdZsEdmDOc0+qa22B9xUu62n85SXX0f0J1FmVE
 JHtIqhtQ77ivkUPTfBZ9p5RAn8LIvx55eNFENBctlvfPl3+RQDQ/cY48i8USHnuyzfnW
 +GiH1hK1ix3ZQCadzgWhT8fPo833b4q5ydvgMKYHrs1t4NP0/0GwJXgVz2eKAlGXCUYM
 y94wznagVKfMSnJL096q185UgiBcCGGTSAJF53hxTZO3zTvM3YjhzcV/nMo3XsQZkpzM
 chOgbMozZk1tmKzQTaDQRK2ISmRw3SjyN+KrOnWFJPNWESdaojEWoK4dGNNHZag+LsgU
 ms7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x/EBS/tohVgrX5ms5+y7t3q/IQj9zXKjUfmpO5XUvbw=;
 b=PmDVEfn5cBPFTWbDMWzmqyTdsvM+H5R0ArpbtsiInlAjAoCGl3oEQ9h7549PpNQbgO
 frE3wTWO2XeXRXAE5F+p0QFgvZoTDHOAcjeBOZ4LdcVqagFSgWAT2WO6mYHEDPqPBm00
 g4WuxhuCzJpihO1obMSNsTWFc2VS8N5bFz47xLPANXWRHrKBi7zhW7RMGmOpnbvy06Fs
 tAQmOkeTvCzYXkTgIg2idPUIkPltUxQzQQw/OeJxPN4lzuSFlL0pxhNb+gK3BS22QKHf
 GFh3J1dcUSa8dIk0n4kxsyz7D5Yp06VpHmfo9nFPVUCSCeGvtxI+/JXU6kgYCPjsJ2JB
 ddUg==
X-Gm-Message-State: AOAM532q8XsIuKvFy62ZeOi1m974kJvZmKGwgFdYduWWtG9Q8LQTBunE
 GZVEwe2wwlG2YtdNPYb4R9A=
X-Google-Smtp-Source: ABdhPJwFg/IEkp0Q3THXCqLhU3JeFkAMjxL14FIiEiXcRVzHOpp+dq++AMS8tIMBgaSlFf6aEDYdlA==
X-Received: by 2002:a63:b25d:: with SMTP id t29mr3102929pgo.79.1637121091320; 
 Tue, 16 Nov 2021 19:51:31 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id c15sm3671339pjg.53.2021.11.16.19.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:51:30 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.u>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] ARM: aspeed: Add secure boot controller support
Date: Wed, 17 Nov 2021 11:51:06 +0800
Message-Id: <20211117035106.321454-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117035106.321454-1-joel@jms.id.au>
References: <20211117035106.321454-1-joel@jms.id.au>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This reads out the status of the secure boot controller and exposes it
in sysfs.

An example on a AST2600A3 QEMU model:

 # grep . /sys/bus/soc/devices/soc0/*
 /sys/bus/soc/devices/soc0/abr_image:0
 /sys/bus/soc/devices/soc0/family:AST2600
 /sys/bus/soc/devices/soc0/low_security_key:0
 /sys/bus/soc/devices/soc0/machine:Rainier 2U
 /sys/bus/soc/devices/soc0/otp_protected:0
 /sys/bus/soc/devices/soc0/revision:A3
 /sys/bus/soc/devices/soc0/secure_boot:1
 /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
 /sys/bus/soc/devices/soc0/soc_id:05030303
 /sys/bus/soc/devices/soc0/uart_boot:1

On boot the state of the system according to the secure boot controller
will be printed:

 [    0.037634] AST2600 secure boot enabled

or

 [    0.037935] AST2600 secure boot disabled

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 1ca140356a08..6faf2c199c90 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -9,6 +9,8 @@
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
+static u32 security_status;
+
 static struct {
 	const char *name;
 	const u32 id;
@@ -74,6 +76,54 @@ static const char *siliconid_to_rev(u32 siliconid)
 	return "??";
 }
 
+#define SEC_STATUS		0x14
+#define ABR_IMAGE_SOURCE	BIT(13)
+#define OTP_PROTECTED		BIT(8)
+#define LOW_SEC_KEY		BIT(7)
+#define SECURE_BOOT		BIT(6)
+#define UART_BOOT		BIT(5)
+
+static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE));
+}
+static DEVICE_ATTR_RO(abr_image);
+
+static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY));
+}
+static DEVICE_ATTR_RO(low_security_key);
+
+static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED));
+}
+static DEVICE_ATTR_RO(otp_protected);
+
+static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT));
+}
+static DEVICE_ATTR_RO(secure_boot);
+
+static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	/* Invert the bit, as 1 is boot from SPI/eMMC */
+	return sprintf(buf, "%d\n", !(security_status & UART_BOOT));
+}
+static DEVICE_ATTR_RO(uart_boot);
+
+static struct attribute *aspeed_attrs[] = {
+	&dev_attr_abr_image.attr,
+	&dev_attr_low_security_key.attr,
+	&dev_attr_otp_protected.attr,
+	&dev_attr_secure_boot.attr,
+	&dev_attr_uart_boot.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(aspeed);
+
 static int __init aspeed_socinfo_init(void)
 {
 	struct soc_device_attribute *attrs;
@@ -81,6 +131,7 @@ static int __init aspeed_socinfo_init(void)
 	struct device_node *np;
 	void __iomem *reg;
 	bool has_chipid = false;
+	bool has_sbe = false;
 	u32 siliconid;
 	u32 chipid[2];
 	const char *machine = NULL;
@@ -109,6 +160,20 @@ static int __init aspeed_socinfo_init(void)
 	}
 	of_node_put(np);
 
+	/* AST2600 only */
+	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
+	if (of_device_is_available(np)) {
+		void *base = of_iomap(np, 0);
+		if (!base) {
+			of_node_put(np);
+			return -ENODEV;
+		}
+		security_status = readl(base + SEC_STATUS);
+		has_sbe = true;
+		iounmap(base);
+		of_node_put(np);
+	}
+
 	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
 	if (!attrs)
 		return -ENODEV;
@@ -135,6 +200,9 @@ static int __init aspeed_socinfo_init(void)
 		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
 						 chipid[1], chipid[0]);
 
+	if (has_sbe)
+		attrs->custom_attr_group = aspeed_groups[0];
+
 	soc_dev = soc_device_register(attrs);
 	if (IS_ERR(soc_dev)) {
 		kfree(attrs->soc_id);
@@ -148,6 +216,11 @@ static int __init aspeed_socinfo_init(void)
 			attrs->revision,
 			attrs->soc_id);
 
+	if (has_sbe) {
+		pr_info("AST2600 secure boot %s\n",
+			(security_status & SECURE_BOOT) ? "enabled" : "disabled");
+	}
+
 	return 0;
 }
 early_initcall(aspeed_socinfo_init);
-- 
2.33.0

