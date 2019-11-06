Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7561F1D95
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Nov 2019 19:32:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Zs74GnfzF5h0
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 05:32:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6213bc35cd=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="B4EP3hCh"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Zs152lKzF5fP
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2019 05:32:35 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6IUHLC005921
 for <linux-aspeed@lists.ozlabs.org>; Wed, 6 Nov 2019 10:32:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=4y6FEsvQDaUsMRInrcp5pgZP0+p8aYZCVy0t9BJL6WA=;
 b=B4EP3hCh//N4e30XQ5gOtud/65HpgIpPZ611oKQeUFwDNSMoLk1gIfZI/jsFCxRbDWVD
 +4XEAV7f8H5L7+XL3H0ahpSu0hgeSTqX+3nfg/uQtnP18ZcqdEZP3UqwuZFx4bBdlpF9
 q5eV5Txch+pvEJWqvmJDQeOAUNWl4Fi+7dQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2w41un0juf-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Nov 2019 10:32:31 -0800
Received: from 2401:db00:12:909f:face:0:3:0 (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 10:32:30 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id E8E611633BB83; Wed,  6 Nov 2019 10:29:35 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <openipmi-developer@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2] drivers: ipmi: Support for both IPMB Req and Resp
Date: Wed, 6 Nov 2019 10:29:21 -0800
Message-ID: <20191106182921.1086795-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_06:2019-11-06,2019-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911060180
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

Removed check for request or response in IPMB packets coming from
device as well as from host. Now it supports both way communication
to device via IPMB. Both request and response will be passed to
application.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 285e0b8f9a97..ae3bfba27526 100644
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
@@ -203,25 +200,16 @@ static u8 ipmb_verify_checksum1(struct ipmb_dev *ipmb_dev, u8 rs_sa)
 		ipmb_dev->request.checksum1);
 }
 
-static bool is_ipmb_request(struct ipmb_dev *ipmb_dev, u8 rs_sa)
+/*
+ * Verify if message has proper ipmb header with minimum length
+ * and correct checksum byte.
+ */
+static bool is_ipmb_msg(struct ipmb_dev *ipmb_dev, u8 rs_sa)
 {
-	if (ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) {
-		if (ipmb_verify_checksum1(ipmb_dev, rs_sa))
-			return false;
+	if ((ipmb_dev->msg_idx >= IPMB_REQUEST_LEN_MIN) &&
+	   (!ipmb_verify_checksum1(ipmb_dev, rs_sa)))
+		return true;
 
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
 	return false;
 }
 
@@ -273,8 +261,7 @@ static int ipmb_slave_cb(struct i2c_client *client,
 
 	case I2C_SLAVE_STOP:
 		ipmb_dev->request.len = ipmb_dev->msg_idx;
-
-		if (is_ipmb_request(ipmb_dev, GET_8BIT_ADDR(client->addr)))
+		if (is_ipmb_msg(ipmb_dev, GET_8BIT_ADDR(client->addr)))
 			ipmb_handle_request(ipmb_dev);
 		break;
 
-- 
2.17.1

