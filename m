Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F17399940D0
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 10:15:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN82r2r1Pz2yY0
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 19:15:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728375314;
	cv=none; b=GD+oOfSMas+sxDkahQv6YTCtWJqeGoIo9fAqNxrRU7BmEWlmCPV1UIGDbK+QM5RkcLnKdIUcQUF77SlJliEh4pXvTQZ+p5rF+3wC9QPuMmRqHyvH+FzHmdolW+ZTpUDVP488uNTkmJRlu6vQ5+hmgRtnWTr71p9D2ZS8PpPcPZl07X6TPZfaMxdyIZ9r37QTk1Nbgz5ZC7onlYtS/NwhzGD93IOKkZkPjlJ/K8aOGImFAtdk1FMQK2DgiyeLuVPh7rtptgdG4WZDF4RmJ+QZ2Vm0LJVWwvu8Z9OdNQl7JMROthxiPvEpcOhXm1mR6aK4KgVb6/znViu4HIvQesdEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728375314; c=relaxed/relaxed;
	bh=gAC2jvnrzh4Pu0XmhNLuUpc8pqd31rD8Wau0w6O/Nzs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kTuJLmNa12hhP9gcKLyuANf8sjL/srX5VNN4KligPikQXA3sRHuA7dCwbr0poeNtlv6C00nQZgsK9TXs4IVIps1n8h10tUfggZgyi28HHqUw3vPzx2BbyqLRpWBHn5quTUPastYjBAIf6qXfDnrhTgk2xkdp+8eRlmzwCAUJDimlFSEVNCEwMKHoPi+0lasRQPW2tU5q+786MxpnXPVpPAX0rpcmSptZYdBkboICoyZlhcBMnop/PSApKwhrP2TubbHBP7cJXWypXWHzo8fDejYJh5tlNCYZcrNGCAGFK32OAfPix2PTwZ2YGKslxal9AcG4v7r0/JNj5covZsmBBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN82m1mj9z2xFn
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 19:15:10 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 16:14:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 8 Oct 2024 16:14:50 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v7 0/7] Add Aspeed G7 gpio support 
Date: Tue, 8 Oct 2024 16:14:43 +0800
Message-ID: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

Change since v6:
- Reorder the patch.
- Reoder the llops assignments in the same order as the member declarations.
- Add a comment explaining the logic used for the debounce timer array.

Change since v5:
- Reorder the aspeed_gpio_llops api
- Add aspeed_gpio prefix for all of the api
- Add mask value check before field_get and field_prep
- Separate the devm_clk_get_enabled modification into a new patch.

Change since v4:
- Add `reg_bank_get` callback
- `reg_bits_get` -> `reg_bit_get
- `dcache_require` -> `require_dcache`
- Use `devm_clk_get_enabled` to get the clock source
- g4 specific api doesn't need to use the callback function 

Change since v3:
- Add `privilege_ctrl` and `privilege_init` callback
- Use `bool aspeed_gpio_support_copro()` api to replace the
`cmd_source_supoort` flag
- Add the `dcache_require` flag and move the dcache usage into the
reg_bit_set callback
- `reg_bits_set` -> `reg_bit_set` and `reg_bits_read` -> `reg_bits_get`
- `bool copro = 0` -> `bool copro = false`
- `if (!gpio->config->llops->reg_bit_set || 
!gpio->config->llops->reg_bits_get) return -EINVAL;`
- Correct the access of reg_irq_status
- Remove __init attribute to fix the compiler warning

Change since v2:
- Correct minItems for gpio-line names
- Remove the example for ast2700, because it's the same as the AST2600
- Fix the sparse warning which is reported by the test robot
- Remove the version and use the match data to replace it.
- Add another two patches one for deferred probe one for flush write.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (7):
  gpio: aspeed: Add the flush write to ensure the write complete.
  gpio: aspeed: Use devm_clk api to manage clock source
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Support G7 Aspeed gpio controller

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 620 +++++++++++-------
 2 files changed, 408 insertions(+), 231 deletions(-)

-- 
2.25.1

