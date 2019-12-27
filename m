Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D612BBA6
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Dec 2019 23:44:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47l2255wnfzDqFM
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Dec 2019 09:44:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7264ab318c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lrPzsUsN"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47l21x2Fg8zDqFK
 for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Dec 2019 09:44:12 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBRMf1hR028328
 for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Dec 2019 14:44:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=PBpHMpBlV1Aa9DOQjEjFsW6rz8psMCEge3KgMqaCmYA=;
 b=lrPzsUsN8trOHVNY/3K3rUSVazEB/JfWYylLxGWtz8UBx1T5S2IgdDF5lWcb28SxDj02
 dq3UXpVLJodTut6uO83M1g1lKv8guIA1NL/JgEuJ8lAg8fRsZrHX3Cbjm9NOir6UoP9u
 6akT/qzOWLJQ4tQnmbc6z6sa+h9pebUgrZs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2x54jqmbsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Dec 2019 14:44:09 -0800
Received: from intmgw003.06.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Dec 2019 14:44:07 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 32C8418FE1EBC; Fri, 27 Dec 2019 14:44:06 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [net-next PATCH] net/ncsi: Fix gma flag setting after response
Date: Fri, 27 Dec 2019 14:43:49 -0800
Message-ID: <20191227224349.2182366-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-27_07:2019-12-24,2019-12-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=841 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912270181
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

gma_flag was set at the time of GMA command request but it should
only be set after getting successful response. Movinng this flag
setting in GMA response handler.

This flag is used mainly for not repeating GMA command once
received MAC address.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/ncsi-manage.c | 3 ---
 net/ncsi/ncsi-rsp.c    | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 70fe02697544..e20b81514029 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -764,9 +764,6 @@ static int ncsi_gma_handler(struct ncsi_cmd_arg *nca, unsigned int mf_id)
 		return -1;
 	}
 
-	/* Set the flag for GMA command which should only be called once */
-	nca->ndp->gma_flag = 1;
-
 	/* Get Mac address from NCSI device */
 	return nch->handler(nca);
 }
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index d5611f04926d..a94bb59793f0 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -627,6 +627,9 @@ static int ncsi_rsp_handler_oem_mlx_gma(struct ncsi_request *nr)
 	saddr.sa_family = ndev->type;
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 	memcpy(saddr.sa_data, &rsp->data[MLX_MAC_ADDR_OFFSET], ETH_ALEN);
+	/* Set the flag for GMA command which should only be called once */
+	ndp->gma_flag = 1;
+
 	ret = ops->ndo_set_mac_address(ndev, &saddr);
 	if (ret < 0)
 		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
@@ -671,6 +674,9 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
 		return -ENXIO;
 
+	/* Set the flag for GMA command which should only be called once */
+	ndp->gma_flag = 1;
+
 	ret = ops->ndo_set_mac_address(ndev, &saddr);
 	if (ret < 0)
 		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
-- 
2.17.1

