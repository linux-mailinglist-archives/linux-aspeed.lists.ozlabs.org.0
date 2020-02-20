Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4AB16573D
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Feb 2020 06:58:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NP5z0CY1zDqQV
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Feb 2020 16:58:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Feb 2020 16:58:24 AEDT
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48NP5r1yYmzDqDx
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Feb 2020 16:58:22 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdd6f484d45c0a816721080@TWNHUMSW4.wistron.com>; Thu, 20 Feb 2020 
 13:53:01 +0800
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Thu, 20 Feb 2020 13:53:00 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 20 Feb 2020 13:53:00 +0800
From: Ben Pai <Ben_Pai@wistron.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <joel@jms.id.au>, 
 <andrew@aj.id.au>, <devicetree@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, 
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ARM: dts: mihawk: Change the name of mihawk led
Date: Thu, 20 Feb 2020 13:52:55 +0800
Message-ID: <20200220055255.22809-1-Ben_Pai@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-TM-SNTS-SMTP: 878E35D0BF548269343F48DBF623908D488A6736306ADE4D4D02D482038B268B2000:8
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
Cc: Ben Pai <Ben_Pai@wistron.com>, wangat@tw.ibm.com, Claire_Ku@wistron.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

1.Change the name of power, fault and rear-id.
2.Remove the two leds.

Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index e55cc454b17f..6c11854b9006 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -120,35 +120,24 @@
 	leds {
 		compatible = "gpio-leds";
 
-		fault {
+		front-fault {
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
 		};
 
-		power {
+		power-button {
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_LOW>;
 		};
 
-		rear-id {
+		front-id {
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
 		};
 
-		rear-g {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_LOW>;
-		};
-
-		rear-ok {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&gpio ASPEED_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
-		};
 
 		fan0 {
 			retain-state-shutdown;
-- 
2.17.1


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
