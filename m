Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B6FB8C0
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 20:26:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cvjg0MWszF6p9
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 06:26:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=622020c9b1=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UidIhXkc"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CvjK6HxKzF6nH
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Nov 2019 06:25:56 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xADJ84KW030855
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 11:25:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=OETIGi2KQ+6/3ZHiA0FV3MBsF5b/Lico1JKL7c62zqU=;
 b=UidIhXkca2wuaYmqWw6o+zclbTiUAye8img9AXWf1gfbc23LaLdJnDEoLIdvYOwFgOe+
 d+N4v5m8+bq+XW4ZTrOtBBzSkXGaFL9ifD7k3ms6B/EN8VU5CL8EZcb+Vj3wiEof5bg4
 pXS2l4p883bnRAGS11yihdrsozCx/+30Up4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2w7pr2skp9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 11:25:42 -0800
Received: from 2401:db00:12:909f:face:0:3:0 (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Nov 2019 11:25:41 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id B779416A6E07D; Wed, 13 Nov 2019 11:23:27 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <openipmi-developer@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v3] drivers: ipmi: Support raw i2c packet in IPMB
Date: Wed, 13 Nov 2019 11:23:25 -0800
Message-ID: <20191113192325.2821207-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_04:2019-11-13,2019-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911130160
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

User can define use-i2c-block in device tree to use i2c raw transfer.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index ae3bfba27526..16d5d4b636a9 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -63,6 +63,7 @@ struct ipmb_dev {
 	spinlock_t lock;
 	wait_queue_head_t wait_queue;
 	struct mutex file_mutex;
+	bool use_i2c;
 };
 
 static inline struct ipmb_dev *to_ipmb_dev(struct file *file)
@@ -112,6 +113,39 @@ static ssize_t ipmb_read(struct file *file, char __user *buf, size_t count,
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
@@ -133,6 +167,12 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
 	netf_rq_lun = msg[NETFN_LUN_IDX];
 
+	/* Check i2c block transfer vs smbus */
+	if (ipmb_dev->use_i2c) {
+		ret = ipmb_i2c_write(ipmb_dev->client, msg);
+		return (ret == 1) ? count : ret;
+	}
+
 	/*
 	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
 	 * i2c_smbus_xfer
@@ -277,6 +317,7 @@ static int ipmb_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct ipmb_dev *ipmb_dev;
+	struct device_node *np;
 	int ret;
 
 	ipmb_dev = devm_kzalloc(&client->dev, sizeof(*ipmb_dev),
@@ -302,6 +343,13 @@ static int ipmb_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	/* Check if i2c block xmit needs to use instead of smbus */
+	np = client->dev.of_node;
+	if (np && of_get_property(np, "use-i2c-block", NULL))
+		ipmb_dev->use_i2c = true;
+	else
+		ipmb_dev->use_i2c = false;
+
 	ipmb_dev->client = client;
 	i2c_set_clientdata(client, ipmb_dev);
 	ret = i2c_slave_register(client, ipmb_slave_cb);
-- 
2.17.1

