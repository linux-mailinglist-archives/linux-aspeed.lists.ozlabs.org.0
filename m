Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B53ED249
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Aug 2021 12:49:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp9rb3vyVz3bnj
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Aug 2021 20:49:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp9rV3mpkz2xgJ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Aug 2021 20:48:57 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17GAUM3X044038;
 Mon, 16 Aug 2021 18:30:22 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:48:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <p.zabel@pengutronix.de>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [v3 00/15] Add support for ast2600 ADC
Date: Mon, 16 Aug 2021 18:48:31 +0800
Message-ID: <20210816104846.13155-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17GAUM3X044038
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

This patch serials make aspeed_adc.c can support ast2600 and backward
compatible.

Change since v2:
dt-bindings:
  - Create a new dt-bindings for ast2600 adc
aspeed_adc.c:
  - Splits the patch for more details
  - Remove version enum and use the flags in model data to distinguish
  hardware feature
  - Support trimming data get and set.
  - Use devm_add_action_or_reset to simplify probe error handling.

Changes since v1:
dt-bindings:
  - Fix the aspeed,adc.yaml check error.
  - Add battery-sensing property.
aspeed_adc.c:
  - Change the init flow:
    Clock and reference voltage setting should be completed before adc
    engine enable.
  - Change the default sampling rate to meet most user case.
  - Add patch #8 to suppoert battery sensing mode.

Billy Tsai (15):
  dt-bindings: iio: adc: Add ast2600-adc bindings
  iio: adc: aspeed: completes the bitfield declare.
  iio: adc: aspeed: set driver data when adc probe.
  iio: adc: aspeed: Keep model data to driver data.
  iio: adc: aspeed: Refactory model data structure
  iio: adc: aspeed: Add vref config function
  iio: adc: aspeed: Set num_channels with model data
  iio: adc: aspeed: Use model_data to set clk scaler.
  iio: adc: aspeed: Use devm_add_action_or_reset.
  iio: adc: aspeed: Support ast2600 adc.
  iio: adc: aspeed: Fix the calculate error of clock.
  iio: adc: aspeed: Add func to set sampling rate.
  iio: adc: aspeed: Add compensation phase.
  iio: adc: aspeed: Support battery sensing.
  iio: adc: aspeed: Get and set trimming data.

 .../bindings/iio/adc/aspeed,ast2600-adc.yaml  |  98 +++
 drivers/iio/adc/aspeed_adc.c                  | 562 +++++++++++++++---
 2 files changed, 570 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml

-- 
2.25.1

