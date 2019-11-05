Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3FF063F
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Nov 2019 20:50:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4770dC0nlWzF4p3
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Nov 2019 06:50:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=62128af700=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="TlZoVwKa"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4770d13GJyzF4nC
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 06:50:11 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5JYRL8025066
 for <linux-aspeed@lists.ozlabs.org>; Tue, 5 Nov 2019 11:50:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=42ae6lQDouib7SXvYVJgz4eaHOcxs5NVBwAhqRbqE3M=;
 b=TlZoVwKau6RJhbK+YbZg+V+JkSwz+7ZCQoEws7zz8hF1wfSOVkAsjMjg4amJDJTYYS10
 c9zUGiOSOvc8fAmke5TaxD8/iXbG2VFvKGyg9cDBCokXPPA5gwWYbgn1H5T7T0diqjBl
 zbBUWmt2M3qf11GyuICNjQTL7Mf6DkQkxQI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w2vvbwqqn-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Nov 2019 11:50:05 -0800
Received: from 2401:db00:12:9028:face:0:29:0 (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 5 Nov 2019 11:49:43 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 4B0241629D96A; Tue,  5 Nov 2019 11:47:34 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <openipmi-developer@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] drivers: ipmi: Support for both IPMB Req and Resp
Date: Tue, 5 Nov 2019 11:47:31 -0800
Message-ID: <20191105194732.1521963-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_07:2019-11-05,2019-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1911050162
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
Cc: cminyard@mvista.com, sdasari@fb.com, linux-aspeed@lists.ozlabs.org,
 asmaa@mellanox.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Removed check for request or response in IPMB packets coming from
device as well as from host. Now it supports both way communication
to device via IPMB. Both request and response will be passed to
application.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 285e0b8f9a97..7201fdb533d8 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -133,9 +133,6 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	rq_sa = GET_7BIT_ADDR(msg[RQ_SA_8BIT_IDX]);
 	netf_rq_lun = msg[NETFN_LUN_IDX];
 
-	if (!(netf_rq_lun & NETFN_RSP_BIT_MASK))
-		return -EINVAL;
-
 	/*
 	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
 	 * i2c_smbus_xfer
@@ -203,28 +200,6 @@ static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)
 		ipmb_dev->request.checksum1);
 }
 
-static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa)
-{
-	if (ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) {
-		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
-			return false;
-
-		/*
-		 * Check whether this is an IPMB request or
-		 * response.
-		 * The 6 MSB of netfn_rs_lun are dedicated to the netfn
-		 * while the remaining bits are dedicated to the lun.
-		 * If the LSB of the netfn is cleared, it is associated
-		 * with an IPMB request.
-		 * If the LSB of the netfn is set, it is associated with
-		 * an IPMB response.
-		 */
-		if (!(ipmb_dev->request.netfn_rs_lun & NETFN_RSP_BIT_MASK))
-			return true;
-	}
-	return false;
-}
-
 /*
  * The IPMB protocol only supports I2C Writes so there is no need
  * to support I2C_SLAVE_READ* events.
@@ -273,9 +248,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
 
 	case I2C_SLAVE_STOP:
 		ipmb_dev->request.len = ipmb_dev->msg_idx;
-
-		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
-			ipmb_handle_request(ipmb_dev);
+		ipmb_handle_request(ipmb_dev);
 		break;
 
 	default:
-- 
2.17.1

