Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3B2F9A48
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jan 2021 08:00:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2jS1t0FzDqCb
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jan 2021 18:00:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK2XQ5Sf5zDqvw;
 Mon, 18 Jan 2021 17:52:22 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10I6jxbE030933;
 Mon, 18 Jan 2021 14:45:59 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 14:51:16 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 2/4] hwmon: Add Aspeed AST2600 support
Date: Mon, 18 Jan 2021 06:50:50 +0000
Message-ID: <20210118065059.2478078-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10I6jxbE030933
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
Cc: leetroy@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Updating index.rst and adding aspeed2600-pwm-tachometer.rst to address
the driver.

Changes since v1:
 - rename to aspeed2600-pwm-tachometer.rst
 - add license identifier

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 .../hwmon/aspeed2600-pwm-tachometer.rst       | 27 +++++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/hwmon/aspeed2600-pwm-tachometer.rst

diff --git a/Documentation/hwmon/aspeed2600-pwm-tachometer.rst b/Documentation/hwmon/aspeed2600-pwm-tachometer.rst
new file mode 100644
index 000000000000..cf0d31a19597
--- /dev/null
+++ b/Documentation/hwmon/aspeed2600-pwm-tachometer.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Kernel driver aspeed2600-pwm-tachometer
+===================================
+
+Supported chips:
+	ASPEED AST2600
+
+Authors:
+	Ryan Chen <ryan_chen@aspeedtech.com>
+
+Description:
+------------
+This driver implements support for ASPEED AST2600 PWM and Fan Tacho
+controller. The PWM controller supports upto 16 PWM outputs. The Fan tacho
+controller supports up to 16 tachometer inputs.
+
+The driver provides the following sensor accesses in sysfs:
+
+=============== ======= =====================================================
+fanX_input	ro	provide current fan rotation value in RPM as reported
+			by the fan to the device.
+
+pwmX		rw	get or set PWM fan control value. This is an integer
+			value between 0(off) and 255(full speed).
+=============== ======= =====================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fcb870ce6286..02020c282549 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -44,6 +44,7 @@ Hardware Monitoring Kernel Drivers
    asb100
    asc7621
    aspeed-pwm-tacho
+   aspeed2600-pwm-tachometer
    bcm54140
    bel-pfe
    bt1-pvt
-- 
2.25.1

