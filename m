Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A71A6F53
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 00:32:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Nfl2yxhzDqHh
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 08:32:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ernesto.corona@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Nbz050MzDqNF
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Apr 2020 08:30:22 +1000 (AEST)
IronPort-SDR: QKPVFfBVDvG2O9UwGZctysQZzL/hN4/IBIaJ3KGM8KnBWoVjW9BnYMj/Rda2mF77uGLPqM3QC6
 PzCb4JLqxxYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 15:30:18 -0700
IronPort-SDR: vRCsw9bREBOCC60RABl7bp+ryTEzmchD5yk8aqBS/Cgjhq0OSHv37Wni/NqCIyDXNdcGm+rTV8
 yIVyEvPleqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,380,1580803200"; d="scan'208";a="399760858"
Received: from epcorona-mobl.amr.corp.intel.com (HELO
 epcorona-moblu.amr.corp.intel.com) ([10.254.189.204])
 by orsmga004.jf.intel.com with ESMTP; 13 Apr 2020 15:30:09 -0700
From: Ernesto Corona <ernesto.corona@intel.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v29 6/6] drivers: jtag: Add JTAG core driver Maintainers
Date: Mon, 13 Apr 2020 15:29:20 -0700
Message-Id: <20200413222920.4722-7-ernesto.corona@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200413222920.4722-1-ernesto.corona@intel.com>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
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
Cc: Rob Herring <robh@kernel.org>, Steven Filary <steven.a.filary@intel.com>,
 Vadim Pasternak <vadimp@mellanox.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jiri Pirko <jiri@mellanox.com>,
 Rgrs <rgrs@protonmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ernesto Corona <ernesto.corona@intel.com>, Patrick Williams <patrickw3@fb.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Oleksandr Shamray <oleksandrs@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

JTAG class driver provide infrastructure to support hardware/software
JTAG platform drivers. It provide user layer API interface for flashing
and debugging external devices which equipped with JTAG interface
using standard transactions.

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Pirko <jiri@mellanox.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Steven Filary <steven.a.filary@intel.com>
Cc: Amithash Prasad <amithash@fb.com>
Cc: Patrick Williams <patrickw3@fb.com>
Cc: Rgrs <rgrs@protonmail.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..96d20fbb719c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9144,6 +9144,17 @@ L:	linux-serial@vger.kernel.org
 S:	Orphan
 F:	drivers/tty/serial/jsm/
 
+JTAG SUBSYSTEM
+M:	Oleksandr Shamray <oleksandrs@mellanox.com>
+M:	Vadim Pasternak <vadimp@mellanox.com>
+M	Ernesto Corona <ernesto.corona@intel.com>
+S:	Maintained
+F:	include/linux/jtag.h
+F:	include/uapi/linux/jtag.h
+F:	drivers/jtag/
+F:	Documentation/devicetree/bindings/jtag/
+F:	Documentation/ABI/testing/jtag-dev
+
 K10TEMP HARDWARE MONITORING DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	linux-hwmon@vger.kernel.org
-- 
2.17.1

