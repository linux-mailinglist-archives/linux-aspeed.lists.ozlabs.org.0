Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC172648A4
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 17:20:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnMyX6WqVzDqg5
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 01:20:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jeOPEFs4; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnMx13Zw9zDqfp;
 Fri, 11 Sep 2020 01:19:01 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AF2oQe195661; Thu, 10 Sep 2020 11:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JOgiBh8i9eFcK4L0kZnRCGl04BXJvtGSR/Tg8yzhjsY=;
 b=jeOPEFs48b5qUFmLoBvDeWqzuMQqGiTGhTaO4DFmJ//sjxRN8AEuuhBVjzMzpAwLOhx9
 ihQFalyLmpJbPSz8VN0JA/pPNOKU96XKTo0sRNfScil2lBXJeFJxwg9ukyC87XkF7j/W
 OjWDucynNoYBS+wXJAdZYjPtBe37T5ivzObYSv6esO+1Q5/48RtDQkCwLFjMYzzmgxKH
 VlitlS8enCrkZUuK+RlUNgqCh9NXRJ+jTjSrvJe97vYOqbc0e6G1dzLbMgs5PBSUPwas
 7PBCHIDE9u3OuaUU01y5NDc3MpYx4HKs8sLGA4ahTUu1MjHo9qlCU2AkVA02mAL/bib4 lw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33fmme3y7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:18:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08AFCBRZ021811;
 Thu, 10 Sep 2020 15:18:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 33c2a9teqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 15:18:43 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08AFIgYF65143224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 15:18:42 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54AFE6E04C;
 Thu, 10 Sep 2020 15:18:42 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5D136E04E;
 Thu, 10 Sep 2020 15:18:41 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.140.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Sep 2020 15:18:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: Add AST2600 APLLdivN definition
Date: Thu, 10 Sep 2020 10:18:37 -0500
Message-Id: <20200910151840.25333-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910151840.25333-1-eajames@linux.ibm.com>
References: <20200910151840.25333-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_04:2020-09-10,
 2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=1 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100139
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org,
 alistair@popple.id.au, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 sboyd@kernel.org, robh+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a new clock definition for the "APLLdivN" as described in the
AST2600 specification. This clock is simply the APLL divided by a
factor defined in the SCU registers. It is the input to the FSI
bus.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 62b9520a00fd..5a9ae0a1d574 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_APLLN		71
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.26.2

