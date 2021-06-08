Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18439EC18
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 04:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzZ4Z016qz300K
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 12:31:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dqdPDJkD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dqdPDJkD; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzZ4S1xKKz2xv7
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 12:31:35 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id q6so10040108qvb.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Jun 2021 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
 b=dqdPDJkDCuEZ1Ah4vxQrDsiTr1jeFn6P/47b9G4+fG+MLusPHgEkYcvdJv+Hy86dEu
 CSopIaCtJPCXLk0V8I/Z1KHKez+5U9UW5zhc9Xfdmpb0+Zj0jYe7qsMcDKVSbBMYeT5U
 0Jhzg+CKm3wSGZDmC56mF8Ci2uDqS/oPXXEuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
 b=leFTJIq8jqAvn5MPTqG3qs3j+LIRqYclU/lYsm6YY+lSHCctQ5T6EKrVxkOfSN3jQv
 FtaIWEOoB24n3VTR9JlKpI4eRsLNx/irMR0IzgnnOgDfnJkvo8ktY8Ml0L0dAzNIUW1h
 z8UFeTMugfazwxOBb9UHm8XvgLTsQclZMsEMpH4eoLEit8zmo62jIBw1dNVCLh4g+G7w
 soNVb6GpzvoPeYxjNM4ZPJd4cR5+TRXOVYJbI/eYNbDDTGo3jJd11+zo8W2/5sBYWmCX
 YvwZ2TdofCaFe/Ji+9uR8F+3EJF89ohXd1948TueC58fdO1BL7szE6Z5/OigEjkP1CEG
 bsnw==
X-Gm-Message-State: AOAM532/L/OskAvyROx9SSPikB8i4PLPNHN+wjP9Rh0JBZKzCdCP573K
 Kg8VhUjra7CipmkyW6R/uitV+Sr+eTd4c7f6TsY=
X-Google-Smtp-Source: ABdhPJzhXY/SJseg0VPNHlw2tkO3JkY6p7RIGqOsi5vobBUn+f6MbbHLg2B78ZJxHCzP4QGFMNWGkgF2DhTAh+9rrsE=
X-Received: by 2002:ad4:4513:: with SMTP id k19mr5251381qvu.10.1623119491048; 
 Mon, 07 Jun 2021 19:31:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jun 2021 02:31:19 +0000
Message-ID: <CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.14
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrewrjeffery@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

A normal looking Aspeed pull request for the next merge window.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree

for you to fetch changes up to dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.14

 - IBM Rainier and Everest LED descriptions. These systems have a large
   number of LEDs attached via expanders.

 - Ampere Mt Jade updates, as OpenBMC bringup continues for this
   machine.

 - Updated 64MB flash layout for systems using OpenBMC on NOR root file
   systems.

 - Support for HS200 MMC on AST2600 EVB. This is only supported from A2,
   so a new device tree is added to support A0 and A1.

 - Update all command lines for early serial output.

----------------------------------------------------------------
Eddie James (1):
      ARM: dts: aspeed: Rainier 4U: Remove fan updates

Joel Stanley (2):
      ARM: dts: aspeed: Set earlycon boot argument
      ARM: dts: aspeed-g5: Add SCU phandle to GFX node

Quan Nguyen (3):
      ARM: dts: aspeed: mtjade: Enable OCP card support via NC-SI
      ARM: dts: aspeed: mtjade: Add PSU support
      ARM: dts: aspeed: mtjade: switch to 64MB flash layout

Santosh Puranik (1):
      ARM: dts: aspeed: Everest: Fix cable card PCA chips

Steven Lee (4):
      ARM: dts: aspeed: ast2600evb: Add sdhci node and gpio regulator
for A2 evb.
      ARM: dts: aspeed: ast2600evb: Add phase correction for emmc controller.
      ARM: dts: aspeed: ast2600evb: Add dts file for A1 and A0
      ARM: dts: aspeed-g6: Add pinctrl settings

Troy Lee (1):
      ARM: dts: aspeed: Grow u-boot partition 64MiB OpenBMC flash layout

Vishwanatha Subbanna (7):
      ARM: dts: aspeed: Everest: Add directly controlled LEDs
      ARM: dts: aspeed: everest: Add system level indicator leds
      ARM: dts: aspeed: everest: Add nvme and fan indicator leds
      ARM: dts: aspeed: everest: Add pcie slot indicator leds
      ARM: dts: aspeed: everest: Add dimm indicator leds
      ARM: dts: aspeed: everest: Add vrm and other indicator leds
      ARM: dts: aspeed: everest: Add pcie cable card indicator leds

 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |   15 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  119 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   59 +-
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    |    2 +-
 .../dts/aspeed-bmc-arm-stardragon4800-rep2.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      |    2 +-
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 2060 ++++++++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   30 -
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |   10 +
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   18 +-
 37 files changed, 2116 insertions(+), 253 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
