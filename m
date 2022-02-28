Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1D4C62B7
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 06:56:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6V502Z4Jz2yLT
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 16:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MnpXaqrN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MnpXaqrN; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6V4s58kBz2xss
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 16:56:44 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id e22so11501131qvf.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Feb 2022 21:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6xc8Wlk7+FaQnbhDm/63togy1hcoxDMaWox1JtA0XU8=;
 b=MnpXaqrNLYda6gdjpPcqdmnNaF4ziI+u7yZbxS77qpgHnRAxVQmSm3AFEn8kqnIMas
 ri4XXQrF7oCaG1H7k6+YH4SGLBXpJamW0KCDY+z+zoeBBhiNNXD3IMrR1+Gs5XIOsCOE
 oeqOl/h/9SgGTikzEnkdu7bH2dQrDua0CPpGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6xc8Wlk7+FaQnbhDm/63togy1hcoxDMaWox1JtA0XU8=;
 b=bo91xSWxn42ox2T9WNIgPpRP28kK6fmd8C7eTetNvbLJ0JFK3DQwFeVsLkJwwoRZ5y
 nY/OALqpSw2PAcWHQWzT1rLWClvfiix6tFSS8Ihy4xtrMmN5vygqchIXIwmHxwurkBk8
 cfWT2UVD/g3rubUOCLtvpv2QpITd4aXxEhc/eWoc1wTVQeliSVfVxRL6NPvVJJmkVpIG
 RO4ZzZrgBlBuMkFwP53yhXlEOjSmcCDA73Tea/6Gejo9+of6ddutzb0d5UjUZu3yxUR0
 3+SRhcSXFdIxV76UbY3CD9WyYG0rQl+dgA/XKDp5ykSR5okB5wfBsez7yA/Sh6kJdash
 HXyw==
X-Gm-Message-State: AOAM5320SITj/gMoxZJ6NRyj07xvS8wnBO34mMa8dNs3UHM6P1Yntos0
 7XragwdItNl+ZhwufTwhXtqhKp+YSMblScnKs3o=
X-Google-Smtp-Source: ABdhPJzDXu9DZCz+hqMVPfZ2AyE/cJra0N1jOLfN3vAnmS2EO8d8+f1POTjpJOshlctAIDo3t3e8HYECm4oOwLzh7Yk=
X-Received: by 2002:a05:6214:19c4:b0:432:8bd1:d8d7 with SMTP id
 j4-20020a05621419c400b004328bd1d8d7mr13117126qvc.65.1646027801875; Sun, 27
 Feb 2022 21:56:41 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 05:56:30 +0000
Message-ID: <CACPK8XdUXy5cnEDKmNirtByNMBGCjXwZpdKqJ0ytc0f34vzbBA@mail.gmail.com>
Subject: [GIT PULL v2] ARM: aspeed: devicetree changes for 5.18
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

Here are the aspeed bits for v5.18, with the tag on the correct branch
this time.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.18-devicetree-2

for you to fetch changes up to 09603f805ab69dbf18015363c2a00001647e89f2:

  ARM: dts: aspeed: p10bmc: Enable ftrace in ramoops buffer
(2022-02-28 15:46:12 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.18

 - New machines

  * Quanta S6Q AST2600 BMC
  * ASRock ROMED8HM3 AST2500 BMC, a half-width, single-socket Epyc
    server board

 - Facebook's Bletchley has a large update for production hardware

 - Ampere's Mt Jade has a number of updates

 - Small clenaups and additions for Everest, Rainier and Tacoma, and the
   flash layout

----------------------------------------------------------------
Andrew Geissler (2):
      ARM: dts: aspeed: everest: Label reset-cause-pinhole GPIO
      ARM: dts: aspeed: rainier: Label reset-cause-pinhole GPIO

Andrew Jeffery (1):
      ARM: dts: aspeed: tacoma: Clean up KCS nodes

Eddie James (3):
      ARM: dts: aspeed: rainier and everest: Enable UHCI
      ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
      ARM: dts: aspeed: p10bmc: Enable ftrace in ramoops buffer

George Hung (1):
      ARM: dts: aspeed: Add device tree for Quanta S6Q BMC

Joel Stanley (3):
      ARM: dts: aspeed: rainier: Remove SPI NOR controllers
      ARM: dts: aspeed: rainer: Add RTC battery gpio name
      ARM: dts: aspeed: everest: Add RTC battery gpio name

Potin Lai (10):
      ARM: dts: aspeed: bletchley: Switch sled numbering to 1-based
      ARM: dts: aspeed: bletchley: Separate leds into multiple groups
      ARM: dts: aspeed: bletchley: Update gpio-line-names
      ARM: dts: aspeed: bletchley: Update fmc configurations
      ARM: dts: aspeed: bletchley: Switch to spi-gpio for spi2
      ARM: dts: aspeed: bletchley: Add interrupt support for sled io expander
      ARM: dts: aspeed: bletchley: Add shunt-resistor for ADM1278
      ARM: dts: aspeed: bletchley: Add INA230 sensor on each sled
      ARM: dts: aspeed: bletchley: Enable mdio3 bus
      ARM: dts: aspeed: bletchley: Cleanup redundant nodes

Quan Nguyen (5):
      ARM: dts: aspeed: mtjade: Enable secondary flash
      ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
      ARM: dts: aspeed: mtjade: Update host0-ready pin
      ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
      ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node

Zev Weiss (2):
      ARM: dts: Fix OpenBMC flash layout label addresses
      ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC

 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |  26 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  | 259 +++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 320 +++++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  11 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  33 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |  12 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts        | 610 +++++++++++++++++++++
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   2 +-
 arch/arm/boot/dts/openbmc-flash-layout.dtsi        |   2 +-
 10 files changed, 1112 insertions(+), 165 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
