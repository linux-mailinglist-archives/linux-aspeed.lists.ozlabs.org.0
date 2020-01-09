Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DB136203
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 21:59:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tz551Jm2zDqbX
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jan 2020 07:59:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tz4p0x8vzDqZm
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jan 2020 07:59:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009KwHUN060979; Thu, 9 Jan 2020 15:59:09 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xe9uybuja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 15:59:09 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 009KtpUx005665;
 Thu, 9 Jan 2020 20:59:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2xajb7d3cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 20:59:08 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 009Kx73E53150124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 20:59:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13F56AC062;
 Thu,  9 Jan 2020 20:59:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBC50AC059;
 Thu,  9 Jan 2020 20:59:05 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.92.233])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 20:59:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v5 01/12] dt-bindings: interrupt-controller: Add Aspeed SCU
 interrupt controller
Date: Thu,  9 Jan 2020 14:58:52 -0600
Message-Id: <20200109205903.27036-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200109205903.27036-1-eajames@linux.ibm.com>
References: <20200109205903.27036-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_05:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxlogscore=739 suspectscore=1 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001090173
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
 maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the Aspeed SCU interrupt controller and add an include file
for the interrupts it provides.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../aspeed,ast2xxx-scu-ic.txt                 | 23 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++++++
 .../interrupt-controller/aspeed-scu-ic.h      | 23 +++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
 create mode 100644 include/dt-bindings/interrupt-controller/aspeed-scu-ic.h

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
new file mode 100644
index 000000000000..251ed44171db
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
@@ -0,0 +1,23 @@
+Aspeed AST25XX and AST26XX SCU Interrupt Controller
+
+Required Properties:
+ - #interrupt-cells		: must be 1
+ - compatible			: must be "aspeed,ast2500-scu-ic",
+				  "aspeed,ast2600-scu-ic0" or
+				  "aspeed,ast2600-scu-ic1"
+ - interrupts			: interrupt from the parent controller
+ - interrupt-controller		: indicates that the controller receives and
+				  fires new interrupts for child busses
+
+Example:
+
+    syscon@1e6e2000 {
+        ranges = <0 0x1e6e2000 0x1a8>;
+
+        scu_ic: interrupt-controller@18 {
+            #interrupt-cells = <1>;
+            compatible = "aspeed,ast2500-scu-ic";
+            interrupts = <21>;
+            interrupt-controller;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 23e4bd382b15..e363fa9f7150 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2704,6 +2704,13 @@ S:	Maintained
 F:	drivers/pinctrl/aspeed/
 F:	Documentation/devicetree/bindings/pinctrl/aspeed,*
 
+ASPEED SCU INTERRUPT CONTROLLER DRIVER
+M:	Eddie James <eajames@linux.ibm.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
+F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h b/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
new file mode 100644
index 000000000000..f315d5a7f5ee
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_SCU_IC_H_
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_SCU_IC_H_
+
+#define ASPEED_SCU_IC_VGA_CURSOR_CHANGE			0
+#define ASPEED_SCU_IC_VGA_SCRATCH_REG_CHANGE		1
+
+#define ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI	2
+#define ASPEED_AST2500_SCU_IC_PCIE_RESET_HI_TO_LO	3
+#define ASPEED_AST2500_SCU_IC_LPC_RESET_LO_TO_HI	4
+#define ASPEED_AST2500_SCU_IC_LPC_RESET_HI_TO_LO	5
+#define ASPEED_AST2500_SCU_IC_ISSUE_MSI			6
+
+#define ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI	2
+#define ASPEED_AST2600_SCU_IC0_PCIE_PERST_HI_TO_LO	3
+#define ASPEED_AST2600_SCU_IC0_PCIE_RCRST_LO_TO_HI	4
+#define ASPEED_AST2600_SCU_IC0_PCIE_RCRST_HI_TO_LO	5
+
+#define ASPEED_AST2600_SCU_IC1_LPC_RESET_LO_TO_HI	0
+#define ASPEED_AST2600_SCU_IC1_LPC_RESET_HI_TO_LO	1
+
+#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_SCU_IC_H_ */
-- 
2.24.0

