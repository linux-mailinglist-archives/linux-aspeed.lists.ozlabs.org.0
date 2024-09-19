Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07297C744
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:44:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Vw105m4z2yNP
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 19:44:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726739038;
	cv=none; b=Nwc+UFnwh73v55fZqoeF8es/3zWWc0k3LaaA8eUJiArBoVxyhX0q2s/w5o32xAWuxZQV8LsicQ6qYoU5d7c3TBs1r9aojH4lnw0R5AKH6g5q6dZyB+jQxEQXXDsy0rHuAyoF2cdpWxLA1JXV2n5N/3MloAfySVjZ6bCXwWXmcA1kuMvjCS/+fLm6Gaxyc2wlh041ePoxb9c6k1+Xll3A865WKLADGNqvWzNQQYssRUNET048nG/wvuDFGnRTPfIh4fDmooSfLJo0OrJORat5jzhdueHZ9T1AfN3uL2d0CPQQXUBcIbvj0M8I5QdQS2Wo280A5kf6IeM4Qq0lnTt/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726739038; c=relaxed/relaxed;
	bh=+xsT/Fr3xPWlK3LP2y7/aGpNkh49ReyK64lOVpNgLzE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J2nIqkijyPetFL8pANvTAjgMqmOyZR2huHkw6SFXesEVdoKA3Gx8weQCyl/vC0tAkdsjFEu6sIRlHXJABm3qdzALUTpKMuglpRD21Z+0KNKL+XjdeIWggdABTxCIFMC5S9R7D43e8Rxcn8/02w8LKwiHyNj+QSzBQZc+jj4I8tt4VqlpwVetmRQccEKO17CvgtAkbtUZi0OxI2HBwE+eJphBvSKxD3fMeWHjtqP0Bfy1Xgq84PnVpW3TSMSZn4NZ/Ww8w3jsIMweBAeoS4uXpl4ST1NqCyYH5jtwkda8hNWmPmxSsNIu9gI9pfy6cdHoHCFnOAIOIG4Lkpmujxz6Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Vvx3TPXz2y66
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 19:43:55 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v4 0/6] Add Aspeed G7 gpio support 
Date: Thu, 19 Sep 2024 17:43:33 +0800
Message-ID: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
- Remove the example for ast2700, because it’s the same as the AST2600
- Fix the sparse warning which is reported by the test robot
- Remove the version and use the match data to replace it.
- Add another two patches one for deferred probe one for flush write.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (6):
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller
  gpio: aspeed: Change the macro to support deferred probe
  gpio: aspeed: Add the flush write to ensure the write complete.

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  19 +-
 drivers/gpio/gpio-aspeed.c                    | 565 +++++++++++-------
 2 files changed, 358 insertions(+), 226 deletions(-)

-- 
2.25.1

