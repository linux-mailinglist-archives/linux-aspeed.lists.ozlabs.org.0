Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3F12FE417
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jan 2021 08:37:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLvNy4ZsHzDr4L
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jan 2021 18:37:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.20; helo=segapp03.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
X-Greylist: delayed 312 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jan 2021 18:37:09 AEDT
Received: from segapp03.wistron.com (segapp03.wistron.com [103.200.3.20])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DLvNj73rYzDqts
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jan 2021 18:37:08 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Te431fb7fcec0a816721aa0@TWNHUMSW4.wistron.com>; Thu, 21 Jan 2021 
 15:31:49 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Thu, 21 Jan 2021 15:31:48 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 21 Jan 2021 15:31:48 +0800
From: Ben Pai <Ben_Pai@wistron.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ARM: dts: aspeed: Add Mowgli rtc driver
Date: Thu, 21 Jan 2021 15:31:46 +0800
Message-ID: <20210121073146.28217-1-Ben_Pai@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-TM-SNTS-SMTP: 33431E5E8F89510968F99CC5EE2665AB0CD5DBCA1446DBBFDC9A097D43E4BC3B2000:8
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

Add mowgli rtc driver.

Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
index b648e468e9db..8503152faaf0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
@@ -582,6 +582,11 @@
 	/* TMP275A */
 	/* TMP275A */
 
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
 	tmp275@48 {
 		compatible = "ti,tmp275";
 		reg = <0x48>;
-- 
2.17.1


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
