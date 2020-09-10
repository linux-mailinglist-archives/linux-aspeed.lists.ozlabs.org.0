Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AA2648A3
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 17:20:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnMyF0Vs0zDqg6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 01:20:05 +1000 (AEST)
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
 header.s=pp1 header.b=nZV1c6Sy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnMwx2d08zDqfp;
 Fri, 11 Sep 2020 01:18:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AF2tjt169967; Thu, 10 Sep 2020 11:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8Mlftey53B/H6IK5E2iIO4KQDXor/nn1hnefl9i/DEI=;
 b=nZV1c6SyU/XJM+SmfzYYQR45GhzOfmVxod/LNdlKa+UEedZzQp/XQHjkAKYw7IYLtcaC
 XN8wgVcRxkiOOCHEOJUdbof1ywbgr6RR9gXlK7ST7JIZ9wh27Fev1XpyzykkqmNNx6EH
 jKT43RXBgitOfZhzugXp9mYslQ3ww7H9OaU1x7Mph3GQeLTYadxWarB4SZhbTiMI3yfP
 WKUUkMrnPsfYEpxaNhTE3XeOZ6Dfodum+2hzPN3HY7GCK1TK5C8dZLfIwDPuXdV8xQJ+
 BmvLJPjBCI6xj7G1JauBrmYGBuPMDdCmcJGEXshrDeC6+jb8hCFTD3R4YnH+151rWzjF jw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33fms8vt4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:18:43 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08AFBvXo012745;
 Thu, 10 Sep 2020 15:18:42 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 33d46n59xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 15:18:42 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08AFIfSB61407558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 15:18:41 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1C6A6E04C;
 Thu, 10 Sep 2020 15:18:41 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D9F36E04E;
 Thu, 10 Sep 2020 15:18:40 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.140.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Sep 2020 15:18:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 0/4] clk: AST2600 and FSI: Add APLL to control FSI bus
 frequency
Date: Thu, 10 Sep 2020 10:18:36 -0500
Message-Id: <20200910151840.25333-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_04:2020-09-10,
 2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 mlxlogscore=754
 suspectscore=1 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009100135
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

Add functionality to control the APLL clock on the AST2600. The APLL provides
the clock for the FSI master on the AST2600. Then add a devicetree property to
set the AST2600 FSI master bus frequency.

Eddie James (4):
  dt-bindings: clock: Add AST2600 APLLdivN definition
  clk: ast2600: Add functionality to the APLL clock
  dt-bindings: fsi: Aspeed master: Add bus-frequency property
  fsi: Aspeed master: Set bus frequency from devicetree

 .../bindings/fsi/fsi-master-aspeed.txt        |   1 +
 drivers/clk/clk-ast2600.c                     | 177 ++++++++++++++++--
 drivers/fsi/fsi-master-aspeed.c               |   5 +
 include/dt-bindings/clock/ast2600-clock.h     |   1 +
 4 files changed, 172 insertions(+), 12 deletions(-)

-- 
2.26.2

