Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66974CD003
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 09:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K91SZ5N4Pz30KM
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 19:37:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K91SQ74l7z2yZc
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 19:37:26 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2248Nfrw022009; 
 Fri, 4 Mar 2022 08:37:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekf7j06v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:03 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248YcLf023379;
 Fri, 4 Mar 2022 08:37:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ekf7j06uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248XpCV010670;
 Fri, 4 Mar 2022 08:37:00 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ek4kg97hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2248avVP48693588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE0B252050;
 Fri,  4 Mar 2022 08:36:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 3E4A452054;
 Fri,  4 Mar 2022 08:36:57 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A78222200FD;
 Fri,  4 Mar 2022 09:36:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v3 06/11] spi: aspeed: Adjust direct mapping to device size
Date: Fri,  4 Mar 2022 09:36:38 +0100
Message-Id: <20220304083643.1079142-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ct2EAHYCSUWyU7RIvLyAusI7qOo6DQAy
X-Proofpoint-ORIG-GUID: 3nipNoVki59muBsYk_Z7XmXktv9TzCPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 clxscore=1034
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The segment registers of the FMC/SPI controllers provide a way to
configure the mapping window of the flash device contents on the AHB
bus. Adjust this window to the size of the spi-mem mapping.

Things get more complex with multiple devices. The driver needs to
also adjust the window of the next device to make sure that there is
no overlap, even if there is no available device. The proposal below
is not perfect but it is covering all the cases we have seen on
different boards with one and two devices on the same bus.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tao Ren <rentao.bupt@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 0951766baef4..9f7910e79ae8 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -403,6 +403,92 @@ static int aspeed_spi_chip_set_default_window(struct=
 aspeed_spi_chip *chip)
 	return chip->ahb_window_size ? 0 : -1;
 }
=20
+static int aspeed_spi_set_window(struct aspeed_spi *aspi,
+				 const struct aspeed_spi_window *win)
+{
+	u32 start =3D aspi->ahb_base_phy + win->offset;
+	u32 end =3D start + win->size;
+	void __iomem *seg_reg =3D aspi->regs + CE0_SEGMENT_ADDR_REG + win->cs *=
 4;
+	u32 seg_val_backup =3D readl(seg_reg);
+	u32 seg_val =3D aspi->data->segment_reg(aspi, start, end);
+
+	if (seg_val =3D=3D seg_val_backup)
+		return 0;
+
+	writel(seg_val, seg_reg);
+
+	/*
+	 * Restore initial value if something goes wrong else we could
+	 * loose access to the chip.
+	 */
+	if (seg_val !=3D readl(seg_reg)) {
+		dev_err(aspi->dev, "CE%d invalid window [ 0x%.8x - 0x%.8x ] %dMB",
+			win->cs, start, end - 1, win->size >> 20);
+		writel(seg_val_backup, seg_reg);
+		return -EIO;
+	}
+
+	if (win->size)
+		dev_dbg(aspi->dev, "CE%d new window [ 0x%.8x - 0x%.8x ] %dMB",
+			win->cs, start, end - 1,  win->size >> 20);
+	else
+		dev_dbg(aspi->dev, "CE%d window closed", win->cs);
+
+	return 0;
+}
+
+/*
+ * Yet to be done when possible :
+ * - Align mappings on flash size (we don't have the info)
+ * - ioremap each window, not strictly necessary since the overall windo=
w
+ *   is correct.
+ */
+static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
+					 u32 local_offset, u32 size)
+{
+	struct aspeed_spi *aspi =3D chip->aspi;
+	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] =3D { 0 };
+	struct aspeed_spi_window *win =3D &windows[chip->cs];
+	int ret;
+
+	aspeed_spi_get_windows(aspi, windows);
+
+	/* Adjust this chip window */
+	win->offset +=3D local_offset;
+	win->size =3D size;
+
+	if (win->offset + win->size > aspi->ahb_window_size) {
+		win->size =3D aspi->ahb_window_size - win->offset;
+		dev_warn(aspi->dev, "CE%d window resized to %dMB", chip->cs, win->size=
 >> 20);
+	}
+
+	ret =3D aspeed_spi_set_window(aspi, win);
+	if (ret)
+		return ret;
+
+	/* Update chip mapping info */
+	chip->ahb_base =3D aspi->ahb_base + win->offset;
+	chip->ahb_window_size =3D win->size;
+
+	/*
+	 * Also adjust next chip window to make sure that it does not
+	 * overlap with the current window.
+	 */
+	if (chip->cs < aspi->data->max_cs - 1) {
+		struct aspeed_spi_window *next =3D &windows[chip->cs + 1];
+
+		/* Change offset and size to keep the same end address */
+		if ((next->offset + next->size) > (win->offset + win->size))
+			next->size =3D (next->offset + next->size) - (win->offset + win->size=
);
+		else
+			next->size =3D 0;
+		next->offset =3D win->offset + win->size;
+
+		aspeed_spi_set_window(aspi, next);
+	}
+	return 0;
+}
+
 static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 {
 	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
@@ -417,6 +503,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_di=
rmap_desc *desc)
 	if (op->data.dir !=3D SPI_MEM_DATA_IN)
 		return -EOPNOTSUPP;
=20
+	aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.lengt=
h);
+
 	if (desc->info.length > chip->ahb_window_size)
 		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
 			 chip->cs, chip->ahb_window_size >> 20);
--=20
2.34.1

