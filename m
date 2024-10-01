Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6298C5E9
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 21:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ75P1JPLz2ysZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 05:18:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727810309;
	cv=none; b=dW8B96b18tQstAn6rtD4Rx3gp/dsBqWrrxymNLrt94ATaMmkFjnUvCOy5b6Oph+aqN55mANOlo2q2bV6+M4mI+NDAWgIAh0eV71yl375eo/ofFfZbaOJiZsj5DthALRRa5YpBmytIosbKoKJV1++vfWQy2HxzFcjw6jT+62/Z/tE8Gmp49LKBfQMsnUHw/AnGeTXi6LwRbfvkyPipxi0L9n3kFGK0is/dNVx8XsvFrjkZi64pGEBv4Qr9v1bxDTZDD/5MK4GV8L5TCDRtUYq/9HdyjfR6WE0yY1o9iTBWyQAUrpwAFL5jQI8xZiBOnunX2rzBGO9vP4kM/Mua62Qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727810309; c=relaxed/relaxed;
	bh=jCNt0CizZjZ00jxp4ELdZxLVqqIWl3GZ609i6rIQxbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmGB4yK+M6D80ptwpjnGsR/TchGOAsXafdZ552zJ4m3BA2pWkQYyN73pOwZfce7CLeafyEhJd8McOEpy2kIOd0/3pzNMOp91dCuPEMkUZCvPLai7r9SaXo5wQy42GrtgJ0yPwPKJ+YyU/G+b2i2C08I3XqFE0/w1RxOcGDASWS2PTn2G+vMkrUob1nHMsRFzvXhd2QxRA3MvUNHN8T3Sf/z3Pcju+KaMtqLJJ2w+r5FwDkUUJQifhWuB4gmECIcCJMJuR/DxBW3qMLdss3cVxiADvCM2xbZLt2Vi/Ui9EhuMqpPZOYokcwKh5BOof4NYt7fcGJ0fWYIwe9qzH8pM7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B0mZyIWG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B0mZyIWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ75K3F2Gz2xHt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 05:18:29 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491GLoNj019766;
	Tue, 1 Oct 2024 19:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=jCNt0CizZjZ00
	jxp4ELdZxLVqqIWl3GZ609i6rIQxbs=; b=B0mZyIWG9lYJW7Ly2MvtJRBsBAK9l
	O/FrkdmaTA44Cyz+aZaOc71HC7kJapfvkLqCNweV47nwPqSIi9YY9socdt/hFwnz
	MO9xNSGxVX2ag4RcIPrsN9beQgouBff47ZuUc/9qWxb2S7/or4ZlQ1i6k9Cc8GYv
	BqBhAsSAa1mquz74/kYVR++yX4FcEHiKne5U5sQ+bVU/jRpD7vNG26PUIhXwnt2G
	5hg22AEtKs+Kd4BGOsIvTdWXxw4wYoYIC5ef1V2+BRXZruY2FsiiY/QPPY23MOcQ
	+Cwj53t1cmWlTC4DMll6lEGvKEpWPdhR2fZjzGqOXX7wPoaxz5bL4Qqmg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420mhdrue4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491I9ZZr007994;
	Tue, 1 Oct 2024 19:18:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xvgxxe45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:11 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491JIAuX11207248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 19:18:10 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 195275804E;
	Tue,  1 Oct 2024 19:18:10 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7461E5803F;
	Tue,  1 Oct 2024 19:18:09 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 19:18:09 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, eajames@linux.ibm.com
Subject: [PATCH v1 2/3] ARM: dts: aspeed: system1: Enable serial gpio0
Date: Tue,  1 Oct 2024 14:17:49 -0500
Message-ID: <20241001191756.234096-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001191756.234096-1-ninad@linux.ibm.com>
References: <20241001191756.234096-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Oi2ttzEgZtQnkTKh85OYLwQWJHCri57Y
X-Proofpoint-ORIG-GUID: Oi2ttzEgZtQnkTKh85OYLwQWJHCri57Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=675
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010125
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable serial GPIO0. Set number of GPIO lines to 128 and bus frequency
to 1MHz.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 1cbf257fb0a0b..c0219167a337a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -398,6 +398,12 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
+&sgpiom0 {
+	status = "okay";
+	ngpios = <128>;
+	bus-frequency = <1000000>;
+};
+
 &ibt {
 	status = "okay";
 };
-- 
2.43.0

