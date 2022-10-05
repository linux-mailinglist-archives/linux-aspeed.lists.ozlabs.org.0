Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9035F50E1
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Oct 2022 10:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj7BK0vV6z3bjZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Oct 2022 19:33:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj7BF0pSXz2xfv;
	Wed,  5 Oct 2022 19:33:07 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2958Ag4F056777;
	Wed, 5 Oct 2022 16:10:42 +0800 (GMT-8)
	(envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 Oct
 2022 16:32:20 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <chin-ting_kuo@aspeedtech.com>, <broonie@kernel.org>,
        <joel@jms.id.au>, <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
        <openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
        <steven_lee@aspeedtech.com>
Subject: [v2] spi: aspeed: Fix typo in mode_bits field for AST2600 platform
Date: Wed, 5 Oct 2022 16:32:09 +0800
Message-ID: <20221005083209.222272-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2958Ag4F056777
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Both quad SPI TX and RX modes can be supported on AST2600.
Correct typo in mode_bits field in both ast2600_fmc_data
and ast2600_spi_data structs.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index a334e89add86..33cefcf18392 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -1163,7 +1163,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 static const struct aspeed_spi_data ast2600_fmc_data = {
 	.max_cs	       = 3,
 	.hastype       = false,
-	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
@@ -1178,7 +1178,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 static const struct aspeed_spi_data ast2600_spi_data = {
 	.max_cs	       = 2,
 	.hastype       = false,
-	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
-- 
2.25.1

