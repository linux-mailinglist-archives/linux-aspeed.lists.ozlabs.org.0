Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7964B4675
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 10:43:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxzmy4xTsz3cFf
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 20:43:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzmm0tz0z30RR
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Feb 2022 20:43:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8UM9r022252; 
 Mon, 14 Feb 2022 09:42:45 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt10krx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9aDv8025445;
 Mon, 14 Feb 2022 09:42:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3e64h92qwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9gee032047572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D43AE053;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49CD8AE051;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D05AE2201E5;
 Mon, 14 Feb 2022 10:42:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Date: Mon, 14 Feb 2022 10:42:22 +0100
Message-Id: <20220214094231.3753686-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gX7JK45671uxdo1i3RwU_vYpKq31PP3t
X-Proofpoint-ORIG-GUID: gX7JK45671uxdo1i3RwU_vYpKq31PP3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=703
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1034 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

To prepare transition to the new Aspeed SMC SPI controller driver using
the spi-mem interface, change the kernel CONFIG option of the current
driver to reflect that the implementation uses the MTD SPI-NOR interface.
Once the new driver is sufficiently exposed, we should remove the old one=
.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/arm/configs/aspeed_g4_defconfig     | 2 +-
 arch/arm/configs/aspeed_g5_defconfig     | 2 +-
 arch/arm/configs/multi_v5_defconfig      | 2 +-
 arch/arm/configs/multi_v7_defconfig      | 2 +-
 drivers/mtd/spi-nor/controllers/Kconfig  | 2 +-
 drivers/mtd/spi-nor/controllers/Makefile | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspe=
ed_g4_defconfig
index b4a1b2ed1a17..964536444cd7 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -64,7 +64,7 @@ CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_PARTITIONED_MASTER=3Dy
 CONFIG_MTD_SPI_NOR=3Dy
 # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
-CONFIG_SPI_ASPEED_SMC=3Dy
+CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
 CONFIG_MTD_UBI=3Dy
 CONFIG_MTD_UBI_FASTMAP=3Dy
 CONFIG_MTD_UBI_BLOCK=3Dy
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
index ccc4240ee4b5..e809236ca88b 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -103,7 +103,7 @@ CONFIG_MTD_BLOCK=3Dy
 CONFIG_MTD_PARTITIONED_MASTER=3Dy
 CONFIG_MTD_SPI_NOR=3Dy
 # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
-CONFIG_SPI_ASPEED_SMC=3Dy
+CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
 CONFIG_MTD_UBI=3Dy
 CONFIG_MTD_UBI_FASTMAP=3Dy
 CONFIG_MTD_UBI_BLOCK=3Dy
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi=
_v5_defconfig
index 80a3ae02d759..49083ef05fb0 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -103,7 +103,7 @@ CONFIG_MTD_RAW_NAND=3Dy
 CONFIG_MTD_NAND_ATMEL=3Dy
 CONFIG_MTD_NAND_ORION=3Dy
 CONFIG_MTD_SPI_NOR=3Dy
-CONFIG_SPI_ASPEED_SMC=3Dy
+CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
 CONFIG_MTD_UBI=3Dy
 CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_ATMEL_SSC=3Dm
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi=
_v7_defconfig
index 33572998dbbe..fc1b69256b64 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -217,7 +217,7 @@ CONFIG_MTD_NAND_DAVINCI=3Dy
 CONFIG_MTD_NAND_STM32_FMC2=3Dy
 CONFIG_MTD_NAND_PL35X=3Dy
 CONFIG_MTD_SPI_NOR=3Dy
-CONFIG_SPI_ASPEED_SMC=3Dm
+CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dm
 CONFIG_MTD_UBI=3Dy
 CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_BLK_DEV_RAM=3Dy
diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-no=
r/controllers/Kconfig
index 5c0e0ec2e6d1..876a47042fec 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SPI_ASPEED_SMC
+config SPI_ASPEED_SMC_MTD_SPI_NOR
 	tristate "Aspeed flash controllers in SPI mode"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on HAS_IOMEM && OF
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-n=
or/controllers/Makefile
index e7abba491d98..1e28297fb1e8 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_SPI_ASPEED_SMC)	+=3D aspeed-smc.o
+obj-$(CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR)	+=3D aspeed-smc.o
 obj-$(CONFIG_SPI_HISI_SFC)	+=3D hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+=3D nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+=3D intel-spi.o
--=20
2.34.1

