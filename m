Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B23EE7CD
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Aug 2021 09:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpjt95k8sz30CX
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Aug 2021 17:52:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WTQvyBhS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WTQvyBhS; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpjt16fFWz2yfc
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Aug 2021 17:52:09 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id l24so16432994qtj.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Aug 2021 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
 b=WTQvyBhSFaH0kQ9XuClZSoEzRDenz7OtNePSY1feYXSOiMhWE2Gux6tItSCNdsIqlb
 RRt5k3y2zkMKlOUbnPvL9JrtNG9D3vFfcYPrV/eEONn3dLgoHQlO2Y+XKZn3Tkyuk00n
 ADBEO8LK3V4w39Slu2yfTdkl+di5UEF26Uauw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
 b=Qy5JREAp5Ze0stBzKtxPjYZiHsgA6uuEmYDMVv8y2mpDIeEXRuopqBV3TvTSPIfuI2
 wXBKpXfBMDXYs8h0I66IKQnn4Xnp6jqygnVBX3acrNqn1uiisq3Q0Nh5RD/MDWE/zhS2
 myeHRexnv4pPGAJ2tE0jxlF8JYOUhTbY8UicspCJM8sin+GoeEvhscdtUNdxZX35ZZat
 uBz15a9fi69k2P9e4wvbjb8EZoqY8HTJYDsPRgwUTXn1SV0jbfSkio/WUt3+wYOg9365
 FWr0xgjdx+NA32HH+ow+PYPLNwJNyYnm6jlMXfiQrQ37la1TvnUB/1dPco5L3VTr/SBY
 GBFQ==
X-Gm-Message-State: AOAM531vG6tJuMFleDuleXHP+NQ0W4qlVQo/YNaBMuwKnLQW4hdhPm22
 n8wORnJJ/TE9c4Vuu+KShG5jBellCHkWrXMVqB8=
X-Google-Smtp-Source: ABdhPJw8feCldLj7Vhc6iKE3JJaHj+my9WkV2PsvQhwYUggdZ9tUjdGKV0GGDotySpd7kIReJnHO1FO9/bXwb6aGkEY=
X-Received: by 2002:ac8:5bcc:: with SMTP id b12mr1879604qtb.176.1629186725533; 
 Tue, 17 Aug 2021 00:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 07:51:54 +0000
Message-ID: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
To: SoC Team <soc@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are the aspeed changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-devicetree

for you to fetch changes up to 6b8b31269898b8891f1f3a95578ceeb109393e23:

  ARM: dts: aspeed: p10bmc: Add power control pins (2021-08-17 13:52:46 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines

  * Facebook's Cloudripper
  * Facebook's Elbert
  * Facebook's Fuji

  All three carry the description of "Facebook's next generation switch
  platform with an AST2600 BMC integrated for health monitoring
  purpose."

  They share a 128 MB SPI NOR flash layout that is also used by some
  older platforms.

  * Inspur's NF5280M6, an x86 platform server with an AST2500-based BMC

 - SGPIO updates including AST2600 support

 - GPIO descriptions for the IBM AST2600 machines

 - Pinctrl fix

 - Updates to Facebook's AST2500 based machines

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: everest: Add phase corrections for eMMC

Dylan Hung (1):
      ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi

Jim Wright (1):
      ARM: dts: aspeed: p10bmc: Add power control pins

Joel Stanley (3):
      ARM: dts: rainier, everest: Add TPM reset GPIO
      ARM: dts: aspeed: tacoma: Add TPM reset GPIO
      ARM: dts: aspeed: ast2500evb: Enable built in RTC

Ping Guo (1):
      ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine

Steven Lee (4):
      dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
      dt-bindings: aspeed-sgpio: Add ast2600 sgpio
      ARM: dts: aspeed-g6: Add SGPIO node.
      ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

Tao Ren (12):
      ARM: dts: aspeed: Enable ADC in Facebook AST2400 common dtsi
      ARM: dts: aspeed: wedge40: Remove redundant ADC device
      ARM: dts: aspeed: galaxy100: Remove redundant ADC device
      ARM: dts: aspeed: wedge100: Enable ADC channels
      ARM: dts: Add Facebook BMC 128MB flash layout
      ARM: dts: aspeed: wedge400: Use common flash layout
      ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
      ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
      ARM: dts: aspeed: minipack: Update flash partition table
      ARM: dts: aspeed: cloudripper: Add comments for "mdio1"

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   77 ++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   46 -
 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    4 +
 .../boot/dts/aspeed-bmc-facebook-cloudripper.dts   |  544 +++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts     | 1251 ++++++++++++++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |    8 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts |    5 +
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |    4 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts   |  691 +++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 -
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |    4 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   28 +
 .../boot/dts/ast2400-facebook-netbmc-common.dtsi   |    4 +
 .../boot/dts/ast2600-facebook-netbmc-common.dtsi   |  169 +++
 .../boot/dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 22 files changed, 3033 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsilin
