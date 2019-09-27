Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC865C0CF7
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2019 22:59:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g40s3xDyzDr1D
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Sep 2019 06:59:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g40b27rgzDr0L
 for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Sep 2019 06:59:10 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RKlfCD084311; Fri, 27 Sep 2019 16:58:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9srx88th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 16:58:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8RKjEXj016489;
 Fri, 27 Sep 2019 20:58:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 2v5bg7u7qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 20:58:52 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RKwp8X60621256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 20:58:51 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9985F6E058;
 Fri, 27 Sep 2019 20:58:51 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED77E6E053;
 Fri, 27 Sep 2019 20:58:50 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 20:58:50 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] irqchip: Add Aspeed SCU Interrupt Controller
Date: Fri, 27 Sep 2019 15:58:45 -0500
Message-Id: <1569617929-29055-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=677 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270173
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-aspeed@lists.ozlabs.org, maz@kernel.org, robh+dt@kernel.org,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The Aspeed SOCs provide some interrupts through the System Control
Unit registers. Add an interrupt controller that provides these
interrupts to the system. Add the interrupt controller to the AST25XX
and AST26XX devicetrees.

Changes since v1:
 - add a spinlock to protect read-modify-write operation for irq masking
 - use readl/writel relaxed versions
 - add a comment explaining the irq status/enable register
 - provide affinity callback that returns -EINVAL

Eddie James (4):
  dt-bindings: interrupt-controller: Add Aspeed SCU interrupt controller
  irqchip: Add Aspeed SCU interrupt controller
  ARM: dts: aspeed: ast2500: Add SCU interrupt controller
  ARM: dts: aspeed: ast2600: Add SCU interrupt controllers

 .../interrupt-controller/aspeed,ast2xxx-scu-ic.txt |  26 +++
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  11 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  18 ++
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-aspeed-scu-ic.c                | 233 +++++++++++++++++++++
 .../interrupt-controller/aspeed-scu-ic.h           |  23 ++
 7 files changed, 319 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
 create mode 100644 drivers/irqchip/irq-aspeed-scu-ic.c
 create mode 100644 include/dt-bindings/interrupt-controller/aspeed-scu-ic.h

-- 
1.8.3.1

