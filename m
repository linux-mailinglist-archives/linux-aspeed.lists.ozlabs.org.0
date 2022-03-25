Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F17B4E72A1
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0yr0N86z30Gx
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:00:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPyWH1Lsvz30D6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 21:09:47 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P75K9a016713; 
 Fri, 25 Mar 2022 10:09:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0t9e4w5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P9sUJc022874;
 Fri, 25 Mar 2022 10:09:05 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0t9e4w48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:04 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9xIMC023167;
 Fri, 25 Mar 2022 10:09:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9k122-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA8xQF43516232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:08:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1934452054;
 Fri, 25 Mar 2022 10:08:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 5E7025204E;
 Fri, 25 Mar 2022 10:08:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9A5BC220158;
 Fri, 25 Mar 2022 11:08:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v4 03/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
Date: Fri, 25 Mar 2022 11:08:41 +0100
Message-Id: <20220325100849.2019209-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wclFZfTC9pGbfbWpTw5o7IHAFVX7GsKD
X-Proofpoint-ORIG-GUID: 7k5ulIWVsp-ZC7JvsWpt-LBWWZIAuyHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1034 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
X-Mailman-Approved-At: Fri, 25 Mar 2022 23:00:04 +1100
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

This SPI driver adds support for the Aspeed static memory controllers
of the AST2600, AST2500 and AST2400 SoCs using the spi-mem interface.

 * AST2600 Firmware SPI Memory Controller (FMC)
   . BMC firmware
   . 3 chip select pins (CE0 ~ CE2)
   . Only supports SPI type flash memory
   . different segment register interface
   . single, dual and quad mode.

 * AST2600 SPI Flash Controller (SPI1 and SPI2)
   . host firmware
   . 2 chip select pins (CE0 ~ CE1)
   . different segment register interface
   . single, dual and quad mode.

 * AST2500 Firmware SPI Memory Controller (FMC)
   . BMC firmware
   . 3 chip select pins (CE0 ~ CE2)
   . supports SPI type flash memory (CE0-CE1)
   . CE2 can be of NOR type flash but this is not supported by the driver
   . single, dual mode.

 * AST2500 SPI Flash Controller (SPI1 and SPI2)
   . host firmware
   . 2 chip select pins (CE0 ~ CE1)
   . single, dual mode.

 * AST2400 New Static Memory Controller (also referred as FMC)
   . BMC firmware
   . New register set
   . 5 chip select pins (CE0 =E2=88=BC CE4)
   . supports NOR flash, NAND flash and SPI flash memory.
   . single, dual and quad mode.

Each controller has a memory range on which flash devices contents are
mapped. Each device is assigned a window that can be changed at bootime
with the Segment Address Registers.

Each SPI flash device can then be accessed in two modes: Command and
User. When in User mode, SPI transfers are initiated with accesses to
the memory segment of a device. When in Command mode, memory
operations on the memory segment of a device generate SPI commands
automatically using a Control Register for the settings.

This initial patch adds support for User mode. Command mode needs a littl=
e
more work to check that the memory window on the AHB bus fits the device
size. It will come later when support for direct mapping is added.

Single and dual mode RX transfers are supported. Other types than SPI
are not supported.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tao Ren <rentao.bupt@gmail.com>
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c  | 910 ------------------
 drivers/spi/spi-aspeed-smc.c                  | 709 ++++++++++++++
 .../devicetree/bindings/mtd/aspeed-smc.txt    |  51 -
 MAINTAINERS                                   |   1 +
 drivers/mtd/spi-nor/controllers/Kconfig       |  10 -
 drivers/mtd/spi-nor/controllers/Makefile      |   1 -
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 8 files changed, 722 insertions(+), 972 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/controllers/aspeed-smc.c
 create mode 100644 drivers/spi/spi-aspeed-smc.c
 delete mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/s=
