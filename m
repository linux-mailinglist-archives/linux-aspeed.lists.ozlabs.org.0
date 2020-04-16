Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A351AD0C1
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2020 22:04:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939Df618WzDsQ7
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Apr 2020 06:04:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939Cf1Tb2zDrQM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Apr 2020 06:03:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GK3pOB038859; Thu, 16 Apr 2020 16:03:52 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ewfqrx49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 16:03:51 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03GK3JUI026246;
 Thu, 16 Apr 2020 20:03:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 30b5h7g0wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 20:03:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03GK3gFk41812346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 20:03:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F1ABAC05B;
 Thu, 16 Apr 2020 20:03:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9BD2AC059;
 Thu, 16 Apr 2020 20:03:40 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.163.81.122])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 20:03:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v9 0/5] soc: aspeed: Add XDMA engine driver
Date: Thu, 16 Apr 2020 15:03:34 -0500
Message-Id: <1587067419-5107-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_08:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 suspectscore=3 phishscore=0 clxscore=1015
 adultscore=0 mlxlogscore=925 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160137
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds a driver to control the Aspeed XDMA engine embedded in the
AST2500 and AST2600. The XDMA engine performs automatic DMA operations
over PCI-E between the Aspeed SOC (acting as a BMC) and a host processor.

Changes since v8:
 - Use DMA API to allocate memory from reserved region.
 - Fix the driver for the AST2500 by keeping the command queue in kernel
   memory and copying the whole buffer to the reserved memory area before
   starting the operation.
 - Add krefs to the client structure to prevent use-after-free.
 - Switch reset-names binding to "device", "root-complex"

Eddie James (5):
  dt-bindings: soc: Add Aspeed XDMA Engine
  soc: aspeed: Add XDMA Engine Driver
  soc: aspeed: xdma: Add user interface
  soc: aspeed: xdma: Add reset ioctl
  ARM: dts: Aspeed: AST2600: Add XDMA PCI-E root control reset

 .../devicetree/bindings/soc/aspeed/xdma.txt        |   45 +
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    3 +-
 drivers/soc/aspeed/Kconfig                         |    8 +
 drivers/soc/aspeed/Makefile                        |    1 +
 drivers/soc/aspeed/aspeed-xdma.c                   | 1099 ++++++++++++++++++++
 include/uapi/linux/aspeed-xdma.h                   |   42 +
 7 files changed, 1205 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
 create mode 100644 drivers/soc/aspeed/aspeed-xdma.c
 create mode 100644 include/uapi/linux/aspeed-xdma.h

-- 
1.8.3.1

