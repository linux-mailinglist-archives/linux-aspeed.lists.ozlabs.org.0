Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42F63CB30
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Nov 2022 23:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMHbp5ZKvz3bWT
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Nov 2022 09:50:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGXb4k2R;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGXb4k2R;
	dkim-atps=neutral
X-Greylist: delayed 693 seconds by postgrey-1.36 at boromir; Wed, 30 Nov 2022 09:50:09 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMHbj09vgz30JR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Nov 2022 09:50:07 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATKQItk019161;
	Tue, 29 Nov 2022 22:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Mq1Vp+oOxQr8VV6vXTFrK1okxbGnx38bFu54ktkCjqo=;
 b=DGXb4k2RhZI7pNvPZoy+aYkbTpxZg/OgthJMNGG0bPaB8DJ0bUyY5ARDYPLHWXbqBa8Y
 HlF+qct3XBC7DpjS3nSFuCmc4j7T1lk3pMxhPTRFV+tVFkiwr+vDGXorKDI+Z7JF+BcD
 NHOBsxiFxX9L/SMZVLPs1zKUU8n05/4j0s4197TXdtMYGCcdPLzFE9IXuFD1LzoyEIMN
 Zb7z7Gi0FzP7fIZY/Tj5M+WioKn1K5f+mvjSerc7xQFJFB0MKf+lHk1fgsX6+5oZ/jmO
 30tM/4vj0n6FatBG9vRQyYtFqIOQv4gNv8w1MGRFo67hRzqA48jUVyBoxQHTnALCY+55 hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5bx0thcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 22:38:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATMcItm014096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 22:38:18 GMT
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 29 Nov
 2022 14:38:17 -0800
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: dts: aspeed-g6: Add more UART controller nodes
Date: Tue, 29 Nov 2022 14:38:05 -0800
Message-ID: <20221129223805.815027-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: roAmhsvQwMLUnz_U8Lncun9aCJsOEbce
X-Proofpoint-ORIG-GUID: roAmhsvQwMLUnz_U8Lncun9aCJsOEbce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxlogscore=888 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290135
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
Cc: linux-aspeed@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, linux-arm-kernel@lists.infradead.org, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add nodes for UART10, UART11, UART12 and UART13 into aspeed-g6.dtsi.

UART12 and UART13 have two mappable pin groups so their pinmux setting
should be specified in a board dts instead like below.

UART12:
  pinctrl-0 = <&pinctrl_uart12g0_default>;
  or
  pinctrl-0 = <&pinctrl_uart12g1_default>;

UART13:
  pinctrl-0 = <&pinctrl_uart13g0_default>;
  or
  pinctrl-0 = <&pinctrl_uart13g1_default>;

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b94ccdb5213d..afc356416d53 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -816,6 +816,58 @@ uart9: serial@1e790300 {
 				status = "disabled";
 			};
 
+			uart10: serial@1e790400 {
+				compatible = "ns16550a";
+				reg = <0x1e790400 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART10CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart10_default>;
+
+				status = "disabled";
+			};
+
+			uart11: serial@1e790500 {
+				compatible = "ns16550a";
+				reg = <0x1e790500 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART11CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart11_default>;
+
+				status = "disabled";
+			};
+
+			uart12: serial@1e790600 {
+				compatible = "ns16550a";
+				reg = <0x1e790600 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART12CLK>;
+				no-loopback-test;
+
+				status = "disabled";
+			};
+
+			uart13: serial@1e790700 {
+				compatible = "ns16550a";
+				reg = <0x1e790700 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART13CLK>;
+				no-loopback-test;
+
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.34.1

