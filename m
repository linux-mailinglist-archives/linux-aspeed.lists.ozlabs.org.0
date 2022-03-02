Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B14CABFD
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 18:32:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K81QK21gRz3byL
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 04:32:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K81Q51k5mz3brR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 04:31:56 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Gmews002118; 
 Wed, 2 Mar 2022 17:31:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ejce98tqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HDEOI008064;
 Wed, 2 Mar 2022 17:31:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1amfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222HKMxa50856382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:20:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C8C42049;
 Wed,  2 Mar 2022 17:31:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57AFC42041;
 Wed,  2 Mar 2022 17:31:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9CCB52200FE;
 Wed,  2 Mar 2022 18:31:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Date: Wed,  2 Mar 2022 18:31:04 +0100
Message-Id: <20220302173114.927476-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wDLBteKCrxXYtKjAXv-rfFdghRBIgirB
X-Proofpoint-ORIG-GUID: wDLBteKCrxXYtKjAXv-rfFdghRBIgirB
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 clxscore=1034 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Hi,

This series adds a new SPI driver using the spi-mem interface for the
Aspeed static memory controllers of the AST2600, AST2500 and AST2400
SoCs.

 * AST2600 Firmware SPI Memory Controller (FMC)
 * AST2600 SPI Flash Controller (SPI1 and SPI2)
 * AST2500 Firmware SPI Memory Controller (FMC)
 * AST2500 SPI Flash Controller (SPI1 and SPI2)
 * AST2400 New Static Memory Controller (also referred as FMC)
 * AST2400 SPI Flash Controller (SPI)

It is based on the current OpenBMC kernel driver [1], using directly
the MTD SPI-NOR interface and on a patchset [2] previously proposed
adding support for the AST2600 only. This driver takes a slightly
different approach to cover all 6 controllers.

It does not make use of the controller register disabling Address and
Data byte lanes because is not available on the AST2400 SoC. We could
introduce a specific handler for new features available on recent SoCs
if needed. As there is not much difference on performance, the driver
chooses the common denominator: "User mode" which has been heavily
tested in [1]. "User mode" is also used as a fall back method when
flash device mapping window is too small.

Problems to address with spi-mem were the configuration of the mapping
windows and the calibration of the read timings. The driver handles
them in the direct mapping handler when some knowledge on the size of
the flash device is know. It is not perfect but not incorrect either.
The algorithm is one from [1] because it doesn't require the DMA
registers which are not available on all controllers.

Direct mapping for writes is not supported (yet). I have seen some
corruption with writes and I preferred to use the safer and proven
method of the initial driver [1]. We can improve that later.

The driver supports Quad SPI RX transfers on the AST2600 SoC but it
didn't have the expected results. Therefore it is not activated yet.
There are some issues on the pinctrl to investigate first.=20

The series does not remove the current Aspeed SMC driver but prepares
ground for its removal by changing its CONFIG option. This last step
can be addressed as a followup when the new driver using the spi-mem
interface has been sufficiently exposed.=20

Tested on:
=20
 * OpenPOWER Palmetto (AST2400)
 * Facebook Wedge 100 BMC (AST2400) by Tao Ren <rentao.bupt@gmail.com>
 * Evaluation board (AST2500)=20
 * Inspur FP5280G2 BMC  (AST2500) by John Wang <wangzq.jn@gmail.com>
 * Facebook Backpack CMM BMC (AST2500) by Tao Ren <rentao.bupt@gmail.com>
 * OpenPOWER Witherspoon (AST2500)
 * Evaluation board (AST2600 A0 and A3)
 * Rainier board (AST2600)
=20
[1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/cont=
rollers/aspeed-smc.c
[2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D212394

Thanks,

C.=20

Changes in v2:

 - Fixed dt_binding_check warnings (Rob)
 - New entry in MAINTAINERS=20
 - Addressed Lukas comments regarding the SPI controller registration
   and device removal. Checked with driver bind/unbind=20=20=20
 - Introduced setup and cleanup handlers and removed routine looping
   on the DT children properties (Pratyush)
 - Clarified in commit log requirements for training.
 - Removed defconfig changes of patch 1 since they were reverted in
   the last patch (Joel)

C=C3=A9dric Le Goater (10):
  mtd: spi-nor: aspeed: Rename Kconfig option
  ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
  dt-bindings: spi: Add Aspeed SMC controllers device tree binding
  spi: spi-mem: Add driver for Aspeed SMC controllers
  spi: aspeed: Add support for direct mapping
  spi: aspeed: Adjust direct mapping to device size
  spi: aspeed: Workaround AST2500 limitations
  spi: aspeed: Add support for the AST2400 SPI controller
  spi: aspeed: Calibrate read timings
  ARM: dts: aspeed: Enable Dual SPI RX transfers

 drivers/spi/spi-aspeed-smc.c                  | 1186 +++++++++++++++++
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   90 ++
 MAINTAINERS                                   |   10 +
 arch/arm/boot/dts/aspeed-g4.dtsi              |   12 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |   16 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |   17 +-
 drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
 drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 10 files changed, 1330 insertions(+), 19 deletions(-)
 create mode 100644 drivers/spi/spi-aspeed-smc.c
 create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fm=
c.yaml

--=20
2.34.1

