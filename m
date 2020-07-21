Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFE22BD9B
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jul 2020 07:41:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCdNf34H7zDrpk
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jul 2020 15:41:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ibm.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=jet.le@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=ibm.com
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B9xxm538TzDqnW
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jul 2020 22:00:44 +1000 (AEST)
Received: from EXCHAPP01.whq.wistron (unverified [10.37.38.24]) by
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Te07f5f89aec0a816701ee4@TWNHUMSW2.wistron.com>; 
 Tue, 21 Jul 2020 20:00:41 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP01.whq.wistron
 (10.37.38.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 21 Jul
 2020 20:00:41 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP01.whq.wistron
 (10.37.38.24) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 21 Jul 2020 20:00:41 +0800
From: Jet Li <Jet.Le@ibm.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH linux dev-5.7 v1] ARM: dts: aspeed: rainier: Add I2c buses for
 nvme use
Date: Tue, 21 Jul 2020 20:00:31 +0800
Message-ID: <20200721120031.27258-1-Jet.Le@ibm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3F6CD30736110E6CFCF9E7DF1BC98941578B327EDD47D86167E9D830534C39F12000:8
X-Mailman-Approved-At: Fri, 24 Jul 2020 15:41:07 +1000
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
Cc: Jet Li <Jet.Li@ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jet Li <Jet.Li@ibm.com>

Adding pca9552 exposes the presence detect lines for the cards
and tca9554 exposes the presence details for the cards.

Signed-off-by: Jet Li <Jet.Li@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 1ae119a..76a7e82 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -248,6 +248,21 @@
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	tca9554@40 {
+		compatible = "ti,tca9554";
+		reg = <0x40>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		smbus0 {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "smbus0";
+		};
+	};
+
 };
 
 &i2c1 {
@@ -562,6 +577,96 @@
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	pca1: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 };
 
 &i2c9 {
-- 
1.8.3.1

