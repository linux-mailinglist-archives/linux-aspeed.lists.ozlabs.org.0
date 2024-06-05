Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3B8FD8AC
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dv/RDUZ8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgVg0p2Zz3cTG
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dv/RDUZ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS91ZCJz3cQX;
	Thu,  6 Jun 2024 07:23:37 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBvuo014371;
	Wed, 5 Jun 2024 21:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=ZO87ym+vrHlW5NSObf7CjE5XoUUtGZQpDoF/ti0pRyg=;
 b=Dv/RDUZ8nP1GfKSkC10tP5LUh9CEhVsBR9gJVa2i7HsrqT+C5mgEGrMRkmYxlljI4sHX
 cAJP1E17McM/KrF9vlM18b5iROcRziO+lLzzmhugYEFDK2ziUDnzTjesCZDQrGaVhQj5
 yQ+T2p/5KW10eB+FhvCE6PhJSkB6ZWWX87nMAKI2XSo/vBLwxbQ4xjsASBBiHIJM/Gkl
 EbGlEtZ1ZzJJ11d69uV4RmsYXJ+EzdMCSYll2yXta70it5HOCSZXusIc9vqGvdaYr7gP
 fIEG9X2D3+Nl/QCOW/wFX0RtrAMcmPT/VLJP64n17n8cLXf3lGE1pwT99xfVwd2ZhC24 XA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjy57r2y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JBRYS031204;
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNK9J44499268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAF1D58055;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E26358069;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 17/40] fsi: aspeed: Refactor trace functions
Date: Wed,  5 Jun 2024 16:22:49 -0500
Message-Id: <20240605212312.349188-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A-oZrEuoCSwLyCqB8ft9uiakyCYSYlj6
X-Proofpoint-ORIG-GUID: A-oZrEuoCSwLyCqB8ft9uiakyCYSYlj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=888
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Remove the opb error trace, add a timeout trace, and combine the
read/write traces.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 29 +++------
 include/trace/events/fsi_master_aspeed.h | 80 ++++++++----------------
 2 files changed, 34 insertions(+), 75 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 29932037c9866..04aa5cb9b6fad 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -122,16 +122,17 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 
 	status = readl(base + OPB0_STATUS);
 
-	trace_fsi_master_aspeed_opb_write(addr, val, transfer_size, status, reg);
-
 	/* Return error when poll timed out */
-	if (ret)
+	if (ret) {
+		trace_fsi_master_aspeed_timeout(reg, status, false);
 		return ret;
+	}
 
 	/* Command failed, master will reset */
 	if (status & STATUS_ERR_ACK)
 		return -EIO;
 
+	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, val, false);
 	return 0;
 }
 
@@ -175,13 +176,11 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	result = readl(base + OPB0_FSI_DATA_R);
 
-	trace_fsi_master_aspeed_opb_read(addr, transfer_size, result,
-			readl(base + OPB0_STATUS),
-			reg);
-
 	/* Return error when poll timed out */
-	if (ret)
+	if (ret) {
+		trace_fsi_master_aspeed_timeout(reg, status, true);
 		return ret;
+	}
 
 	/* Command failed, master will reset */
 	if (status & STATUS_ERR_ACK)
@@ -204,6 +203,7 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	}
 
+	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, result, true);
 	return 0;
 }
 
@@ -226,19 +226,6 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
 
-	if (trace_fsi_master_aspeed_opb_error_enabled()) {
-		__be32 mresp0, mstap0, mesrb0;
-
-		opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
-		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
-		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
-
-		trace_fsi_master_aspeed_opb_error(
-				be32_to_cpu(mresp0),
-				be32_to_cpu(mstap0),
-				be32_to_cpu(mesrb0));
-	}
-
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
 
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 0fff873775f19..7eeecbfec7f09 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -8,69 +8,41 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(fsi_master_aspeed_opb_read,
-	TP_PROTO(uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
-	TP_ARGS(addr, size, result, status, irq_status),
+TRACE_EVENT(fsi_master_aspeed_opb_xfer,
+	TP_PROTO(uint32_t addr, uint32_t size, uint32_t data, bool read),
+	TP_ARGS(addr, size, data, read),
 	TP_STRUCT__entry(
-		__field(uint32_t,  addr)
-		__field(size_t,    size)
-		__field(uint32_t,  result)
-		__field(uint32_t,  status)
-		__field(uint32_t,  irq_status)
-		),
+		__field(uint32_t, addr)
+		__field(uint32_t, size)
+		__field(uint32_t, data)
+		__field(bool, read)
+	),
 	TP_fast_assign(
 		__entry->addr = addr;
 		__entry->size = size;
-		__entry->result = result;
-		__entry->status = status;
-		__entry->irq_status = irq_status;
-		),
-	TP_printk("addr %08x size %zu: result %08x sts: %08x irq_sts: %08x",
-		__entry->addr, __entry->size, __entry->result,
-		__entry->status, __entry->irq_status
-	   )
+		__entry->data = data;
+		__entry->read = read;
+	),
+	TP_printk("%s addr %08x size %u data %08x", __entry->read ? "read" : "write",
+		  __entry->addr, __entry->size, __entry->data)
 );
 
-TRACE_EVENT(fsi_master_aspeed_opb_write,
-	TP_PROTO(uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
-	TP_ARGS(addr, val, size, status, irq_status),
+TRACE_EVENT(fsi_master_aspeed_timeout,
+	TP_PROTO(uint32_t irq, uint32_t status, bool read),
+	TP_ARGS(irq, status, read),
 	TP_STRUCT__entry(
-		__field(uint32_t,    addr)
-		__field(uint32_t,    val)
-		__field(size_t,    size)
-		__field(uint32_t,  status)
-		__field(uint32_t,  irq_status)
-		),
+		__field(uint32_t, irq)
+		__field(uint32_t, status)
+		__field(bool, read)
+	),
 	TP_fast_assign(
-		__entry->addr = addr;
-		__entry->val = val;
-		__entry->size = size;
+		__entry->irq = irq;
 		__entry->status = status;
-		__entry->irq_status = irq_status;
-		),
-	TP_printk("addr %08x val %08x size %zu status: %08x irq_sts: %08x",
-		__entry->addr, __entry->val, __entry->size,
-		__entry->status, __entry->irq_status
-		)
-	);
-
-TRACE_EVENT(fsi_master_aspeed_opb_error,
-	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
-	TP_ARGS(mresp0, mstap0, mesrb0),
-	TP_STRUCT__entry(
-		__field(uint32_t,  mresp0)
-		__field(uint32_t,  mstap0)
-		__field(uint32_t,  mesrb0)
-		),
-	TP_fast_assign(
-		__entry->mresp0 = mresp0;
-		__entry->mstap0 = mstap0;
-		__entry->mesrb0 = mesrb0;
-		),
-	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
-		__entry->mresp0, __entry->mstap0, __entry->mesrb0
-		)
-	);
+		__entry->read = read;
+	),
+	TP_printk("%s irq %08x status %08x", __entry->read ? "read" : "write", __entry->irq,
+		  __entry->status)
+);
 
 TRACE_EVENT(fsi_master_aspeed_cfam_reset,
 	TP_PROTO(bool start),
-- 
2.39.3

