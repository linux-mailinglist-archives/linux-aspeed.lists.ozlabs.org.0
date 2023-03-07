Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB96ADFAE
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzH23Krz3cdG
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:04:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pkj0393X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pkj0393X;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFz73QPtz3bZx
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:49 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id y14so13074786ljq.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWAazNHBDVRAh2BONHNMgJ6UofOBNN4Fn8MZeeYeiu0=;
        b=pkj0393XpFRI99wm6saQTaQPPmMUBplQtNlf1h4PD/Zay63D1nQisoaVe95PSHJwpN
         ygvUWiwScJvDaV3Qe0PmHcXYpGaY9oYV0Gm/e28LQX7jl8pK/q4nQ3eM0pSpjMezHbPW
         H6PXcnX+D+M8x3lOF27cHdUdwokO7ggt0zBh2mB7Xil4V66wDg3blNn4emtr0iooL/U/
         cK3lNt3eIE14tUXw57R31rqUhT9FgZCfEhpJX271vdEjMhNqiZT4zQqK6FxSEZClUIfI
         LtnKt4NpstuXMZxk+P7Knq9c5kOTBkMVtdk4GxBEmsHt3DSDrq+mDUcZRmfspMzrn5xO
         a1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWAazNHBDVRAh2BONHNMgJ6UofOBNN4Fn8MZeeYeiu0=;
        b=5eMmMy+sdDi8cXdrE2R/adTBanCpe8kAARJvGLyElTfl4tIx8FAj6ekgC/Nt8iStqX
         AWGNUAHihORqcVYu3OCwL8So1psuiboGrpBlZy4XiThRFVhjjMsdDYLpA3uixW3EcEGL
         EiFn9Jvjdny42mK1cQRIx8SIwivnjgedGEWyZ8BySVZJqnt4Xda78zgObT5Ran69rQIX
         szfLKCEQQBZUZlq7GsXPuhKvXuC1o7vVPaU/vKXvXP5Y9RRGQRooHA0LxKkZ4cXrckuT
         uMeEcB9GB8WGMVgNHVIilrCvQRD4ACN+qqquVePM6IyUTA3OEuXvx/mJmBro7lkis7ks
         8TfQ==
X-Gm-Message-State: AO0yUKVFxRDwFWzse5MZp1IWIEq47T7wuYf2vDMg9hTA8jFy2ay1yskh
	tvj7j7d2srFGbtzvC1oSzHLHYg==
X-Google-Smtp-Source: AK7set/+CaDoWlGsmws8NLZ0ArqU7rN6NOrFt0w/Lq4mckNLP+Uoto4U0QDcb4hzd4153c9yamDYeA==
X-Received: by 2002:a05:651c:544:b0:298:4424:aea9 with SMTP id q4-20020a05651c054400b002984424aea9mr2870926ljp.21.1678194285179;
        Tue, 07 Mar 2023 05:04:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/16] Mass convert GPIO IRQ chips to be immutable
Date: Tue, 07 Mar 2023 14:04:42 +0100
Message-Id: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGo2B2QC/3WOwQ6CMBBEf4X07Jp2FVFP/ofhUGChm0BLtkg0h
 H+3cPHk8U3mZWZRkYQpqnu2KKGZIwefAA+Zqp31HQE3iRVqPGk0OfAwvCZb9QS14zFCccEbIhZ
 Fa0glq7KRoBLra7d53cjh52yFUajl9z75LBM7jlOQz/5gNlv6f2w2oCE39toinm3e6EfP3ko4B
 ulUua7rF6W1ixPQAAAA
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
Changes in v2:
- Rebased on v6.3-rc1
- Collected some test and ACK tags
- Link to v1: https://lore.kernel.org/r/20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org

---
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
 drivers/gpio/gpio-aspeed.c       | 44 ++++++++++++++++++---
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
 15 files changed, 273 insertions(+), 109 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230215-immutable-chips-762922277f1e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

