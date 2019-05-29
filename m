Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1082E854
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 00:35:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dlsr3bkfzDqNt
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 08:35:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1052dfd69e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iyGeSHJO"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dlsg3lYfzDqLW
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 08:35:32 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x4TMXBKp022986
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 15:35:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=E/7CawHUgsSjWEZbZXxUdQdn9jE5t8ujO/dmm4aOm50=;
 b=iyGeSHJOgzWUSNcQW0RgCHD4GLx9W0odmIlt4R+6DXHtmm52FsjmLzlyPZsSqMVjsXpn
 ikUXEi/2nx9R4etwaPyZFKI6vi6YfeepO2N2tflZpZqmz8p5+/BNFNL0z7hVck5P/Id3
 bjmR2sHszNZ2Zcm02aZxyytfZABbP6wPVko= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2st2yjr08t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 15:35:29 -0700
Received: from mx-out.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 29 May 2019 15:35:28 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id CC02DE882C31; Wed, 29 May 2019 15:35:26 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, <linux-hwmon@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH 2/2] Docs: hwmon: pmbus: Add PXE1610 driver
Date: Wed, 29 May 2019 15:35:09 -0700
Message-ID: <20190529223511.4059120-2-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529223511.4059120-1-vijaykhemka@fb.com>
References: <20190529223511.4059120-1-vijaykhemka@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290139
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sdasari@fb.com,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Added support for Infenion PXE1610 driver

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 Documentation/hwmon/pxe1610 | 84 +++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/hwmon/pxe1610

diff --git a/Documentation/hwmon/pxe1610 b/Documentation/hwmon/pxe1610
new file mode 100644
index 000000000000..b5c83edf027a
--- /dev/null
+++ b/Documentation/hwmon/pxe1610
@@ -0,0 +1,84 @@
+Kernel driver pxe1610
+=====================
+
+Supported chips:
+  * Infinion PXE1610
+    Prefix: 'pxe1610'
+    Addresses scanned: -
+    Datasheet: Datasheet is not publicly available.
+
+  * Infinion PXE1110
+    Prefix: 'pxe1110'
+    Addresses scanned: -
+    Datasheet: Datasheet is not publicly available.
+
+  * Infinion PXM1310
+    Prefix: 'pxm1310'
+    Addresses scanned: -
+    Datasheet: Datasheet is not publicly available.
+
+Author: Vijay Khemka <vijaykhemka@fb.com>
+
+
+Description
+-----------
+
+PXE1610 is a Multi-rail/Multiphase Digital Controllers and
+it is compliant to Intel VR13 DC-DC converter specifications.
+
+
+Usage Notes
+-----------
+
+This driver can be enabled with kernel config CONFIG_SENSORS_PXE1610
+set to 'y' or 'm'(for module).
+
+This driver does not probe for PMBus devices. You will have
+to instantiate devices explicitly.
+
+Example: the following commands will load the driver for an PXE1610
+at address 0x70 on I2C bus #4:
+
+# modprobe pxe1610
+# echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
+
+It can also be instantiated by declaring in device tree if it is
+built as a kernel not as a module.
+
+
+Sysfs attributes
+----------------
+
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_alarm		Current high alarm
+
+curr[2-4]_label		"iout[1-3]"
+curr[2-4]_input		Measured output current
+curr[2-4]_crit		Critical maximum current
+curr[2-4]_crit_alarm	Current critical high alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in[2-4]_label		"vout[1-3]"
+in[2-4]_input		Measured output voltage
+in[2-4]_lcrit		Critical minimum output voltage
+in[2-4]_lcrit_alarm	Output voltage critical low alarm
+in[2-4]_crit		Critical maximum output voltage
+in[2-4]_crit_alarm	Output voltage critical high alarm
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+
+power[2-4]_label	"pout[1-3]"
+power[2-4]_input	Measured output power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_crit		Critical high temperature
+temp[1-3]_crit_alarm	Chip temperature critical high alarm
+temp[1-3]_max		Maximum temperature
+temp[1-3]_max_alarm	Chip temperature high alarm
-- 
2.17.1

