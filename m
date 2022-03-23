Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0244E4A20
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 01:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNV0C0KZkz303H
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 11:41:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNV034lMSz2xY3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Mar 2022 11:41:05 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22N0Thp7001180;
 Wed, 23 Mar 2022 08:29:43 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Mar
 2022 08:40:15 +0800
From: ryan_chen <ryan_chen@aspeedtech.com>
To: <BMC-SW@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
 <p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add ASPEED AST2600 I2C new controller driver
Date: Wed, 23 Mar 2022 08:40:07 +0800
Message-ID: <20220323004009.943298-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22N0Thp7001180
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series add AST2600 i2c new register mode driver. The 
i2c new register mode have new clock divider option for
more flexibale generation. And also have separate i2c 
master and slave register set for control.

ryan_chen (2):
  dt-bindings: i2c-new: Add bindings for AST2600 i2C new controller
  i2c:aspeed:support ast2600 i2c new register mode driver

 .../bindings/i2c/aspeed,i2c-new.yaml          |   78 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/aspeed-i2c-new-global.c    |   91 +
 drivers/i2c/busses/aspeed-i2c-new-global.h    |   19 +
 drivers/i2c/busses/i2c-new-aspeed.c           | 1698 +++++++++++++++++
 6 files changed, 1898 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-new.yaml
 create mode 100644 drivers/i2c/busses/aspeed-i2c-new-global.c
 create mode 100644 drivers/i2c/busses/aspeed-i2c-new-global.h
 create mode 100644 drivers/i2c/busses/i2c-new-aspeed.c

-- 
2.25.1

