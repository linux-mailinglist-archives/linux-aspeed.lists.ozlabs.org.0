Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FF4A947A
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 08:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqn7T2cRVz3bb2
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 18:23:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HmUyqiwJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HmUyqiwJ; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqn7P6ph0z3bWG
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Feb 2022 18:22:57 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id y17so4400020plg.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 23:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3NAuZUPwGF81ONxppx1B9B6iTuR1QuOpDIcTSst0sx0=;
 b=HmUyqiwJMKWnR7xJD07p4oXeNj9NB7fxabIkBU7eUvnS7cgvXWWegTDLLCfxRsQO0L
 bDTv0BDUlmGtIsho04tQU1mS+fFZs0lOi4IXKWd4u4jiaFmxFO1v6Uy5ykagjn1FfFkY
 ooJR2M+k3Ad2jnFTbCJzpLDQLmy8ctJ0d1cZASvSOVAMPqBYsT2rx6OIq8Wo+L3yZXJf
 HEE14JFihc1dS7hY07KRN2s3iv0iSOkvaS4TEAAjSULEjOuf0sbT8DSwqrP2AhTpoFoP
 li3jYYBBInfYPeEGtJS1Y8Q88AslwT6YmvKI7otNQFTjM30Mr1y/Cw8CixxwV40SbOoD
 cVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3NAuZUPwGF81ONxppx1B9B6iTuR1QuOpDIcTSst0sx0=;
 b=jissnbyexHoYRBzcYxHUBVo6Zv3BGrwuAmXiv7pMorQpaT1BqCyXxp7xLNYC5kqHW+
 KHRYDFHnSPgULyaDET8AjlIX+8QDD/nVhhKTPNCnYS3Pjm09ppOHYa/XPiKZ+u8WOShZ
 pZp6olY+0LeZM7XjeB3IOCuzUuT0MPvbzqWheAYA4bxvj2e4oyeQtuoLEUKiGbYhS975
 NIPS+0W+d6WnFdep1l3UiYB0I09glcjqwF3ByH2wcYUQ1B4czEmwQeSx28lTwCwcKGwI
 01TlxaRpvrhJ4iQoyjidnwER3DauoEIXteQob3vhr0xUzQVTG8IrNWA5hpjD/JR9Hn8z
 wQ3w==
X-Gm-Message-State: AOAM531bVxxGuanXN24/P2mUMi3GsKTTmS2bYf1Pgt5fAn0VftyupFfk
 Xqe6byTYzp1PaVzhw4OUisY=
X-Google-Smtp-Source: ABdhPJyVz5qfJzssRkzORV9t582XmgGtNGjvXlTFsPohRi5IjyDvNmGF+qtghzsEor7vO69s2ZW/Fg==
X-Received: by 2002:a17:90a:6a4e:: with SMTP id
 d14mr1695587pjm.177.1643959375746; 
 Thu, 03 Feb 2022 23:22:55 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t14sm11665328pjd.6.2022.02.03.23.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:22:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 3/3] x86/setup: Populate bootinfo with secure boot status
Date: Fri,  4 Feb 2022 17:52:34 +1030
Message-Id: <20220204072234.304543-4-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204072234.304543-1-joel@jms.id.au>
References: <20220204072234.304543-1-joel@jms.id.au>
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

bootinfo indicates to userspace that firmware is configured to boot with
secure boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: new
v3: no change
---
 arch/x86/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index f7a132eb794d..b805b758478f 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -23,6 +23,7 @@
 #include <linux/usb/xhci-dbgp.h>
 #include <linux/static_call.h>
 #include <linux/swiotlb.h>
+#include <linux/firmware_bootinfo.h>
 
 #include <uapi/linux/mount.h>
 
@@ -1100,17 +1101,22 @@ void __init setup_arch(char **cmdline_p)
 	setup_log_buf(1);
 
 	if (efi_enabled(EFI_BOOT)) {
+		struct bootinfo bootinfo = {};
+
 		switch (boot_params.secure_boot) {
 		case efi_secureboot_mode_disabled:
 			pr_info("Secure boot disabled\n");
+			BOOTINFO_SET(bootinfo, secure_boot, false);
 			break;
 		case efi_secureboot_mode_enabled:
 			pr_info("Secure boot enabled\n");
+			BOOTINFO_SET(bootinfo, secure_boot, true);
 			break;
 		default:
 			pr_info("Secure boot could not be determined\n");
 			break;
 		}
+		firmware_bootinfo_init(&bootinfo);
 	}
 
 	reserve_initrd();
-- 
2.34.1

