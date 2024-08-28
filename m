Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCA961FBF
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 08:28:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtvby5xbYz2yjg
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 16:27:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724826477;
	cv=none; b=OzZRD+o3NIyFCIpq05IacIU5hiYyI1AWygdOtoA39iJW/WCmn5gbdNaX2H1+mBr8AT/O0isY8doEwCVqp609Mqly02jGmL/Kmjt5FSAx/5l1poaggricM6UvRKh8Q58cz/PPv2Bq7yh+1mJ0zM3dJseJ8sSQWhlCaMnsnxjPY6wV6h0c+xMspjrgzg7WDfGG/jKGgme8kd+fXIQ+T2JxaBDIh5U1tSv4YDPLtrLAD+04SUsmKZO3/ZX9M19em5qjDtqZdjR+FFJyHr52xYD9N86GgoWcczp7VawENSduQFL1LHsCjfvpCv7IDHL0hMLCPVstgfC2zIFGAla7lSzJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724826477; c=relaxed/relaxed;
	bh=PZL6BAfEQ7zgusiSYxeyEJA8eURa9C3w4dm4TCmsOI4=;
	h=Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type; b=VKMBrE5BiZtMHCmcNS2c5Lx0zCoAxEUwJCeODRG+uvt0wzCVdNynBKVuhXEnt+dt7p6DeuQTc+UcBJ1w0ECA4RnHdhMLTkQ3Q/K9dxfeKm+veuaYvjwEhpHxRgizxJSsHXbLGaFne+fS3EPyXp/YctRwtyG5EIHfZV1lQ92yf4aIeYtAfi1rvLPunidkSDtnl4St8bLObnhNpszmoVHUYytlnnLr7lD8AuasiWe6VuSWIfjeem6ZczqL43d8TuXtB/J3AiNkxOHVMgeU+YdDuF2vUi15A/wtqknZP1MILSjlyLIyyXSS/zrgXhulhHJc+EYtNTIGbJHzpB9K3hqdeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtvbx1qbGz2yZ6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2024 16:27:55 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 28 Aug
 2024 14:27:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 28 Aug 2024 14:27:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v2 0/3] Add support for AST2700 clk driver
Date: Wed, 28 Aug 2024 14:27:37 +0800
Message-ID: <20240828062740.1614744-1-ryan_chen@aspeedtech.com>
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

v2:
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number
-clk-ast2700: drop WARN_ON, weird comment.

Ryan Chen (3):
  dt-bindings: reset Add AST2700 reset bindings
  dt-bindings: clock: Add AST2700 clock bindings
  clk: aspeed: add AST2700 clk driver

 drivers/clk/Kconfig                           |   10 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-ast2700.c                     | 1198 +++++++++++++++++
 .../dt-bindings/clock/aspeed,ast2700-clk.h    |  165 +++
 .../dt-bindings/reset/aspeed,ast2700-reset.h  |  125 ++
 5 files changed, 1499 insertions(+)
 create mode 100644 drivers/clk/clk-ast2700.c
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
 create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h

-- 
2.34.1

