Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1095971652
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 13:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2PKq3ZQkz2yVF
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 21:11:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725880301;
	cv=none; b=XfxN1Y12pFwBdg07Acu8lStnG9Y3HCG8q5Rad8dKIOl4NVIiELGCKiOHjz/DIaVR+ukZDJE1BA3JDvG2kuvgMqMhOYjBywJ54fVTrTcq/YQfnF6ZvsTgfDro34uRq1syg20EBKDsZUQOvl5QdNy9/hok2NyO2y1Bfs1XcgUXFrS3MfL1p31UzqhUdVDd3nVjsmGkrF8ERKzHwO+YWxE3tQVfLz/PQJ8S7Jm7TBFUGdr64riL/HJRdxgp1csHxJsTbLfpmFqRMDnJPUkaNKvKCs3062jYcimtS1whkNzK+n2XedSXLaYhLjP/5QrKXLMP2PPPHPfkf5AYikoGn0YY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725880301; c=relaxed/relaxed;
	bh=hEi6zUwnbDjys825gM3YK1GcVffLVfXi3GfkImwNjuY=;
	h=DKIM-Signature:MIME-Version:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=oyrtb5GcF1s23r+efiFdPBaNUOFUtpxzHAMCDERyVXMapLG/5gI+u7Fy3L3BiiW2K6jg27MZAvB7V3zdyD/TcODcKud7/QmNGcNq67+p60kngA7H5DQNL3QC4m+uiXxznUxm2UDzHO0uRotE9tDHcnnd3q1cth+5egWA41/kERimSfPJ59mJEbf6guGczh20aJMtjGfoHlcqFsJiaByWszrbQmdyx84ImMm8cq4I7+gEQO47X0E9kgAqpCmnWWz90pPqs9wh+V9Dy/cfIiwqfz/Im/vuPusyT1E2BBTJ2hxpYZ9yu1g7RcBxHkVCMjwsJ4avSImPFSqByWizW1RD9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au; dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FDJurmKk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FDJurmKk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2PKk62GVz2yN4
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 21:11:36 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53662965a05so1895756e87.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Sep 2024 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1725880291; x=1726485091; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEi6zUwnbDjys825gM3YK1GcVffLVfXi3GfkImwNjuY=;
        b=FDJurmKkXQTO89wSq1ZicQqoAcuVcgVo36JMhUrwsbdzTVDF5arpCrx9+Py6ZZXzSS
         G4ZLE/aWsu+9KPhaS+cJKw/mgxX9QfTkbo14Z/UGToQw12BaGpt6X7nbnrborV8U9Osc
         oYmv9t8YEQGTbiNx7a3g80TLqXbHW+DOmR5os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880291; x=1726485091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEi6zUwnbDjys825gM3YK1GcVffLVfXi3GfkImwNjuY=;
        b=SPYfz1tx+ceIbMaBf3nffl+lII0OPNdWT9xtUAX8ZxYeiSjDGDbND4vsGjgo304was
         jJu0CHREJeeamtMHtcQzujtqaOO3vI9rIgMXKkjEpFJ1uTdOXHIpBtx4aYxuLYuDJAsX
         /h+nOxaITy0jU0mPkvj80NnJiEt+g19owYzni6Bg8gVQNHL+iCsY/77m+b9+9uZPrmBZ
         nx12d3Ti8z5XGIMu86nDiT44V/6pigOtxqnyZtMAq98wMUhUZHMoFpovJ/g8RUtyI9Wo
         ITVs/sZt3kjeiTkCVAbqehAY3y3tnhYXXASlr9OpSpfbLa/V/5MY252VZlsJAisHlXYG
         T4tA==
X-Forwarded-Encrypted: i=1; AJvYcCV+e2XQoovxnp0qt+3bL6G1Y+q1vkx/BYmhsq4toUFwLNDSU8vJp0dIu6yllWXa9kPKU46HdpbdGlUvMi8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywy6FJm3ddHIM1Z9n+r12i8NJcrHDtMDQT70/G01apfVbQ1i3AB
	JQenehCjE7/OB0nq9+4UD2a/lSXlcOxFw6ZlvpFwW5mquFfgHJfcmsM6xAmxQcPbqIVTeI7YPB9
	lQdO70W7egGcPWVf2lavXvfco3nA=
X-Google-Smtp-Source: AGHT+IHUs7T5VaWD0jgLB/pWAwf9yx1RNXhU/EPxRRDinoFHGdasJSOiQ6hplnfyx1StBfuDjhWndZoFKtBV9lnBXFU=
X-Received: by 2002:a05:6512:2215:b0:530:e228:7799 with SMTP id
 2adb3069b0e04-53658813717mr8325341e87.58.1725880290973; Mon, 09 Sep 2024
 04:11:30 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Sep 2024 20:41:17 +0930
