Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052744F785F
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Apr 2022 09:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtyP6GrVz3bZs
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Apr 2022 17:57:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtyC584bz2yJ9
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Apr 2022 17:57:06 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2377id9e045432;
 Thu, 7 Apr 2022 15:44:39 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 7 Apr
 2022 15:56:00 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: [PATCH v3 0/3] Add reset deassertion for Aspeed MDIO
Date: Thu, 7 Apr 2022 15:57:31 +0800
Message-ID: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2377id9e045432
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

Add missing reset deassertion for Aspeed MDIO bus controller. The reset
is asserted by the hardware when power-on so the driver only needs to
deassert it. To be able to work with the old DT blobs, the reset is
optional since it may be deasserted by the bootloader or the previous
kernel.

V3:
- remove reset property from the required list of the device tree
  bindings
- remove "Cc: stable@vger.kernel.org" from the commit messages
- add more description in the commit message of the dt-binding

V2:
- add reset property in the device tree bindings
- add reset assertion in the error path and driver remove

Dylan Hung (3):
  dt-bindings: net: add reset property for aspeed, ast2600-mdio binding
  net: mdio: add reset control for Aspeed MDIO
  ARM: dts: aspeed: add reset properties into MDIO nodes

 .../bindings/net/aspeed,ast2600-mdio.yaml         |  5 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi                  |  4 ++++
 drivers/net/mdio/mdio-aspeed.c                    | 15 ++++++++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.25.1