pi-nor/controllers/aspeed-smc.c
deleted file mode 100644
index 7225870e8b18..000000000000
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ /dev/null
@@ -1,910 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * ASPEED Static Memory Controller driver
- *
- * Copyright (c) 2015-2016, IBM Corporation.
- */
-
-#include <linux/bug.h>
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/spi-nor.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/sizes.h>
-#include <linux/sysfs.h>
-
-#define DEVICE_NAME	"aspeed-smc"
-
-/*
- * The driver only support SPI flash
- */
-enum aspeed_smc_flash_type {
-	smc_type_nor  =3D 0,
-	smc_type_nand =3D 1,
-	smc_type_spi  =3D 2,
-};
-
-struct aspeed_smc_chip;
-
-struct aspeed_smc_info {
-	u32 maxsize;		/* maximum size of chip window */
-	u8 nce;			/* number of chip enables */
-	bool hastype;		/* flash type field exists in config reg */
-	u8 we0;			/* shift for write enable bit for CE0 */
-	u8 ctl0;		/* offset in regs of ctl for CE0 */
-
-	void (*set_4b)(struct aspeed_smc_chip *chip);
-};
-
-static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip=
);
-static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
-
-static const struct aspeed_smc_info fmc_2400_info =3D {
-	.maxsize =3D 64 * 1024 * 1024,
-	.nce =3D 5,
-	.hastype =3D true,
-	.we0 =3D 16,
-	.ctl0 =3D 0x10,
-	.set_4b =3D aspeed_smc_chip_set_4b,
-};
-
-static const struct aspeed_smc_info spi_2400_info =3D {
-	.maxsize =3D 64 * 1024 * 1024,
-	.nce =3D 1,
-	.hastype =3D false,
-	.we0 =3D 0,
-	.ctl0 =3D 0x04,
-	.set_4b =3D aspeed_smc_chip_set_4b_spi_2400,
-};
-
-static const struct aspeed_smc_info fmc_2500_info =3D {
-	.maxsize =3D 256 * 1024 * 1024,
-	.nce =3D 3,
-	.hastype =3D true,
-	.we0 =3D 16,
-	.ctl0 =3D 0x10,
-	.set_4b =3D aspeed_smc_chip_set_4b,
-};
-
-static const struct aspeed_smc_info spi_2500_info =3D {
-	.maxsize =3D 128 * 1024 * 1024,
-	.nce =3D 2,
-	.hastype =3D false,
-	.we0 =3D 16,
-	.ctl0 =3D 0x10,
-	.set_4b =3D aspeed_smc_chip_set_4b,
-};
-
-enum aspeed_smc_ctl_reg_value {
-	smc_base,		/* base value without mode for other commands */
-	smc_read,		/* command reg for (maybe fast) reads */
-	smc_write,		/* command reg for writes */
-	smc_max,
-};
-
-struct aspeed_smc_controller;
-
-struct aspeed_smc_chip {
-	int cs;
-	struct aspeed_smc_controller *controller;
-	void __iomem *ctl;			/* control register */
-	void __iomem *ahb_base;			/* base of chip window */
-	u32 ahb_window_size;			/* chip mapping window size */
-	u32 ctl_val[smc_max];			/* control settings */
-	enum aspeed_smc_flash_type type;	/* what type of flash */
-	struct spi_nor nor;
-};
-
-struct aspeed_smc_controller {
-	struct device *dev;
-
-	struct mutex mutex;			/* controller access mutex */
-	const struct aspeed_smc_info *info;	/* type info of controller */
-	void __iomem *regs;			/* controller registers */
-	void __iomem *ahb_base;			/* per-chip windows resource */
-	u32 ahb_window_size;			/* full mapping window size */
-
-	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
-};
-
-/*
- * SPI Flash Configuration Register (AST2500 SPI)
- *     or
- * Type setting Register (AST2500 FMC).
- * CE0 and CE1 can only be of type SPI. CE2 can be of type NOR but the
- * driver does not support it.
- */
-#define CONFIG_REG			0x0
-#define CONFIG_DISABLE_LEGACY		BIT(31) /* 1 */
-
-#define CONFIG_CE2_WRITE		BIT(18)
-#define CONFIG_CE1_WRITE		BIT(17)
-#define CONFIG_CE0_WRITE		BIT(16)
-
-#define CONFIG_CE2_TYPE			BIT(4) /* AST2500 FMC only */
-#define CONFIG_CE1_TYPE			BIT(2) /* AST2500 FMC only */
-#define CONFIG_CE0_TYPE			BIT(0) /* AST2500 FMC only */
-
-/*
- * CE Control Register
- */
-#define CE_CONTROL_REG			0x4
-
-/*
- * CEx Control Register
- */
-#define CONTROL_AAF_MODE		BIT(31)
-#define CONTROL_IO_MODE_MASK		GENMASK(30, 28)
-#define CONTROL_IO_DUAL_DATA		BIT(29)
-#define CONTROL_IO_DUAL_ADDR_DATA	(BIT(29) | BIT(28))
-#define CONTROL_IO_QUAD_DATA		BIT(30)
-#define CONTROL_IO_QUAD_ADDR_DATA	(BIT(30) | BIT(28))
-#define CONTROL_CE_INACTIVE_SHIFT	24
-#define CONTROL_CE_INACTIVE_MASK	GENMASK(27, \
-					CONTROL_CE_INACTIVE_SHIFT)
-/* 0 =3D 16T ... 15 =3D 1T   T=3DHCLK */
-#define CONTROL_COMMAND_SHIFT		16
-#define CONTROL_DUMMY_COMMAND_OUT	BIT(15)
-#define CONTROL_IO_DUMMY_HI		BIT(14)
-#define CONTROL_IO_DUMMY_HI_SHIFT	14
-#define CONTROL_CLK_DIV4		BIT(13) /* others */
-#define CONTROL_IO_ADDRESS_4B		BIT(13) /* AST2400 SPI */
-#define CONTROL_RW_MERGE		BIT(12)
-#define CONTROL_IO_DUMMY_LO_SHIFT	6
-#define CONTROL_IO_DUMMY_LO		GENMASK(7, \
-						CONTROL_IO_DUMMY_LO_SHIFT)
-#define CONTROL_IO_DUMMY_MASK		(CONTROL_IO_DUMMY_HI | \
-					 CONTROL_IO_DUMMY_LO)
-#define CONTROL_IO_DUMMY_SET(dummy)				 \
-	(((((dummy) >> 2) & 0x1) << CONTROL_IO_DUMMY_HI_SHIFT) | \
-	 (((dummy) & 0x3) << CONTROL_IO_DUMMY_LO_SHIFT))
-
-#define CONTROL_CLOCK_FREQ_SEL_SHIFT	8
-#define CONTROL_CLOCK_FREQ_SEL_MASK	GENMASK(11, \
-						CONTROL_CLOCK_FREQ_SEL_SHIFT)
-#define CONTROL_LSB_FIRST		BIT(5)
-#define CONTROL_CLOCK_MODE_3		BIT(4)
-#define CONTROL_IN_DUAL_DATA		BIT(3)
-#define CONTROL_CE_STOP_ACTIVE_CONTROL	BIT(2)
-#define CONTROL_COMMAND_MODE_MASK	GENMASK(1, 0)
-#define CONTROL_COMMAND_MODE_NORMAL	0
-#define CONTROL_COMMAND_MODE_FREAD	1
-#define CONTROL_COMMAND_MODE_WRITE	2
-#define CONTROL_COMMAND_MODE_USER	3
-
-#define CONTROL_KEEP_MASK						\
-	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
-	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3=
)
-
-/*
- * The Segment Register uses a 8MB unit to encode the start address
- * and the end address of the mapping window of a flash SPI slave :
- *
- *        | byte 1 | byte 2 | byte 3 | byte 4 |
- *        +--------+--------+--------+--------+
- *        |  end   |  start |   0    |   0    |
- */
-#define SEGMENT_ADDR_REG0		0x30
-#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
-#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
-#define SEGMENT_ADDR_VALUE(start, end)					\
-	(((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
-#define SEGMENT_ADDR_REG(controller, cs)	\
-	((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
-
-/*
- * In user mode all data bytes read or written to the chip decode addres=
s
- * range are transferred to or from the SPI bus. The range is treated as=
 a
- * fifo of arbitratry 1, 2, or 4 byte width but each write has to be ali=
gned
- * to its size. The address within the multiple 8kB range is ignored whe=
n
- * sending bytes to the SPI bus.
- *
- * On the arm architecture, as of Linux version 4.3, memcpy_fromio and
- * memcpy_toio on little endian targets use the optimized memcpy routine=
s
- * that were designed for well behavied memory storage. These routines
- * have a stutter if the source and destination are not both word aligne=
d,
- * once with a duplicate access to the source after aligning to the
- * destination to a word boundary, and again with a duplicate access to
- * the source when the final byte count is not word aligned.
- *
- * When writing or reading the fifo this stutter discards data or sends
- * too much data to the fifo and can not be used by this driver.
- *
- * While the low level io string routines that implement the insl family=
 do
- * the desired accesses and memory increments, the cross architecture io
- * macros make them essentially impossible to use on a memory mapped add=
ress
- * instead of a a token from the call to iomap of an io port.
- *
- * These fifo routines use readl and friends to a constant io port and u=
pdate
- * the memory buffer pointer and count via explicit code. The final upda=
tes
- * to len are optimistically suppressed.
- */
-static int aspeed_smc_read_from_ahb(void *buf, void __iomem *src, size_t=
 len)
-{
-	size_t offset =3D 0;
-
-	if (IS_ALIGNED((uintptr_t)src, sizeof(uintptr_t)) &&
-	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t))) {
-		ioread32_rep(src, buf, len >> 2);
-		offset =3D len & ~0x3;
-		len -=3D offset;
-	}
-	ioread8_rep(src, (u8 *)buf + offset, len);
-	return 0;
-}
-
-static int aspeed_smc_write_to_ahb(void __iomem *dst, const void *buf,
-				   size_t len)
-{
-	size_t offset =3D 0;
-
-	if (IS_ALIGNED((uintptr_t)dst, sizeof(uintptr_t)) &&
-	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t))) {
-		iowrite32_rep(dst, buf, len >> 2);
-		offset =3D len & ~0x3;
-		len -=3D offset;
-	}
-	iowrite8_rep(dst, (const u8 *)buf + offset, len);
-	return 0;
-}
-
-static inline u32 aspeed_smc_chip_write_bit(struct aspeed_smc_chip *chip=
)
-{
-	return BIT(chip->controller->info->we0 + chip->cs);
-}
-
-static void aspeed_smc_chip_check_config(struct aspeed_smc_chip *chip)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 reg;
-
-	reg =3D readl(controller->regs + CONFIG_REG);
-
-	if (reg & aspeed_smc_chip_write_bit(chip))
-		return;
-
-	dev_dbg(controller->dev, "config write is not set ! @%p: 0x%08x\n",
-		controller->regs + CONFIG_REG, reg);
-	reg |=3D aspeed_smc_chip_write_bit(chip);
-	writel(reg, controller->regs + CONFIG_REG);
-}
-
-static void aspeed_smc_start_user(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-	u32 ctl =3D chip->ctl_val[smc_base];
-
-	/*
-	 * When the chip is controlled in user mode, we need write
-	 * access to send the opcodes to it. So check the config.
-	 */
-	aspeed_smc_chip_check_config(chip);
-
-	ctl |=3D CONTROL_COMMAND_MODE_USER |
-		CONTROL_CE_STOP_ACTIVE_CONTROL;
-	writel(ctl, chip->ctl);
-
-	ctl &=3D ~CONTROL_CE_STOP_ACTIVE_CONTROL;
-	writel(ctl, chip->ctl);
-}
-
-static void aspeed_smc_stop_user(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	u32 ctl =3D chip->ctl_val[smc_read];
-	u32 ctl2 =3D ctl | CONTROL_COMMAND_MODE_USER |
-		CONTROL_CE_STOP_ACTIVE_CONTROL;
-
-	writel(ctl2, chip->ctl);	/* stop user CE control */
-	writel(ctl, chip->ctl);		/* default to fread or read mode */
-}
-
-static int aspeed_smc_prep(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	mutex_lock(&chip->controller->mutex);
-	return 0;
-}
-
-static void aspeed_smc_unprep(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	mutex_unlock(&chip->controller->mutex);
-}
-
-static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
-			       size_t len)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_write_to_ahb(chip->ahb_base, &opcode, 1);
-	aspeed_smc_read_from_ahb(buf, chip->ahb_base, len);
-	aspeed_smc_stop_user(nor);
-	return 0;
-}
-
-static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, const u8=
 *buf,
