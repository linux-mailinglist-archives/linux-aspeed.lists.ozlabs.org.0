Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E3CB9FE
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 14:10:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l7ww2gvdzDqfJ
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Oct 2019 22:10:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l7wc0FLTzDqf5
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Oct 2019 22:09:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94C7nrJ148408
 for <linux-aspeed@lists.ozlabs.org>; Fri, 4 Oct 2019 08:09:46 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ve3y2vsfc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Oct 2019 08:09:46 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <clg@kaod.org>;
 Fri, 4 Oct 2019 13:09:44 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 13:09:39 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94C9cbv50528396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 12:09:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11B7911C04C;
 Fri,  4 Oct 2019 12:09:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7C0611C04A;
 Fri,  4 Oct 2019 12:09:37 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Oct 2019 12:09:37 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id D21952201B7;
 Fri,  4 Oct 2019 14:09:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 14/16] mtd: spi-nor: aspeed: Introduce training operations per
 platform
Date: Fri,  4 Oct 2019 14:09:32 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100412-0020-0000-0000-00000374FF71
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100412-0021-0000-0000-000021CB0E95
Message-Id: <20191004120934.21662-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=646 adultscore=0 classifier=spam adjust=0 reason=mlx
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

The read timing compensation register records the read delay settings
for a range of HCLK. Its encoding is different on the AST2600 and the
read training will be slightly more complex.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index fad08738e534..85b7ff3bcc91 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -41,9 +41,13 @@ struct aspeed_smc_info {
 	u8 we0;			/* shift for write enable bit for CE0 */
 	u8 ctl0;		/* offset in regs of ctl for CE0 */
 	u8 timing;		/* offset in regs of timing */
+	u32 hdiv_max;           /* Max HCLK divisor on read timing reg */
 
 	void (*set_4b)(struct aspeed_smc_chip *chip);
 	int (*optimize_read)(struct aspeed_smc_chip *chip, u32 max_freq);
+	int (*calibrate)(struct aspeed_smc_chip *chip, u32 hdiv,
+			 const u8 *golden_buf, u8 *test_buf);
+
 	u32 (*segment_start)(struct aspeed_smc_controller *controller, u32 reg);
 	u32 (*segment_end)(struct aspeed_smc_controller *controller, u32 reg);
 	u32 (*segment_reg)(struct aspeed_smc_controller *controller,
@@ -54,6 +58,8 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 				    u32 max_freq);
+static int aspeed_smc_calibrate_reads(struct aspeed_smc_chip *chip, u32 hdiv,
+				      const u8 *golden_buf, u8 *test_buf);
 
 static u32 aspeed_smc_segment_start(struct aspeed_smc_controller *controller,
 				    u32 reg);
@@ -69,8 +75,10 @@ static const struct aspeed_smc_info fmc_2400_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -83,8 +91,10 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.we0 = 0,
 	.ctl0 = 0x04,
 	.timing = 0x14,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	/* No segment registers */
 };
 
@@ -95,8 +105,10 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -109,8 +121,10 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.we0 = 16,
 	.ctl0 = 0x10,
 	.timing = 0x94,
+	.hdiv_max = 1,
 	.set_4b = aspeed_smc_chip_set_4b,
 	.optimize_read = aspeed_smc_optimize_read,
+	.calibrate = aspeed_smc_calibrate_reads,
 	.segment_start = aspeed_smc_segment_start,
 	.segment_end = aspeed_smc_segment_end,
 	.segment_reg = aspeed_smc_segment_reg,
@@ -1022,6 +1036,8 @@ static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 				    u32 max_freq)
 {
+	struct aspeed_smc_controller *controller = chip->controller;
+	const struct aspeed_smc_info *info = controller->info;
 	u8 *golden_buf, *test_buf;
 	int i, rc, best_div = -1;
 	u32 save_read_val = chip->ctl_val[smc_read];
@@ -1054,7 +1070,8 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	}
 
 	/* Now we iterate the HCLK dividers until we find our breaking point */
-	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
+	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs);
+	     i > info->hdiv_max - 1; i--) {
 		u32 tv, freq;
 
 		/* Compare timing to max */
@@ -1065,8 +1082,8 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 		/* Set the timing */
 		tv = chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
 		writel(tv, chip->ctl);
-		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
-		rc = aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
+		dev_dbg(chip->nor.dev, "Trying HCLK/%d [%08x] ...", i, tv);
+		rc = info->calibrate(chip, i, golden_buf, test_buf);
 		if (rc == 0)
 			best_div = i;
 	}
-- 
2.21.0

