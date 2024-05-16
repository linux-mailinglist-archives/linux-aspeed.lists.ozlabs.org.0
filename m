Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB48C7C01
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:21:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AQjOSSQu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJLz5lj5z3fqC
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:21:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AQjOSSQu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJy6msNz3fnr;
	Fri, 17 May 2024 04:19:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAesx020807;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7rdXwcif5odw8BMvyEIyfx63iGwhjk1j2vHqrFPW0j8=;
 b=AQjOSSQuej4TMs/S1GS8nlBVYJX748XHLdqJS8iKj5mrgojAU+D3HHHiQVlVdMOB/gtB
 W/w7DL++7l6c/pTAXy87qcDxjzHAzO4LjGAOcIexOkSIVgbBKKPFm2yPcPoMYoGXJ3B2
 b1RAu+KNZWaYXq1ZgnV0ynySK7LfTks3cbWSprM2HyAm3nSX4nt/V0mKtOxHaFHG34kC
 sx6yQ3Fm/nk7c7jHF+JQuGDbq/y+MasofCpFYxalCDgj40yc+2YWEtOgV9JndJy1Xbis
 bbDt88qiJOVjEzhHtPfpAgriv7Dpbvecs1JHws31RR5Jz3AvuHDB5xjOik3qU2dfWzk6 ng== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5p6gg5n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHFiN3018766;
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJJw717892018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E65DB58069;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7A3158070;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 38/40] spi: fsi: Calculate clock divider from local bus frequency
Date: Thu, 16 May 2024 13:19:05 -0500
Message-Id: <20240516181907.3468796-39-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t6GYCQt_X6uhjL6KkshgjWQhVkW4aZkY
X-Proofpoint-ORIG-GUID: t6GYCQt_X6uhjL6KkshgjWQhVkW4aZkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=844 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, andrew@codeconstruct.com.au, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the new FSI device local bus clock to calculate the proper SPI
clock divider.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index fc9e33be1e0e7..e762690f1a390 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -40,6 +40,7 @@
 #define  SPI_FSI_CLOCK_CFG_SCK_RECV_DEL	 GENMASK_ULL(51, 44)
 #define   SPI_FSI_CLOCK_CFG_SCK_NO_DEL	  BIT_ULL(51)
 #define  SPI_FSI_CLOCK_CFG_SCK_DIV	 GENMASK_ULL(63, 52)
+#define  SPI_FSI_CLOCK_CFG_SCK_DIV_MIN	  0x4
 #define SPI_FSI_MMAP			0x4
 #define SPI_FSI_DATA_TX			0x5
 #define SPI_FSI_DATA_RX			0x6
@@ -70,6 +71,7 @@
 struct fsi2spi {
 	struct fsi_device *fsi; /* FSI2SPI CFAM engine device */
 	struct mutex lock; /* lock access to the device */
+	u32 lbus_freq;
 };
 
 struct fsi_spi {
@@ -359,7 +361,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 	return 0;
 }
 
-static int fsi_spi_transfer_init(struct fsi_spi *ctx)
+static int fsi_spi_transfer_init(struct fsi_spi *ctx, u32 clock_div)
 {
 	int loops = 0;
 	int rc;
@@ -370,7 +372,7 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 	u64 status = 0ULL;
 	u64 wanted_clock_cfg = SPI_FSI_CLOCK_CFG_ECC_DISABLE |
 		SPI_FSI_CLOCK_CFG_SCK_NO_DEL |
-		FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 19);
+		FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, clock_div);
 
 	end = jiffies + msecs_to_jiffies(SPI_FSI_TIMEOUT_MS);
 	do {
@@ -421,6 +423,24 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 	return rc;
 }
 
+static u32 fsi_spi_calculate_clock_div(struct fsi2spi *bridge, struct spi_device *dev,
+				       struct spi_transfer *transfer)
+{
+	u32 div = 19;
+
+	if (bridge->lbus_freq) {
+		u32 desired_speed_hz = transfer->speed_hz ?: dev->max_speed_hz;
+
+		div = DIV_ROUND_UP(bridge->lbus_freq, desired_speed_hz);
+		if (div < SPI_FSI_CLOCK_CFG_SCK_DIV_MIN)
+			div = SPI_FSI_CLOCK_CFG_SCK_DIV_MIN;
+
+		transfer->effective_speed_hz = bridge->lbus_freq / div;
+	}
+
+	return div;
+}
+
 static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 					struct spi_message *mesg)
 {
@@ -429,6 +449,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 	unsigned int len;
 	struct spi_transfer *transfer;
 	struct fsi_spi *ctx = spi_controller_get_devdata(ctlr);
+	u32 div;
 
 	rc = fsi_spi_check_mux(ctx->bridge->fsi, ctx->dev);
 	if (rc)
@@ -446,7 +467,8 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 		dev_dbg(ctx->dev, "Start tx of %d bytes.\n", transfer->len);
 
-		rc = fsi_spi_transfer_init(ctx);
+		div = fsi_spi_calculate_clock_div(ctx->bridge, mesg->spi, transfer);
+		rc = fsi_spi_transfer_init(ctx, div);
 		if (rc < 0)
 			goto error;
 
@@ -533,6 +555,7 @@ static int fsi_spi_probe(struct device *dev)
 
 	bridge->fsi = fsi;
 	mutex_init(&bridge->lock);
+	bridge->lbus_freq = fsi_device_local_bus_frequency(fsi);
 
 	for_each_available_child_of_node(dev->of_node, np) {
 		u32 base;
@@ -550,6 +573,10 @@ static int fsi_spi_probe(struct device *dev)
 
 		ctlr->dev.of_node = np;
 		ctlr->num_chipselect = of_get_available_child_count(np) ?: 1;
+		if (bridge->lbus_freq) {
+			ctlr->min_speed_hz = DIV_ROUND_UP(bridge->lbus_freq, 0xfff);
+			ctlr->max_speed_hz = bridge->lbus_freq / SPI_FSI_CLOCK_CFG_SCK_DIV_MIN;
+		}
 		ctlr->flags = SPI_CONTROLLER_HALF_DUPLEX;
 		ctlr->max_transfer_size = fsi_spi_max_transfer_size;
 		ctlr->transfer_one_message = fsi_spi_transfer_one_message;
-- 
2.39.3

