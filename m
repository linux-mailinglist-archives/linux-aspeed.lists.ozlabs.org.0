Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274F4976E8
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 02:44:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jht8L3S8xz30QX
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 12:44:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jht8B4F88z2yQC
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jan 2022 12:44:39 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20O1acU0011857;
 Mon, 24 Jan 2022 09:36:38 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWei-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 Jan
 2022 09:43:53 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <sfr@canb.auug.org.au>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH next] docs/ABI: testing: aspeed-uart-routing: Escape asterisk
Date: Mon, 24 Jan 2022 09:43:51 +0800
Message-ID: <20220124014351.9121-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20O1acU0011857
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Escape asterisk symbols to fix the following warning:

"WARNING: Inline emphasis start-string without end-string"

Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
index b363827da437..910df0e5815a 100644
--- a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/\*/uart\*
 Date:		September 2021
 Contact:	Oskar Senft <osk@google.com>
 		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
@@ -9,7 +9,7 @@ Description:	Selects the RX source of the UARTx device.
 		depends on the selected file.
 
 		e.g.
-		cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+		cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
 		[io1] io2 io3 io4 uart2 uart3 uart4 io6
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
@@ -17,7 +17,7 @@ Description:	Selects the RX source of the UARTx device.
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
 
-What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/\*/io\*
 Date:		September 2021
 Contact:	Oskar Senft <osk@google.com>
 		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
-- 
2.25.1

