Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9946CA13
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Dec 2021 02:35:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J808x15WFz3050
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Dec 2021 12:35:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=tommy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J808t13xwz2yXv
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Dec 2021 12:35:09 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B818luB089267;
 Wed, 8 Dec 2021 09:08:47 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 09:33:45 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 7/7] dt-bindings:ast2600-clock Add CRT reset define
Date: Wed, 8 Dec 2021 09:33:37 +0800
Message-ID: <20211208013337.13806-8-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B818luB089267
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add new CRT reset define for ast2600.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 62b9520a00fd..f8bee338a00f 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -110,6 +110,7 @@
 #define ASPEED_RESET_PCIE_DEV_OEN	20
 #define ASPEED_RESET_PCIE_RC_O		19
 #define ASPEED_RESET_PCIE_RC_OEN	18
+#define ASPEED_RESET_CRT		13
 #define ASPEED_RESET_PCI_DP		5
 #define ASPEED_RESET_AHB		1
 #define ASPEED_RESET_SDRAM		0
-- 
2.17.1

