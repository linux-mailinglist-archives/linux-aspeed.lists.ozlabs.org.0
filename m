Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD706443733
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 21:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkLrm0Bpkz2yHW
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 07:21:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Wed, 03 Nov 2021 07:21:04 AEDT
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkLrc3NGdz2xDY
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 07:21:04 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218552904"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="218552904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 13:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="500738809"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2021 13:17:47 -0700
From: jae.hyun.yoo@intel.com
To: Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 0/6] Add LCLK control into Aspeed LPC sub drivers
Date: Tue,  2 Nov 2021 13:37:11 -0700
Message-Id: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
X-Mailer: git-send-email 2.25.1
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

Hello all,

This series is for appliying below fix to all Aspped LPC sub drivers.
https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/

An LPC sub driver can be enabled without using the lpc-ctrl driver or it
can be registered ahead of lpc-ctrl depends on each system configuration and
this difference introduces that LPC can be enabled without heart beating of
LCLK so it causes improper handling on host interrupts when the host sends
interrupts in that time frame. Then kernel eventually forcibly disables the
interrupt with dumping stack and printing a 'nobody cared this irq' message
out.

To prevent this issue, all LPC sub drivers should enable LCLK individually
so this patch adds clock control logic into the remaining Aspeed LPC sub
drivers.

Please review this series.

Thanks,
Jae

Changes sinve v1:
 - Added 'clocks' property into ibt and kcs-bmc bindings using
   'aspeed,ast2400-ibt-bmc.txt' and 'aspeed,ast2400-kcs-bmc.yaml'
   respectively because these are not merged into 'aspeed-lpc.yaml' yet.
   The bindings merging could be done using a separate patch later.

Jae Hyun Yoo (6):
  ARM: dts: aspeed: add LCLK setting into LPC IBT node
  dt-bindings: ipmi: bt-bmc: add 'clocks' as a required property
  ipmi: bt: add clock control logic
  ARM: dts: aspeed: add LCLK setting into LPC KCS nodes
  dt-bindings: ipmi: aspeed,kcs-bmc: add 'clocks' as a required property
  ipmi: kcs_bmc_aspeed: add clock control logic

 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  |  2 ++
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml |  7 +++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |  1 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |  5 +++
 arch/arm/boot/dts/aspeed-g6.dtsi              |  5 +++
 drivers/char/ipmi/bt-bmc.c                    | 24 +++++++++++++-
 drivers/char/ipmi/kcs_bmc_aspeed.c            | 31 ++++++++++++++++---
 7 files changed, 70 insertions(+), 5 deletions(-)

-- 
2.25.1

