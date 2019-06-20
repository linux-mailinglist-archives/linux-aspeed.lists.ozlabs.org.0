Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D72124C870
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 09:34:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ttqx1P4bzDrBd
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 17:34:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HhCmBNDR"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ttqr1bVjzDr7P
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 17:34:32 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id p15so2254196qtl.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=opL2zp18YnmTOfD3nJtvIoIaI7cchsn9/smGdNrpPY0=;
 b=HhCmBNDRtNjYnwGuG4f3HjzdaUVMsZ7BG2RnVud73GNk2EmJk/OCmTvs30j3n8WxR8
 gCWqVVTCsCzpBrzJ+rAPvmDMPoV+T9Xrq3D/xG/OrF+Zef45AtmJ2jggaOD313C6wqwT
 5bPkRE+APQxX3uwo8e79SEBxnin7s1Rm3mTvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=opL2zp18YnmTOfD3nJtvIoIaI7cchsn9/smGdNrpPY0=;
 b=T4/4HXJpr7n/zl6LCx+/N3EVpK9u0Vjn43oU8Y9I9MbeQBc05J+qYHtjMjwgxx3/BG
 BeRkpRrmWFipqV2X+ejODoVds/DZx76Te6G8PrVxCR6WlQ6RMHCBJPD1QDRvhkl6Ld1w
 jZijYxPjT+ZRJ0cIOs+mBKQRKI8Lszdb1mbo8xXDhxvEy7DQsM+jdE0MkUxhrob5OR65
 gij09LGm3KzZD/1dzygKDHDVJvkZGyR26NSu31h+1LkFdwKdDLLuAW3Ei6/qEGInNnZP
 dXTn/EtMuu3UIsuHUUjArs2CBCD/FK6OxQ5cAVkZyE9W246h0tVw5dEehtQXu+AZ9BIK
 Rh4Q==
X-Gm-Message-State: APjAAAVFE5+dn4fEcQ3oJLD9WbaZxZ56MZ/w37PAKaYEG+AR3+02Osd/
 dgnG/tLmiQ1PLLhDVXPr5O0x1xQzDAVmHsczVco=
X-Google-Smtp-Source: APXvYqwRxXdtvtt6uzudgb1QKaYmA2gWC+s0AgywtWsHXoMeiZw60VhSib0MRWaRzLMmLIEy16khGqRajUx3G01G1qM=
X-Received: by 2002:ac8:2493:: with SMTP id s19mr90260592qts.220.1561016068125; 
 Thu, 20 Jun 2019 00:34:28 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jun 2019 07:34:16 +0000
Message-ID: <CACPK8XfMEzqvTGZz7JZxz0XQ0tBHzpJRDxtCEFB-ZzKCyDeuQw@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: dts changes for 5.3
To: arm <arm@kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello ARM maintainers,

Here's the ASPEED device tree changes for 5.3. Most of the patches
have been baking for a number of weeks, with a few late changes added
in today.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.3-devicetree

for you to fetch changes up to 6084110a0e9c4bff75970f3d68091ceff9e2c2c7:

  ARM: dts: aspeed: Enable video engine on romulus and wtherspoon
(2019-06-20 16:37:26 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.3

We have various device tree updates from the OpenBMC project to enable
bits and pieces in existing systems, notably updates to Google's Zaius.

There are some AST2500 machines under development:

  * Lenovo Hr630
  * IBM Swift
  * Facebook YAMP

And some AST2400 machines that have been around but out of tree and have
now joined the party:

  * YADRO VESNIN
  * Microsoft Olympus

----------------------------------------------------------------
Adriana Kobylak (2):
      ARM: dts: aspeed: Add Swift BMC machine
      ARM: dts: aspeed: swift: Add pca9539 devices

Alexander Filippov (1):
      ARM: dts: aspeed: Add YADRO VESNIN BMC

Andrew Peng (1):
      ARM: dts: aspeed: Adding Lenovo Hr630 BMC

Benjamin Herrenschmidt (1):
      ARM: dts: aspeed: Add Power9 and Power9 CFAM description

Eddie James (1):
      ARM: dts: aspeed: Enable video engine on romulus and wtherspoon

Hongwei Zhang (1):
      ARM: dts: aspeed: Add Microsoft Olympus BMC

Joel Stanley (1):
      ARM: dts: aspeed: Rename flash-controller nodes

John Wang (1):
      ARM: dts: aspeed: Add Inspur fp5280g2 BMC machine

Maxim Sloyko (1):
      ARM: dts: aspeed: zaius: add Infineon and Intersil regulators

Patrick Venture (2):
      ARM: dts: aspeed: Add aspeed-p2a-ctrl node
      ARM: dts: aspeed: quanta-q71: Enable p2a node

Robert Lippert (2):
      ARM: dts: aspeed: zaius: update 12V brick I2C address
      ARM: dts: aspeed: zaius: fixed I2C bus numbers for pcie slots

Tao Ren (2):
      ARM: dts: aspeed: cmm: enable ehci host controllers
      ARM: dts: aspeed: Add Facebook YAMP BMC

 arch/arm/boot/dts/Makefile                         |   6 +
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      |   8 +
 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts     | 160 ++++
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 846 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts      | 566 ++++++++++++
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 207 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |   2 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  22 +
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  14 +
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 966 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        | 224 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  14 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         | 123 ++-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |   5 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   8 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  11 +-
 arch/arm/boot/dts/ibm-power9-dual.dtsi             | 248 ++++++
 17 files changed, 3417 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
 create mode 100644 arch/arm/boot/dts/ibm-power9-dual.dtsi
