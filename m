Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F12658F5
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 07:52:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnlK42lbMzDqg3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 15:52:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Y/pxHX0M; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnlJy5GMZzDqXW
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 15:52:34 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id j11so12208541ejk.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=m/C1hfSh+Cv1iAiiETK7AX4qzqwRn+66BFVeawL44Jk=;
 b=Y/pxHX0Mtirk5qHZ+b+4nQc9/toF7Ln7N2yeBzKLPrCepcfSF3XjhdQFgqejNTO/5F
 7hnmu1/nGFvEYPlGhXrQiYMk1kD4ZtcN9t2lK1OA2ny0qIA4GnhdIgsXufZqXvrKR4EE
 PLYQftQ9oF2AEYQXHmxQDaGuMvmv444dCsmQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=m/C1hfSh+Cv1iAiiETK7AX4qzqwRn+66BFVeawL44Jk=;
 b=GAJGEkqgEmoREmW1/TTmufyVtPGgBsZEs8YS2+ztw347cUzvRUlbciFVrf43B15CUb
 7qX1EbDUEiZcUCpz+sT3DxAR26a+8biNYaUWHJ4LDmTwMrNYQoAUhY9imcTj/W4wEcON
 mdC5T3qgLfzX1KIlatNFnaVTi8EzlLJJSLubMcgWcRiDPebaSdYQlC/3JmppwN59jUkw
 vDVT+K10ZQjEzM0WvCAIsrQVZtD7hrpWwcxia32S1iOXzBuYafetrt/TqKH+hCx2+rRm
 N56HLMIrHlE+b9UXCDRdtI6bvslSps2NlTb00yD8+slTqynTyutgDtXK1jE05WZ7e8ZV
 PTYQ==
X-Gm-Message-State: AOAM533i3eKzmAFp1zk9JQ2aRzXILh7L0UNUx6K4k4WG5S8rvuwHWSZ0
 ONZkzfr8Jf5/UBpOz/QAQrwT4xBNRFjtFDxHwds=
X-Google-Smtp-Source: ABdhPJyflTFMwshtAMNwfws4k19Ielz6kvt2izeC1Z2+uwtNXWjw5iNWwDgp3iL7MHp7jPGQbYo+C06AhA27fUxKQeI=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr532577ejw.108.1599803551540; 
 Thu, 10 Sep 2020 22:52:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 05:52:20 +0000
Message-ID: <CACPK8XcDNBYAHzW6NYB4LFm3YbN63AprgW75ZqS+6uXn2b3kug@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.10
To: arm <arm@kernel.org>, SoC Team <soc@kernel.org>
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
Cc: Ben Pai <Ben_Pai@wistron.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Please pull these ASPEED device tree changes for incusion in 5.10.

The following changes since commit e89570584d2bcf188af4baaebacfb6998e6326dc:

  ARM: dts: aspeed: Add Mowgli BMC platform (2020-09-11 15:08:16 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.10-devicetree

for you to fetch changes up to e89570584d2bcf188af4baaebacfb6998e6326dc:

  ARM: dts: aspeed: Add Mowgli BMC platform (2020-09-11 15:08:16 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.10

 - New machines

  * Wistron Mowgli, an AST2500 BMC for a Power9 OpenPower server

  * Facebook Wedge400, an AST2500 BMC system which we can assume is 4
    times better than the existing Wedge100 top of rack network switch

 - Add a new device, the IBM Operation Panel

 - Fixes for Facebook's collection of BMCs

 - eMMC and vuart fixes

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: rainier: Disable internal pull-downs on eMMC pins

Ben Pai (1):
      ARM: dts: aspeed: Add Mowgli BMC platform

Eddie James (3):
      ARM: dts: aspeed: rainier: Enable XDMA engine
      ARM: dts: aspeed: tacoma: Add IBM Operation Panel I2C device
      ARM: dts: aspeed: rainier: Add IBM Operation Panel I2C device

Joel Stanley (1):
      ARM: aspeed: g5: Do not set sirq polarity

Tao Ren (7):
      ARM: dts: aspeed: Remove flash layout from Facebook AST2500 Common dtsi
      ARM: dts: aspeed: cmm: Set 32MB FMC flash layout
      ARM: dts: aspeed: yamp: Set 32MB FMC flash layout
      ARM: dts: aspeed: minipack: Update 64MB FMC flash layout
      ARM: dts: aspeed: Add Facebook Wedge400 BMC
      ARM: dts: aspeed: wedge40: Update FMC flash0 label
      ARM: dts: aspeed: wedge40: Update UART4 pin settings

 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      |  17 +
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |  47 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |   5 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts | 420 +++++++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts     |  17 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  23 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        | 662 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |   7 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   1 -
 .../boot/dts/ast2500-facebook-netbmc-common.dtsi   |  13 -
 11 files changed, 1193 insertions(+), 21 deletions(-)
