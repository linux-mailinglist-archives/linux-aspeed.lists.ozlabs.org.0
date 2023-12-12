Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782980F341
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 17:41:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRQPqaec;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqPWT6rfXz3bhr
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 03:41:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRQPqaec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPWC17kBz30Np
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 03:40:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCGQu84014652;
	Tue, 12 Dec 2023 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UQutNkyXkdRPHnX3fp0gpn41BNLxExuQ51FNo4S6SO0=;
 b=dRQPqaecFJgF6gQi2aFihXEIVxmfjO2Df4puagjOIpS9ApY86eD1JtU8xhIdMzbgxGyE
 twvc2mrfeF+yNkFuEp8o/ThZoCeY/DVaNTOW4hoaGdB0q1nIygefVE1rFDiOoZtQNCyu
 KBaHCGyWTig4nIrIquUgENTGjDtdLAPuigvzJ0ICDtmWb9016xpXsRC+GWPYZNYv3Sg2
 HHYTa1Fehq6vmoiCYHlYKH166vD72qswa4JrPAGKqn0rmZBk+3dsdm+j1fjF1RP0NNuy
 c2k4Xm5WguSpvLFReWAOgKAHYErHu8i+710SKZBSneLyB4Mv/LJ3XWS3pRxlKlZtqAZQ sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxs7x4uy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:24 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BCGRM4j017198;
	Tue, 12 Dec 2023 16:40:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uxs7x4uxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BCCZP88014824;
	Tue, 12 Dec 2023 16:40:22 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw42kcxc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:40:22 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BCGeLZB393928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 16:40:21 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A94D58059;
	Tue, 12 Dec 2023 16:40:21 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C099958053;
	Tue, 12 Dec 2023 16:40:19 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Dec 2023 16:40:19 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au, peterhuewe@gmx.de,
        jarkko@kernel.org, jgg@ziepe.ca, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com, ninad@linux.ibm.com,
        johannes.holland@infineon.com, linux@roeck-us.net, broonie@kernel.org
Subject: [PATCH v1 4/8] ARM: dts: aspeed: System1: Add i2c and muxes
Date: Tue, 12 Dec 2023 10:40:00 -0600
Message-Id: <20231212164004.1683589-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212164004.1683589-1-ninad@linux.ibm.com>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DxQM87i39S61sOem0cloWO3kDl9ImY-g
X-Proofpoint-ORIG-GUID: 5vHSFOg1KKpN5AvkgzB3b1y_ncnvzFZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_10,2023-12-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312120128
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This commit adds i2c devices and muxes.

Tested:
    This board is tested using the simics simulator.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 577 ++++++++++++++++++
 1 file changed, 577 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 01291b407f59..0557bff9f36a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -11,6 +11,65 @@ / {
 	model = "System1";
 	compatible = "ibm,system1-bmc", "aspeed,ast2600";
 
+	aliases {
+		i2c16 = &i2c8mux1chn0;
+		i2c17 = &i2c8mux1chn1;
+		i2c18 = &i2c8mux1chn2;
+		i2c19 = &i2c8mux1chn3;
+		i2c20 = &i2c8mux1chn4;
+		i2c21 = &i2c8mux1chn5;
+		i2c22 = &i2c8mux1chn6;
+		i2c23 = &i2c8mux1chn7;
+		i2c24 = &i2c3mux0chn0;
+		i2c25 = &i2c3mux0chn1;
+		i2c26 = &i2c3mux0chn2;
+		i2c27 = &i2c3mux0chn3;
+		i2c28 = &i2c3mux0chn4;
+		i2c29 = &i2c3mux0chn5;
+		i2c30 = &i2c3mux0chn6;
+		i2c31 = &i2c3mux0chn7;
+		i2c32 = &i2c6mux0chn0;
+		i2c33 = &i2c6mux0chn1;
+		i2c34 = &i2c6mux0chn2;
+		i2c35 = &i2c6mux0chn3;
+		i2c36 = &i2c6mux0chn4;
+		i2c37 = &i2c6mux0chn5;
+		i2c38 = &i2c6mux0chn6;
+		i2c39 = &i2c6mux0chn7;
+		i2c40 = &i2c7mux0chn0;
+		i2c41 = &i2c7mux0chn1;
+		i2c42 = &i2c7mux0chn2;
+		i2c43 = &i2c7mux0chn3;
+		i2c44 = &i2c7mux0chn4;
+		i2c45 = &i2c7mux0chn5;
+		i2c46 = &i2c7mux0chn6;
+		i2c47 = &i2c7mux0chn7;
+		i2c48 = &i2c8mux0chn0;
+		i2c49 = &i2c8mux0chn1;
+		i2c50 = &i2c8mux0chn2;
+		i2c51 = &i2c8mux0chn3;
+		i2c52 = &i2c8mux0chn4;
+		i2c53 = &i2c8mux0chn5;
+		i2c54 = &i2c8mux0chn6;
+		i2c55 = &i2c8mux0chn7;
+		i2c56 = &i2c14mux0chn0;
+		i2c57 = &i2c14mux0chn1;
+		i2c58 = &i2c14mux0chn2;
+		i2c59 = &i2c14mux0chn3;
+		i2c60 = &i2c14mux0chn4;
+		i2c61 = &i2c14mux0chn5;
+		i2c62 = &i2c14mux0chn6;
+		i2c63 = &i2c14mux0chn7;
+		i2c64 = &i2c15mux0chn0;
+		i2c65 = &i2c15mux0chn1;
+		i2c66 = &i2c15mux0chn2;
+		i2c67 = &i2c15mux0chn3;
+		i2c68 = &i2c15mux0chn4;
+		i2c69 = &i2c15mux0chn5;
+		i2c70 = &i2c15mux0chn6;
+		i2c71 = &i2c15mux0chn7;
+	};
+
 	chosen {
 		stdout-path = &uart5;
 		bootargs = "console=ttyS4,115200n8 earlycon";
@@ -54,10 +113,12 @@ vga_memory: region@bf000000 {
 			reg = <0xbf000000 0x01000000>;  /* 16M */
 		};
 	};
+
 };
 
 &adc1 {
 	status = "okay";
+
 	aspeed,int-vref-microvolt = <2500000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc8_default
@@ -186,3 +247,519 @@ &kcs3 {
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c3mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c3mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c3mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c3mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c3mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c3mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c3mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c3mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
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
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c6mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c6mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c6mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c6mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c7mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c7mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c7mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c7mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c7mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c7mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c7mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c7mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c8mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c8mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c8mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c8mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c8mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			i2c-mux@70 {
+				compatible = "nxp,pca9548";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "okay";
+				i2c-mux-idle-disconnect;
+
+				i2c8mux1chn0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c8mux1chn1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c8mux1chn2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c8mux1chn3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				i2c8mux1chn4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				i2c8mux1chn5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				i2c8mux1chn6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				i2c8mux1chn7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+		};
+
+		i2c8mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c8mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c8mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c14mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c14mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c14mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c14mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c14mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c14mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c14mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c14mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c15 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9548";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c15mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c15mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c15mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c15mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c15mux0chn4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			i2c-mux@70 {
+				compatible = "nxp,pca9548";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "okay";
+				i2c-mux-idle-disconnect;
+
+				i2c15mux1chn0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				i2c15mux1chn1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				i2c15mux1chn2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				i2c15mux1chn3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				i2c15mux1chn4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				i2c15mux1chn5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				i2c15mux1chn6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				i2c15mux1chn7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+		};
+
+		i2c15mux0chn5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c15mux0chn6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c15mux0chn7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
-- 
2.39.2

