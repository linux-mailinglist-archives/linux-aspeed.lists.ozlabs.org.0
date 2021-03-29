Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5834D31C
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G4Y2yZTz303t
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lCX7yRW6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lCX7yRW6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3l4pgdz2yYx
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEX6hJ012317; Mon, 29 Mar 2021 11:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pRb7O409tbGr59YO9erj6yxG3YR+PSARjcMn0Yk0Y54=;
 b=lCX7yRW666HsosvaRJ9gW6Zp5C4rso5QeUV+FY2PYT1Ptp0wrnE7JqLr/VlojLWHD3kf
 teiFnxSwuZzFtAvRTKMZjPAwTR4cI7JVFRLrebp0k4ZIwCvTE0nC4vaOUOfscbrmtVmJ
 vHevbAXDdS9eZHi8Tad3eiCYgISuc0pfFlxAmhzVFOynT2kqDmmHfFP6v92JP5zOXbBv
 QX/iC7f2L7tLgdXZOgQXl+Wze7YLJrIzr+Y6dxyJQMD7dZs8EIOhy5dI9e5FngsTmOxC
 UimN0tl4ch7z19vpss6+8nuOk1U5Pc7UURjIFYEE1cG7CtffEzW6cRAlEeBZ3vHthjeV LA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jpbverfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:43 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TExnP8012693;
 Mon, 29 Mar 2021 15:00:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 37jqmmy6qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0fmB30802198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B540C78060;
 Mon, 29 Mar 2021 15:00:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5688278063;
 Mon, 29 Mar 2021 15:00:41 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 21/22] ARM: dts: aspeed: rainier: Support pass 2 planar
Date: Mon, 29 Mar 2021 10:00:19 -0500
Message-Id: <20210329150020.13632-22-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jo-5GPjr8Stl84UCbrYxXaEq0jzEAsne
X-Proofpoint-ORIG-GUID: Jo-5GPjr8Stl84UCbrYxXaEq0jzEAsne
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290112
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Alpana Kumari <alpankum@in.ibm.com>, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Alpana Kumari <alpankum@in.ibm.com>

Add device trees for the second version of the Rainier system planar.
Include the original dts and make the necessary changes.

Signed-off-by: Alpana Kumari <alpankum@in.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                    |   2 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts | 198 ++++++++++++++++++
 .../boot/dts/aspeed-bmc-ibm-rainier-v2.dts    | 198 ++++++++++++++++++
 3 files changed, 398 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9fb6086a53c9..c2c8ec8c1cd5 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1423,7 +1423,9 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier-v2.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
+	aspeed-bmc-ibm-rainier-4u-v2.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
new file mode 100644
index 000000000000..6712b2e7e7b5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier-4u.dts"
+
+/ {
+	i2c20 = &i2c4mux0chn0;
+	i2c21 = &i2c4mux0chn1;
+	i2c22 = &i2c4mux0chn2;
+	i2c23 = &i2c5mux0chn0;
+	i2c24 = &i2c5mux0chn1;
+	i2c25 = &i2c6mux0chn0;
+	i2c26 = &i2c6mux0chn1;
+	i2c27 = &i2c6mux0chn2;
+	i2c28 = &i2c6mux0chn3;
+	i2c29 = &i2c11mux0chn0;
+	i2c30 = &i2c11mux0chn1;
+};
+
+&i2c4 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+	};
+};
+
+&i2c5 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c5mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+	/delete-node/ eeprom@53;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c11 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts
new file mode 100644
index 000000000000..24cf12150919
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier.dts"
+
+/ {
+	i2c20 = &i2c4mux0chn0;
+	i2c21 = &i2c4mux0chn1;
+	i2c22 = &i2c4mux0chn2;
+	i2c23 = &i2c5mux0chn0;
+	i2c24 = &i2c5mux0chn1;
+	i2c25 = &i2c6mux0chn0;
+	i2c26 = &i2c6mux0chn1;
+	i2c27 = &i2c6mux0chn2;
+	i2c28 = &i2c6mux0chn3;
+	i2c29 = &i2c11mux0chn0;
+	i2c30 = &i2c11mux0chn1;
+};
+
+&i2c4 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+	};
+};
+
+&i2c5 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c5mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+	/delete-node/ eeprom@53;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c11 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
-- 
2.27.0

