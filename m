Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA32234D305
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 17:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8G3m64X7z304G
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Mar 2021 02:00:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l51NtAGM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l51NtAGM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8G3d2VQDz300C
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Mar 2021 02:00:43 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12TEXiik127565; Mon, 29 Mar 2021 11:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AN4hdJZ0MsMZuPxJjikdHVAlfmL9PV9h6iu+52Gywu8=;
 b=l51NtAGMo08XepkOtm2Y0fTkJjaXdTTmbl853GYkkgvBbVcPaPF9XLHifXW6zgpY7vte
 tGBwCUdXLjk4UVtXrPWblgujxXXivnaflOhP+gDdT8jMEU3aVkKQ1qu2tzXMzGYqfm+0
 y3p5EsEgq7JiOO3uxl2xZBND013t7kFTVe2WV/7a4S21c+A60Lmx8W3V5xRkKDlywicr
 mVmYtR79celz27wDBjl4m0hduxrTK1tV6YObORYf1SoaZqDvrsWlDXgMvhDITDik+7kk
 1jjlbPDUC/scQhaYV+WR6uAHhnx06PtxbIBE+yzR0fSoc1HiSQz+BgzFrn1PYMbwgkVQ aA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnkk07c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:00:34 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12TEqlee007196;
 Mon, 29 Mar 2021 15:00:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 37hvb8q4b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 15:00:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12TF0W4J31392048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:00:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8BD77806B;
 Mon, 29 Mar 2021 15:00:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A8C078072;
 Mon, 29 Mar 2021 15:00:31 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.3.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 15:00:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH 00/22] ARM: dts: aspeed: Updates for Rainier and Everest
 machines
Date: Mon, 29 Mar 2021 09:59:58 -0500
Message-Id: <20210329150020.13632-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IVIdx3z3jX6BanOTNOl3v6w3_mTtmkw_
X-Proofpoint-ORIG-GUID: IVIdx3z3jX6BanOTNOl3v6w3_mTtmkw_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_09:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=794 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series updates the device trees for the Rainier and Everest system
BMCs. For Rainier, the changes have been tested fairly extensively in
hardware. Everest has largely been tested in simulation and some basic
hardware verification testing.

Alpana Kumari (3):
  ARM: dts: aspeed: rainier: Add presence GPIOs
  ARM: dts: aspeed: everest: GPIOs support
  ARM: dts: aspeed: rainier: Support pass 2 planar

Brandon Wyman (2):
  ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
  ARM: dts: aspeed: everest: Add power supply i2c devices

Eddie James (7):
  ARM: dts: aspeed: rainier: Add additional processor CFAMs
  ARM: dts: aspeed: rainier: Enable fan watchdog
  ARM: dts: aspeed: rainier 4U: Fix fan configuration
  ARM: dts: Aspeed: Everest: Add FSI CFAMs and re-number engines
  ARM: dts: Aspeed: Everest: Add RTC
  ARM: dts: aspeed: everest: Enable fan watchdog
  ARM: dts: aspeed: Add Rainier 1S4U machine

Jim Wright (1):
  ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Matthew Barth (2):
  ARM: dts: Aspeed: Everest: Add max31785 fan controller device
  ARM: dts: Aspeed: Everest: Add pca9552 fan presence

PriyangaRamasamy (1):
  ARM: dts: aspeed: Everest: Add I2C components

Vishwanatha Subbanna (6):
  ARM: dts: aspeed: rainier: Add Operator Panel LEDs
  ARM: dts: aspeed: rainier: Add directly controlled LEDs
  ARM: dts: aspeed: rainier: Add leds that are off PCA9552
  ARM: dts: aspeed: rainier: Add leds that are off pic16f882
  ARM: dts: aspeed: rainier: Add leds on optional DASD cards
  ARM: dts: aspeed: rainier: Add leds on optional PCI cable cards

 arch/arm/boot/dts/Makefile                    |    3 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 1770 +++++++++++-
 .../boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   14 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts |  198 ++
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   14 +
 .../boot/dts/aspeed-bmc-ibm-rainier-v2.dts    |  198 ++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 2367 +++++++++++++++--
 7 files changed, 4290 insertions(+), 274 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts

-- 
2.27.0

