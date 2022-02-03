Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11184A835E
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 12:54:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqHBy3h4zz3bXn
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 22:54:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BjG3aUua;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BjG3aUua; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqHBn1f5mz3bb2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Feb 2022 22:54:09 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id i30so2019290pfk.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYksfqXaPV/dh2hqgLls7NY6zYw6qDongmSSBZKsfsc=;
 b=BjG3aUuaDcR15UUUbWnRHZMmAfImhR37OOfIAEbDVyEBG3bMLKPk0AMcZE709hkDmC
 wrCKej65+toxCE+wJdzgUF5XTyrA748FK9AxG2OmmfbOTDcv5Bhyzovi2BmsPUHYKRle
 ggzENsYakkmYRtuxOc1oxcGJDkIZJfXdRmjJM1/F0+G16m7/X3TuYo5cyWYFyIfduX4N
 /K0S7U+/BiohQf4LLkUZnMhwEfP3FkpZTn1JJe+lzi5wdvazzZf49aLs7CKPfH7tdI/4
 WtOUGysft1QKT8VES0RtPg0l9QTamPNmFOJ7a4zQ+5PTu441LZBfHrAIwyAa1sS9pV/0
 Zn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYksfqXaPV/dh2hqgLls7NY6zYw6qDongmSSBZKsfsc=;
 b=TNhgmlG2Ggn7PEabHOgi1GF2HBgYmLc/UcljhCjLTFbM88x9Im0BcXfutx35Lt1j1b
 n6rwE7p21lgF+fFsRyOEvFbCIxmfCTM5DnG4+6v4Wove1y3vtElqwbMbL7qdRaADk0Ug
 GmIZ0DFPqhzuuqU9rVH73GBs/OZmChCnk5oEne0xQA3ruN6OPOhEanWgfmvzss0v/WK5
 AnDopABxAJo1p9dOqXIwJVzms16DlscP2iazGR0BP2OYJLcH4eiNrk4Rr05CrKDjreaA
 dE8H5UMkWJLipsrgA3imuRAS07HkuHyuD3czGNTU9FkI8BNNlI2VJNgibP7o1IZfzfEZ
 7xEQ==
X-Gm-Message-State: AOAM530BSkav8p7+qCI9o6XJcD7txft8Ra8S4/Fag0mbW6SnNQDzb8EU
 14o6X/xNiV23hRA2i+bqvbQ=
X-Google-Smtp-Source: ABdhPJypXHtSz1IUsmMH9S/+owRsut30+8ayH1fpDzvTpQE50paUnOxndIO3XEwgBjUCoguuAArtmg==
X-Received: by 2002:a63:80c8:: with SMTP id j191mr20235458pgd.8.1643889247028; 
 Thu, 03 Feb 2022 03:54:07 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm9586389pjb.28.2022.02.03.03.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:54:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 3/3] x86/setup: Populate bootinfo with secure boot status
Date: Thu,  3 Feb 2022 22:23:44 +1030
Message-Id: <20220203115344.267159-4-joel@jms.id.au>
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

bootinfo indicates to userspace that firmware is configured to boot with
secure boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: new
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

