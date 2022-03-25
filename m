Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94694E70C1
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 11:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPyWW5QlGz30Bm
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 21:09:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPyW86zx0z2yHc
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 21:09:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P8oIMP016467; 
 Fri, 25 Mar 2022 10:09:16 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0gnk1qrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9w5Ql004280;
 Fri, 25 Mar 2022 10:09:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t94x4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA9Bq149348926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:09:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E84011C04A;
 Fri, 25 Mar 2022 10:09:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E24A211C04C;
 Fri, 25 Mar 2022 10:09:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:09:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4A760220158;
 Fri, 25 Mar 2022 11:09:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to at
 least 2MB for AST2600
Date: Fri, 25 Mar 2022 11:08:49 +0100
Message-Id: <20220325100849.2019209-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
References: <20220325100849.2019209-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dLn_uyNuaBgXXxkKZwl1H-aVA55JLQjM
X-Proofpoint-ORIG-GUID: dLn_uyNuaBgXXxkKZwl1H-aVA55JLQjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=896 clxscore=1034 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250057
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
 Rob Herring <robh+dt@kernel.org>, Potin Lai <potin.lai@quantatw.com>,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Potin Lai <potin.lai@quantatw.com>

In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
address offset is set to the acctual offset - 1MB. If the flash only has
1MB, the end address will has same value as start address, which will
causing unexpected errors.

This patch set the decoding size to at least 2MB to avoid decoding errors=
.

Tested:
root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
[   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST260=
0 Decoding)
[   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200=
000 ] 2MB
root@bletchley:~# devmem 0x1e631030
0x00100000

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
[ clg : Ported on new spi-mem driver ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 660451667a39..227797e13997 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -466,6 +466,8 @@ static int aspeed_spi_set_window(struct aspeed_spi *a=
spi,
  *   is correct.
  */
 static const struct aspeed_spi_data ast2500_spi_data;
+static const struct aspeed_spi_data ast2600_spi_data;
+static const struct aspeed_spi_data ast2600_fmc_data;
=20
 static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
@@ -489,6 +491,17 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
ed_spi_chip *chip,
 			 chip->cs, size >> 20);
 	}
=20
+	/*
+	 * The decoding size of AST2600 SPI controller should set at
+	 * least 2MB.
+	 */
+	if ((aspi->data =3D=3D &ast2600_spi_data || aspi->data =3D=3D &ast2600_=
fmc_data) &&
+	    size < SZ_2M) {
+		size =3D SZ_2M;
+		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2600 Decoding)",
+			 chip->cs, size >> 20);
+	}
+
 	aspeed_spi_get_windows(aspi, windows);
=20
 	/* Adjust this chip window */
--=20
2.34.1

