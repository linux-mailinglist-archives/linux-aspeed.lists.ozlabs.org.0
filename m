Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543E2648A2
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 17:19:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnMxt0pD1zDqg3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 01:19:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FMEDkw73; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnMwt0km1zDqfq;
 Fri, 11 Sep 2020 01:18:53 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AF20KA110560; Thu, 10 Sep 2020 11:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RUjE8geQUfKJdleFxhslp2zP2B33QNPoIINZYifD8iU=;
 b=FMEDkw733leENqm6oVNBrKXrUlkoJX10udLb+AphbqatfaLEA3KgFRC4msJ+iMpDPlZa
 0+N5Xx28E9/JTDmU9HiExKyuT8T81QDpBTN0onDPC2oZJn/yzvo+N5qiviHDIo+1F4u/
 16qYfex3vHHgf9hwGfnm86ztj6kyPBQaoM0PZw4GbUXFOZQVL0uUy9+IutDIbV9slfXW
 M9paM6IA2GNodtdoDx6semhD0AR5662XyhCpRbbA6LBproPOOp+xYoxxtq6DsnT3wlts
 CTUAsigwf/ToeNSfItp4vnXL1qdE76O+SzEAZhF8jOz98Som3cPzFjOYWpS6gn09dcTR sA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33fp6ss20d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:18:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08AFCAE0021779;
 Thu, 10 Sep 2020 15:18:44 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 33c2a9teqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 15:18:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08AFIe0N47448510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 15:18:40 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 946946E050;
 Thu, 10 Sep 2020 15:18:43 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 083AA6E053;
 Thu, 10 Sep 2020 15:18:43 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.140.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Sep 2020 15:18:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: fsi: Aspeed master: Add bus-frequency
 property
Date: Thu, 10 Sep 2020 10:18:39 -0500
Message-Id: <20200910151840.25333-4-eajames@linux.ibm.com>
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
 clxscore=1015 mlxscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100130
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

Document the bus-frequency property.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
index a513e65ec0c9..d84bd19526ca 100644
--- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
@@ -17,6 +17,7 @@ Optional properties:
 
  - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
  - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
+ - bus-frequency: the frequency of the FSI bus
 
 
 Examples:
-- 
2.26.2

