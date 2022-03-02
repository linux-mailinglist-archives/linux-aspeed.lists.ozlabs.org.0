Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1384CAC03
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 18:32:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K81QW4ySyz3bxR
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 04:32:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K81QC2tVhz3bts
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 04:32:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222HI36k011577; 
 Wed, 2 Mar 2022 17:31:28 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejcv288sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:28 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HD6OZ009105;
 Wed, 2 Mar 2022 17:31:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu95ybj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVNdV50332028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38DCAAE053;
 Wed,  2 Mar 2022 17:31:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 802C7AE057;
 Wed,  2 Mar 2022 17:31:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 096622200FE;
 Wed,  2 Mar 2022 18:31:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2 04/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Date: Wed,  2 Mar 2022 18:31:08 +0100
Message-Id: <20220302173114.927476-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UlooaQ4hJ9NPbz11YtX1TaqeleFwPvUB
X-Proofpoint-ORIG-GUID: UlooaQ4hJ9NPbz11YtX1TaqeleFwPvUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1034 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
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

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c            | 711 ++++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 drivers/mtd/spi-nor/controllers/Kconfig |   2 +-
 drivers/spi/Kconfig                     |  11 +
 drivers/spi/Makefile                    |   1 +
 5 files changed, 725 insertions(+), 1 deletion(-)
 create mode 100644 drivers/spi/spi-aspeed-smc.c

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
new file mode 100644
index 000000000000..688f9472e0d7
--- /dev/null
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -0,0 +1,711 @@
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
+#define ASPEED_SPI_DEFAULT_FREQ		50000000
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
diff --git a/MAINTAINERS b/MAINTAINERS
index f5ab77548ef6..cb163052fe61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2933,6 +2933,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subs=
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
index 876a47042fec..35f18c01b1d8 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SPI_ASPEED_SMC_MTD_SPI_NOR
 	tristate "Aspeed flash controllers in SPI mode"
-	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on (ARCH_ASPEED && !SPI_ASPEED_SMC) || COMPILE_TEST
 	depends on HAS_IOMEM && OF
 	help
 	  This enables support for the Firmware Memory controller (FMC)
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 83e352b0c8f9..dc44493439fb 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -101,6 +101,17 @@ config SPI_ARMADA_3700
 	  This enables support for the SPI controller present on the
 	  Marvell Armada 3700 SoCs.
=20
+config SPI_ASPEED_SMC
+	tristate "Aspeed flash controllers in SPI mode"
+	depends on (ARCH_ASPEED && !CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR) || COMPI=
LE_TEST
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
index 699db95c8441..3dd0e649be94 100644
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

