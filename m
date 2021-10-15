Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE942E774
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Oct 2021 06:01:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVsz42XG7z306l
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Oct 2021 15:01:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gIXasXOq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gIXasXOq; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVsyz1THLz2yp8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Oct 2021 15:01:44 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id w2so7794122qtn.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Oct 2021 21:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
 b=gIXasXOqP3ZyNyTBXLwyCySfZifxVIYOiEQJmV+nxk/PHLSxGrhrIGcgesEMSwYtbw
 rzulIvfb37aOBwzkHvO/2jsQxTxGQCaJN3hoFAMCgszHfdGgpZNds6+SChBW9PRQorza
 /pZ8u0n1z1AHojts8kU0xMlPWIGuBgf7+oBjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
 b=xc1PJ3Cj8xKdww7NtAC1Ic+KwXIAU+8oKpPvpVAEVKMeIe/h9PH2LF457vSvKwg4zw
 ez7ZpeI/ajP1PzwXs6QKYF6meI3QULNK/nXfvHa17OxsEYU1FNp1eAWohIU0bdg5dukf
 7e7k6mfgZZW9iyMDwNmNqjzxvPd83KPtdbt1v4C2rGGhI/XCyxmugV6cvBXvTcPYKee/
 TIOHpiG4bY8Z3lH0JemFEvF1YMJC9PJoBEFiRy8a5hLWArEPv/0Bh5Zn6TD6n4sdRLrw
 nAusW5jQsN56TYM1XLw6AGrSgScO/TxuWdBBaqwHi/cygCF3dJLxj93gJP30+cWUPrlL
 H58w==
X-Gm-Message-State: AOAM5333Fgn2S75aOxCBbkDHCZ8x5H+1SdqL3m70Lqyg+xL/XVZ9jQNV
 BI1JElWJ1aVlwO4Jr9ijq1EPVyXKSp66AOvbqvM=
X-Google-Smtp-Source: ABdhPJz5ihCwKgESTZKbaaX82wih0wrKU9fUlqSYcBkxd2H4K+BVYtLy0hdfzMJuRZWu1v78+2JJaDVjGuxV09hydak=
X-Received: by 2002:a05:622a:1451:: with SMTP id
 v17mr11094292qtx.25.1634270501310; 
 Thu, 14 Oct 2021 21:01:41 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Oct 2021 04:01:30 +0000
Message-ID: <CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrewrjeffery@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are the aspeed device tree changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-devicetree

for you to fetch changes up to 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62:

  ARM: dts: aspeed: fp5280g2: Use the 64M layout (2021-10-14 18:25:17 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines:

  * TYAN S7106 BMC, a x86 server from about four years ago

 - Descriptions for the AST2600 ADC, which now has an upstream driver

 - Lots of GPIO line names. The OpenBMC project has adopted a scheme for
   naming the lines, and new additions will follow this guide

 - New I2C devices for Rainier, Everest, EthanolX, Mt Jade

 - Fixes for fp5280g2 which has seen some recent development, including
   the addtion of a QEmu machine for testing

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: dts: aspeed: rainier: Add power-config-full-load gpio

Ben Tyner (3):
      ARM: dts: rainier: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line B6

Eddie James (3):
      ARM: dts: aspeed: rainier: Add system LEDs
      ARM: dts: aspeed: everest: Add I2C bus 15 muxes
      ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Everest

George Liu (1):
      ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding

Isaac Kurth (1):
      ARM: dts: everest: Add 'factory-reset-toggle' as GPIOF6

Joel Stanley (1):
      ARM: dts: aspeed: p10bmc: Define secure boot gpio

John Wang (1):
      ARM: dts: aspeed: fp5280g2: Use the 64M layout

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Add FRU EEPROM

Oskar Senft (1):
      ARM: dts: aspeed: Add TYAN S7106 BMC machine

Quan Nguyen (1):
      ARM: dts: aspeed: mtjade: Add some gpios

 arch/arm/boot/dts/Makefile                       |    3 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts    |    5 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts   |   21 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts     |  182 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts     | 1571 +++++++++++++++++++---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts |    9 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts      |  488 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi                 |   20 +
 8 files changed, 2075 insertions(+), 224 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
