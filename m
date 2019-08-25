Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0EC9C44D
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Aug 2019 16:10:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GcVS22QjzDqNP
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 00:10:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="a5Dsnexy"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GcVF68xQzDq8W
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 00:10:29 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id t12so15580825qtp.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Aug 2019 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rQdJ4W7sx1Dw6nKOeB5W9zPWaUkj4EIdG7sI3MyZJ24=;
 b=a5DsnexyjqK++nrn/EmqB36/Ezc0tHgqySC1ObykjuUKy6DP2mF9L3/rQZr/hWq6fp
 oiezoWr3NioPZ6EKPEOELXjaEoCuyXq/kv2FYgfFLB55Gf8qtiWiwXSU8mSvHPk3malS
 JJyd93uT4X9sgvqPodJ2f8489E080ePTrUnsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rQdJ4W7sx1Dw6nKOeB5W9zPWaUkj4EIdG7sI3MyZJ24=;
 b=QABzS9I4R/62DB2vsl9qABhl4HbwYOCau1MIgvCj3XaUmTpzQt8E6INAxRvh1pSXp8
 EWVoDi0Vs3BNX2b5nhZVjLO9AU8bLm/yQ2OZuXF9VfLY45n3zblvxvBJ8r4f8SdQitbt
 RMxuiof0qWj71xNX6JSnG+Ka9eloZXcYuv5I1iQET/Nr2VHYTEbmruqnKYEN/8+EJh4T
 C1D6teU1QAsqvUJXcbINNscwyb5/uyXiVmOSUvo3zsmnGfs4vpbl25HbbjBUK6997FVJ
 CqcI+xNYnEw7r1y7fjcJb3JIofz/w+pO1f7OWZ5v01R/k8PdyhaenYkQjUs7lsLlA2d2
 zNdA==
X-Gm-Message-State: APjAAAWM0KdjUdJ/2pF4B4oWqy+WYaKzAc9FrWfILN3U/JfnkiVJPtdn
 6eEBZtMgskjJds0ddnYMGaR1XgN1sfNrMKJPeHE=
X-Google-Smtp-Source: APXvYqy0P1Tl1BJhu53PFtZq+aExVFsLuax5uzD6g/IqzuiQI+4XXPjixA08Jb/9bWUw+wmR9X8C5GR3VpYz9KNvYqQ=
X-Received: by 2002:aed:3e6f:: with SMTP id m44mr13694652qtf.220.1566742227110; 
 Sun, 25 Aug 2019 07:10:27 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 25 Aug 2019 14:10:15 +0000
Message-ID: <CACPK8XfKHpNYXNE_VRaLeGUQa7-hkmUS0nsPfaeSLE4sckKFHg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.4
To: arm <arm@kernel.org>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello ARM Maintainers,

Here are the APSEED device tree changes. No ast2600 support here
unfortunately as the clock driver wasn't quite ready in time.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.4-devicetree

for you to fetch changes up to 49b0f3be0b86292eed6f6aedadf4252131d9c111:

  ARM: dts: aspeed: swift: Add eMMC device (2019-08-22 15:34:20 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.4

New machines:

 - Facebook Wedge100, Wedge40 and Minipack
 - Lenovo Hr855xg2
 - Wistron Mihawk

There's a few other updates, notably some changes to to use the newly
added SDHCI driver.

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: aspeed: Describe SD controllers
      ARM: dts: aspeed: Enable first MMC slot on AST2500 EVB

Andrew Peng (1):
      ARM: dts: aspeed: Add Lenovo Hr855xg2 BMC

Ben Pai (1):
      ARM: dts: aspeed: Add Mihawk BMC platform

Hongwei Zhang (1):
      ARM: dts: aspeed: Add SGPM pinmux

Joel Stanley (1):
      ARM: dts: aspeed: swift: Add eMMC device

John Wang (1):
      ARM: dts: aspeed: fp5280g2: Fix power supply address

Matt Spinler (1):
      ARM: dts: aspeed: swift: Fix FSI GPIOs

Tao Ren (3):
      ARM: dts: aspeed: Add Facebook Minipack BMC
      ARM: dts: aspeed: Add Facebook Wedge40 BMC
      ARM: dts: aspeed: Add Facebook Wedge100 BMC

Vijay Khemka (3):
      ARM: dts: aspeed: tiogapass: Add VR devices
      ARM: dts: aspeed: tiogapass: Move battery sensor
      ARM: dts: aspeed: tiogapass: Add Riser card

 arch/arm/boot/dts/Makefile                         |   5 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  11 +
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts | 429 ++++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 272 +++++-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts | 149 ++++
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  | 141 ++++
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |   4 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   | 663 +++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        | 918 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |  15 +-
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  28 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  33 +
 12 files changed, 2659 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
 create mode 100755 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
