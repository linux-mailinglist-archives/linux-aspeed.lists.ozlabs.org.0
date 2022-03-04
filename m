Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAA4CD00F
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 09:37:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K91Sn19LRz30hl
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 19:37:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K91SW5TqTz2ywb
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 19:37:31 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2247IXYX028487; 
 Fri, 4 Mar 2022 08:37:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eke90s86t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:09 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2248SrHq021740;
 Fri, 4 Mar 2022 08:37:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eke90s86c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248XW5P020673;
 Fri, 4 Mar 2022 08:37:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3ek4ka920p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:37:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2248b4c049611120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:37:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81EAAA405C;
 Fri,  4 Mar 2022 08:37:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D243AA4054;
 Fri,  4 Mar 2022 08:37:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:37:03 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1D5B32200FD;
 Fri,  4 Mar 2022 09:37:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v3 10/11] ARM: dts: aspeed: Enable Dual SPI RX transfers
Date: Fri,  4 Mar 2022 09:36:42 +0100
Message-Id: <20220304083643.1079142-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WCdqW2nETb4UQ0Mwgm4fKcA-MTAiRqt1
X-Proofpoint-ORIG-GUID: HtRGs9r0M2zi5Ybu2iNLriu2HSRkh_lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=746
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040044
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

All these controllers support at least Dual SPI. Update the DTs.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tao Ren <rentao.bupt@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
index 9ae67e83cf60..31e6569db97e 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -64,27 +64,32 @@ fmc: spi@1e620000 {
 			flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
+				spi-rx-bus-width =3D <2>;
 				spi-max-frequency =3D <50000000>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@2 {
 				reg =3D < 2 >;
 				compatible =3D "jedec,spi-nor";
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@3 {
 				reg =3D < 3 >;
 				compatible =3D "jedec,spi-nor";
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@4 {
 				reg =3D < 4 >;
 				compatible =3D "jedec,spi-nor";
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
@@ -100,6 +105,7 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
index c3e0a8e13c8a..29bf017899b6 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -66,18 +66,21 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@2 {
 				reg =3D < 2 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
@@ -93,12 +96,14 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
@@ -114,12 +119,14 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-=
g6.dtsi
index 1ad05dde19d2..ce93c56a21a7 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -106,18 +106,21 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@2 {
 				reg =3D < 2 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
@@ -133,12 +136,14 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
@@ -154,18 +159,21 @@ flash@0 {
 				reg =3D < 0 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@1 {
 				reg =3D < 1 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 			flash@2 {
 				reg =3D < 2 >;
 				compatible =3D "jedec,spi-nor";
 				spi-max-frequency =3D <50000000>;
+				spi-rx-bus-width =3D <2>;
 				status =3D "disabled";
 			};
 		};
--=20
2.34.1

