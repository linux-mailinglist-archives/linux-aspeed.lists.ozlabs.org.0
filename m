Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4026B7CD3
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 16:53:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1RT5jLRz3cC5
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 02:53:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7vqOzuq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7vqOzuq;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1Q75wnnz3cDG
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 02:52:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678722768; x=1710258768;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=44H65SqPEjytPpOdhJ9BoDKKnN4CrCDrzMx5ajkPqYc=;
  b=c7vqOzuqGbgrvuATAhAnelGS+gnPTbt4sxFQDsSVJ2bJpVwueyPL/abT
   cHfLW+H1PmQAWG9/zXwQYT1sCsXRUcGJL2g/1j5vrcxjaFKpF1HVfQCUD
   FZAOl83wp3w2lwN9hbCDjb3CijKuBFGSGaEaVEaEzKcBW9pyIDDt1UvQF
   OFDIg+dFmo3lZ2DWytG66DwDvbLfX53P6q0TG6kBH0lFEHLjfl6iNlgHO
   OR0VXVsf1eOs7Nc5yAeA6Uuk+Zy+6IZ+J/PoLx7LfhqdcWbjOGvirN7Cy
   B3YbTOXfH0B008x0Kcyax0Eu+2eB8GPoQZMovkBHr85eAdUJ+i83qwW0E
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337206327"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="337206327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 08:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747659008"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="747659008"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 08:52:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 74026365; Mon, 13 Mar 2023 17:53:15 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Henry Tian <tianxiaofeng@bytedance.com>,
	Joel Stanley <joel@jms.id.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Liang He <windhl@126.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] usb: gadget: aspeed: Rectify a bit a random header inclusion
Date: Mon, 13 Mar 2023 17:53:10 +0200
Message-Id: <20230313155310.80022-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

It looks like the driver copied'n'pasted almost random set of
headers for its code. Rectify it a bit by removing of_gpio.h
that is not only unused, but also will be removed in the future
completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 1 -
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 1 -
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 1 -
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 1 -
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index ac3ca24f8b04..86398a04a012 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 4f3bc27c1c62..573109ca5b79 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index b4cf46249fea..e9aa74231760 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 56e55472daa1..148d7ec3ebf4 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index e2207d014620..a63e4af60a56 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/usb/gadget.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <linux/bcd.h>
-- 
2.39.2

