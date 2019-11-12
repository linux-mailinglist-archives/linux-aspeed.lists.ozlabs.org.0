Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBFF86F1
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 03:39:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BsQd47cJzF4N5
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 13:39:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=621956b8ff=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IBK0A7mh"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BsQH6FY1zF3Km
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 13:39:14 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC2caMJ028908
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 18:39:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=EsFW0vFYwwzxjwWNpMP7bdWQ94gwqkkNeVJD0e+a73s=;
 b=IBK0A7mhoD/jS+3xlmoZLuSTtGM2kkmi4h861XffqME+RNfXnYsUb9dLbhgl6eGz/DYF
 MKU4wZYra2dFykzbuotF8cnJkGzXKW9I+saWmqjI4rxqJIIoEk7Kx8DYn6bBPoRuNl0L
 UxLxISN/ELDPbpIQGj5PbpkVROy8jN/6VMo= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w7h8krray-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 18:39:11 -0800
Received: from 2401:db00:12:909f:face:0:3:0 (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 11 Nov 2019 18:39:09 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 8E0BD16879994; Mon, 11 Nov 2019 18:36:25 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <openipmi-developer@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH 1/2] drivers: ipmi: Support raw i2c packet in IPMB
Date: Mon, 11 Nov 2019 18:36:09 -0800
Message-ID: <20191112023610.3644314-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-11_07:2019-11-11,2019-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=853 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911120020
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
support only smbus devices. So added support for raw i2c packets.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/Kconfig        |  6 ++++++
 drivers/char/ipmi/ipmb_dev_int.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index a9cfe4c05e64..e5268443b478 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -139,3 +139,9 @@ config IPMB_DEVICE_INTERFACE
 	  Provides a driver for a device (Satellite MC) to
 	  receive requests and send responses back to the BMC via
 	  the IPMB interface. This module requires I2C support.
+
+config IPMB_SMBUS_DISABLE
+	bool 'Disable SMBUS protocol for sending packet to IPMB device'
+	depends on IPMB_DEVICE_INTERFACE
+	help
+	  provides functionality of sending raw i2c packets to IPMB device.
diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index ae3bfba27526..2419b9a928b2 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -118,6 +118,10 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
 	u8 rq_sa, netf_rq_lun, msg_len;
 	union i2c_smbus_data data;
+#ifdef CONFIG_IPMB_SMBUS_DISABLE
+	unsigned char *i2c_buf;
+	struct i2c_msg i2c_msg;
+#endif
 	u8 msg[MAX_MSG_LEN];
 	ssize_t ret;
 
@@ -133,6 +137,31 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
 	netf_rq_lun = msg[NETFN_LUN_IDX];
 
+#ifdef CONFIG_IPMB_SMBUS_DISABLE
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
+	i2c_msg.addr = rq_sa;
+	i2c_msg.flags = ipmb_dev->client->flags &
+			(I2C_M_TEN | I2C_CLIENT_PEC | I2C_CLIENT_SCCB);
+	i2c_msg.len = msg_len;
+	i2c_msg.buf = i2c_buf;
+
+	ret = i2c_transfer(ipmb_dev->client->adapter, &i2c_msg, 1);
+	kfree(i2c_buf);
+
+	return (ret == 1) ? count : ret;
+#else
 	/*
 	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
 	 * i2c_smbus_xfer
@@ -149,6 +178,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 			     I2C_SMBUS_BLOCK_DATA, &data);
 
 	return ret ? : count;
+#endif
 }
 
 static unsigned int ipmb_poll(struct file *file, poll_table *wait)
-- 
2.17.1

