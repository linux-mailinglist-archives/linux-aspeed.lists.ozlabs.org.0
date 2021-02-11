Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A94231935A
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Feb 2021 20:49:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc6dg0flnzDwqP
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Feb 2021 06:49:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yqw6Jm5U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc6dQ2jDCzDwp7;
 Fri, 12 Feb 2021 06:48:57 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11BJawCo060001; Thu, 11 Feb 2021 14:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3ECbkre0tIcEPaZw5FdcXHPPdJMMxgI5dRte7jJoTFs=;
 b=Yqw6Jm5UYS7WelFOgRvm92UU+lTng5/5XqFpp3Gjf6nsNd7fIfO56BwnqnQeL5TR3JYk
 HaUNrlTPH9vNn4OHtv3t9FM9dMe5XzgcI/bVPKCutOec0J3zZ854lH0gggYgCFEMyjaj
 2lkbujoA2BdFRp83GJufGoOGVe79AuxBjcYSZO60uzIu2n6QY6zGb8X3Gp/ke015eE3d
 uKpiTP0DHHfjn1KmHnu2XNX7R7gH5OsKWsd9Fe1ve+kpdGi3z7WUZDQon+cv5waaxKJF
 g1r9T4mivJSsUShf5XvmSrib8FmTG0y/C/63GhgMdKsSecJBxcZVkrdzQLe/dGphp32z 8g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36n9dybk5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 14:48:50 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BJkuYH024284;
 Thu, 11 Feb 2021 19:48:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 36hjr9t3h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 19:48:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11BJmmvC15401316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 19:48:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B81BE112066;
 Thu, 11 Feb 2021 19:48:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E28112061;
 Thu, 11 Feb 2021 19:48:47 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.11.199])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 11 Feb 2021 19:48:47 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH] fsi: Aspeed: Reduce poll timeout
Date: Thu, 11 Feb 2021 13:48:46 -0600
Message-Id: <20210211194846.35475-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=993 mlxscore=0 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110151
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
Cc: linux-aspeed@lists.ozlabs.org, alistair@popple.id.au,
 linux-kernel@vger.kernel.org, jk@ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The lengthy timeout previously used sometimes resulted in
scheduling problems, detailed below. Therefore reduce the timeout
to 500us. This timeout selection is supported by the benchmarks
collected below with various clock dividers. This is purely the time
spent polling (reported by ktime_get()).

div  1: max:150us avg:  2us
div  2: max:155us avg:  3us
div  4: max:149us avg:  7us
div  8: max:153us avg: 13us
div 16: max:197us avg: 21us
div 32: max:181us avg: 50us
div 64: max:262us avg:100us

Jan 22 01:27:21 rain27bmc kernel: rcu: INFO: rcu_sched self-detected stall on CPU
Jan 22 01:27:21 rain27bmc kernel: rcu:         0-....: (2099 ticks this GP) idle=0ca/1/0x40000002 softirq=349573/349573 fqs=1048
Jan 22 01:27:21 rain27bmc kernel:         (t=2100 jiffies g=841149 q=7163)
Jan 22 01:27:21 rain27bmc kernel: NMI backtrace for cpu 0
Jan 22 01:27:21 rain27bmc kernel: CPU: 0 PID: 5959 Comm: ibm-read-vpd Not tainted 5.8.17-a9b4ea8 #1
Jan 22 01:27:21 rain27bmc kernel: Hardware name: Generic DT based system
Jan 22 01:27:21 rain27bmc kernel: Backtrace:
Jan 22 01:27:25 rain27bmc kernel: [<8010d92c>] (dump_backtrace) from [<8010db80>] (show_stack+0x20/0x24)
...
Jan 22 01:27:25 rain27bmc kernel: [<8010130c>] (gic_handle_irq) from [<80100b0c>] (__irq_svc+0x6c/0x90)
Jan 22 01:27:25 rain27bmc kernel: Exception stack(0xb79159b0 to 0xb79159f8)
Jan 22 01:27:25 rain27bmc kernel: 59a0:                                     9e88e5d5 00000559 00000559 00000018
Jan 22 01:27:25 rain27bmc kernel: 59c0: 00000000 9f217c55 00000003 00000559 a0201c00 bfa4d048 bfa4d000 b7915a44
Jan 22 01:27:25 rain27bmc kernel: 59e0: 40e88f8a b7915a00 3254e553 80734924 80030113 ffffffff
Jan 22 01:27:25 rain27bmc kernel:  r9:b7914000 r8:a0201c00 r7:b79159e4 r6:ffffffff r5:80030113 r4:80734924
Jan 22 01:27:25 rain27bmc kernel: [<807348b4>] (__opb_read) from [<80734d98>] (aspeed_master_read+0xbc/0xcc)
Jan 22 01:27:25 rain27bmc kernel:  r10:00000004 r9:00000002 r8:80734cdc r7:bd33fa40 r6:00000004 r5:bd33f840
Jan 22 01:27:25 rain27bmc kernel:  r4:00201c00
Jan 22 01:27:25 rain27bmc kernel: [<80734cdc>] (aspeed_master_read) from [<807320f0>] (fsi_master_read+0x6c/0x1bc)
...

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 90dbe58ca1ed..03c61e50b299 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -92,7 +92,7 @@ static const u32 fsi_base = 0xa0000000;
 static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
 module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
 
-#define OPB_POLL_TIMEOUT		10000
+#define OPB_POLL_TIMEOUT		500
 
 static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 		       u32 val, u32 transfer_size)
-- 
2.27.0

