Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E698B03B
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkZ3ySWz3fr8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697868;
	cv=none; b=NNv+wZ31B+/Dd4IqDf8QfQCubXAUbsPZjZ132TTszR9X3bGrkL/lJQo5XBQTLkKkCJlxUJAlcR1RCXrmOE5d91dSbp+B10AxnRCsttk21i8KStQO3zX/FknBq9Ixw2aiyLOti4oRyTUSWGIiTPx0A1yqqKDsrUcS9fm4KuA0mSVky0oFb7WfO9aOSI65+o6xoSsKT4I3ei1bYmY07+A3TGLm3ZSc7uumaCB6kPrEhkWPbcEuksWEMvoNPv6+g3hjkHkdbXfCzG0/Q4JWvPrTAG8Zdp5hji3hCgHPC/j6QvmRksR6ieSoqx4tTdJ8wOkeR+o7FJZKFZUlmIFus/8ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697868; c=relaxed/relaxed;
	bh=t2tB8sFg/5a2I4zeaxxZR6pf56+tHkpHPezEUEsu9lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agIFLZkdZ3GKd14Tk2+YAYx8djl2t1AVhQBWXs4TppF15GvNts9cWXxDGWSQQGn/viJ1djSopx0uOiYvBZW/9SMxqQW/7DBH/oAIGfR3yqqe0A0V7UenPkZ5EzakSBme9wwRnX4pNBGKvCWEA67UWA+FD6fisZBNJZQ/9h7dVeqnyvCM5uM2oYafpnPmv0TBbNMkzYqFjqmU1doXLsCJq51qOiBMmKudG6oI7H+jJo9oyuDIQS4gwL/hIAGPplSSv+IGbd7POFeUspWc5sNgYXUsEgyz7/ds4wwLvUIKUYVNhdJu5cbTWbaGjqellqliWs2IMfsSTdkLcnnbspnilg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3w7vEmm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3w7vEmm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKW02BzQz2yPj
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:28 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6cb25aad5dfso40846316d6.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697865; x=1728302665; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2tB8sFg/5a2I4zeaxxZR6pf56+tHkpHPezEUEsu9lc=;
        b=M3w7vEmmoM/Iw1xEGYZWVqqRPBcXjagr3ocfkjHyENOdGEGB5bUPcrOt2K4s0SblYV
         0QnKWoEe8KG/+LAyj5mfVkX986HAul04wyAMipAzqjCP70v0fMSM3Zu8SioD8tWXfmTs
         mlVFJf6jzsAUUxo5+iaDJX+L1yOdSOFMIVfMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697865; x=1728302665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2tB8sFg/5a2I4zeaxxZR6pf56+tHkpHPezEUEsu9lc=;
        b=I9ZLvpDrJYOtlRXXnumitND3A/Z4I3FbX4B5U8Ex7+k1U0HRlYodEUfos7om2mRqQc
         mCUI/m6qLKRBJDN039940jcJmaY2gkPcUjI2g8g8s41cIN6lIfO1QNLxWFvCUmRrMJBr
         NcuhFWFeB6GV8kKh2D/q4zO9tiOEzEjFK+D3iuXuzzeBG1yYTTtN5Q5akl1IQxIsXimy
         0+/Ht5p/Wbu5OcGWV8tct7J+osADnd0X/hDDKUMKyrt6GvpwC4eI/vfbn/CaAIYI3vfg
         0WbcAtbQYlOPAGiwuL8KAYPwwhb4InxibhUuD9qSy61BzE4BhlH7GlesoIPkcXYtRxKa
         OEBw==
X-Forwarded-Encrypted: i=1; AJvYcCXk9k9YqWF78HHGYuQhFwIfh39qwpFTE9dpsTdC/ZKWHw/TeIoNcctRFCEtp1APX4Qi202zg7ji9cBhNjo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQNxph/aWCEmpSyQreMPM1t+QMnhk2FdyyWlhl5E9m54dnyObH
	LiCFr9BDKMiQlB1Ae65ei1q8Ea7Z61jISl2zJKArjOXlrYgDJbuYbrZY/rOOvA==
X-Google-Smtp-Source: AGHT+IHhNN24sJCIubgfbFA4VGeLvNv4RKY7X5IqP1ufDg/rjxIUh41wM/wPVdTOII53M0RqAZGVpA==
X-Received: by 2002:a05:6214:3982:b0:6cb:3e26:bcaf with SMTP id 6a1803df08f44-6cb3e26bd60mr117592306d6.32.1727697865303;
        Mon, 30 Sep 2024 05:04:25 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:06 +0000
Subject: [PATCH 11/45] media: rc: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-11-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following cocci warnings are fixed:
drivers/media/rc/mceusb.c:1130:2-8: opportunity for str_enable_disable(enable)
drivers/media/rc/ene_ir.c:1121:22-28: opportunity for str_enabled_disabled(enable)
drivers/media/rc/serial_ir.c:591:4-9: opportunity for str_low_high(sense)
drivers/media/rc/serial_ir.c:594:4-9: opportunity for str_low_high(sense)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/rc/ene_ir.c    | 3 ++-
 drivers/media/rc/mceusb.c    | 3 ++-
 drivers/media/rc/serial_ir.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 67722e2e47ff..90bee860a8a1 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 #include "ene_ir.h"
 
@@ -1118,7 +1119,7 @@ static void ene_remove(struct pnp_dev *pnp_dev)
 /* enable wake on IR (wakes on specific button on original remote) */
 static void ene_enable_wake(struct ene_device *dev, bool enable)
 {
-	dbg("wake on IR %s", enable ? "enabled" : "disabled");
+	dbg("wake on IR %s", str_enabled_disabled(enable));
 	ene_set_clear_reg_mask(dev, ENE_FW1, ENE_FW1_WAKE, enable);
 }
 
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index cd7af4d88b7f..7f932f0f5750 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/workqueue.h>
 #include <linux/usb.h>
 #include <linux/usb/input.h>
@@ -1127,7 +1128,7 @@ static int mceusb_set_rx_carrier_report(struct rc_dev *dev, int enable)
 				    MCE_CMD_SETIRRXPORTEN, 0x00 };
 
 	dev_dbg(ir->dev, "%s short-range receiver carrier reporting",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 	if (enable) {
 		ir->carrier_report_enabled = true;
 		if (!ir->learning_active) {
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index fc5fd3927177..f9ec2f043529 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 
 struct serial_ir_hw {
@@ -588,10 +589,10 @@ static int serial_ir_probe(struct platform_device *dev)
 		}
 		sense = nlow >= nhigh ? 1 : 0;
 		dev_info(&dev->dev, "auto-detected active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 	} else
 		dev_info(&dev->dev, "Manually using active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 
 	dev_dbg(&dev->dev, "Interrupt %d, port %04x obtained\n", irq, io);
 

-- 
2.46.1.824.gd892dcdcdd-goog

