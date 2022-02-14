Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFF4B4676
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 10:43:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxzn03zKXz3bVZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 20:43:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzmn2ZPRz30RR
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Feb 2022 20:43:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E7cXtS003354; 
 Mon, 14 Feb 2022 09:42:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7dvm06ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9bkhQ002577;
 Mon, 14 Feb 2022 09:42:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3e64h9jrft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E9gmkp38797662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEE1FA4055;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37CF9A4040;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C984A2201E5;
 Mon, 14 Feb 2022 10:42:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 07/10] spi: aspeed: Add support for the AST2400 SPI controller
Date: Mon, 14 Feb 2022 10:42:28 +0100
Message-Id: <20220214094231.3753686-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _0RwvAi9IPxVlAqUDd93ID1x2tjNVpRL
X-Proofpoint-ORIG-GUID: _0RwvAi9IPxVlAqUDd93ID1x2tjNVpRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
index c6ac3253d7d5..e44e80bab50f 100644
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
@@ -293,6 +294,8 @@ static bool aspeed_spi_supports_op(struct spi_mem *me=
m, const struct spi_mem_op
 	return true;
 }
=20
+static const struct aspeed_spi_data ast2400_spi_data;
+
 static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_m=
em_op *op)
 {
 	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
@@ -322,6 +325,9 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
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
@@ -413,7 +419,13 @@ static int aspeed_spi_chip_set_default_window(struct=
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
@@ -476,6 +488,10 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
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
@@ -560,6 +576,12 @@ static int aspeed_spi_dirmap_create(struct spi_mem_d=
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
@@ -860,6 +882,14 @@ static const struct aspeed_spi_data ast2400_fmc_data=
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
@@ -904,6 +934,7 @@ static const struct aspeed_spi_data ast2600_spi_data =
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

