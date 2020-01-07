Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984A132F80
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 20:31:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sjCw5dlmzDqNF
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jan 2020 06:31:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8275cdec92=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="HF9Ln4ef"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sjCZ2h6NzDqMx
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jan 2020 06:30:48 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007JSqT0006966
 for <linux-aspeed@lists.ozlabs.org>; Tue, 7 Jan 2020 11:30:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=Uij8Ue7p80JCsa0xFwke2dRkold23rvr67wlz2fHIsY=;
 b=HF9Ln4efAj+LOMvJIl+LeIA7PNfek34P7iHxXk1OINs8KT6GfUSQSs+1yg8actiQPt5y
 RLdOWw/MT3PUgf8jlyXeeEucxKyuTodKiE7QxZA4U6L45ayEchwUre3vW36wS8s7rCno
 w0Fq4b5xmC9BRYTyxn30G+71C98JmA3hbxQ= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xcwm1h1ur-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jan 2020 11:30:45 -0800
Received: from intmgw002.41.prn1.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 7 Jan 2020 11:30:41 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 62C4519717D23; Tue,  7 Jan 2020 11:30:38 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [net-next PATCH] net/ncsi: Send device address as source address
Date: Tue, 7 Jan 2020 11:30:33 -0800
Message-ID: <20200107193034.1322431-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-07_06:2020-01-07,
 2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070153
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
Cc: sdasari@fb.com, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

After receiving device mac address from device, send this as
a source address for further commands instead of broadcast
address.

This will help in multi host NIC cards.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/ncsi-cmd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 0187e65176c0..ba9ae482141b 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -369,7 +369,15 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	eh = skb_push(nr->cmd, sizeof(*eh));
 	eh->h_proto = htons(ETH_P_NCSI);
 	eth_broadcast_addr(eh->h_dest);
-	eth_broadcast_addr(eh->h_source);
+
+	/* If mac address received from device then use it for
+	 * source address as unicast address else use broadcast
+	 * address as source address
+	 */
+	if (nca->ndp->gma_flag == 1)
+		memcpy(eh->h_source, nca->ndp->ndev.dev->dev_addr, ETH_ALEN);
+	else
+		eth_broadcast_addr(eh->h_source);
 
 	/* Start the timer for the request that might not have
 	 * corresponding response. Given NCSI is an internal
-- 
2.17.1

