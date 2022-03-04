Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2724CD01F
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 09:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K91Sz05c7z30Lp
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 19:37:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K91Sf1ZJbz30RD
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 19:37:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2247ChgT003272; 
 Fri, 4 Mar 2022 08:37:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ek78b8447-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:01 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248AKHu012078;
 Fri, 4 Mar 2022 08:37:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ek78b843s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248X3S1013595;
 Fri, 4 Mar 2022 08:36:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ek4k417h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2248aumf57672142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5853BAE053;
 Fri,  4 Mar 2022 08:36:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF4B3AE04D;
 Fri,  4 Mar 2022 08:36:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:55 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D96B72201B4;
 Fri,  4 Mar 2022 09:36:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v3 05/11] spi: aspeed: Add support for direct mapping
Date: Fri,  4 Mar 2022 09:36:37 +0100
Message-Id: <20220304083643.1079142-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6yY8G907jljsVK9o6RAwlcASsDP6EnNq
X-Proofpoint-GUID: j1K9uRvHqhRRW72XmpctzbGXoo-UJhJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1034 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
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

Use direct mapping to read the flash device contents. This operation
mode is called "Command mode" on Aspeed SoC SMC controllers. It uses a
Control Register for the settings to apply when a memory operation is
performed on the flash device mapping window.

If the window is not big enough, fall back to the "User mode" to
perform the read.

Since direct mapping now handles all reads of the flash device
contents, also use memcpy_fromio for other address spaces, such as
SFDP.

Direct mapping for writes will come later when validated.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tao Ren <rentao.bupt@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 67 ++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 997ec2e45118..0951766baef4 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -322,8 +322,8 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *o
 		if (!op->addr.nbytes)
 			ret =3D aspeed_spi_read_reg(chip, op);
 		else
-			ret =3D aspeed_spi_read_user(chip, op, op->addr.val,
-						   op->data.nbytes, op->data.buf.in);
+			memcpy_fromio(op->data.buf.in, chip->ahb_base + op->addr.val,
+				      op->data.nbytes);
 	} else {
 		if (!op->addr.nbytes)
 			ret =3D aspeed_spi_write_reg(chip, op);
@@ -403,10 +403,73 @@ static int aspeed_spi_chip_set_default_window(struc=
t aspeed_spi_chip *chip)
 	return chip->ahb_window_size ? 0 : -1;
 }
=20
+static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
+	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
+	struct spi_mem_op *op =3D &desc->info.op_tmpl;
+	u32 ctl_val;
+	int ret =3D 0;
+
+	chip->clk_freq =3D desc->mem->spi->max_speed_hz;
+
+	/* Only for reads */
+	if (op->data.dir !=3D SPI_MEM_DATA_IN)
+		return -EOPNOTSUPP;
+
+	if (desc->info.length > chip->ahb_window_size)
+		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
+			 chip->cs, chip->ahb_window_size >> 20);
+
+	/* Define the default IO read settings */
+	ctl_val =3D readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
+	ctl_val |=3D aspeed_spi_get_io_mode(op) |
+		op->cmd.opcode << CTRL_COMMAND_SHIFT |
+		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
+		CTRL_IO_MODE_READ;
+
+	/* Tune 4BYTE address mode */
+	if (op->addr.nbytes) {
+		u32 addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
+
+		if (op->addr.nbytes =3D=3D 4)
+			addr_mode |=3D (0x11 << chip->cs);
+		else
+			addr_mode &=3D ~(0x11 << chip->cs);
+		writel(addr_mode, aspi->regs + CE_CTRL_REG);
+	}
+
+	/* READ mode is the controller default setting */
+	chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
+	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
+
+	dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
+		 chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_READ]);
+
+	return ret;
+}
+
+static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
+				      u64 offset, size_t len, void *buf)
+{
+	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
+	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
+
+	/* Switch to USER command mode if mapping window is too small */
+	if (chip->ahb_window_size < offset + len)
+		aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, len, buf);
+	else
+		memcpy_fromio(buf, chip->ahb_base + offset, len);
+
+	return len;
+}
+
 static const struct spi_controller_mem_ops aspeed_spi_mem_ops =3D {
 	.supports_op =3D aspeed_spi_supports_op,
 	.exec_op =3D aspeed_spi_exec_op,
 	.get_name =3D aspeed_spi_get_name,
+	.dirmap_create =3D aspeed_spi_dirmap_create,
+	.dirmap_read =3D aspeed_spi_dirmap_read,
 };
=20
 static void aspeed_spi_chip_set_type(struct aspeed_spi *aspi, unsigned i=
nt cs, int type)
--=20
2.34.1

