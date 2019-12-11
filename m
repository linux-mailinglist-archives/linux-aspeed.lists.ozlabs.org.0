Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3F11BC6A
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 20:02:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5sR5r3FzDqcx
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 06:02:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=724802d32d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y5ry3WjqzDqrq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 06:02:04 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBJ1g0T009835
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:02:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=HFrnMddEiovg7dvYssXfgyIzvT5cyvbBRUfNd730BhY=;
 b=Q0/LAefWYfIowc+7G7i3B3FtrXeJqV0A7Wt2V1zqQ9ub/gWKJoMGgsvvfnYAoKXz/ekt
 uU1VHFSNRw/mG8QOSJwbGFwK7ItPBiuAyEdLTxK75E6+A5a1ohbeGA/PdTBc92mGCswo
 D/hWyXZA7XPWhtE2BYjK4DEt4O8B7kmhZfc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2wteq4ptgf-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:02:01 -0800
Received: from intmgw003.06.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Dec 2019 11:01:58 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id B23D81809D01C; Wed, 11 Dec 2019 11:01:57 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: <tcminyard@gmail.com>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] drivers: ipmi: Modify max length of IPMB packet
Date: Wed, 11 Dec 2019 11:01:55 -0800
Message-ID: <20191211190155.1279610-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_06:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=1
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=831
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110156
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

As per IPMB specification, maximum packet size supported is 255,
modified Max length to 240 from 128 to accommodate more data.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 68a254c0dd92..382e4a1df510 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -19,7 +19,7 @@
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 
-#define MAX_MSG_LEN		128
+#define MAX_MSG_LEN		240
 #define IPMB_REQUEST_LEN_MIN	7
 #define NETFN_RSP_BIT_MASK	0x4
 #define REQUEST_QUEUE_MAX_LEN	256
-- 
2.17.1

