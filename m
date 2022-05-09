Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D605203D5
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 May 2022 19:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxpl738ZHz3bqL
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 May 2022 03:56:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxpl42t7Qz3bcv
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 May 2022 03:56:32 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Kxpl33zStz4xcY;
 Tue, 10 May 2022 03:56:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kxpkr500lz4xVP;
 Tue, 10 May 2022 03:56:20 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
Date: Mon,  9 May 2022 19:56:05 +0200
Message-Id: <20220509175616.1089346-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
There are some issues on the pinctrl to investigate first. 

Tested on:
 
 * OpenPOWER Palmetto (AST2400)
 * Facebook Wedge 100 BMC (AST2400) by Tao Ren <rentao.bupt@gmail.com>
 * Evaluation board (AST2500) 
 * Inspur FP5280G2 BMC (AST2500) by John Wang <wangzq.jn@gmail.com>
 * Facebook Backpack CMM BMC (AST2500) by Tao Ren <rentao.bupt@gmail.com>
 * OpenPOWER Witherspoon (AST2500)
 * Evaluation board (AST2600 A0 and A3)
 * Rainier board (AST2600)
 
[1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
[2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394

Thanks,

C. 

Changes in v7:

  - Moved removal of the old binding desccription in the binding patch 

Changes in v6:

  - Removed tabs for aspeed,ast2600-fmc.yaml

Changes in v5:

  - Rebased on 5.18-rc5
  - More AST2600 tests from Jae Hyun Yoo
  - Cleanups of aspeed,ast2600-fmc.yaml
  - Modified aspeed_spi_send_cmd_addr() routine to return an error  
  - Simplified conditions in exec_op() handler when computing
    the controller setting
  - Dropped the use of memcpy_fromio for the SFDP address space

Changes in v4:

  - Rebased on 5.18 
  - Removal of the SPI-NOR base driver (we had enough tests)
  - Fix for small size flash devices on AST2600 (Potin)

Changes in v3:

 - Fixed compile warning on aspeed_spi_dirmap_read() prototype reported
   by kernel test robot 
 - Removed unnecessary entry in ast2600-fmc.yaml
 - New patch from Tao to set spi-max-frequency on all FMC devices

Changes in v2:

 - Fixed dt_binding_check warnings (Rob)
 - New entry in MAINTAINERS 
 - Addressed Lukas comments regarding the SPI controller registration
   and device removal. Checked with driver bind/unbind   
 - Introduced setup and cleanup handlers and removed routine looping
   on the DT children properties (Pratyush)
 - Clarified in commit log requirements for training.
 - Removed defconfig changes of patch 1 since they were reverted in
   the last patch (Joel)

Cédric Le Goater (9):
  ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
  dt-bindings: spi: Convert the Aspeed SMC controllers device tree
    binding
  spi: spi-mem: Convert Aspeed SMC driver to spi-mem
  spi: aspeed: Add support for direct mapping
  spi: aspeed: Adjust direct mapping to device size
  spi: aspeed: Workaround AST2500 limitations
  spi: aspeed: Add support for the AST2400 SPI controller
  spi: aspeed: Calibrate read timings
  ARM: dts: aspeed: Enable Dual SPI RX transfers

Potin Lai (1):
  mtd: spi-nor: aspeed: set the decoding size to at least 2MB for
    AST2600

Tao Ren (1):
  ARM: dts: aspeed-g4: Set spi-max-frequency for all flashes

 drivers/mtd/spi-nor/controllers/aspeed-smc.c  |  921 -------------
 drivers/spi/spi-aspeed-smc.c                  | 1210 +++++++++++++++++
 .../devicetree/bindings/mtd/aspeed-smc.txt    |   51 -
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   82 ++
 MAINTAINERS                                   |   10 +
 arch/arm/boot/dts/aspeed-g4.dtsi              |   16 +-
 arch/arm/boot/dts/aspeed-g5.dtsi              |   16 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |   17 +-
 drivers/mtd/spi-nor/controllers/Kconfig       |   10 -
 drivers/mtd/spi-nor/controllers/Makefile      |    1 -
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 12 files changed, 1347 insertions(+), 999 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/controllers/aspeed-smc.c
 create mode 100644 drivers/spi/spi-aspeed-smc.c
 delete mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml

-- 
2.35.1

