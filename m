Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AE85E62E
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:35:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoUEF7or;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4hM2bT6z3d4F
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:35:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoUEF7or;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4h6216Hz3brV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:35:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540503; x=1740076503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GKzrAAQ/SAD+M4CCaHIYdelfWhk61yKpviB6x4LqmT4=;
  b=EoUEF7or6nSFIRXXBX3hu6Br1E1hP9X8BfWg1Mjk/AexFpubbPcOm+nO
   iEi3sAesWoiV4NtyZfu2KTbHLa4tYnLrNIVa3uPg4WcFIseIV8NGs1T2w
   mGznJoBrjtJyZ+mwSGzzwCGdBtdQ5WhfFF8nNzfJ9sa7ZJl0supXxRod6
   XJwG29HjGyT3edh3UVYnceN+a7I5VImu+fUNLyMx19bi8TSba8IXfJmCC
   CJlMm3UX1d+27dOUii14BQd0FuFSZKZEdP+pUzA/Z5YhUh2KLVawJ+05s
   pren4j9BEbazVBtXhayD8lEfK0HFswcoL8EHx/kbE3D/7GpinMV2+Ap7i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164694"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164694"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684739"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684739"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B783E144; Wed, 21 Feb 2024 20:34:46 +0200 (EET)
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
Subject: [PATCH v1 01/14] serial: core: Move struct uart_port::quirks closer to possible values
Date: Wed, 21 Feb 2024 20:31:17 +0200
Message-ID: <20240221183442.4124354-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
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
belong two. Reindent the code, so it will be easy to read and understand.
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

