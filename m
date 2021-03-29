Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1634D31B
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G4S1m6Bz30DF
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+mgJGi/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F+mgJGi/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3j4Wxbz304H
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:49 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEWvXX179657; Mon, 29 Mar 2021 11:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GUfCxaLqvqw8EpBkOhdXVTA966U06w+54uyyBfRbeng=;
 b=F+mgJGi/JsMDdL+Hc1HfhKk29TEqJp2feBTUDQRhXPz0kQLHOtRlUJEMGshqr8TRvB7X
 4MEi6ff1yxeWV7HhrJdaxxzgXfoxiayPbuhVYRt+uhRXnjs7BH+3BxvN3zvqZ2J+lDcs
 E05bH+33ULBBO3XrO2KMr+6v0/QPuICVtqdY9icHqU6uZ2gFPByRl1yqzehuNbtZhb6x
 4xrjtpHx1Lu6owPw0C8TWKy380etEjSfMDiAwfavDgRlufeRx2YLp8MILFUW3QLmaOdU
 xw4y1cYEjLXIK2plZ0qIB5rsObwfwgVtbKSNfEyeqqqMRa2sldEDswoXL+9/xe5jypHF dw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37juxbj3jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:40 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TExwKg006726;
 Mon, 29 Mar 2021 15:00:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 37hvb92wnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0cZO23069108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE5578066;
 Mon, 29 Mar 2021 15:00:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8387F7805E;
 Mon, 29 Mar 2021 15:00:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 13/22] ARM: dts: Aspeed: Everest: Add max31785 fan controller
 device
Date: Mon, 29 Mar 2021 10:00:11 -0500
Message-Id: <20210329150020.13632-14-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210329150020.13632-1-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KJBGx8Cmk0RzRoLt7njG8T5Y18WdrhLd
X-Proofpoint-ORIG-GUID: KJBGx8Cmk0RzRoLt7njG8T5Y18WdrhLd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Matthew Barth <msbarth@us.ibm.com>, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Matthew Barth <msbarth@us.ibm.com>

Add the max31785 configuration at address 0x52 on i2c14 behind mux0
channel 3.

Signed-off-by: Matthew Barth <msbarth@us.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 71 ++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index ab7be4d511a5..cc45608b0cbc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -59,10 +59,11 @@ aliases {
 		i2c27 = &i2c14mux0chn0;
 		i2c28 = &i2c14mux0chn1;
 		i2c29 = &i2c14mux0chn2;
-		i2c30 = &i2c14mux1chn0;
-		i2c31 = &i2c14mux1chn1;
-		i2c32 = &i2c14mux1chn2;
-		i2c33 = &i2c14mux1chn3;
+		i2c30 = &i2c14mux0chn3;
+		i2c31 = &i2c14mux1chn0;
+		i2c32 = &i2c14mux1chn1;
+		i2c33 = &i2c14mux1chn2;
+		i2c34 = &i2c14mux1chn3;
 
 		serial4 = &uart5;
 
@@ -457,6 +458,68 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 		};
+
+		i2c14mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			max31785@52 {
+				compatible = "maxim,max31785a";
+				reg = <0x52>;
+
+				fan@0 {
+					compatible = "pmbus-fan";
+					reg = <0>;
+					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
+				};
+
+				fan@1 {
+					compatible = "pmbus-fan";
+					reg = <1>;
+					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
+				};
+
+				fan@2 {
+					compatible = "pmbus-fan";
+					reg = <2>;
+					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
+				};
+
+				fan@3 {
+					compatible = "pmbus-fan";
+					reg = <3>;
+					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
+				};
+			};
+		};
 	};
 
 	i2c-switch@71 {
-- 
2.27.0

