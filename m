Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD1988310
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 13:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFSdC6QDLz3cJk
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 21:18:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727435901;
	cv=none; b=GHsN5eUVB25XcjiIsxdl2lYDmzP3qbqRRfgMrs3nm2oHgWZiV92ujK64OP9BnS4PuIAjCe9xK/+8eWNivGXZlMlfLMKZFQ2xjwQFfhUJTH5NDKvdi2zbq09sHgaj8A2XWoFsOL7f+XMnoKhjARNn3m7eSHRKkTSTMoiwGAbjXkb9XVEZfA5x705lIfB0NskJABNj24MwyZCOZnK8Ojeytpx+WYPHj4S2pP0lsusyxAIyJvo4dKKAj0foR7p1QsYXsbQQx/RrFin3i8zFcNz1k0MiLXwgkKByA9bQ00KUqp88EGCgHYBm4wEZf4Na/NN8+LgxDih0gXAj6hxYNjvdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727435901; c=relaxed/relaxed;
	bh=XdHMZZdj11ML4YoAuShBk+07kz0wBVdh7ArP1d1BoxU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HMyku0IsNqEZCio6UgZI/e1rJXJNNct+5/z+IENtYROuGnS5cRiuJrF6r3XGtUuP4yzRz/hQEcj+IGWWXxTR+pNTjtXUBNm0qu2aq+anOxvIlt3VD18iAfcu+qU2UVaGhnurq33POzzZN0jDjO73+ujZjmFvkgLWY78PuMCcRG5DXW6tX1m8wWi6NwW+uBbV77ynObjtTKyp+DaUefL+V2XnWG812nbo/J6k5cX5J19/IzwrfFrQ26pcsz+xyMU3J3EQpGl2zV+P99Ns11Q4Os6WhYK36LBZXWwUuKL7XcioxkmZhu9Lhn4WuTO0ofqXO3AFk85InxP515svOnpzNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFSd85JsMz3c66
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 21:18:11 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 19:17:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 19:17:44 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v6 0/7] Add Aspeed G7 gpio support 
Date: Fri, 27 Sep 2024 19:17:37 +0800
Message-ID: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

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
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Add the flush write to ensure the write complete.
  gpio: aspeed: Use devm_clk api to manage clock source

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 605 +++++++++++-------
 2 files changed, 394 insertions(+), 230 deletions(-)

-- 
2.25.1

