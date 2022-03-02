Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 899FE4CABFB
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 18:32:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K81QF558Mz3bt2
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 04:32:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K81Q5127Yz3br0
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 04:31:56 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222FZWUA014056; 
 Wed, 2 Mar 2022 17:31:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej9std0k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HDPte008081;
 Wed, 2 Mar 2022 17:31:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1amg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVS6H55312846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0BBAE045;
 Wed,  2 Mar 2022 17:31:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA411AE04D;
 Wed,  2 Mar 2022 17:31:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 83E802200FE;
 Wed,  2 Mar 2022 18:31:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2 08/10] spi: aspeed: Add support for the AST2400 SPI
 controller
Date: Wed,  2 Mar 2022 18:31:12 +0100
Message-Id: <20220302173114.927476-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QvKns0BNX4Dkfkm0M9ehrUPHiVJGXvHR
X-Proofpoint-ORIG-GUID: QvKns0BNX4Dkfkm0M9ehrUPHiVJGXvHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1034 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Extend the driver for the AST2400 SPI Flash Controller (SPI). This
controller has a slightly different interface which requires
adaptation of the 4B handling. Summary of features :

   . host Firmware
   . 1 chip select pin (CE0)
   . slightly different register set, between AST2500 and the legacy
     controller
   . no segment registers
   . single, dual mode.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index e133984d3c95..8c6d7f79d97f 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -32,6 +32,7 @@
 #define   CTRL_IO_DUAL_DATA		BIT(29)
 #define   CTRL_IO_QUAD_DATA		BIT(30)
 #define   CTRL_COMMAND_SHIFT		16
+#define   CTRL_IO_ADDRESS_4B		BIT(13)	/* AST2400 SPI only */
 #define   CTRL_IO_DUMMY_SET(dummy)					\
 	(((((dummy) >> 2) & 0x1) << 14) | (((dummy) & 0x3) << 6))
 #define   CTRL_CE_STOP_ACTIVE		BIT(2)
@@ -272,6 +273,8 @@ static bool aspeed_spi_supports_op(struct spi_mem *me=
m, const struct spi_mem_op
 	return spi_mem_default_supports_op(mem, op);
 }
=20
+static const struct aspeed_spi_data ast2400_spi_data;
+
 static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_m=
em_op *op)
 {
 	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
@@ -301,6 +304,9 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *o
 			addr_mode |=3D (0x11 << chip->cs);
 		else
 			addr_mode &=3D ~(0x11 << chip->cs);
+
+		if (op->addr.nbytes =3D=3D 4 && chip->aspi->data =3D=3D &ast2400_spi_d=
ata)
+			ctl_val |=3D CTRL_IO_ADDRESS_4B;
 	}
=20
 	if (op->dummy.buswidth && op->dummy.nbytes)
@@ -392,7 +398,13 @@ static int aspeed_spi_chip_set_default_window(struct=
 aspeed_spi_chip *chip)
 	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] =3D { 0 };
 	struct aspeed_spi_window *win =3D &windows[chip->cs];
=20
-	aspeed_spi_get_windows(aspi, windows);
+	/* No segment registers for the AST2400 SPI controller */
+	if (aspi->data =3D=3D &ast2400_spi_data) {
+		win->offset =3D 0;
+		win->size =3D aspi->ahb_window_size;
+	} else {
+		aspeed_spi_get_windows(aspi, windows);
+	}
=20
 	chip->ahb_base =3D aspi->ahb_base + win->offset;
 	chip->ahb_window_size =3D win->size;
@@ -455,6 +467,10 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
ed_spi_chip *chip,
 	struct aspeed_spi_window *win =3D &windows[chip->cs];
 	int ret;
=20
+	/* No segment registers for the AST2400 SPI controller */
+	if (aspi->data =3D=3D &ast2400_spi_data)
+		return 0;
+
 	/*
 	 * Due to an HW issue on the AST2500 SPI controller, the CE0
 	 * window size should be smaller than the maximum 128MB.
@@ -539,6 +555,12 @@ static int aspeed_spi_dirmap_create(struct spi_mem_d=
irmap_desc *desc)
 		else
 			addr_mode &=3D ~(0x11 << chip->cs);
 		writel(addr_mode, aspi->regs + CE_CTRL_REG);
+
+		/* AST2400 SPI controller sets 4BYTE address mode in
+		 * CE0 Control Register
+		 */
+		if (op->addr.nbytes =3D=3D 4 && chip->aspi->data =3D=3D &ast2400_spi_d=
ata)
+			ctl_val |=3D CTRL_IO_ADDRESS_4B;
 	}
=20
 	/* READ mode is the controller default setting */
@@ -805,6 +827,14 @@ static const struct aspeed_spi_data ast2400_fmc_data=
 =3D {
 	.segment_reg   =3D aspeed_spi_segment_reg,
 };
=20
+static const struct aspeed_spi_data ast2400_spi_data =3D {
+	.max_cs	       =3D 1,
+	.hastype       =3D false,
+	.we0	       =3D 0,
+	.ctl0	       =3D 0x04,
+	/* No segment registers */
+};
+
 static const struct aspeed_spi_data ast2500_fmc_data =3D {
 	.max_cs	       =3D 3,
 	.hastype       =3D true,
@@ -849,6 +879,7 @@ static const struct aspeed_spi_data ast2600_spi_data =
=3D {
=20
 static const struct of_device_id aspeed_spi_matches[] =3D {
 	{ .compatible =3D "aspeed,ast2400-fmc", .data =3D &ast2400_fmc_data },
+	{ .compatible =3D "aspeed,ast2400-spi", .data =3D &ast2400_spi_data },
 	{ .compatible =3D "aspeed,ast2500-fmc", .data =3D &ast2500_fmc_data },
 	{ .compatible =3D "aspeed,ast2500-spi", .data =3D &ast2500_spi_data },
 	{ .compatible =3D "aspeed,ast2600-fmc", .data =3D &ast2600_fmc_data },
--=20
2.34.1

