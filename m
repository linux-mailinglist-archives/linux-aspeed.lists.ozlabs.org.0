Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A66698FFC
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVGZ6WPsz3cdm
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:37:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IWvdWUom;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IWvdWUom;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGH2vhWz3cdm
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:08 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id g28so2096967lfv.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4kcTI2putLnbdN9MP2mFPB2+31xxohlAWl8A4kqJzM=;
        b=IWvdWUomqTO8QzgT9/RsA6AztLIRxUOVfgNmvqvN5Gxqy/9cUOZIxx4zOEI1GUMEuO
         V9TAsRuESAn9eSAcdJ2Q3Y3LmKVgHE8dfzqSPMuCxP/X5dVXTxpT/3K4G5ne2L20BOdg
         +Ns/bp3nNMVysizAwePy8SWWIByCVc5VQGg8CAYpY3pYPX0k66HI0RMoIupaYO98vhyF
         UQv0R+0F5TTrERZ+m2rMar8TvjV9kY3VTcqgBRT3yds+E6jk3uqrdTy6JBPMpNEg1k6H
         AheohWlxTzNKMooy9nCo7cHAhRm+3PHCMpalddk4nPGaayP7ES+3UEPmE2SdsVilbLTV
         raJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4kcTI2putLnbdN9MP2mFPB2+31xxohlAWl8A4kqJzM=;
        b=SBweSxgYnGV2+MA55YiSxeVF05gww9jpAwsJaD2Ylgxc8JIOKx2dDpKlKoQCSxgoRi
         5lVfRQo3b/SRLGBCwb5IPwTObf3FNeT4rkKwcAUVlFFXblmGYkJ0EOyi/FrmmExp6h3S
         HYjSLxgXy2wHv3NidIJflGavZgNYVHbTL9NFg7SRkRpQGDcf+Q3AU9zxxRj95vW/B+vT
         tCXUpsW/ZyMRst3SyDAoYZvqCBk8MKWErGvLMaUhYXJPIKPNmPr9AeZ1kCsMFLFpsGdO
         yfrWfyUrWJ6Jhot6fZ9Ely35BpQn3G+8uWtID27PhiWPHShZSeUhovm1Uh3FC8b1fuaM
         8S8w==
X-Gm-Message-State: AO0yUKVy5DyhDn5OZwjXuY/dVIE72Nd236IGOp1QFCTnsKQnF0NTCwUy
	Vur3XpGnKzceaTEhZY3Mj9lx8Q==
X-Google-Smtp-Source: AK7set8LMDSUl/0lfLpNLdxiWXIpZtBeu3tMcI1noiOnxnhVDDzyYiOekOwnbuCrkq4smDZqBa7rOg==
X-Received: by 2002:a05:6512:48f:b0:4ce:88af:473b with SMTP id v15-20020a056512048f00b004ce88af473bmr1118725lfq.54.1676540224493;
        Thu, 16 Feb 2023 01:37:04 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/17] Mass convert GPIO IRQ chips to be immutable
Date: Thu, 16 Feb 2023 10:37:01 +0100
Message-Id: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD357WMC/0XNQQqDMBCF4avIrDtgprTBXqV0kaSjGdAYMioF8
 e6N3XT5w/t4OygXYYVHs0PhTVTmVMNcGgjRpYFR3rWBWrq2ZG4o07Quzo+MIUpWtHfqiMja3jB
 U5Z0y+uJSiKcbssx/cw5y4V4+v8vn6zi+Vg6p2IIAAAA=
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We are getting tired of these irq_chips not getting converted
to be immutable, so I just take out the big hammer and fix
some that I deem not too complex as best I can.

I stopped after doing some, I will take another sweep at some
point I guess.

Please test if you have the hardware. The OMAP patch especially,
hi Tony ;)

I don't expect this to be merged to v6.3, but as Bartosz may
feel it is fixes material they are of course fine to trickle
in on a case-by-case basis.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (17):
      gpio: altera: Convert to immutable irq_chip
      gpio: adnp: Convert to immutable irq_chip
      gpio: aspeed: Convert to immutable irq_chip
      gpio: aspeed-sgpio: Convert to immutable irq_chip
      gpio: ath79: Convert to immutable irq_chip
      gpio: cadence: Convert to immutable irq_chip
      gpio: eic_sprd: Convert to immutable irq_chip
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
 drivers/gpio/gpio-eic-sprd.c     | 33 +++++++++++-----
 drivers/gpio/gpio-hisi.c         | 25 +++++++-----
 drivers/gpio/gpio-hlwd.c         | 33 ++++++++++++----
 drivers/gpio/gpio-idt3243x.c     | 11 ++++--
 drivers/gpio/gpio-max732x.c      |  8 +++-
 drivers/gpio/gpio-mlxbf2.c       | 32 ++++++++++++----
 drivers/gpio/gpio-msc313.c       | 26 +++++++++++--
 drivers/gpio/gpio-omap.c         | 83 ++++++++++++++++++++++------------------
 drivers/gpio/gpio-pci-idio-16.c  | 12 ++++--
 drivers/gpio/gpio-pcie-idio-24.c | 12 ++++--
 16 files changed, 297 insertions(+), 118 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230215-immutable-chips-762922277f1e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

