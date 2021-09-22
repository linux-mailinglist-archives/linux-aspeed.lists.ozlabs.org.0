Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D712414645
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 12:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDvk16QRlz2ybD
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 20:32:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvjt659Gz2yJN;
 Wed, 22 Sep 2021 20:32:01 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB7vf012562;
 Wed, 22 Sep 2021 18:11:07 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 18:31:25 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <adrian.hunter@intel.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <andrew@aj.id.au>
Subject: [PATCH 00/10] ASPEED SD/eMMC controller clock configuration
Date: Wed, 22 Sep 2021 18:31:06 +0800
Message-ID: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB7vf012562
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
Cc: BMC-SW@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series aims to configure SD and eMMC controllers' clock
frequency and clock phase parameters. The main modification is the
clock phase calculation method which has been checked with the HW IP
designer. Also, the clock source detection method is updated for
AST2600-A2/A3. This patch series has been verified on AST2600-A3 EVB.

Chin-Ting Kuo (10):
  clk: aspeed: ast2600: Porting sdhci clock source
  sdhci: aspeed: Add SDR50 support
  dts: aspeed: ast2600: Support SDR50 for SD device
  mmc: Add invert flag for clock phase signedness
  mmc: aspeed: Adjust delay taps calculation method
  arm: dts: aspeed: Change eMMC device compatible
  arm: dts: aspeed: Adjust clock phase parameter
  arm: dts: ibm: Adjust clock phase parameter
  dt-bindings: mmc: aspeed: Add max-tap-delay property
  dt-bindings: mmc: aspeed: Add a new compatible string

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml |   4 +
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts   |   8 ++
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      |  11 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |   3 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |   2 +-
 drivers/clk/clk-ast2600.c                     |  69 ++++++++--
 drivers/mmc/core/host.c                       |  10 +-
 drivers/mmc/host/sdhci-of-aspeed.c            | 123 ++++++++++++++----
 include/linux/mmc/host.h                      |   2 +
 11 files changed, 193 insertions(+), 45 deletions(-)

-- 
2.17.1

