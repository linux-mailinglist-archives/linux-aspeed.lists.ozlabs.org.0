Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B577784F
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 14:28:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VDAxragm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM5n60mFzz3bw8
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 22:28:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VDAxragm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM5mz1VXMz2yWB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 22:28:16 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1d03e124so119754866b.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691670488; x=1692275288;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zVnE64GF5JkTluD6xr4hJ+bYfY9RuuI4BGvlCOpCCMU=;
        b=VDAxragmobNCNMxFQz2XyiCW5yU5RkNvh6MRyvrfKJcSaTk/3rFuOSPMhDd1m+FXhN
         9sn6b8zuiCpSFUGwDcZ5DZwOrdViqe1Oed+fMur1cPZsXWuvuVgNxU2Q8HXl7yxNU2aJ
         zqhz8aHrIQZRY4zcmS4dfoJbN491rxT64lw2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670488; x=1692275288;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVnE64GF5JkTluD6xr4hJ+bYfY9RuuI4BGvlCOpCCMU=;
        b=UmJd6GnKqxCo75NTvaa9iOvEI3nxPI22FsLLxav3Th/TrVPcWwK6V7lRDdnTkR+1Kh
         FexuEzydfa98xR8XHQM9+FoLaivacRS8muH1Co5SPYNO0AkE0WeHX2yrTfCLE1fCtO04
         i2xYbEfI1Cf03uyta7O7DCXXpinh1Y62Tra2HPVKKQWUgg0ySDzSSrI75eIAJWa+0YEc
         +4aV6WshIeXfRDkhr+OWxWxcOW0BwLoih1zx06h0GUuItQ5csz0wkr5bLaxYjKAxMYBV
         nrrPvbYIdWvCYYhSr2whWWvp27l+VkFTGA9hEA9RFsTuvQX7UV4t+LUKpRc2fLgAj65f
         NghA==
X-Gm-Message-State: AOJu0YyLpa5xIDg2HBqeqa/I0wk58aCrK3RJz6o5sTCpatzMYqmv2uwt
	LVLloI/ZqDcdMB8NyiTpG8nJ4BudShYk+M6iwCM=
X-Google-Smtp-Source: AGHT+IGNA+TXbCwNm9jkM37jKrm+NtIht8GpC02YTUKWnLMrvEr/qay2O650NoPdj03fbiDH1o7GifDtMY0AT9BdH+k=
X-Received: by 2002:a17:906:9d1:b0:99c:5056:4e2e with SMTP id
 r17-20020a17090609d100b0099c50564e2emr1636720eje.31.1691670488193; Thu, 10
 Aug 2023 05:28:08 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2023 12:27:55 +0000
Message-ID: <CACPK8Xc76O5kLEAXRtbFXZcP=ObrKR0Kpez_er+zV2vZffZe7A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.6
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Soc team,

Here are the aspeed device tree changes for v6.6.

The tag has a -2 as I had a typo in the first tag. I removed that tag
from the repo.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.6-devicetree-2

for you to fetch changes up to 32b7343226e622e36c7b241f3c6513f396a5a185:

  ARM: dts: aspeed: Add AST2600 I3C control pins (2023-08-10 21:39:42 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.6

 - New machines

  * Inventec's Starscream AST2600 BMC, for a x86 server platform
  * Meta's Yossemite 4 AST2600 BMC, for a multi-node server platform

 - Big device tree rework for IBM's Power10 BMC platforms

 - Updates for wedge400 and Mt Mitchell

 - AST2600 I3C and VUART descriptions

----------------------------------------------------------------
Chanh Nguyen (3):
      ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
      ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell
DVT systems
      ARM: dts: aspeed: mtmitchell: Add MCTP

Chen PJ (2):
      dt-bindings: arm: aspeed: add Inventec starscream-bmc
      ARM: dts: aspeed: Adding Inventec Starscream BMC

Delphine CC Chiu (2):
      dt-bindings: arm: aspeed: add Facebook Yosemite 4 board
      ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC

Dylan Hung (1):
      ARM: dts: aspeed: Add AST2600 I3C control pins

Eddie James (3):
      ARM: dts: aspeed: bonnell: Add DIMM SPD
      ARM: dts: aspeed: Add P10 FSI descriptions
      ARM: dts: aspeed: everest: Reorganise FSI description

Joel Stanley (4):
      ARM: dts: aspeed: Add AST2600 VUARTs
      ARM: dts: aspeed: bonnell: Reorganise FSI description
      ARM: dts: aspeed: rainier: Reorganise FSI description
      ARM: dts: aspeed: everest: Move common devices up

Lakshmi Yadlapati (1):
      ARM: dts: aspeed: rainier: Remove TPM device

Tao Ren (3):
      ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
      ARM: dts: aspeed: wedge400: Enable more ADC channels
      ARM: dts: aspeed: wedge400: Set eMMC max frequency

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |  129 +-
 .../dts/aspeed/aspeed-bmc-facebook-wedge400.dts    |    4 +-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   |  624 +++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |  364 +---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts | 1837 ++++++++++++--------
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |  683 +-------
 .../dts/aspeed/aspeed-bmc-inventec-starscream.dts  |  389 +++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   20 +
 .../dts/aspeed/ast2500-facebook-netbmc-common.dtsi |    4 +
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     |  380 ++++
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi     | 1305 ++++++++++++++
 14 files changed, 3924 insertions(+), 1829 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
