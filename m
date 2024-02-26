Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345686782F
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:25:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dh82Kid1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2w970hvz3vfH
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 01:25:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dh82Kid1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2vr6MF8z3c1g
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 01:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708957529; x=1740493529;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=74CnFkZQ38BEQwdCa2/x1RRI0t/N2qwbGFXvoSq90DY=;
  b=Dh82Kid1sPeslAKt7toB5lZK9VZ4F0167/dhZCHhh0ujN/ey+bInd5uE
   sT1RzZ5DOmBF4c2bJAbSTS6wy3U8/7eEhasp1rh1tpJyJGxBGFOMIReXU
   ai9v1EllEkDd5sJr5xkY7PBzUsExWk+hA7M3BUFhN5TacZztsO8cLXi3p
   CXubIDg4xy0LNe6UZFeDsN/fU9WBcIN/+Z+kT8KS/mr+jVGV9vno75C6d
   X9rHlgHVuYzJV3hZGWLOEoOhOIUsfM/VcKeQ/cWLxjGRwqe393ogO+FjY
   gGCUuvgyCLBxzw1MUogPYdnR5zBEO1Na7b51fxR/7vBLnPLSNiJFftPOz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3375123"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3375123"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937030139"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937030139"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2024 06:25:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E5EA8213; Mon, 26 Feb 2024 16:25:15 +0200 (EET)
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
Subject: [PATCH v2 00/14] serial: Add a helper to parse device properties and more
Date: Mon, 26 Feb 2024 16:19:16 +0200
Message-ID: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I have noticed that many drivers are using the subset of the common
properties and IRQ retrieval code. With the moving it to one place
we have got a common parser one for many.

Tested on Intel Apollo Lake with DesingWare 8250 UARTs (clang compiled)
and in QEMU for Aspeed configuration (gcc compiled). The rest has been
compile tested on x86_64 with clang.

In v2:
- fixed typo (Hugo)
- renamed UPIO_UNSET --> UPIO_UNKNOWN (Florian)
- fixed 8250_of not working (Andrew)
- dropped unused variable in 8250_bcm7271 (LKP)
- added tag to 8250_aspeed_vuart (Andrew)

Andy Shevchenko (14):
  serial: core: Move struct uart_port::quirks closer to possible values
  serial: core: Add UPIO_UNKNOWN constant for unknown port type
  serial: port: Introduce a common helper to read properties
  serial: 8250_aspeed_vuart: Switch to use uart_read_port_properties()
  serial: 8250_bcm2835aux: Switch to use uart_read_port_properties()
  serial: 8250_bcm7271: Switch to use uart_read_port_properties()
  serial: 8250_dw: Switch to use uart_read_port_properties()
  serial: 8250_ingenic: Switch to use uart_read_port_properties()
  serial: 8250_lpc18xx: Switch to use uart_read_port_properties()
  serial: 8250_of: Switch to use uart_read_port_properties()
  serial: 8250_omap: Switch to use uart_read_port_properties()
  serial: 8250_pxa: Switch to use uart_read_port_properties()
  serial: 8250_tegra: Switch to use uart_read_port_properties()
  serial: 8250_uniphier: Switch to use uart_read_port_properties()

 drivers/tty/serial/8250/8250_aspeed_vuart.c |  50 +++-----
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  92 ++++++--------
 drivers/tty/serial/8250/8250_bcm7271.c      |  56 +++-----
 drivers/tty/serial/8250/8250_dw.c           |  67 ++++------
 drivers/tty/serial/8250/8250_ingenic.c      |  20 +--
 drivers/tty/serial/8250/8250_lpc18xx.c      |  20 ++-
 drivers/tty/serial/8250/8250_of.c           | 105 ++++-----------
 drivers/tty/serial/8250/8250_omap.c         |  29 ++---
 drivers/tty/serial/8250/8250_pxa.c          |  22 ++--
 drivers/tty/serial/8250/8250_tegra.c        |  26 ++--
 drivers/tty/serial/8250/8250_uniphier.c     |  17 +--
 drivers/tty/serial/serial_port.c            | 134 ++++++++++++++++++++
 include/linux/serial_core.h                 |  10 +-
 13 files changed, 313 insertions(+), 335 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

