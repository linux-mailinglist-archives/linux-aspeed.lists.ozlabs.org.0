Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4E867832
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:25:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HmSlEyDg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2wG2dqQz3vfk
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 01:25:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HmSlEyDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2vs08HMz3vdp
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 01:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708957530; x=1740493530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A8p5Npmvda1MkUKRvwcBNktCV2esnRfoVCvpbf/iEPo=;
  b=HmSlEyDgRFwdE206enf1D/Gc3CriDX/wrWragFUSYI7dYEGf4pGUForB
   k0OrDlLJ00nbZkA3ZNV3KF/ZAAHFxs8Ix0n76oT7/LdgWvUsWdJbDQtgy
   T3UIOTrY4XBlSHbS8cjHs0YNhRCvE0dfE66VdfkJVp31/2tMdocSyTr5O
   rUCKkYn1KvrOjQMG1uxuPq8fmme/aq4xt32BRrcnblB5Hx9z+kKj4cXSA
   5SfkWaXORxSioIaEtsV3JSQYwhFq0E+EPNzJ2+yMuQZ/6gY/svvOIyT6p
   gTXi9QLK/IokrIaBFA34Vd2Q7R8HLL3JvIk8IPNBUlRm17SWlh6dyAtTa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3375136"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3375136"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937030141"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937030141"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2024 06:25:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 07994144; Mon, 26 Feb 2024 16:25:15 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/14] serial: core: Move struct uart_port::quirks closer to possible values
Date: Mon, 26 Feb 2024 16:19:17 +0200
Message-ID: <20240226142514.1485246-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
References: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently it's not crystal clear what UPIO_* and UPQ_* definitions
belong to. Reindent the code, so it will be easy to read and understand.
No functional changes intended.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/serial_core.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 55b1f3ba48ac..2d2ec99eca93 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -467,8 +467,8 @@ struct uart_port {
 	unsigned int		fifosize;		/* tx fifo size */
 	unsigned char		x_char;			/* xon/xoff char */
 	unsigned char		regshift;		/* reg offset shift */
+
 	unsigned char		iotype;			/* io access style */
-	unsigned char		quirks;			/* internal quirks */
 
 #define UPIO_PORT		(SERIAL_IO_PORT)	/* 8b I/O port access */
 #define UPIO_HUB6		(SERIAL_IO_HUB6)	/* Hub6 ISA card */
@@ -479,7 +479,9 @@ struct uart_port {
 #define UPIO_MEM32BE		(SERIAL_IO_MEM32BE)	/* 32b big endian */
 #define UPIO_MEM16		(SERIAL_IO_MEM16)	/* 16b little endian */
 
-	/* quirks must be updated while holding port mutex */
+	unsigned char		quirks;			/* internal quirks */
+
+	/* internal quirks must be updated while holding port mutex */
 #define UPQ_NO_TXEN_TEST	BIT(0)
 
 	unsigned int		read_status_mask;	/* driver specific */
-- 
2.43.0.rc1.1.gbec44491f096