-				size_t len)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_write_to_ahb(chip->ahb_base, &opcode, 1);
-	aspeed_smc_write_to_ahb(chip->ahb_base, buf, len);
-	aspeed_smc_stop_user(nor);
-	return 0;
-}
-
-static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 ad=
dr)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-	__be32 temp;
-	u32 cmdaddr;
-
-	switch (nor->addr_width) {
-	default:
-		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
-			  nor->addr_width);
-		fallthrough;
-	case 3:
-		cmdaddr =3D addr & 0xFFFFFF;
-		cmdaddr |=3D cmd << 24;
-
-		temp =3D cpu_to_be32(cmdaddr);
-		aspeed_smc_write_to_ahb(chip->ahb_base, &temp, 4);
-		break;
-	case 4:
-		temp =3D cpu_to_be32(addr);
-		aspeed_smc_write_to_ahb(chip->ahb_base, &cmd, 1);
-		aspeed_smc_write_to_ahb(chip->ahb_base, &temp, 4);
-		break;
-	}
-}
-
-static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
-				    size_t len, u_char *read_buf)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-	int i;
-	u8 dummy =3D 0xFF;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
-	for (i =3D 0; i < chip->nor.read_dummy / 8; i++)
-		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
-
-	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
-	aspeed_smc_stop_user(nor);
-	return len;
-}
-
-static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
-				     size_t len, const u_char *write_buf)
-{
-	struct aspeed_smc_chip *chip =3D nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
-	aspeed_smc_write_to_ahb(chip->ahb_base, write_buf, len);
-	aspeed_smc_stop_user(nor);
-	return len;
-}
-
-static int aspeed_smc_unregister(struct aspeed_smc_controller *controlle=
r)
-{
-	struct aspeed_smc_chip *chip;
-	int n;
-
-	for (n =3D 0; n < controller->info->nce; n++) {
-		chip =3D controller->chips[n];
-		if (chip)
-			mtd_device_unregister(&chip->nor.mtd);
-	}
-
-	return 0;
-}
-
-static int aspeed_smc_remove(struct platform_device *dev)
-{
-	return aspeed_smc_unregister(platform_get_drvdata(dev));
-}
-
-static const struct of_device_id aspeed_smc_matches[] =3D {
-	{ .compatible =3D "aspeed,ast2400-fmc", .data =3D &fmc_2400_info },
-	{ .compatible =3D "aspeed,ast2400-spi", .data =3D &spi_2400_info },
-	{ .compatible =3D "aspeed,ast2500-fmc", .data =3D &fmc_2500_info },
-	{ .compatible =3D "aspeed,ast2500-spi", .data =3D &spi_2500_info },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
-
-/*
- * Each chip has a mapping window defined by a segment address
- * register defining a start and an end address on the AHB bus. These
- * addresses can be configured to fit the chip size and offer a
- * contiguous memory region across chips. For the moment, we only
- * check that each chip segment is valid.
- */
-static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
-					  struct resource *res)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 offset =3D 0;
-	u32 reg;
-
-	if (controller->info->nce > 1) {
-		reg =3D readl(SEGMENT_ADDR_REG(controller, chip->cs));
-
-		if (SEGMENT_ADDR_START(reg) >=3D SEGMENT_ADDR_END(reg))
-			return NULL;
-
-		offset =3D SEGMENT_ADDR_START(reg) - res->start;
-	}
-
-	return controller->ahb_base + offset;
-}
-
-static u32 aspeed_smc_ahb_base_phy(struct aspeed_smc_controller *control=
ler)
-{
-	u32 seg0_val =3D readl(SEGMENT_ADDR_REG(controller, 0));
-
-	return SEGMENT_ADDR_START(seg0_val);
-}
-
-static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 st=
art,
-			    u32 size)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	void __iomem *seg_reg;
-	u32 seg_oldval, seg_newval, ahb_base_phy, end;
-
-	ahb_base_phy =3D aspeed_smc_ahb_base_phy(controller);
-
-	seg_reg =3D SEGMENT_ADDR_REG(controller, cs);
-	seg_oldval =3D readl(seg_reg);
-
-	/*
-	 * If the chip size is not specified, use the default segment
-	 * size, but take into account the possible overlap with the
-	 * previous segment
-	 */
-	if (!size)
-		size =3D SEGMENT_ADDR_END(seg_oldval) - start;
-
-	/*
-	 * The segment cannot exceed the maximum window size of the
-	 * controller.
-	 */
-	if (start + size > ahb_base_phy + controller->ahb_window_size) {
-		size =3D ahb_base_phy + controller->ahb_window_size - start;
-		dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
-			 cs, size >> 20);
-	}
-
-	end =3D start + size;
-	seg_newval =3D SEGMENT_ADDR_VALUE(start, end);
-	writel(seg_newval, seg_reg);
-
-	/*
-	 * Restore default value if something goes wrong. The chip
-	 * might have set some bogus value and we would loose access
-	 * to the chip.
-	 */
-	if (seg_newval !=3D readl(seg_reg)) {
-		dev_err(chip->nor.dev, "CE%d window invalid", cs);
-		writel(seg_oldval, seg_reg);
-		start =3D SEGMENT_ADDR_START(seg_oldval);
-		end =3D SEGMENT_ADDR_END(seg_oldval);
-		size =3D end - start;
-	}
-
-	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
-		 cs, start, end, size >> 20);
-
-	return size;
-}
-
-/*
- * The segment register defines the mapping window on the AHB bus and
- * it needs to be configured depending on the chip size. The segment
- * register of the following CE also needs to be tuned in order to
- * provide a contiguous window across multiple chips.
- *
- * This is expected to be called in increasing CE order
- */
-static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 ahb_base_phy, start;
-	u32 size =3D chip->nor.mtd.size;
-
-	/*
-	 * Each controller has a chip size limit for direct memory
-	 * access
-	 */
-	if (size > controller->info->maxsize)
-		size =3D controller->info->maxsize;
-
-	/*
-	 * The AST2400 SPI controller only handles one chip and does
-	 * not have segment registers. Let's use the chip size for the
-	 * AHB window.
-	 */
-	if (controller->info =3D=3D &spi_2400_info)
-		goto out;
-
-	/*
-	 * The AST2500 SPI controller has a HW bug when the CE0 chip
-	 * size reaches 128MB. Enforce a size limit of 120MB to
-	 * prevent the controller from using bogus settings in the
-	 * segment register.
-	 */
-	if (chip->cs =3D=3D 0 && controller->info =3D=3D &spi_2500_info &&
-	    size =3D=3D SZ_128M) {
-		size =3D 120 << 20;
-		dev_info(chip->nor.dev,
-			 "CE%d window resized to %dMB (AST2500 HW quirk)",
-			 chip->cs, size >> 20);
-	}
-
-	ahb_base_phy =3D aspeed_smc_ahb_base_phy(controller);
-
-	/*
-	 * As a start address for the current segment, use the default
-	 * start address if we are handling CE0 or use the previous
-	 * segment ending address
-	 */
-	if (chip->cs) {
-		u32 prev =3D readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
-
-		start =3D SEGMENT_ADDR_END(prev);
-	} else {
-		start =3D ahb_base_phy;
-	}
-
-	size =3D chip_set_segment(chip, chip->cs, start, size);
-
-	/* Update chip base address on the AHB bus */
-	chip->ahb_base =3D controller->ahb_base + (start - ahb_base_phy);
-
-	/*
-	 * Now, make sure the next segment does not overlap with the
-	 * current one we just configured, even if there is no
-	 * available chip. That could break access in Command Mode.
-	 */
-	if (chip->cs < controller->info->nce - 1)
-		chip_set_segment(chip, chip->cs + 1, start + size, 0);
-
-out:
-	if (size < chip->nor.mtd.size)
-		dev_warn(chip->nor.dev,
-			 "CE%d window too small for chip %dMB",
-			 chip->cs, (u32)chip->nor.mtd.size >> 20);
-
-	return size;
-}
-
-static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 reg;
-
-	reg =3D readl(controller->regs + CONFIG_REG);
-
-	reg |=3D aspeed_smc_chip_write_bit(chip);
-	writel(reg, controller->regs + CONFIG_REG);
-}
-
-static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int t=
ype)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 reg;
-
-	chip->type =3D type;
-
-	reg =3D readl(controller->regs + CONFIG_REG);
-	reg &=3D ~(3 << (chip->cs * 2));
-	reg |=3D chip->type << (chip->cs * 2);
-	writel(reg, controller->regs + CONFIG_REG);
-}
-
-/*
- * The first chip of the AST2500 FMC flash controller is strapped by
- * hardware, or autodetected, but other chips need to be set. Enforce
- * the 4B setting for all chips.
- */
-static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	u32 reg;
-
-	reg =3D readl(controller->regs + CE_CONTROL_REG);
-	reg |=3D 1 << chip->cs;
-	writel(reg, controller->regs + CE_CONTROL_REG);
-}
-
-/*
- * The AST2400 SPI flash controller does not have a CE Control
- * register. It uses the CE0 control register to set 4Byte mode at the
- * controller level.
- */
-static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip=
)
-{
-	chip->ctl_val[smc_base] |=3D CONTROL_IO_ADDRESS_4B;
-	chip->ctl_val[smc_read] |=3D CONTROL_IO_ADDRESS_4B;
-}
-
-static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
-				      struct resource *res)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	const struct aspeed_smc_info *info =3D controller->info;
-	u32 reg, base_reg;
-
-	/*
-	 * Always turn on the write enable bit to allow opcodes to be
-	 * sent in user mode.
-	 */
-	aspeed_smc_chip_enable_write(chip);
-
-	/* The driver only supports SPI type flash */
-	if (info->hastype)
-		aspeed_smc_chip_set_type(chip, smc_type_spi);
-
-	/*
-	 * Configure chip base address in memory
-	 */
-	chip->ahb_base =3D aspeed_smc_chip_base(chip, res);
-	if (!chip->ahb_base) {
-		dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
-		return -EINVAL;
-	}
-
-	/*
-	 * Get value of the inherited control register. U-Boot usually
-	 * does some timing calibration on the FMC chip, so it's good
-	 * to keep them. In the future, we should handle calibration
-	 * from Linux.
-	 */
-	reg =3D readl(chip->ctl);
-	dev_dbg(controller->dev, "control register: %08x\n", reg);
-
-	base_reg =3D reg & CONTROL_KEEP_MASK;
-	if (base_reg !=3D reg) {
-		dev_dbg(controller->dev,
-			"control register changed to: %08x\n",
-			base_reg);
-	}
-	chip->ctl_val[smc_base] =3D base_reg;
-
-	/*
-	 * Retain the prior value of the control register as the
-	 * default if it was normal access mode. Otherwise start with
-	 * the sanitized base value set to read mode.
-	 */
-	if ((reg & CONTROL_COMMAND_MODE_MASK) =3D=3D
-	    CONTROL_COMMAND_MODE_NORMAL)
-		chip->ctl_val[smc_read] =3D reg;
-	else
-		chip->ctl_val[smc_read] =3D chip->ctl_val[smc_base] |
-			CONTROL_COMMAND_MODE_NORMAL;
-
-	dev_dbg(controller->dev, "default control register: %08x\n",
-		chip->ctl_val[smc_read]);
-	return 0;
-}
-
-static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
-{
-	struct aspeed_smc_controller *controller =3D chip->controller;
-	const struct aspeed_smc_info *info =3D controller->info;
-	u32 cmd;
-
-	if (chip->nor.addr_width =3D=3D 4 && info->set_4b)
-		info->set_4b(chip);
-
-	/* This is for direct AHB access when using Command Mode. */
-	chip->ahb_window_size =3D aspeed_smc_chip_set_segment(chip);
-
-	/*
-	 * base mode has not been optimized yet. use it for writes.
-	 */
-	chip->ctl_val[smc_write] =3D chip->ctl_val[smc_base] |
-		chip->nor.program_opcode << CONTROL_COMMAND_SHIFT |
-		CONTROL_COMMAND_MODE_WRITE;
-
-	dev_dbg(controller->dev, "write control register: %08x\n",
-		chip->ctl_val[smc_write]);
-
-	/*
-	 * TODO: Adjust clocks if fast read is supported and interpret
-	 * SPI NOR flags to adjust controller settings.
-	 */
-	if (chip->nor.read_proto =3D=3D SNOR_PROTO_1_1_1) {
-		if (chip->nor.read_dummy =3D=3D 0)
-			cmd =3D CONTROL_COMMAND_MODE_NORMAL;
-		else
-			cmd =3D CONTROL_COMMAND_MODE_FREAD;
-	} else {
-		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
-		return -EINVAL;
-	}
-
-	chip->ctl_val[smc_read] |=3D cmd |
-		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
-
-	dev_dbg(controller->dev, "base control register: %08x\n",
-		chip->ctl_val[smc_read]);
-	return 0;
-}
-
-static const struct spi_nor_controller_ops aspeed_smc_controller_ops =3D=
 {
-	.prepare =3D aspeed_smc_prep,
-	.unprepare =3D aspeed_smc_unprep,
-	.read_reg =3D aspeed_smc_read_reg,
-	.write_reg =3D aspeed_smc_write_reg,
-	.read =3D aspeed_smc_read_user,
-	.write =3D aspeed_smc_write_user,
-};
-
-static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controll=
er,
-				  struct device_node *np, struct resource *r)
-{
-	const struct spi_nor_hwcaps hwcaps =3D {
-		.mask =3D SNOR_HWCAPS_READ |
-			SNOR_HWCAPS_READ_FAST |
-			SNOR_HWCAPS_PP,
-	};
-	const struct aspeed_smc_info *info =3D controller->info;
-	struct device *dev =3D controller->dev;
-	struct device_node *child;
-	unsigned int cs;
-	int ret =3D -ENODEV;
-
-	for_each_available_child_of_node(np, child) {
-		struct aspeed_smc_chip *chip;
-		struct spi_nor *nor;
-		struct mtd_info *mtd;
-
-		/* This driver does not support NAND or NOR flash devices. */
-		if (!of_device_is_compatible(child, "jedec,spi-nor"))
-			continue;
-
-		ret =3D of_property_read_u32(child, "reg", &cs);
-		if (ret) {
-			dev_err(dev, "Couldn't not read chip select.\n");
-			break;
-		}
-
-		if (cs >=3D info->nce) {
-			dev_err(dev, "Chip select %d out of range.\n",
-				cs);
-			ret =3D -ERANGE;
-			break;
-		}
-
-		if (controller->chips[cs]) {
-			dev_err(dev, "Chip select %d already in use by %s\n",
-				cs, dev_name(controller->chips[cs]->nor.dev));
-			ret =3D -EBUSY;
-			break;
-		}
-
-		chip =3D devm_kzalloc(controller->dev, sizeof(*chip), GFP_KERNEL);
-		if (!chip) {
-			ret =3D -ENOMEM;
-			break;
-		}
-
-		chip->controller =3D controller;
-		chip->ctl =3D controller->regs + info->ctl0 + cs * 4;
-		chip->cs =3D cs;
-
-		nor =3D &chip->nor;
-		mtd =3D &nor->mtd;
-
-		nor->dev =3D dev;
-		nor->priv =3D chip;
-		spi_nor_set_flash_node(nor, child);
-		nor->controller_ops =3D &aspeed_smc_controller_ops;
-
-		ret =3D aspeed_smc_chip_setup_init(chip, r);
-		if (ret)
-			break;
-
-		/*
-		 * TODO: Add support for Dual and Quad SPI protocols
-		 * attach when board support is present as determined
-		 * by of property.
-		 */
-		ret =3D spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
-
-		ret =3D aspeed_smc_chip_setup_finish(chip);
-		if (ret)
-			break;
-
-		ret =3D mtd_device_register(mtd, NULL, 0);
-		if (ret)
-			break;
-
-		controller->chips[cs] =3D chip;
-	}
-
-	if (ret) {
-		of_node_put(child);
-		aspeed_smc_unregister(controller);
-	}
-
-	return ret;
-}
-
-static int aspeed_smc_probe(struct platform_device *pdev)
-{
-	struct device_node *np =3D pdev->dev.of_node;
-	struct device *dev =3D &pdev->dev;
-	struct aspeed_smc_controller *controller;
-	const struct of_device_id *match;
-	const struct aspeed_smc_info *info;
-	struct resource *res;
-	int ret;
-
-	match =3D of_match_device(aspeed_smc_matches, &pdev->dev);
-	if (!match || !match->data)
-		return -ENODEV;
-	info =3D match->data;
-
-	controller =3D devm_kzalloc(&pdev->dev,
-				  struct_size(controller, chips, info->nce),
-				  GFP_KERNEL);
-	if (!controller)
-		return -ENOMEM;
-	controller->info =3D info;
-	controller->dev =3D dev;
-
-	mutex_init(&controller->mutex);
-	platform_set_drvdata(pdev, controller);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	controller->regs =3D devm_ioremap_resource(dev, res);
-	if (IS_ERR(controller->regs))
-		return PTR_ERR(controller->regs);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	controller->ahb_base =3D devm_ioremap_resource(dev, res);
-	if (IS_ERR(controller->ahb_base))
-		return PTR_ERR(controller->ahb_base);
-
-	controller->ahb_window_size =3D resource_size(res);
-
-	ret =3D aspeed_smc_setup_flash(controller, np, res);
-	if (ret)
-		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
-
-	return ret;
-}
-
-static struct platform_driver aspeed_smc_driver =3D {
-	.probe =3D aspeed_smc_probe,
-	.remove =3D aspeed_smc_remove,
-	.driver =3D {
-		.name =3D DEVICE_NAME,
-		.of_match_table =3D aspeed_smc_matches,
-	}
-};
-
-module_platform_driver(aspeed_smc_driver);
-
-MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
-MODULE_AUTHOR("Cedric Le Goater <clg@kaod.org>");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
new file mode 100644
index 000000000000..997ec2e45118
--- /dev/null
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ASPEED FMC/SPI Memory Controller Driver
+ *
+ * Copyright (c) 2015-2022, IBM Corporation.
+ * Copyright (c) 2020, ASPEED Corporation.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+#define DEVICE_NAME "spi-aspeed-smc"
+
+/* Type setting Register */
+#define CONFIG_REG			0x0
+#define   CONFIG_TYPE_SPI		0x2
+
+/* CE Control Register */
+#define CE_CTRL_REG			0x4
+
+/* CEx Control Register */
+#define CE0_CTRL_REG			0x10
+#define   CTRL_IO_MODE_MASK		GENMASK(30, 28)
+#define   CTRL_IO_SINGLE_DATA	        0x0
+#define   CTRL_IO_DUAL_DATA		BIT(29)
+#define   CTRL_IO_QUAD_DATA		BIT(30)
+#define   CTRL_COMMAND_SHIFT		16
+#define   CTRL_IO_DUMMY_SET(dummy)					\
+	(((((dummy) >> 2) & 0x1) << 14) | (((dummy) & 0x3) << 6))
+#define   CTRL_CE_STOP_ACTIVE		BIT(2)
+#define   CTRL_IO_MODE_CMD_MASK		GENMASK(1, 0)
+#define   CTRL_IO_MODE_NORMAL		0x0
+#define   CTRL_IO_MODE_READ		0x1
+#define   CTRL_IO_MODE_WRITE		0x2
+#define   CTRL_IO_MODE_USER		0x3
+
+#define   CTRL_IO_CMD_MASK		0xf0ff40c3
+
+/* CEx Address Decoding Range Register */
+#define CE0_SEGMENT_ADDR_REG		0x30
+
+enum aspeed_spi_ctl_reg_value {
+	ASPEED_SPI_BASE,
+	ASPEED_SPI_READ,
+	ASPEED_SPI_WRITE,
+	ASPEED_SPI_MAX,
+};
+
+struct aspeed_spi;
+
+struct aspeed_spi_chip {
+	struct aspeed_spi	*aspi;
+	u32			 cs;
+	void __iomem		*ctl;
+	void __iomem		*ahb_base;
+	u32			 ahb_window_size;
+	u32			 ctl_val[ASPEED_SPI_MAX];
+	u32			 clk_freq;
+};
+
+struct aspeed_spi_data {
+	u32	ctl0;
+	u32	max_cs;
+	bool	hastype;
+	u32	mode_bits;
+	u32	we0;
+
+	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
+	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
+	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
+};
+
+#define ASPEED_SPI_MAX_NUM_CS	5
+
+struct aspeed_spi {
+	const struct aspeed_spi_data	*data;
+
+	void __iomem		*regs;
+	void __iomem		*ahb_base;
+	u32			 ahb_base_phy;
+	u32			 ahb_window_size;
+	struct device		*dev;
+
+	struct clk		*clk;
+	u32			 clk_freq;
+
+	struct aspeed_spi_chip	 chips[ASPEED_SPI_MAX_NUM_CS];
+};
+
+static u32 aspeed_spi_get_io_mode(const struct spi_mem_op *op)
+{
+	switch (op->data.buswidth) {
+	case 1:
+		return CTRL_IO_SINGLE_DATA;
+	case 2:
+		return CTRL_IO_DUAL_DATA;
+	case 4:
+		return CTRL_IO_QUAD_DATA;
+	default:
+		return CTRL_IO_SINGLE_DATA;
+	}
+}
+
+static void aspeed_spi_set_io_mode(struct aspeed_spi_chip *chip, u32 io_=
mode)
+{
+	u32 ctl;
+
+	if (io_mode > 0) {
+		ctl =3D readl(chip->ctl) & ~CTRL_IO_MODE_MASK;
+		ctl |=3D io_mode;
+		writel(ctl, chip->ctl);
+	}
+}
+
+static void aspeed_spi_start_user(struct aspeed_spi_chip *chip)
+{
+	u32 ctl =3D chip->ctl_val[ASPEED_SPI_BASE];
+
+	ctl |=3D CTRL_IO_MODE_USER | CTRL_CE_STOP_ACTIVE;
+	writel(ctl, chip->ctl);
+
+	ctl &=3D ~CTRL_CE_STOP_ACTIVE;
+	writel(ctl, chip->ctl);
+}
+
+static void aspeed_spi_stop_user(struct aspeed_spi_chip *chip)
+{
+	u32 ctl =3D chip->ctl_val[ASPEED_SPI_READ] |
+		CTRL_IO_MODE_USER | CTRL_CE_STOP_ACTIVE;
+
+	writel(ctl, chip->ctl);
+
+	/* Restore defaults */
+	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
+}
+
+static int aspeed_spi_read_from_ahb(void *buf, void __iomem *src, size_t=
 len)
