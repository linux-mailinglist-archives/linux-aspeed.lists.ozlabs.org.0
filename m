Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212F607A49
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Oct 2022 17:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv7NM2L5Rz3dsk
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Oct 2022 02:16:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JVpR8N+I;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JVpR8N+I;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv7N916f6z3dsR
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Oct 2022 02:16:24 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LF99ET031173;
	Fri, 21 Oct 2022 15:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w7DOAZ7bjYd5DlCK+vTzZ8rrvZ0nNvNBR+CY5uDp6Lk=;
 b=JVpR8N+IRvPmSCCKUh6dCI4r+99Chi5ys0rmn0xh9CkzOjwzgn127GHaYvm7XY/X8+30
 GNmdVpLOFttqnnXNjeot56OOoRMZqoZK+U+I9odt0ywBvwrm3JjQPDKudEkACkyqAwie
 ilDo1Ol6fH8JDgUJbe5IFCfsenSbUZrVuhnwlyWGzOrbrE45NBbXwq977l9MQW2EDIwa
 AmMJSxaWJem5mpQZTXwnW1RStu/0D6Qw3xfH+CzySUNr50EM2vHpyZYfKDL7glof3QEj
 mGhDn+pyQTTvM/nnAt0nU2ndxOs5XUjJXI9UgV8hQXNDo3zc/mN4eM0SW27IGFLtXfwB BA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbw7dsedq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 15:16:14 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LF5IBV019500;
	Fri, 21 Oct 2022 15:16:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01wdc.us.ibm.com with ESMTP id 3k9be2gvd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 15:16:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29LFGCbo47120718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 15:16:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 533D858060;
	Fri, 21 Oct 2022 15:16:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA15D58058;
	Fri, 21 Oct 2022 15:16:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.163.86])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 15:16:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: watchdog: aspeed: Document aspeed,pre-timeout-irq-us
Date: Fri, 21 Oct 2022 10:15:59 -0500
Message-Id: <20221021151559.781983-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221021151559.781983-1-eajames@linux.ibm.com>
References: <20221021151559.781983-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ws9Ti4BoPPa3Tw667wsCxzljzGpSvnbA
X-Proofpoint-ORIG-GUID: Ws9Ti4BoPPa3Tw667wsCxzljzGpSvnbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210090
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document this new property for the pre-timeout interrupt.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index a8197632d6d2..81d2c35ca7e3 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -40,12 +40,17 @@ Optional properties:
 			specified no external signal is sent.
  - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
 
-Optional properties for AST2500-compatible watchdogs:
+Optional properties for AST2500 and AST2600 compatible watchdogs:
  - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
 			 drive type to push-pull. The default is open-drain.
  - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
 			   is configured as push-pull, then set the pulse
 			   polarity to active-high. The default is active-low.
+ - aspeed,pre-timeout-irq-us: If aspeed,pre-timeout-irq-us is non-zero, the
+			      pre-timeout interrupt will be enabled for the
+			      watchdog. The interrupt will fire the specified
+			      number of microseconds before the watchdog expires
+			      and trigger a kernel panic.
 
 Example:
 
-- 
2.31.1

