Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC022FE25
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Jul 2020 01:45:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFxJF5N8SzDqvK
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Jul 2020 09:45:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=X+502/75; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFxJ74dqdzDqcK
 for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Jul 2020 09:45:25 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id gg18so15431431ejb.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Jul 2020 16:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3XJyxlG3BYKDeDJF3aoLhmmu0Dvjt7O+XVlhzaHzUZY=;
 b=X+502/75eLwiOOhu2FXaPQPVI3mwBEOHpjkzgveZj6NJeu92H39sgN7V/XKbtGizX5
 IBpkfvzaX5U0mXZtiL5V9H4jv8qofN0Z9jS9ulEYMMs5wGPkLsaKoeUI223ofoXU0BRj
 r8f9WtuaRe6dBGIMnYsvLDwL46MJM2dhANPgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3XJyxlG3BYKDeDJF3aoLhmmu0Dvjt7O+XVlhzaHzUZY=;
 b=Ssgoz8y2wwuWHeR4IRQ3qDaRpIPeatlN2dq+mTfL4WiNhL5W5ldaECV+uvQGRqt8P2
 aQ+yxna3mIKytBjYLlp21Y+Ng9gwg9aot0qgtMgEIGh1Yugk2G1OQoeOTVisB4G/Sgn0
 ha5yR4G40+DPJDFaGJLGnFxmXiBq78gjcJLRACaaYJTvqcGeBCSpkykzckM1V2pCNtGT
 wGlTiYYvhhyIMTXiU6r7//NX4ZLMvPnHgyEBrxPzyvSyGYADtJTb/gK4nVbhOgeFAHCs
 hDCiALCa+fohQ93dkycyOdog4LpChLvWgLh5yZxxTsbdxZcS1YATh2deIevrLZjbNYDa
 mmPw==
X-Gm-Message-State: AOAM532+NNdPk3ZcsPiYz3U5qxfFlG4ZMHooLRmAHEKU08COF1h940ME
 uXrvdvJwlHddbrMdakdm8MbNwUalJ7hbpuexn17vozlCsPw=
X-Google-Smtp-Source: ABdhPJyB4vtDt95XmGh3BJyuB9kC6b7d7DJOIVGxbmiYBkFGAWdfSb4ZpxYT3ZPX+fU6Qg8JI1k+5k+K14r6VVBvDrI=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr22248095ejd.266.1595893522582; 
 Mon, 27 Jul 2020 16:45:22 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Jul 2020 23:45:11 +0000
Message-ID: <CACPK8Xf_Np7LtcDFhywi6Uk1EgUpb0pVVa+Lr9YEwBRjbjOKCQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.9
To: arm <arm@kernel.org>, soc@kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello ARM maintainers,

Here's the ASPEED pull request for 5.9. Most of the patches have been
sitting in next for a while, with a few late comers merged today.

The following changes since commit 2c887638a5fa1ac5e2491ae911f50d554b604985:

  ARM: dts: Aspeed: tacoma: Enable EHCI controller (2020-07-28 09:02:45 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.9-devicetree

for you to fetch changes up to 2c887638a5fa1ac5e2491ae911f50d554b604985:

  ARM: dts: Aspeed: tacoma: Enable EHCI controller (2020-07-28 09:02:45 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.9

There is one new machine; AMD's EthanolX reference platform with an
AST2600 BMC.

Misc updates for Rainier, Tacoma, Wedge and Mihawk machines.

----------------------------------------------------------------

Andrew Jeffery (2):
      ARM: dts: rainier: Configure ball Y23 as GPIOP7 for MCLR_VPP
      ARM: dts: rainier: Describe GPIO mux on I2C3

Ben Pai (2):
      ARM: dts: aspeed: mihawk: IO expander uses TCA9554 driver
      ARM: dts: aspeed: mihawk: Add 8 tmp401 thermal sensors

Ben Tyner (2):
      ARM: dts: aspeed: tacoma: Remove checkstop gpio-key
      ARM: dts: aspeed: rainier: Add line-name checkstop

Eddie James (9):
      ARM: dts: aspeed: ast2500: Update XDMA engine node
      ARM: dts: aspeed: ast2600: Update XDMA engine node
      ARM: dts: aspeed: witherspoon: Enable XDMA engine
      ARM: dts: aspeed: tacoma: Enable XDMA engine
      ARM: dts: aspeed: rainier: Add second cfam on the hub
      ARM: dts: aspeed: rainier: Add CFAM SPI controllers
      ARM: dts: aspeed: rainier: Switch OCCs to P10
      ARM: dts: aspeed: rainier: Enable EHCI controller
      ARM: dts: Aspeed: tacoma: Enable EHCI controller

Jet Li (1):
      ARM: dts: aspeed: rainier: Add I2C buses for NVMe use

Joel Stanley (5):
      ARM: dts: aspeed: rainier: System has one SPI NOR
      ARM: dts: aspeed: tacoma: Fix gpio-key definitions
      ARM: dts: aspeed: rainier: Add CFAM reset GPIO
      ARM: dts: aspeed: tacoma: Add CFAM reset GPIO
      ARM: dts: aspeed: rainier: Add FSI I2C masters

Supreeth Venkatesh (1):
      ARM: dts: aspeed: Initial device tree for AMD EthanolX

Tao Ren (4):
      ARM: dts: aspeed: cmm: Fixup I2C tree
      ARM: dts: aspeed: wedge40: Disable unused i2c controllers
      ARM: dts: aspeed: wedge40: Enable ADC device
      ARM: dts: aspeed: wedge40: Enable pwm_tacho device
