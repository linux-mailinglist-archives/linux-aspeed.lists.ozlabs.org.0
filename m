Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B4979DFF
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 11:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6fKP5M79z2ysc
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 19:11:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726477861;
	cv=none; b=jy5RD64ybXVHtRgN9YgbKN0uXZk7AAU79/3nDvgfH7gCywBGyTyOHPrmfzrzYFhy1cmltdsn0KowZLwX7b20qK5FJ4b695cGinf+bZ+0FdYNuzdx+mQGoxDhv99ImgOqoqWFsej5XFruy3TEdAMTKdAR3bLXRBjANV2g3xLZQgr5ouBPJO2BfzWzjjaGlxpmvA2p7WfD98Ay5jr1hx/tThhzjlFvwWWaXoLe8jU6i14Vts6YF9gE0DS0/9ZKq9W30bFRqZnV7e8Wa/toLvzrMuWK6OCJIAlsucQ/GaRJNT4atkNHEUz6JjqkhvgdLcZWE7xDNtzbQr8P3BEQhMqa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726477861; c=relaxed/relaxed;
	bh=UX6iLCyQxYBkbKGNvs8Km1ckvZqzEq7cGzBWswj73Hk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e1kV7Minjy5vTbyYF40bVctUYsULjGVNHAffJCTkZK7y1Z6JrDlK/bh81dAFo3RHcIqCvXfJ7DQquM7Y7hOjnuuMVM/M3udy+g7za64nELwjJOb4ALgeSV1YCy8CvfADIeRa0GP3gvuNUVZXZiHXyEoPf/i2E7fuH/iVpEo0fHFPg6oGRwr9TsS5X/FNrTOJ2UkClHHphzxBxfi3LUXIaJH43wYM4Y7UfqcGWua/PUN8SVriJLd9wrdQYKHC6DRdOMkq25ubCzQkYMWb3UzmQvFbPadKBFgblr8AAf1UQK+1ypbZ63Ci5+oWnYYmHDF9oxggmi1LQOA6ojMnWHg40Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6fKG2FWdz2yTs
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 19:10:56 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 16 Sep
 2024 17:10:39 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 16 Sep 2024 17:10:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 0/4] Add support for AST2700 clk driver
Date: Mon, 16 Sep 2024 17:10:35 +0800
Message-ID: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series is add clk driver for AST2700.

AST2700 is the 8th generation of Integrated Remote Management Processor
introduced by ASPEED Technology Inc. Which is Board Management controller
(BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.

v3:
-yaml: v2 missing send yaml patch, v3 add.
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number.
-dt-bindings: merge clk and reset to be one patch.
-reset-aspeed: add auxiliary device for reset driver.
-clk-ast2700: modify reset to be auxiliary add.
-clk-ast2700: modify to be platform driver.
-clk-ast2700: modify each clk to const clk array.

v2:
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number
-clk-ast2700: drop WARN_ON, weird comment.

Ryan Chen (4):
  dt-bindings: mfd: aspeed: support for AST2700
  dt-bindings: Add AST2700 bindings
  reset: aspeed: register AST2700 reset auxiliary bus device
  clk: aspeed: add AST2700 clock driver.

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   13 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-ast2700.c                     | 1548 +++++++++++++++++
 drivers/reset/Kconfig                         |    6 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-aspeed.c                  |  259 +++
 .../dt-bindings/clock/aspeed,ast2700-clk.h    |  163 ++
 .../dt-bindings/reset/aspeed,ast2700-reset.h  |  124 ++
 9 files changed, 2121 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/clk-ast2700.c
 create mode 100644 drivers/reset/reset-aspeed.c
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
 create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h

-- 
2.34.1

