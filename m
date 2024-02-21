Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B385E62A
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:35:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfflYw5c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4hB55kPz3cZR
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:35:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfflYw5c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4h26sFkz3brV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:34:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540499; x=1740076499;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SXh9o6lcdXir6m04bi7g64vXsMqCpE0OVYelVUUwvJE=;
  b=YfflYw5cZWQ6hRqrh0nQiuYQ8aallWOhKAhLQ0FqQFM/szs6Ba7tVz5a
   j6tW0enkwZyOCVYpJsaV0XL5xJKxX7RTya+dHzPS3mN7ekur+Tr0nLLak
   7FWHWXiIV0KMzmwWBcMMd3cAFYh697jFbTG+kuv4ew+q2AY1OfCGJX/7A
   qB8FeforemVUyMo66IuuiQdY7J+h8bU99eXBPY/ZONKI+C0eXqkx9jaO6
   y2q0zF0ynq73IrZvZhdNIkibuNn6Ks1V7YWYXiQz1VUpkSd3f8lcyB6+7
   4aqqOqOHZt/zc7sl08hkEUyROTaeJJ1XeEcb7ySkAPpJY3tbJdNm287DV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164673"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164673"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684737"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684737"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A7CB11FD; Wed, 21 Feb 2024 20:34:46 +0200 (EET)
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
Subject: [rft, PATCH v1 00/14]  serial: Add a helper to parse device properties and more
Date: Wed, 21 Feb 2024 20:31:16 +0200
Message-ID: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
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

Tested on Intel Apollo Lake with DesingWare 8250 UARTs.
The rest has been compile tested on x86_64 with clang.

Andy Shevchenko (14):
  serial: core: Move struct uart_port::quirks closer to possible values
  serial: core: Add UPIO_UNSET constant for unset port type
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
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  92 ++++++-------
 drivers/tty/serial/8250/8250_bcm7271.c      |  53 +++-----
 drivers/tty/serial/8250/8250_dw.c           |  67 ++++------
 drivers/tty/serial/8250/8250_ingenic.c      |  20 +--
 drivers/tty/serial/8250/8250_lpc18xx.c      |  20 ++-
 drivers/tty/serial/8250/8250_of.c           | 105 ++++-----------
 drivers/tty/serial/8250/8250_omap.c         |  29 ++---
 drivers/tty/serial/8250/8250_pxa.c          |  22 ++--
 drivers/tty/serial/8250/8250_tegra.c        |  26 ++--
 drivers/tty/serial/8250/8250_uniphier.c     |  17 +--
 drivers/tty/serial/serial_port.c            | 135 ++++++++++++++++++++
 include/linux/serial_core.h                 |  10 +-
 13 files changed, 313 insertions(+), 333 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

