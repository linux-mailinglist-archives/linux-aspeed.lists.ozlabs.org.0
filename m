Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD954725D4
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 06:21:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thx127s9zDq7d
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 14:21:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XsAyY/We"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQpT1fDszDqPM
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 03:44:31 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NHeNJC006061
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2019 10:44:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=rHEVBIPm6rYaNCINyNoMCMxgPi8PsxfqlzLmzxF3+Bg=;
 b=XsAyY/WenN/InNm0+n9fYmhLVFZ7c6JVPfL8KX+kh1Gtf9pLXUajFf3aJ4xXpcdsYYQN
 rGUN2VBVpphlBLr9/jU7+WsZ77PsrqWKHQoOF2GoGAmGLUIdbhGxh5f0DVBJasjKoRjs
 I/LTWvgoszBe9vy0BtJnHz1LKTkN+UP+Bi0= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx61p08db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2019 10:44:28 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 23 Jul 2019 10:44:27 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 29C221159941D; Tue, 23 Jul 2019 10:19:24 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Kosina <trivial@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Patrick Venture <venture@google.com>, Ard
 Biesheuvel <ard.biesheuvel@linaro.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Anson Huang <anson.huang@nxp.com>,
 Jeremy Gebben <jgebben@sweptlaser.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2] dt-bindings: Add pxe1610 as a trivial device
Date: Tue, 23 Jul 2019 10:19:16 -0700
Message-ID: <20190723171922.1435859-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230178
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, sdasari@fb.com,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The pxe1610 is a voltage regulator from Infineon. It also supports
other VRs pxe1110 and pxm1310 from Infineon.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
In V2: comment was put wrongly after device so corrected.

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2e742d399e87..a3dd83d4f429 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -98,6 +98,8 @@ properties:
           - gmt,g751
             # Infineon IR38064 Voltage Regulator
           - infineon,ir38064
+            # Infineon PXE1610, PXE1110 and PXM1310 Voltage Regulators
+          - infineon,pxe1610
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
-- 
2.17.1