Message-ID: <CACPK8XeGDUrbJ-OaxqQBR=aVVYyrKGnvT1ZKXO0vPHpsjQ_i9g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.12
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Here are some aspeed changes for v6.12. They are late because I forgot the =
pin
for my yubikey, so I couldn't sign a tag. All sorted now. I've missed
a few merge
windows so I sent this along just in case you had time to put it in this wi=
ndow.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b=
:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.12-devicetree

for you to fetch changes up to b4c322c2783aedd652183bcec6d545ad45eba6d9:

  ARM: dts: aspeed: catalina: Update io expander line names
(2024-08-27 13:00:49 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.12

 - New machines

  * IBM P11 AST2600 BMC machines, named Blueridge and Fuji
  * Meta's Catalina AST2600 BMC

 - Updates to harma, minerva, mtmitchell, mtjade, system1, SPC621D8HM3

 - Various changes to the dtsi to keep the YAML checker happy

----------------------------------------------------------------
Andrew Jeffery (7):
      ARM: dts: aspeed: Fix coprocessor interrupt controller node name
      ARM: dts: aspeed: Specify correct generic compatible for CVIC
      ARM: dts: aspeed: Specify required properties for sram node
      ARM: dts: aspeed: Remove undocumented XDMA nodes
      ARM: dts: aspeed: Clean up AST2500 pinctrl properties
      ARM: dts: aspeed-g6: Use generic 'ethernet' for ftgmac100 nodes
      ARM: dts: aspeed-g6: Drop cells properties from ethernet nodes

Chanh Nguyen (5):
      ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
      ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
      ARM: dts: aspeed: mtmitchell: Add Riser cards
      ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
      ARM: dts: aspeed: mtmitchell: Add LEDs

Eddie James (5):
      dt-bindings: arm: aspeed: add IBM P11 BMC boards
      ARM: dts: aspeed: Add IBM P11 FSI devices
      ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
      ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
      ARM: dts: aspeed: Add IBM P11 Fuji BMC system

Ninad Palsule (1):
      ARM: dts: aspeed: System1: Updates to BMC board

Peter Yin (11):
      ARM: dts: aspeed: harma: Revise hsc chip
      ARM: dts: aspeed: harma: Add VR devices
      ARM: dts: aspeed: harma: Add sgpio name
      ARM: dts: aspeed: harma: Add ina238
      ARM: dts: aspeed: harma: Add power monitor xdp710
      ARM: dts: aspeed: harma: Remove multi-host property
      ARM: dts: aspeed: harma: Add fru device
      ARM: dts: aspeed: harma: Add temperature device
      ARM: dts: aspeed: harma: Enable mctp controller
      ARM: dts: aspeed: harma: Fix spi-gpio dtb_check warnings
      ARM: dts: aspeed: harma: Remove pca9546

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC
      ARM: dts: aspeed: catalina: Add pdb cpld io expander
      ARM: dts: aspeed: catalina: Update io expander line names

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM content to
layout syntax

Yang Chen (18):
      ARM: dts: aspeed: minerva: change the address of tmp75
      ARM: dts: aspeed: minerva: change aliases for uart
      ARM: dts: aspeed: minerva: add eeprom on i2c bus
      ARM: dts: aspeed: minerva: change RTC reference
      ARM: dts: aspeed: minerva: enable mdio3
      ARM: dts: aspeed: minerva: remove unused bus and device
      ARM: dts: aspeed: minerva: Define the LEDs node name
      ARM: dts: aspeed: minerva: Add adc sensors for fan board
      ARM: dts: aspeed: minerva: add linename of two pins
      ARM: dts: aspeed: minerva: enable ehci0 for USB
      ARM: dts: aspeed: minerva: add tmp75 sensor
      ARM: dts: aspeed: minerva: add power monitor xdp710
      ARM: dts: aspeed: minerva: revise sgpio line name
      ARM: dts: aspeed: minerva: Switch the i2c bus number
      ARM: dts: aspeed: minerva: remove unused power device
      ARM: dts: aspeed: minerva: add ltc4287 device
      ARM: dts: aspeed: minerva: Add spi-gpio
      ARM: dts: aspeed: minerva: add host0-ready pin

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 arch/arm/boot/dts/aspeed/Makefile                  |    3 +
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |   20 +-
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |  154 +
 .../aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts  |    4 -
 .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts   |   12 +-
 .../boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  |    4 -
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1110 ++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |  177 +-
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  518 ++-
 .../dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts     |   21 +
 .../boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1686 +++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |    5 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |    5 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3876 ++++++++++++++++=
++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |    5 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |    6 +-
 .../boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts |    4 -
 .../boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts |    4 -
 .../boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dts   |    4 -
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |    4 -
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts  |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |    5 -
 .../boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |    9 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |    2 -
 .../dts/aspeed/aspeed-bmc-supermicro-x11spi.dts    |    4 -
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |    7 +-
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   18 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   29 +-
 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi     | 1539 ++++++++
 32 files changed, 8939 insertions(+), 311 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.d=
ts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dt=
s
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
