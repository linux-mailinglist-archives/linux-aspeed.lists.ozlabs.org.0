Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FEF9E0C
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 00:17:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNvH68HFzF5qN
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 10:17:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=621956b8ff=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="EgRvQbn9"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNsC6BF3zF5fY
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 10:15:58 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACN5d4b006848
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 15:15:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=VBzDESx2BPi21yALs+izvvoTYhtutvjWaNlW8SC34AM=;
 b=EgRvQbn942FGD3FE/0sOc4sU0qDCbsATI77xSsnjNAtXZFEc72VC5OdTojcQlDmL8Laf
 /t38VtjkuZyYYPF8Ap2P4+Wtmx9qdCbaP7q4xhoMPbE09taK0HfTz3MN52rK+JkuDoKB
 hT6YeSmKId6Q98cDqrM2fqlTd3RApCY9NMk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w7prjcs5a-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 15:15:55 -0800
Received: from 2401:db00:30:6007:face:0:1:0 (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 12 Nov 2019 15:15:53 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 28F4016946C34; Tue, 12 Nov 2019 15:13:11 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
 <openipmi-developer@lists.sourceforge.net>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2] drivers: ipmi: Support raw i2c packet in IPMB
Date: Tue, 12 Nov 2019 15:13:07 -0800
Message-ID: <20191112231309.3094727-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_09:2019-11-11,2019-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911120199
X-FB-Internal: deliver
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
Cc: cminyard@mvista.com, sdasari@fb.com, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Many IPMB devices doesn't support smbus protocol and current driver
support only smbus devices. Added support for raw i2c packets.

User can include ipmi_ipmb.h and set xmit type via ioctl.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 54 ++++++++++++++++++++++++++++++++
 include/uapi/linux/ipmi_ipmb.h   | 17 ++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 include/uapi/linux/ipmi_ipmb.h

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index ae3bfba27526..11f7240f62cc 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/ipmi_ipmb.h>
 
 #define MAX_MSG_LEN		128
 #define IPMB_REQUEST_LEN_MIN	7
@@ -63,6 +64,7 @@ struct ipmb_dev {
 	spinlock_t lock;
 	wait_queue_head_t wait_queue;
 	struct mutex file_mutex;
+	unsigned long xmit_type;
 };
 
 static inline struct ipmb_dev *to_ipmb_dev(struct file *file)
@@ -112,6 +114,39 @@ static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
 	return ret < 0 ? ret : count;
 }
 
+static int ipmb_i2c_write(struct i2c_client *client, u8 *msg)
+{
+	unsigned char *i2c_buf;
+	struct i2c_msg i2c_msg;
+	ssize_t ret;
+	u8 msg_len;
+
+	/*
+	 * subtract 1 byte (rq_sa) from the length of the msg passed to
+	 * raw i2c_transfer
+	 */
+	msg_len = msg[IPMB_MSG_LEN_IDX] - 1;
+
+	i2c_buf = kzalloc(msg_len, GFP_KERNEL);
+	if (!i2c_buf)
+		return -EFAULT;
+
+	/* Copy message to buffer except first 2 bytes (length and address) */
+	memcpy(i2c_buf, msg+2, msg_len);
+
+	i2c_msg.addr = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
+	i2c_msg.flags = client->flags &
+			(I2C_M_TEN | I2C_CLIENT_PEC | I2C_CLIENT_SCCB);
+	i2c_msg.len = msg_len;
+	i2c_msg.buf = i2c_buf;
+
+	ret = i2c_transfer(client->adapter, &i2c_msg, 1);
+	kfree(i2c_buf);
+
+	return ret;
+
+}
+
 static ssize_t ipmb_write(struct file *file, const char __user *buf,
 			size_t count, loff_t *ppos)
 {
@@ -133,6 +168,11 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
 	netf_rq_lun = msg[NETFN_LUN_IDX];
 
+	if (ipmb_dev->xmit_type == IPMB_XMIT_TYPE_I2C_RAW) {
+		ret = ipmb_i2c_write(ipmb_dev->client, msg);
+		return (ret == 1) ? count : ret;
+	}
+
 	/*
 	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
 	 * i2c_smbus_xfer
@@ -166,11 +206,25 @@ static unsigned int ipmb_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static long ipmb_ioctl(struct file *file, unsigned int cmd,
+				unsigned long arg)
+{
+	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
+
+	if (cmd == IPMI_IPMB_IOCTL_SET_XMIT_TYPE)
+		ipmb_dev->xmit_type = arg;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct file_operations ipmb_fops = {
 	.owner	= THIS_MODULE,
 	.read	= ipmb_read,
 	.write	= ipmb_write,
 	.poll	= ipmb_poll,
+	.unlocked_ioctl = ipmb_ioctl,
 };
 
 /* Called with ipmb_dev->lock held. */
diff --git a/include/uapi/linux/ipmi_ipmb.h b/include/uapi/linux/ipmi_ipmb.h
new file mode 100644
index 000000000000..b283752f77f8
--- /dev/null
+++ b/include/uapi/linux/ipmi_ipmb.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Facebook
+ */
+
+#ifndef _UAPI_LINUX_IPMI_IPMB_H
+#define _UAPI_LINUX_IPMI_IPMB_H
+
+#include <linux/ioctl.h>
+
+#define __IPMI_IPMB_IOCTL_MAGIC        0xC1
+#define IPMI_IPMB_IOCTL_SET_XMIT_TYPE _IO(__IPMI_IPMB_IOCTL_MAGIC, 0x01)
+
+#define IPMB_XMIT_TYPE_SMBUS 0
+#define IPMB_XMIT_TYPE_I2C_RAW 1
+
+#endif /* _UAPI_LINUX_IPMI_IPMB_H */
-- 
2.17.1

