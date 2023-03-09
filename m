Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4806B1CA0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:46:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLpR5WX6z3cLB
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:46:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZOGUmF5l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZOGUmF5l;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpL2HnJz3bm9
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:01 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id g17so1162363lfv.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7u9Q7fUnpppRJq2RShEjTYzc0gmpoEcEwMnKD4I77E=;
        b=ZOGUmF5lPyvnwoaxcsnaV5kFREvx9c67R8Xt2D4aG2OqbpjoSIFIgfjqkeKd2S6usT
         l8DXLzEVqebWIrKLzoDS9E38ZHi4X+ic8s+682m0ifDHn+tHimOpvXVudCZanN7m+C+H
         vBk53hkGLAEoK0bLibgNAgem9FZPvK8njQ1BlmZ8qRGstSAB9t+Hyw/r4nQZlcRpAMjF
         PXeWttVBiHP1Y35YAuxdi7JNtR0VBHVw3F1xrsIYJLgX49CQQGFroE+TpqvMnr+iF4Lz
         i7YmgZn762YP4GfeUrARK5T1rbAouopqXXUl7MA9C9BOjxvIhXvKgBB84+ifrXOof8PX
         XWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7u9Q7fUnpppRJq2RShEjTYzc0gmpoEcEwMnKD4I77E=;
        b=WL0Ko0QTQsM+mbwzusooBtBrzpKFrIlBWPkb1wNN6Yq7LVuVFhps3Jr3mGWGV5bEh7
         Xp6RRBbOjPydxI2JufzzfOvbHFyQSINR0vKMp9SaghpaxlmEpD1K+iTb/CJvXZ1wbEEr
         blbzsLSNFDrQjmUcWUJPZoCBGoDqV/uznupC5I9e2kqhp0RH4TSpetw2pcZBHnDABAj/
         vhe3viqSTfQ25+ZFG869Hm5szWC1opySdyGeUdI4iOyrgFJ61Kpe4zmWvq2+NWhaVxeY
         +0mibNln8sopdKf58gsR9NCgIZacTsts5fQdbD3Y31S6kV5BIdraISFCV3KzZ+SyjbHh
         W/Tw==
X-Gm-Message-State: AO0yUKUJGafROFG3C1UjW3mtpGR8wUC4SEGlMvNbTJF1e7bi++u8Rg1N
	MyRXQp+Ccux02ktEtRlFiNUi5g==
X-Google-Smtp-Source: AK7set+vIUQ72mb6AEMJVO/fxbvWyj70zhw6JKYV9d4wNLZO7GH6w6kig86D2dIVDe9AxryQMSHQBQ==
X-Received: by 2002:ac2:5dfa:0:b0:4b6:e405:1027 with SMTP id z26-20020ac25dfa000000b004b6e4051027mr6046573lfq.14.1678347955140;
        Wed, 08 Mar 2023 23:45:55 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:45:54 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 00/17] Mass convert GPIO IRQ chips to be immutable
Date: Thu, 09 Mar 2023 08:45:48 +0100
Message-Id: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2OCWQC/4WOQQ6CMBBFr0K6tqYdBMSV9zAuCp3SSaAlLRIN4
 e4WNsaFcfl/5r0/C4sYCCO7ZAsLOFMk71LIDxlrrXIdctIpMxCQC5AFp2F4TKrpkbeWxsirEmo
 AqCojkSWqURF5E5Rr7cZ1I/kPsx2MAQ0998nbPWVLcfLhtX8wy639PTZLLngh1dkAnFShxbUnp
 4I/+tCxTTbDHwEkgS4bgbkBXdfyS7Cu6xs9SJNyEQEAAA==
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 William Breathitt Gray <william.gray@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We are getting tired of these irq_chips not getting converted
to be immutable, so I just take out the big hammer and fix
some that I deem not too complex as best I can.

I stopped after doing some, I will take another sweep at some
point I guess.

This is v6.4 material.

The last two patches to pci-idio-* (patch 15 and 16) can be
omitted if William's patches to convert this driver to
regmap GPIO are merged first.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Deleted the irq_chip->name assignment in the Aspeed driver
- Fold in a patch from Joel to make aspeed IRQs compulsory
- Link to v2: https://lore.kernel.org/r/20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org

Changes in v2:
- Rebased on v6.3-rc1
- Collected some test and ACK tags
- Link to v1: https://lore.kernel.org/r/20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org

---
Joel Stanley (1):
      gpio: aspeed: Always register the irqchip

Linus Walleij (16):
      gpio: altera: Convert to immutable irq_chip
      gpio: adnp: Convert to immutable irq_chip
      gpio: aspeed: Convert to immutable irq_chip
      gpio: aspeed-sgpio: Convert to immutable irq_chip
      gpio: ath79: Convert to immutable irq_chip
      gpio: cadence: Convert to immutable irq_chip
      gpio: hisi: Convert to immutable irq_chip
      gpio: hlwd: Convert to immutable irq_chip
      gpio: idt3243x: Convert to immutable irq_chip
      gpio: msc313: Convert to immutable irq_chip
      gpio: mlxbf2: Convert to immutable irq_chip
      gpio: max732x: Convert to immutable irq_chip
      gpio: omap: Drop irq_base
      gpio: omap: Convert to immutable irq_chip
      gpio: pci-idio-16: Convert to immutable irq_chip
      gpio: pcie-idio-24: Convert to immutable irq_chip

 drivers/gpio/gpio-adnp.c         |  9 ++++-
 drivers/gpio/gpio-altera.c       | 25 +++++++-----
 drivers/gpio/gpio-aspeed-sgpio.c | 44 +++++++++++++++++----
 drivers/gpio/gpio-aspeed.c       | 82 ++++++++++++++++++++++++++-------------
 drivers/gpio/gpio-ath79.c        |  8 +++-
 drivers/gpio/gpio-cadence.c      | 10 +++--
 drivers/gpio/gpio-hisi.c         | 25 +++++++-----
 drivers/gpio/gpio-hlwd.c         | 33 ++++++++++++----
 drivers/gpio/gpio-idt3243x.c     | 11 ++++--
 drivers/gpio/gpio-max732x.c      |  8 +++-
 drivers/gpio/gpio-mlxbf2.c       | 32 ++++++++++++----
 drivers/gpio/gpio-msc313.c       | 26 +++++++++++--
 drivers/gpio/gpio-omap.c         | 83 ++++++++++++++++++++++------------------
 drivers/gpio/gpio-pci-idio-16.c  | 12 ++++--
 drivers/gpio/gpio-pcie-idio-24.c | 12 ++++--
 15 files changed, 290 insertions(+), 130 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230215-immutable-chips-762922277f1e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