+{
+	size_t offset =3D 0;
+
+	if (IS_ALIGNED((uintptr_t)src, sizeof(uintptr_t)) &&
+	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t))) {
+		ioread32_rep(src, buf, len >> 2);
+		offset =3D len & ~0x3;
+		len -=3D offset;
+	}
+	ioread8_rep(src, (u8 *)buf + offset, len);
+	return 0;
+}
+
+static int aspeed_spi_write_to_ahb(void __iomem *dst, const void *buf, s=
ize_t len)
+{
+	size_t offset =3D 0;
+
+	if (IS_ALIGNED((uintptr_t)dst, sizeof(uintptr_t)) &&
+	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t))) {
+		iowrite32_rep(dst, buf, len >> 2);
+		offset =3D len & ~0x3;
+		len -=3D offset;
+	}
+	iowrite8_rep(dst, (const u8 *)buf + offset, len);
+	return 0;
+}
+
+static void aspeed_spi_send_cmd_addr(struct aspeed_spi_chip *chip, u8 ad=
dr_nbytes,
+				     u64 offset, u32 opcode)
+{
+	struct aspeed_spi *aspi =3D chip->aspi;
+	__be32 temp;
+	u32 cmdaddr;
+
+	switch (addr_nbytes) {
+	default:
+		dev_warn_once(aspi->dev, "Unexpected address width %u, defaulting to 3=
",
+			      addr_nbytes);
+		fallthrough;
+	case 3:
+		cmdaddr =3D offset & 0xFFFFFF;
+		cmdaddr |=3D opcode << 24;
+
+		temp =3D cpu_to_be32(cmdaddr);
+		aspeed_spi_write_to_ahb(chip->ahb_base, &temp, 4);
+		break;
+	case 4:
+		temp =3D cpu_to_be32(offset);
+		aspeed_spi_write_to_ahb(chip->ahb_base, &opcode, 1);
+		aspeed_spi_write_to_ahb(chip->ahb_base, &temp, 4);
+		break;
+	}
+}
+
+static int aspeed_spi_read_reg(struct aspeed_spi_chip *chip,
+			       const struct spi_mem_op *op)
+{
+	aspeed_spi_start_user(chip);
+	aspeed_spi_write_to_ahb(chip->ahb_base, &op->cmd.opcode, 1);
+	aspeed_spi_read_from_ahb(op->data.buf.in,
+				 chip->ahb_base, op->data.nbytes);
+	aspeed_spi_stop_user(chip);
+	return 0;
+}
+
+static int aspeed_spi_write_reg(struct aspeed_spi_chip *chip,
+				const struct spi_mem_op *op)
+{
+	aspeed_spi_start_user(chip);
+	aspeed_spi_write_to_ahb(chip->ahb_base, &op->cmd.opcode, 1);
+	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out,
+				op->data.nbytes);
+	aspeed_spi_stop_user(chip);
+	return 0;
+}
+
+static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
+				    const struct spi_mem_op *op,
+				    u64 offset, size_t len, void *buf)
+{
+	int io_mode =3D aspeed_spi_get_io_mode(op);
+	u8 dummy =3D 0xFF;
+	int i;
+
+	aspeed_spi_start_user(chip);
+	aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, offset, op->cmd.opcode)=
;
+	if (op->dummy.buswidth && op->dummy.nbytes) {
+		for (i =3D 0; i < op->dummy.nbytes / op->dummy.buswidth; i++)
+			aspeed_spi_write_to_ahb(chip->ahb_base, &dummy,	sizeof(dummy));
+	}
+
+	aspeed_spi_set_io_mode(chip, io_mode);
+
+	aspeed_spi_read_from_ahb(buf, chip->ahb_base, len);
+	aspeed_spi_stop_user(chip);
+	return 0;
+}
+
+static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
+				     const struct spi_mem_op *op)
+{
+	aspeed_spi_start_user(chip);
+	aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val, op->cmd.o=
pcode);
+	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out, op->data.nbyt=
es);
+	aspeed_spi_stop_user(chip);
+	return 0;
+}
+
+/* support for 1-1-1, 1-1-2 or 1-1-4 */
+static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi=
_mem_op *op)
+{
+	if (op->cmd.buswidth > 1)
+		return false;
+
+	if (op->addr.nbytes !=3D 0) {
+		if (op->addr.buswidth > 1 || op->addr.nbytes > 4)
+			return false;
+	}
+
+	if (op->dummy.nbytes !=3D 0) {
+		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
+			return false;
+	}
+
+	if (op->data.nbytes !=3D 0 && op->data.buswidth > 4)
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
+static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_m=
em_op *op)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
+	struct aspeed_spi_chip *chip =3D &aspi->chips[mem->spi->chip_select];
+	u32 addr_mode, addr_mode_backup;
+	u32 ctl_val;
+	int ret =3D 0;
+
+	dev_dbg(aspi->dev,
+		"CE%d %s OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x len:%#x",
+		chip->cs, op->data.dir =3D=3D SPI_MEM_DATA_IN ? "read" : "write",
+		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
+		op->dummy.buswidth, op->data.buswidth,
+		op->addr.nbytes, op->dummy.nbytes, op->data.nbytes);
+
+	addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
+	addr_mode_backup =3D addr_mode;
+
+	ctl_val =3D chip->ctl_val[ASPEED_SPI_BASE];
+	ctl_val &=3D ~CTRL_IO_CMD_MASK;
+
+	ctl_val |=3D op->cmd.opcode << CTRL_COMMAND_SHIFT;
+
+	/* 4BYTE address mode */
+	if (op->addr.nbytes) {
+		if (op->addr.nbytes =3D=3D 4)
+			addr_mode |=3D (0x11 << chip->cs);
+		else
+			addr_mode &=3D ~(0x11 << chip->cs);
+	}
+
+	if (op->dummy.buswidth && op->dummy.nbytes)
+		ctl_val |=3D CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
+
+	if (op->data.nbytes !=3D 0) {
+		if (op->data.buswidth)
+			ctl_val |=3D aspeed_spi_get_io_mode(op);
+	}
+
+	if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
+		ctl_val |=3D CTRL_IO_MODE_WRITE;
+	else
+		ctl_val |=3D CTRL_IO_MODE_READ;
+
+	if (addr_mode !=3D addr_mode_backup)
+		writel(addr_mode, aspi->regs + CE_CTRL_REG);
+	writel(ctl_val, chip->ctl);
+
+	if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
+		if (!op->addr.nbytes)
+			ret =3D aspeed_spi_read_reg(chip, op);
+		else
+			ret =3D aspeed_spi_read_user(chip, op, op->addr.val,
+						   op->data.nbytes, op->data.buf.in);
+	} else {
+		if (!op->addr.nbytes)
+			ret =3D aspeed_spi_write_reg(chip, op);
+		else
+			ret =3D aspeed_spi_write_user(chip, op);
+	}
+
+	/* Restore defaults */
+	if (addr_mode !=3D addr_mode_backup)
+		writel(addr_mode_backup, aspi->regs + CE_CTRL_REG);
+	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
+	return ret;
+}
+
+static int aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_=
op *op)
+{
+	int ret;
+
+	ret =3D do_aspeed_spi_exec_op(mem, op);
+	if (ret)
+		dev_err(&mem->spi->dev, "operation failed: %d\n", ret);
+	return ret;
+}
+
+static const char *aspeed_spi_get_name(struct spi_mem *mem)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
+	struct device *dev =3D aspi->dev;
+
+	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi=
->chip_select);
+}
+
+struct aspeed_spi_window {
+	u32 cs;
+	u32 offset;
+	u32 size;
+};
+
+static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
+				   struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS])
+{
+	const struct aspeed_spi_data *data =3D aspi->data;
+	u32 reg_val;
+	u32 cs;
+
+	for (cs =3D 0; cs < aspi->data->max_cs; cs++) {
+		reg_val =3D readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
+		windows[cs].cs =3D cs;
+		windows[cs].size =3D data->segment_end(aspi, reg_val) -
+			data->segment_start(aspi, reg_val);
+		windows[cs].offset =3D cs ? windows[cs - 1].offset + windows[cs - 1].s=
ize : 0;
+		dev_vdbg(aspi->dev, "CE%d offset=3D0x%.8x size=3D0x%x\n", cs,
+			 windows[cs].offset, windows[cs].size);
+	}
+}
+
+/*
+ * On the AST2600, some CE windows are closed by default at reset but
+ * U-Boot should open all.
+ */
+static int aspeed_spi_chip_set_default_window(struct aspeed_spi_chip *ch=
ip)
+{
+	struct aspeed_spi *aspi =3D chip->aspi;
+	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] =3D { 0 };
+	struct aspeed_spi_window *win =3D &windows[chip->cs];
+
+	aspeed_spi_get_windows(aspi, windows);
+
+	chip->ahb_base =3D aspi->ahb_base + win->offset;
+	chip->ahb_window_size =3D win->size;
+
+	dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ] %dMB",
+		chip->cs, aspi->ahb_base_phy + win->offset,
+		aspi->ahb_base_phy + win->offset + win->size - 1,
+		win->size >> 20);
+
+	return chip->ahb_window_size ? 0 : -1;
+}
+
+static const struct spi_controller_mem_ops aspeed_spi_mem_ops =3D {
+	.supports_op =3D aspeed_spi_supports_op,
+	.exec_op =3D aspeed_spi_exec_op,
+	.get_name =3D aspeed_spi_get_name,
+};
+
+static void aspeed_spi_chip_set_type(struct aspeed_spi *aspi, unsigned i=
nt cs, int type)
+{
+	u32 reg;
+
+	reg =3D readl(aspi->regs + CONFIG_REG);
+	reg &=3D ~(0x3 << (cs * 2));
+	reg |=3D type << (cs * 2);
+	writel(reg, aspi->regs + CONFIG_REG);
+}
+
+static void aspeed_spi_chip_enable(struct aspeed_spi *aspi, unsigned int=
 cs, bool enable)
