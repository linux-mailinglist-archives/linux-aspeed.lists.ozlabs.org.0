Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2227A809
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 09:02:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0D3X5l18zDqPK
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Sep 2020 17:02:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0D3025pCzDqNk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Sep 2020 17:01:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 08S6fwmg009743;
 Mon, 28 Sep 2020 14:41:58 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Sep
 2020 15:01:13 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <bmc-sw@aspeedtech.com>
Subject: [PATCH 1/1] clk: aspeed: modify some default clks are critical
Date: Mon, 28 Sep 2020 15:01:08 +0800
Message-ID: <20200928070108.14040-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 08S6fwmg009743
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

In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2 are
default for Host SuperIO UART device, eSPI clk for Host eSPI bus access
eSPI slave channel, those clks can't be disable should keep default,
otherwise will affect Host side access SuperIO and SPI slave device.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/clk/clk-aspeed.c  | 8 ++++----
 drivers/clk/clk-ast2600.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 411ff5fb2c07..d348c4fd3f9f 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -54,15 +54,15 @@ static const struct aspeed_gate_data aspeed_gates[] = {
 	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	CLK_IS_CRITICAL }, /* DAC */
 	[ASPEED_CLK_GATE_REFCLK] =	{  6, -1, "refclk-gate",	"clkin", CLK_IS_CRITICAL },
 	[ASPEED_CLK_GATE_USBPORT2CLK] =	{  7,  3, "usb-port2-gate",	NULL,	0 }, /* USB2.0 Host port 2 */
-	[ASPEED_CLK_GATE_LCLK] =	{  8,  5, "lclk-gate",		NULL,	0 }, /* LPC */
+	[ASPEED_CLK_GATE_LCLK] =	{  8,  5, "lclk-gate",		NULL,	CLK_IS_CRITICAL }, /* LPC */
 	[ASPEED_CLK_GATE_USBUHCICLK] =	{  9, 15, "usb-uhci-gate",	NULL,	0 }, /* USB1.1 (requires port 2 enabled) */
 	[ASPEED_CLK_GATE_D1CLK] =	{ 10, 13, "d1clk-gate",		NULL,	0 }, /* GFX CRT */
 	[ASPEED_CLK_GATE_YCLK] =	{ 13,  4, "yclk-gate",		NULL,	0 }, /* HAC */
 	[ASPEED_CLK_GATE_USBPORT1CLK] = { 14, 14, "usb-port1-gate",	NULL,	0 }, /* USB2 hub/USB2 host port 1/USB1.1 dev */
-	[ASPEED_CLK_GATE_UART1CLK] =	{ 15, -1, "uart1clk-gate",	"uart",	0 }, /* UART1 */
-	[ASPEED_CLK_GATE_UART2CLK] =	{ 16, -1, "uart2clk-gate",	"uart",	0 }, /* UART2 */
+	[ASPEED_CLK_GATE_UART1CLK] =	{ 15, -1, "uart1clk-gate",	"uart",	CLK_IS_CRITICAL }, /* UART1 */
+	[ASPEED_CLK_GATE_UART2CLK] =	{ 16, -1, "uart2clk-gate",	"uart",	CLK_IS_CRITICAL }, /* UART2 */
 	[ASPEED_CLK_GATE_UART5CLK] =	{ 17, -1, "uart5clk-gate",	"uart",	0 }, /* UART5 */
-	[ASPEED_CLK_GATE_ESPICLK] =	{ 19, -1, "espiclk-gate",	NULL,	0 }, /* eSPI */
+	[ASPEED_CLK_GATE_ESPICLK] =	{ 19, -1, "espiclk-gate",	NULL,	CLK_IS_CRITICAL }, /* eSPI */
 	[ASPEED_CLK_GATE_MAC1CLK] =	{ 20, 11, "mac1clk-gate",	"mac",	0 }, /* MAC1 */
 	[ASPEED_CLK_GATE_MAC2CLK] =	{ 21, 12, "mac2clk-gate",	"mac",	0 }, /* MAC2 */
 	[ASPEED_CLK_GATE_RSACLK] =	{ 24, -1, "rsaclk-gate",	NULL,	0 }, /* RSA */
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index bbacaccad554..6802a2d5bbe2 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -86,8 +86,8 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	/* Reserved 26 */
 	[ASPEED_CLK_GATE_EMMCCLK]	= { 27, 16, "emmcclk-gate",	NULL,	 0 },	/* For card clk */
 	/* Reserved 28/29/30 */
-	[ASPEED_CLK_GATE_LCLK]		= { 32, 32, "lclk-gate",	NULL,	 0 }, /* LPC */
-	[ASPEED_CLK_GATE_ESPICLK]	= { 33, -1, "espiclk-gate",	NULL,	 0 }, /* eSPI */
+	[ASPEED_CLK_GATE_LCLK]		= { 32, 32, "lclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* LPC */
+	[ASPEED_CLK_GATE_ESPICLK]	= { 33, -1, "espiclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* eSPI */
 	[ASPEED_CLK_GATE_REF1CLK]	= { 34, -1, "ref1clk-gate",	"clkin", CLK_IS_CRITICAL },
 	/* Reserved 35 */
 	[ASPEED_CLK_GATE_SDCLK]		= { 36, 56, "sdclk-gate",	NULL,	 0 },	/* SDIO/SD */
@@ -102,8 +102,8 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_I3C5CLK]	= { 45,  45, "i3c5clk-gate",	NULL,	 0 },	/* I3C5 */
 	[ASPEED_CLK_GATE_I3C6CLK]	= { 46,  46, "i3c6clk-gate",	NULL,	 0 },	/* I3C6 */
 	[ASPEED_CLK_GATE_I3C7CLK]	= { 47,  47, "i3c7clk-gate",	NULL,	 0 },	/* I3C7 */
-	[ASPEED_CLK_GATE_UART1CLK]	= { 48,  -1, "uart1clk-gate",	"uart",	 0 },	/* UART1 */
-	[ASPEED_CLK_GATE_UART2CLK]	= { 49,  -1, "uart2clk-gate",	"uart",	 0 },	/* UART2 */
+	[ASPEED_CLK_GATE_UART1CLK]	= { 48,  -1, "uart1clk-gate",	"uart",	 CLK_IS_CRITICAL },	/* UART1 */
+	[ASPEED_CLK_GATE_UART2CLK]	= { 49,  -1, "uart2clk-gate",	"uart",	 CLK_IS_CRITICAL },	/* UART2 */
 	[ASPEED_CLK_GATE_UART3CLK]	= { 50,  -1, "uart3clk-gate",	"uart",  0 },	/* UART3 */
 	[ASPEED_CLK_GATE_UART4CLK]	= { 51,  -1, "uart4clk-gate",	"uart",	 0 },	/* UART4 */
 	[ASPEED_CLK_GATE_MAC3CLK]	= { 52,  52, "mac3clk-gate",	"mac34", 0 },	/* MAC3 */
-- 
2.17.1

