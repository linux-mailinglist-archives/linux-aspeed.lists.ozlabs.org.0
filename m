Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B683811458B
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Dec 2019 18:16:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TMnK1vl8zDqZx
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Dec 2019 04:16:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TMmh6Db7zDqZb
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Dec 2019 04:15:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5H8CvB015468; Thu, 5 Dec 2019 12:15:20 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq2xc1qtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 12:15:20 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB5HFHLC014850;
 Thu, 5 Dec 2019 17:15:19 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 2wkg278cn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 17:15:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB5HFIvL48628090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 17:15:18 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04C386E052;
 Thu,  5 Dec 2019 17:15:18 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65A6A6E05D;
 Thu,  5 Dec 2019 17:15:17 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 17:15:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
Date: Thu,  5 Dec 2019 11:15:05 -0600
Message-Id: <1575566112-11658-6-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_05:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=1 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912050144
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

Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
 - Add 'clocks', 'scu', 'sdmc', 'vga-mem', and 'pcie-device' property
   documentation

 .../devicetree/bindings/soc/aspeed/xdma.txt        | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt

diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
new file mode 100644
index 0000000..942dc07
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
@@ -0,0 +1,43 @@
+Aspeed AST25XX and AST26XX XDMA Engine
+
+The XDMA Engine embedded in the AST2500 and AST2600 SOCs can perform automatic
+DMA operations over PCI between the SOC (acting as a BMC) and a host processor.
+
+Required properties:
+ - compatible		: must be "aspeed,ast2500-xdma" or
+			  "aspeed,ast2600-xdma"
+ - reg			: contains the address and size of the memory region
+			  associated with the XDMA engine registers
+ - clocks		: clock specifier for the clock associated with the
+			  XDMA engine
+ - resets		: reset specifier for the syscon reset associated with
+			  the XDMA engine
+ - interrupts-extended	: two interrupt nodes; the first specifies the global
+			  interrupt for the XDMA engine and the second
+			  specifies the PCI-E reset or PERST interrupt.
+ - scu			: a phandle to the syscon node for the system control
+			  unit of the SOC
+ - sdmc			: a phandle to the syscon node for the SDRAM memory
+			  controller of the SOC
+ - vga-mem		: contains the address and size of the VGA memory space
+			  to be used by the XDMA engine
+
+Optional properties:
+ - pcie-device		: should be either "bmc" or "vga", corresponding to
+			  which device should be used by the XDMA engine for
+			  DMA operations. If this property is not set, the XDMA
+			  engine will use the BMC PCI-E device.
+
+Example:
+
+    xdma@1e6e7000 {
+        compatible = "aspeed,ast2500-xdma";
+        reg = <0x1e6e7000 0x100>;
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        resets = <&syscon ASPEED_RESET_XDMA>;
+        interrupts-extended = <&vic 6>, <&scu_ic ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
+        scu = <&syscon>;
+        sdmc = <&edac>;
+        pcie-device = "bmc";
+        vga-mem = <0x9f000000 0x01000000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 398861a..528a142 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2707,6 +2707,12 @@ S:	Maintained
 F:	drivers/media/platform/aspeed-video.c
 F:	Documentation/devicetree/bindings/media/aspeed-video.txt
 
+ASPEED XDMA ENGINE DRIVER
+M:	Eddie James <eajames@linux.ibm.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/aspeed/xdma.txt
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 L:	acpi4asus-user@lists.sourceforge.net
-- 
1.8.3.1

