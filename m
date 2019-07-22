Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432A709DB
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Jul 2019 21:41:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ssRG2yv9zDqP3
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2019 05:40:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2106111e7f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rBEH7ODf"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ssR61mKdzDqNT
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2019 05:40:46 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x6MJQam7020882
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2019 12:40:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=zEF2pJ7/cS00eTij98oSpd+N8SWWrMXB+27aiyhjuSg=;
 b=rBEH7ODfIxtKlP4GNU1DnvAXnd838SbnmnRQ5oXuTuoX+HE0bZI7TtZ8vZuNsvujpj8N
 eq9tsdDrFGARNjOi+KSb9l+MiJ7Je69+t2z8S96lQ9CAms2nXhQNQeaxCBawHw2wERvP
 ybA185IW7jF8tuMPgKGr9Y7XfAxuu/kRJMg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2twjyn03yn-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2019 12:40:44 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 22 Jul 2019 12:40:41 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 395F41150EA8F; Mon, 22 Jul 2019 12:25:25 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Date: Mon, 22 Jul 2019 12:24:48 -0700
Message-ID: <20190722192451.1947348-2-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722192451.1947348-1-vijaykhemka@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=722 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220213
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, sdasari@fb.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Added new DT binding document for Infineon PXE1610 devices.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../devicetree/bindings/hwmon/pxe1610.txt         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pxe1610.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pxe1610.txt b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
new file mode 100644
index 000000000000..635daf4955db
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
@@ -0,0 +1,15 @@
+pxe1610 properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "infineon,pxe1610" for pxe1610
+	- "infineon,pxe1110" for pxe1610
+	- "infineon,pxm1310" for pxm1310
+- reg: I2C address
+
+Example:
+
+vr@48 {
+	compatible = "infineon,pxe1610";
+	reg = <0x48>;
+};
-- 
2.17.1

