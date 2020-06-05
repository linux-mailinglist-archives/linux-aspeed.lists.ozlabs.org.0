Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235581EF4F4
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jun 2020 12:06:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ddbR4NdvzDqxD
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jun 2020 20:06:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 49ddbF4w1NzDqyG
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jun 2020 20:06:33 +1000 (AEST)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdf921276e5c0a816729a0@TWNHUMSW4.wistron.com>; Fri, 5 Jun 2020 
 18:06:30 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Fri, 5 Jun 2020 18:06:29 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 5 Jun 2020 18:06:29 +0800
From: Ben Pai <Ben_Pai@wistron.com>
To: <joel@jms.id.au>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, 
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] ARM: dts: aspeed: mihawk: Add 8 tmp401 thermal sensor
Date: Fri, 5 Jun 2020 18:06:28 +0800
Message-ID: <20200605100628.14807-1-Ben_Pai@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-TM-SNTS-SMTP: DDB9BC0458D24F053680539219F4C8D39E075093F38EDD5C6560CD8C1B8894672000:8
Content-Transfer-Encoding: 7bit
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
Cc: Ben Pai <Ben_Pai@wistron.com>, claire_ku@wistron.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index 25ffe65fbdc0..5bf1f13dda3b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -834,6 +834,11 @@
 					line-name = "smbus0";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus9_mux232: i2c@1 {
@@ -854,6 +859,11 @@
 					line-name = "smbus1";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus9_mux233: i2c@2 {
@@ -897,6 +907,11 @@
 					line-name = "smbus2";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus9_mux236: i2c@1 {
@@ -917,6 +932,11 @@
 					line-name = "smbus3";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus9_mux237: i2c@2 {
@@ -979,6 +999,11 @@
 					line-name = "smbus4";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus10_mux240: i2c@1 {
@@ -999,6 +1024,11 @@
 					line-name = "smbus5";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus10_mux241: i2c@2 {
@@ -1042,6 +1072,11 @@
 					line-name = "smbus6";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus10_mux244: i2c@1 {
@@ -1062,6 +1097,11 @@
 					line-name = "smbus7";
 				};
 			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
 		};
 
 		bus10_mux245: i2c@2 {
-- 
2.17.1


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
