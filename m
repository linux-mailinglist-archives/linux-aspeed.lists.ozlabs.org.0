Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E82754164
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 19:52:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2fFk1Cxhz3cND
	for <lists+linux-aspeed@lfdr.de>; Sat, 15 Jul 2023 03:52:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2fFC05j0z3c6c
	for <linux-aspeed@lists.ozlabs.org>; Sat, 15 Jul 2023 03:52:14 +1000 (AEST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78372625badso83222939f.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 10:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357133; x=1691949133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAZXEC0ZZSTboxvyemEYcLPqrWdEtetoC7pYf3hwIVs=;
        b=KgoFgjX5aAfciwSnOZXNj+AtuYBIA7ibb+mHCzXHLV/woN8X2f+ewb6GTEs/kLz4ve
         ND9bCPz2gDYKHGcB8XJM559C4DOKP1Kd8DfjsHvWcqvLNaDygFa4RFA0Wl/z7pNrSobR
         X+lWobXdYFfB8GwMn/hOxWBllvz+U7OPOL49NXhEXR9EjJVIcfQVXGqgg1LqaO9uKTTG
         RkFCeR0wg5sR7qql4HPkWYW963Tk5wPTUlWZOKrfyRGb6Pf7z/pzFxF/9Q7oZnJCDi4o
         cpSVKjIlyM8K2EXZw5ei4MgROYHi+edTqfGnEoxwUNokqlsOdmtGUAbAfnOxSPgEZNYf
         WzJA==
X-Gm-Message-State: ABy/qLbxdknZFQVvLIj1ourmjXNF4irTGvY1NstUUuz7P7lxUjWD7mOa
	EO2PXE20JZU2WBIXFVVsFg==
X-Google-Smtp-Source: APBJJlE9JcsK12a+nn2E92glV3v0m6kTD9dSy4NFGvaTaUE4vjS3fqBwn27Us4irzM5tFOUlsZVZZQ==
X-Received: by 2002:a05:6602:2565:b0:783:63d6:4cb with SMTP id dj5-20020a056602256500b0078363d604cbmr5307703iob.14.1689357132908;
        Fri, 14 Jul 2023 10:52:12 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ei2-20020a05663829a200b0042b4b1246cbsm2731387jab.148.2023.07.14.10.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:52:12 -0700 (PDT)
Received: (nullmailer pid 4067193 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:29 -0000
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] soc: aspeed: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:28 -0600
Message-Id: <20230714175128.4067138-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c    | 1 -
 drivers/soc/aspeed/aspeed-p2a-ctrl.c     | 2 +-
 drivers/soc/aspeed/aspeed-uart-routing.c | 3 +--
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8dfbeb..773dbcbc03a6 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -19,7 +19,6 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 20b5fb2a207c..548f44da28a9 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -18,8 +18,8 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index ef8b24fd1851..8c89ad312c1d 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -5,8 +5,7 @@
  */
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
-- 
2.40.1

