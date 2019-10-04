Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38BCB9FD
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:10:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l7wp4t2mzDqdk
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:10:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l7wb1ktDzDqf2
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:09:50 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94C7MsQ025499
 for <linux-aspeed@lists.ozlabs.org>; Fri, 4 Oct 2019 08:09:48 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ve3uencsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Oct 2019 08:09:48 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <clg@kaod.org>;
 Fri, 4 Oct 2019 13:09:45 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 13:09:41 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94C9eiU45219928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 12:09:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 178DA4C050;
 Fri,  4 Oct 2019 12:09:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECF744C04A;
 Fri,  4 Oct 2019 12:09:39 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Oct 2019 12:09:39 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id DFC722201B7;
 Fri,  4 Oct 2019 14:09:38 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 16/16] mtd: spi-nor: aspeed: Add read training support for the
 AST2600
Date: Fri,  4 Oct 2019 14:09:34 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004120934.21662-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004120934.21662-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100412-0012-0000-0000-000003540265
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100412-0013-0000-0000-0000218F0D3B
Message-Id: <20191004120934.21662-3-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040113
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The read training algorithm consists of finding the appropriate read
timing delays for the HCLK dividers in range [ 2 - 5 ] and store the
results in the Read Timing Compensation register. The previous AST2500
and AST2400 SoCs were covering a broader HCLK range [ 1 - 5 ] because
the AHB frequency was lower.

The algorithm first reads a golden buffer at low speed and then
performs reads with different clocks and delay cycle settings to find
a breaking point. This selects the default clock frequency for the CEx
control register. The current settings are bit optimistic as we pick
the first delay giving good results. A safer approach would be to
determine an interval and choose the middle value. We might change the
approach depending on the results on other systems.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 72 ++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 5fa9956d183e..1176ad0c4fe5 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -141,6 +141,9 @@ static u32 aspeed_smc_segment_end_ast2600(struct aspeed_smc_controller *ctrl,
 					  u32 reg);
 static u32 aspeed_smc_segment_reg_ast2600(struct aspeed_smc_controller *ctrl,
 					  u32 start, u32 end);
+static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip,
+					      u32 hdiv, const u8 *golden_buf,
+					      u8 *test_buf);
 
 static const struct aspeed_smc_info fmc_2600_info = {
 	.maxsize = 256 * 1024 * 1024,
@@ -149,7 +152,11 @@ static const struct aspeed_smc_info fmc_2600_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xf0fff0ff,
+	.hdiv_max = 2,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads_ast2600,
 	.segment_start = aspeed_smc_segment_start_ast2600,
 	.segment_end = aspeed_smc_segment_end_ast2600,
 	.segment_reg = aspeed_smc_segment_reg_ast2600,
@@ -162,7 +169,11 @@ static const struct aspeed_smc_info spi_2600_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hclk_mask = 0xf0fff0ff,
+	.hdiv_max = 2,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads_ast2600,
 	.segment_start = aspeed_smc_segment_start_ast2600,
 	.segment_end = aspeed_smc_segment_end_ast2600,
 	.segment_reg = aspeed_smc_segment_reg_ast2600,
@@ -1107,6 +1118,67 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	return 0;
 }
 
+#define TIMING_DELAY_DI         BIT(3)
+#define TIMING_DELAY_HCYCLE_MAX     5
+#define TIMING_REG_AST2600(chip)					\
+	((chip)->controller->regs + (chip)->controller->info->timing +	\
+	 (chip)->cs * 4)
+
+static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip,
+					      u32 hdiv, const u8 *golden_buf,
+					      u8 *test_buf)
+{
+	int hcycle;
+	u32 shift = (hdiv - 2) << 3;
+	u32 mask = ~(0xfu << shift);
+	u32 fread_timing_val = 0;
+
+	for (hcycle = 0; hcycle <= TIMING_DELAY_HCYCLE_MAX; hcycle++) {
+		int delay_ns;
+		bool pass = false;
+
+		fread_timing_val &= mask;
+		fread_timing_val |= hcycle << shift;
+
+		/* no DI input delay first  */
+		writel(fread_timing_val, TIMING_REG_AST2600(chip));
+		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
+		dev_dbg(chip->nor.dev,
+			"  * [%08x] %d HCLK delay, DI delay none : %s",
+			fread_timing_val, hcycle, pass ? "PASS" : "FAIL");
+		if (pass)
+			return 0;
+
+		/* Add DI input delays  */
+		fread_timing_val &= mask;
+		fread_timing_val |= (TIMING_DELAY_DI | hcycle) << shift;
+
+		for (delay_ns = 0; delay_ns < 0x10; delay_ns++) {
+			fread_timing_val &= ~(0xf << (4 + shift));
+			fread_timing_val |= delay_ns << (4 + shift);
+
+			writel(fread_timing_val, TIMING_REG_AST2600(chip));
+			pass = aspeed_smc_check_reads(chip, golden_buf,
+						      test_buf);
+			dev_dbg(chip->nor.dev,
+				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
+				fread_timing_val, hcycle, (delay_ns + 1) / 2,
+				(delay_ns + 1) & 1 ? 5 : 5,
+				pass ? "PASS" : "FAIL");
+			/*
+			 * TODO: This is optimistic. We should look
+			 * for a working interval and save the middle
+			 * value in the read timing register.
+			 */
+			if (pass)
+				return 0;
+		}
+	}
+
+	/* No good setting for this frequency */
+	return -1;
+}
+
 static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
-- 
2.21.0

