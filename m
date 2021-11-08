Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23058449BE4
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Nov 2021 19:43:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp0PM0SxVz301K
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Nov 2021 05:43:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp0PG0LWWz2yg6
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Nov 2021 05:43:29 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293132659"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="293132659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 10:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="503150687"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 08 Nov 2021 10:42:19 -0800
From: jae.hyun.yoo@intel.com
To: Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 2/6] dt-bindings: ipmi: bt-bmc: add 'clocks' as a required
 property
Date: Mon,  8 Nov 2021 11:01:56 -0800
Message-Id: <20211108190200.290957-3-jae.hyun.yoo@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108190200.290957-1-jae.hyun.yoo@intel.com>
References: <20211108190200.290957-1-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
hardware block will be enabled without heart beating of LCLK until
lpc-ctrl enables the LCLK. This issue causes improper handling on
host interrupts when the host sends interrupts in that time frame.
Then kernel eventually forcibly disables the interrupt with
dumping stack and printing a 'nobody cared this irq' message out.

To prevent this issue, all LPC sub drivers should enable LCLK
individually so this patch adds 'clocks' property as one of
required properties to enable the LCLK by the LPC IBT driver.

Note: dtsi change in this patch series should be applied along with,
and dtbs should be re-compiled after applying this series since
it's adding a new required property otherwise the driver will not
be probed correctly.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
v2 -> v3:
 * Made commit message more descriptive.

v1 -> v2:
 * Added 'clocks' property into ibt bindings using
   'aspeed,ast2400-ibt-bmc.txt' because it's not merged into
   'aspeed-lpc.yaml' yet. The bindings merging could be done using a
   separate patch later.

 .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
index c9902fd4b38b..25f86da804b7 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
@@ -11,6 +11,7 @@ Required properties:
 	"aspeed,ast2500-ibt-bmc"
 	"aspeed,ast2600-ibt-bmc"
 - reg: physical address and size of the registers
+- clocks: clock for the device
 
 Optional properties:
 
@@ -23,4 +24,5 @@ Example:
 		compatible = "aspeed,ast2400-ibt-bmc";
 		reg = <0x1e789140 0x18>;
 		interrupts = <8>;
+		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 	};
-- 
2.25.1

