Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843338FD896
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rBm3Uu5S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgTv4jy0z3cRR
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rBm3Uu5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS65yTyz3cGM;
	Thu,  6 Jun 2024 07:23:34 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455K7DWI006841;
	Wed, 5 Jun 2024 21:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=xCm0+YRnt5KSLJvpEJFGcfGKqyndMMqxkk4ixOrcDpE=;
 b=rBm3Uu5SBxkNYRdlTt/bPol30TmmadBEFx0FAIRAA3pmmRH4lLsM0nNpX9NHwgJsdChs
 lkR2pJV8QJC6wQIlc/DzAJogqs6+qiEQwmAicTzZDe7t8tYWPWKXawDEkK1z3S3cyfbZ
 /Eca8UY02g07GhOPn3u12Ns+VZASw5GOzmZyhPR32m+Vchyy66teeidvYgjUGA/acDyg
 n6YTlrti/etqN2u4ovVkej7q8t2qvyhnIgsonDUk4m6E8qmm1x99BW3RqEG4Es6hN1wB
 fEUyh8ZzSdx27/Ce9NixOInRFV7oVXTBawX4PEUuOXeGg4kOeK9ifYfxS8wDcMfnyuTI yQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxjmr8yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IRk56008458;
	Wed, 5 Jun 2024 21:23:16 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:16 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LND9q57540998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:15 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21EBF58069;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D450258066;
	Wed,  5 Jun 2024 21:23:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 00/40] fsi: Add interrupt support
Date: Wed,  5 Jun 2024 16:22:32 -0500
Message-Id: <20240605212312.349188-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LOhfTrQLpVZ01E9a_1TLojXq6bWSBFUb
X-Proofpoint-ORIG-GUID: LOhfTrQLpVZ01E9a_1TLojXq6bWSBFUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050160
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series primarily adds interrupt support to the FSI driver subsystem.
There are a number of related changes and fixes. Firstly, the FSI clocking
model is improved to allow FSI engine drivers to obtain real clock rates
and calculate appropriate clock dividers. Secondly, much master code is
made common through the use of a regmap to access master registers. This
will prove more useful as additional FSI master drivers are added. Lastly,
interrupt support is added to the FSI I2C driver.

Changes since v3:
 - Fix compile warnings due to non-static local function and incorrect use
   of handle_irq_desc

Changes since v2:
 - Add several patches to fix additional issues found during testing
 - For local bus frequenccy, use cfam clock-frequency property instead of
   hardcoded master local bus divider
 - Change default local bus clock divider from 8 to 2
 - Zero the regmap_config structure in the common FSI initialization
   function
 - Add AST2700 direct AHB access of master registers
 - Remove slave interrupt handler since it's not used yet
 - For I2C driver, change minimum clock div to 3, use DIV_ROUND_UP instead
   of re-implementing it, and use better logic for checking for
   clock-frequency property
 - Add detail to I2C driver formatting change

Eddie James (40):
  fsi: hub: Set master index to link number plus one
  fsi: Move slave definitions to fsi-slave.h
  fsi: Fix slave addressing after break command
  fsi: Use a defined value for default echo delay
  fsi: Calculate local bus clock frequency
  fsi: core: Improve master read/write/error traces
  fsi: core: Add slave error trace
  fsi: core: Reset errors instead of clearing interrupts
  fsi: aspeed: Add AST2700 support
  fsi: core: Add slave spinlock
  fsi: core: Allow cfam device type aliases
  fsi: core: Add common regmap master functions
  fsi: core: Disable relative addressing during scan
  fsi: hub: Use common initialization and link enable
  fsi: aspeed: Use common initialization and link enable
  fsi: aspeed: Remove cfam reset sysfs file in error path and remove
  fsi: aspeed: Refactor trace functions
  fsi: aspeed: Don't clear all IRQs during OPB transfers
  fsi: aspeed: Only read result register for successful read
  fsi: aspeed: Switch to spinlock
  fsi: aspeed: Disable relative addressing and IPOLL for cfam reset
  fsi: aspeed: Use common master error handler
  fsi: core: Add interrupt support
  fsi: aspeed: Add interrupt support
  fsi: hub: Add interrupt support
  i2c: fsi: Calculate clock divider from local bus frequency
  i2c: fsi: Improve formatting
  i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
  i2c: fsi: Remove list structure of ports
  i2c: fsi: Define a function to check status error bits
  i2c: fsi: Add boolean for skip stop command on abort
  i2c: fsi: Add interrupt support
  fsi: hub master: Reset hub master after errors
  fsi: core: Add master register read-only sysfs
  fsi: core: Add slave register read-only sysfs
  fsi: i2cr: Adjust virtual CFAM ID to match Odyssey chip
  fsi: core: Add different types of CFAM
  spi: fsi: Calculate clock divider from local bus frequency
  ARM: dts: aspeed: P10 and tacoma: Set FSI clock frequency
  ARM: dts: aspeed: P10: Bump SPI max frequencies

 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  32 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  17 +-
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  16 +-
 drivers/fsi/Kconfig                           |   2 +
 drivers/fsi/fsi-core.c                        | 888 +++++++++++++++---
 drivers/fsi/fsi-master-aspeed.c               | 431 +++++----
 drivers/fsi/fsi-master-hub.c                  | 244 ++---
 drivers/fsi/fsi-master-i2cr.c                 |   2 +-
 drivers/fsi/fsi-master.h                      |  33 +
 drivers/fsi/fsi-slave.h                       | 117 +++
 drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
 drivers/spi/spi-fsi.c                         |  33 +-
 include/linux/fsi.h                           |   3 +
 include/trace/events/fsi.h                    | 171 ++--
 include/trace/events/fsi_master_aspeed.h      |  86 +-
 include/trace/events/i2c_fsi.h                |  45 +
 17 files changed, 1897 insertions(+), 687 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

-- 
2.39.3