+{
+	u32 we_bit =3D BIT(aspi->data->we0 + cs);
+	u32 reg =3D readl(aspi->regs + CONFIG_REG);
+
+	if (enable)
+		reg |=3D we_bit;
+	else
+		reg &=3D ~we_bit;
+	writel(reg, aspi->regs + CONFIG_REG);
+}
+
+static int aspeed_spi_setup(struct spi_device *spi)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(spi->master);
+	const struct aspeed_spi_data *data =3D aspi->data;
+	unsigned int cs =3D spi->chip_select;
+	struct aspeed_spi_chip *chip =3D &aspi->chips[cs];
+
+	chip->aspi =3D aspi;
+	chip->cs =3D cs;
+	chip->ctl =3D aspi->regs + data->ctl0 + cs * 4;
+
+	/* The driver only supports SPI type flash */
+	if (data->hastype)
+		aspeed_spi_chip_set_type(aspi, cs, CONFIG_TYPE_SPI);
+
+	if (aspeed_spi_chip_set_default_window(chip) < 0) {
+		dev_warn(aspi->dev, "CE%d window invalid", cs);
+		return -EINVAL;
+	}
+
+	aspeed_spi_chip_enable(aspi, cs, true);
+
+	chip->ctl_val[ASPEED_SPI_BASE] =3D CTRL_CE_STOP_ACTIVE | CTRL_IO_MODE_U=
SER;
+
+	dev_dbg(aspi->dev, "CE%d setup done\n", cs);
+	return 0;
+}
+
+static void aspeed_spi_cleanup(struct spi_device *spi)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(spi->master);
+	unsigned int cs =3D spi->chip_select;
+
+	aspeed_spi_chip_enable(aspi, cs, false);
+
+	dev_dbg(aspi->dev, "CE%d cleanup done\n", cs);
+}
+
+static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
+{
+	int cs;
+
+	for (cs =3D 0; cs < aspi->data->max_cs; cs++)
+		aspeed_spi_chip_enable(aspi, cs, enable);
+}
+
+static int aspeed_spi_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	const struct aspeed_spi_data *data;
+	struct spi_controller *ctlr;
+	struct aspeed_spi *aspi;
+	struct resource *res;
+	int ret;
+
+	data =3D of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	ctlr =3D devm_spi_alloc_master(dev, sizeof(*aspi));
+	if (!ctlr)
+		return -ENOMEM;
+
+	aspi =3D spi_controller_get_devdata(ctlr);
+	platform_set_drvdata(pdev, aspi);
+	aspi->data =3D data;
+	aspi->dev =3D dev;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	aspi->regs =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(aspi->regs)) {
+		dev_err(dev, "missing AHB register window\n");
+		return PTR_ERR(aspi->regs);
+	}
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	aspi->ahb_base =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(aspi->ahb_base)) {
+		dev_err(dev, "missing AHB mapping window\n");
+		return PTR_ERR(aspi->ahb_base);
+	}
+
+	aspi->ahb_window_size =3D resource_size(res);
+	aspi->ahb_base_phy =3D res->start;
+
+	aspi->clk =3D devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(aspi->clk)) {
+		dev_err(dev, "missing clock\n");
+		return PTR_ERR(aspi->clk);
+	}
+
+	aspi->clk_freq =3D clk_get_rate(aspi->clk);
+	if (!aspi->clk_freq) {
+		dev_err(dev, "invalid clock\n");
+		return -EINVAL;
+	}
+
+	ret =3D clk_prepare_enable(aspi->clk);
+	if (ret) {
+		dev_err(dev, "can not enable the clock\n");
+		return ret;
+	}
+
+	/* IRQ is for DMA, which the driver doesn't support yet */
+
+	ctlr->mode_bits =3D SPI_RX_DUAL | SPI_TX_DUAL | data->mode_bits;
+	ctlr->bus_num =3D pdev->id;
+	ctlr->mem_ops =3D &aspeed_spi_mem_ops;
+	ctlr->setup =3D aspeed_spi_setup;
+	ctlr->cleanup =3D aspeed_spi_cleanup;
+	ctlr->num_chipselect =3D data->max_cs;
+	ctlr->dev.of_node =3D dev->of_node;
+
+	ret =3D devm_spi_register_controller(dev, ctlr);
+	if (ret) {
+		dev_err(&pdev->dev, "spi_register_controller failed\n");
+		goto disable_clk;
+	}
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(aspi->clk);
+	return ret;
+}
+
+static int aspeed_spi_remove(struct platform_device *pdev)
+{
+	struct aspeed_spi *aspi =3D platform_get_drvdata(pdev);
+
+	aspeed_spi_enable(aspi, false);
+	clk_disable_unprepare(aspi->clk);
+	return 0;
+}
+
+/*
+ * AHB mappings
+ */
+
+/*
+ * The Segment Registers of the AST2400 and AST2500 use a 8MB unit.
+ * The address range is encoded with absolute addresses in the overall
+ * mapping window.
+ */
+static u32 aspeed_spi_segment_start(struct aspeed_spi *aspi, u32 reg)
+{
+	return ((reg >> 16) & 0xFF) << 23;
+}
+
+static u32 aspeed_spi_segment_end(struct aspeed_spi *aspi, u32 reg)
+{
+	return ((reg >> 24) & 0xFF) << 23;
+}
+
+static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi, u32 start, u3=
2 end)
+{
+	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24);
+}
+
+/*
+ * The Segment Registers of the AST2600 use a 1MB unit. The address
+ * range is encoded with offsets in the overall mapping window.
+ */
+
+#define AST2600_SEG_ADDR_MASK 0x0ff00000
+
+static u32 aspeed_spi_segment_ast2600_start(struct aspeed_spi *aspi,
+					    u32 reg)
+{
+	u32 start_offset =3D (reg << 16) & AST2600_SEG_ADDR_MASK;
+
+	return aspi->ahb_base_phy + start_offset;
+}
+
+static u32 aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
+					  u32 reg)
+{
+	u32 end_offset =3D reg & AST2600_SEG_ADDR_MASK;
+
+	/* segment is disabled */
+	if (!end_offset)
+		return aspi->ahb_base_phy;
+
+	return aspi->ahb_base_phy + end_offset + 0x100000;
+}
+
+static u32 aspeed_spi_segment_ast2600_reg(struct aspeed_spi *aspi,
+					  u32 start, u32 end)
+{
+	/* disable zero size segments */
+	if (start =3D=3D end)
+		return 0;
+
+	return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
+		((end - 1) & AST2600_SEG_ADDR_MASK);
+}
+
+/*
+ * Platform definitions
+ */
+static const struct aspeed_spi_data ast2400_fmc_data =3D {
+	.max_cs	       =3D 5,
+	.hastype       =3D true,
+	.we0	       =3D 16,
+	.ctl0	       =3D CE0_CTRL_REG,
+	.segment_start =3D aspeed_spi_segment_start,
+	.segment_end   =3D aspeed_spi_segment_end,
+	.segment_reg   =3D aspeed_spi_segment_reg,
+};
+
+static const struct aspeed_spi_data ast2500_fmc_data =3D {
+	.max_cs	       =3D 3,
+	.hastype       =3D true,
+	.we0	       =3D 16,
+	.ctl0	       =3D CE0_CTRL_REG,
+	.segment_start =3D aspeed_spi_segment_start,
+	.segment_end   =3D aspeed_spi_segment_end,
+	.segment_reg   =3D aspeed_spi_segment_reg,
+};
+
+static const struct aspeed_spi_data ast2500_spi_data =3D {
+	.max_cs	       =3D 2,
+	.hastype       =3D false,
+	.we0	       =3D 16,
+	.ctl0	       =3D CE0_CTRL_REG,
+	.segment_start =3D aspeed_spi_segment_start,
+	.segment_end   =3D aspeed_spi_segment_end,
+	.segment_reg   =3D aspeed_spi_segment_reg,
+};
+
+static const struct aspeed_spi_data ast2600_fmc_data =3D {
+	.max_cs	       =3D 3,
+	.hastype       =3D false,
+	.mode_bits     =3D SPI_RX_QUAD | SPI_RX_QUAD,
+	.we0	       =3D 16,
+	.ctl0	       =3D CE0_CTRL_REG,
+	.segment_start =3D aspeed_spi_segment_ast2600_start,
+	.segment_end   =3D aspeed_spi_segment_ast2600_end,
+	.segment_reg   =3D aspeed_spi_segment_ast2600_reg,
+};
+
+static const struct aspeed_spi_data ast2600_spi_data =3D {
+	.max_cs	       =3D 2,
+	.hastype       =3D false,
+	.mode_bits     =3D SPI_RX_QUAD | SPI_RX_QUAD,
+	.we0	       =3D 16,
+	.ctl0	       =3D CE0_CTRL_REG,
+	.segment_start =3D aspeed_spi_segment_ast2600_start,
+	.segment_end   =3D aspeed_spi_segment_ast2600_end,
+	.segment_reg   =3D aspeed_spi_segment_ast2600_reg,
+};
+
+static const struct of_device_id aspeed_spi_matches[] =3D {
+	{ .compatible =3D "aspeed,ast2400-fmc", .data =3D &ast2400_fmc_data },
+	{ .compatible =3D "aspeed,ast2500-fmc", .data =3D &ast2500_fmc_data },
+	{ .compatible =3D "aspeed,ast2500-spi", .data =3D &ast2500_spi_data },
+	{ .compatible =3D "aspeed,ast2600-fmc", .data =3D &ast2600_fmc_data },
+	{ .compatible =3D "aspeed,ast2600-spi", .data =3D &ast2600_spi_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_spi_matches);
+
+static struct platform_driver aspeed_spi_driver =3D {
+	.probe			=3D aspeed_spi_probe,
+	.remove			=3D aspeed_spi_remove,
+	.driver	=3D {
+		.name		=3D DEVICE_NAME,
+		.of_match_table =3D aspeed_spi_matches,
+	}
+};
+
+module_platform_driver(aspeed_spi_driver);
+
+MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
+MODULE_AUTHOR("Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>");
+MODULE_AUTHOR("Cedric Le Goater <clg@kaod.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Docum=
entation/devicetree/bindings/mtd/aspeed-smc.txt
deleted file mode 100644
index 49f6528ef547..000000000000
--- a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-* Aspeed Firmware Memory controller
-* Aspeed SPI Flash Memory Controller
-
-The Firmware Memory Controller in the Aspeed AST2500 SoC supports
-three chip selects, two of which are always of SPI type and the third
-can be SPI or NOR type flash. These bindings only describe SPI.
-
-The two SPI flash memory controllers in the AST2500 each support two
-chip selects.
-
-Required properties:
-  - compatible : Should be one of
-	"aspeed,ast2400-fmc" for the AST2400 Firmware Memory Controller
-	"aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
-	"aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
-	"aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
-
-  - reg : the first contains the control register location and length,
-          the second contains the memory window mapping address and leng=
th
-  - #address-cells : must be 1 corresponding to chip select child bindin=
g
-  - #size-cells : must be 0 corresponding to chip select child binding
-
-Optional properties:
-  - interrupts : Should contain the interrupt for the dma device if an
-    FMC
-
-The child nodes are the SPI flash modules which must have a compatible
-property as specified in bindings/mtd/jedec,spi-nor.txt
-
-Optionally, the child node can contain properties for SPI mode (may be
-ignored):
-  - spi-max-frequency - max frequency of spi bus
-
-
-Example:
-fmc: fmc@1e620000 {
-	compatible =3D "aspeed,ast2500-fmc";
-	reg =3D < 0x1e620000 0x94
-		0x20000000 0x02000000 >;
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
-	interrupts =3D <19>;
-	flash@0 {
-		reg =3D < 0 >;
-		compatible =3D "jedec,spi-nor";
-		/* spi-max-frequency =3D <>; */
-		/* m25p,fast-read; */
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 7d5f81dcd837..f4605689f41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3029,6 +3029,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subs=
cribers)
 L:	linux-spi@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+F:	drivers/spi/spi-aspeed-smc.c
=20
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-no=
r/controllers/Kconfig
index 50f4f3484d42..ca45dcd3ffe8 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -1,14 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SPI_ASPEED_SMC
-	tristate "Aspeed flash controllers in SPI mode"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	depends on HAS_IOMEM && OF
-	help
-	  This enables support for the Firmware Memory controller (FMC)
-	  in the Aspeed AST2500/AST2400 SoCs when attached to SPI NOR chips,
-	  and support for the SPI flash memory controller (SPI) for
-	  the host firmware. The implementation only supports SPI NOR.
-
 config SPI_HISI_SFC
 	tristate "Hisilicon FMC SPI NOR Flash Controller(SFC)"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-n=
or/controllers/Makefile
index 6e2a1dc68466..0b8e1d530913 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_SPI_ASPEED_SMC)	+=3D aspeed-smc.o
 obj-$(CONFIG_SPI_HISI_SFC)	+=3D hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+=3D nxp-spifi.o
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 31a2cef3790c..9f6679cb0f78 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -101,6 +101,17 @@ config SPI_ARMADA_3700
 	  This enables support for the SPI controller present on the
 	  Marvell Armada 3700 SoCs.
=20
+config SPI_ASPEED_SMC
+	tristate "Aspeed flash controllers in SPI mode"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on OF
+	help
+	  This enables support for the Firmware Memory controller (FMC)
+	  in the Aspeed AST2600, AST2500 and AST2400 SoCs when attached
+	  to SPI NOR chips, and support for the SPI flash memory
+	  controller (SPI) for the host firmware. The implementation
+	  only supports SPI NOR.
+
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 3aa28ed3f761..1566388b96ae 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SPI_ALTERA_CORE)		+=3D spi-altera-core.o
 obj-$(CONFIG_SPI_ALTERA_DFL)		+=3D spi-altera-dfl.o
 obj-$(CONFIG_SPI_AR934X)		+=3D spi-ar934x.o
 obj-$(CONFIG_SPI_ARMADA_3700)		+=3D spi-armada-3700.o
+obj-$(CONFIG_SPI_ASPEED_SMC)		+=3D spi-aspeed-smc.o
 obj-$(CONFIG_SPI_ATMEL)			+=3D spi-atmel.o
 obj-$(CONFIG_SPI_ATMEL_QUADSPI)		+=3D atmel-quadspi.o
 obj-$(CONFIG_SPI_AT91_USART)		+=3D spi-at91-usart.o
--=20
2.34.1

