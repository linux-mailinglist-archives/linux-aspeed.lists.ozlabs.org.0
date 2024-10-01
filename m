Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6998C5E8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 21:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ75L6FR0z2yZ0
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 05:18:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727810308;
	cv=none; b=WsS8VZ6dDVXCRbOarXJzx9YJKmRL2iJIuYYlKuqYNeBwRYHldLSe5acqPykpFg7Ye/sXPNvcvZvZ1zrFObxLXVr1JBa8dExHRkbV1UghwyQkuF/08SO57SPgfVg7proyB+bl94UYjgsAoPvLP7EdklUJxcvPno1FPLpODZCgtx1p8BP1JJjPDKjnYLfqnA4bZVRxeVJS4XaYpx/cLmAazH+QE5dDLdwWrVMwF7m5hjyPxBn7Qld5NMvApyipFUuMIQyR2FG9pNA41AIwCflgobECar1YXnQk7WiLz25wDG+SIdw396FB81bTlz4udftPJHuwWi1v4Ooi/y3PEA5ssA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727810308; c=relaxed/relaxed;
	bh=mD/5D8Eo+dQm7ngs61A8LO8bCXXX9Bs+h1+t5Sfk+W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeTwoRtvR8qHHRum5B2OBwgTZ8g4YEJ7YircJbdgcdU8wguwdCubetmc+QxY6/rj+lSlT5LwedQ+o59h/lBC9cZjiIvc3Paj45w5t1RXFrKPCwCsAUeB9WzTtVHlvRfvm6jD16znsyxeBsdXQWaPV2DLgQqmJoYGloj3/I4QNTud3r5tHq401en5na/PhlecGDoLLrG9pdxEzJZb7dHDXzOqIPcBAFM44fmPzuOebzs2ui5etTYg7m1rZEjsbeYbrBheoNsEeP1dm+uNcMhmo3EtpRlaXSdCj/kU6JIopqosMi+OJLLmKLi7SOrNf2yL4YlJRMQ46buITkqaTMdC/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MYpZ+Xps; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MYpZ+Xps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ75H1ts0z2xHt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 05:18:26 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491JHBKV011701;
	Tue, 1 Oct 2024 19:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=mD/5D8Eo+dQm7
	ngs61A8LO8bCXXX9Bs+h1+t5Sfk+W0=; b=MYpZ+XpsXViBh6zZJ+2qfCJl1tb5U
	Vv1URxvUHKNDFjJ3meBygltjss0pop7dGWtZgctqFM6LgdXpRVulzHjli5vtrkya
	yxp4DYDq0T+NNWxvLfw/fvj6wB64b9Y3KEZe+3r7IZ3mVn7yudreTALydxsgB2YQ
	Jn6Uj6PgFFbWk/sllI47LidK0w0Gx1BwoZGQuFeP+Oq88bdL9uTa0AUu1gznOOVX
	98YIqD1oDpXq8jzv7KTsFPIRk7PZfZHmuX1O5SFNR1x/TihVFSM3516C4pawJrph
	y6602xy5oui8YcEqouCD6fTiqqly+Ucy5L5gk++1aP9jLmkCcdHyeWQPA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420q3p0048-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491HwQvc007989;
	Tue, 1 Oct 2024 19:18:10 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xvgxxe41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 19:18:10 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491JI9QM21693166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 19:18:09 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4246C5804E;
	Tue,  1 Oct 2024 19:18:09 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CCF25803F;
	Tue,  1 Oct 2024 19:18:08 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 19:18:08 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, eajames@linux.ibm.com
Subject: [PATCH v1 1/3] ARM: dts: aspeed: system1: Bump up i2c busses freq
Date: Tue,  1 Oct 2024 14:17:48 -0500
Message-ID: <20241001191756.234096-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001191756.234096-1-ninad@linux.ibm.com>
References: <20241001191756.234096-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jDzzMLugSTVAW0G0J-KeCi0oVSDN59jr
X-Proofpoint-ORIG-GUID: jDzzMLugSTVAW0G0J-KeCi0oVSDN59jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=694 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010125
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

Bump up i2c8 and i2c15 bus frequency so that PCIe slot and FPGA runs
faster

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index f3efecc7eb8d0..1cbf257fb0a0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -1007,6 +1007,7 @@ i2c7mux0chn7: i2c@7 {
 
 &i2c8 {
 	status = "okay";
+	bus-frequency = <400000>;
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
@@ -1468,6 +1469,7 @@ i2c14mux0chn7: i2c@7 {
 
 &i2c15 {
 	status = "okay";
+	bus-frequency = <400000>;
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
-- 
2.43.0

