Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633C183005
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Mar 2020 13:14:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dSSG32p0zDqRN
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Mar 2020 23:14:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dWUc1NI1; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dSS46lVszDqPf
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Mar 2020 23:14:26 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id f16so2604079plj.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Mar 2020 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KLGqjo2Pbyp0L4oH5SdHTAc+fFuuPfjZO2AGlFDtlHs=;
 b=dWUc1NI1L8enMUDwDEz9I3rxuIr2RJ9QzspTGcARsuYyzTdb7R8vAMLVr3qdL4Pe/G
 JSXtUsTXjr8uYWalLj4lm2EjpVXdf7RvXImFc36KD3Kr1I53+fCKyCzDj5za/5ddoZJ9
 NIHVl4zzCpAra6mos9utiidoMUTl+lqYMROzWXHiMyqvhn0m+E/zh0WxramiVW55II5W
 v28YQ3rv2jnjXTGREpJL3sWJs0oLxfFwBmXjWAUH7nCJ6dJ2+HR+0Np7UorcaJJ7HQLI
 o/unZqhiP9nYS7oTncmPF0o5OFv4QuWHP+6ieqqYQOLXoDMwP0cp8Fu3hntsgbIsIz2d
 Q8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KLGqjo2Pbyp0L4oH5SdHTAc+fFuuPfjZO2AGlFDtlHs=;
 b=IAUlFapd/czAb3bOYRf+yicUF71419l9m72u4/IwIr0qHeAYw777ZixtOUTh915/09
 VTfG+bUpNCFEiQznT48nb6Ln9rV9UXNvSl0142dmnrhOSZf31n5Gv+xqHOe3haFeESp+
 2w/NoEqbwB2UUWwGBCesCZwOWHp7gJe2Xmj5pH+EU9GQywC3SxU1ybBJCb2rdoVldIs2
 LgiaJibxbYrzRyadwc3xAt9NufHiA3AkklY6OJ/A0syxoggR0n8GNvuqxfBLEqqDiGRy
 f8jjGCcBm9iVOycGsHoEwMh7rCQ0FDUc9O4JBXcE9/5IO0mRP7gdhqdY4MoCJ1Uoa0DT
 +LJg==
X-Gm-Message-State: ANhLgQ28FQM1kYl0E8ma55F9C5iQSkw8KZH+1wM/FNDBsPrDUqCxAWm/
 VMJ+zzoiNnwlWmuxJEk6y7c=
X-Google-Smtp-Source: ADFU+vsw+EfzNY/wTEESeWvDprQ08xBi0sD3cWjQdPqtqWYy0EZEXJD5ldslcZhzmtNk8045vleS9g==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr3662856pjb.173.1584015262789; 
 Thu, 12 Mar 2020 05:14:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x71sm2615640pfd.129.2020.03.12.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 05:14:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
Date: Thu, 12 Mar 2020 22:44:13 +1030
Message-Id: <20200312121413.294384-1-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
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

The ast2600 disables the mapping of AHB memory regions by default,
only allowing the LPC window to point to SPI NOR. In order to point the
window to any AHB address, an ast2600 specific bit must be toggled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index f4ac14c40518..142cb4cc85e7 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -22,6 +22,9 @@
 #define HICR5_ENL2H	BIT(8)
 #define HICR5_ENFWH	BIT(10)
 
+#define HICR6 0x4
+#define SW_FWH2AHB	BIT(17)
+
 #define HICR7 0x8
 #define HICR8 0xc
 
@@ -33,6 +36,7 @@ struct aspeed_lpc_ctrl {
 	resource_size_t		mem_size;
 	u32		pnor_size;
 	u32		pnor_base;
+	bool			fwh2ahb;
 };
 
 static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
@@ -177,6 +181,16 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 		if (rc)
 			return rc;
 
+		/*
+		 * Switch to FWH2AHB mode, AST2600 only.
+		 *
+		 * The other bits in this register are interrupt status bits
+		 * that are cleared by writing 1. As we don't want to clear
+		 * them, set only the bit of interest.
+		 */
+		if (lpc_ctrl->fwh2ahb)
+			regmap_write(lpc_ctrl->regmap, HICR6, SW_FWH2AHB);
+
 		/*
 		 * Enable LPC FHW cycles. This is required for the host to
 		 * access the regions specified.
@@ -274,6 +288,9 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl"))
+		lpc_ctrl->fwh2ahb = true;
+
 	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_ctrl->miscdev.name = DEVICE_NAME;
 	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
-- 
2.25.1

