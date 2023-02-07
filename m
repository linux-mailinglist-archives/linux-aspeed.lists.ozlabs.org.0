Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67768CD9F
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 04:51:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9q1Z0w36z3cGH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 14:51:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dT7Q1Y3y;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dT7Q1Y3y;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9q1P0lqcz3bTS
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Feb 2023 14:51:18 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id qw12so39996107ejc.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Feb 2023 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1kuhwo6Br/SXIA2IZ0bvJrbV39UIM6SkgEHl7l1GqPY=;
        b=dT7Q1Y3yd0f3DfyVEQW4gse6XFUUvZZZCepxJSb52yaVwBxAuotMAH51inwzxhoG9m
         mvogpN897vxwD8NIgQYd+4C5enARq2jPPnX/oAyp3ocmcHgMZoNqP+6jwBrfk7aMYDbt
         jeeeNdfB9zl3Np1ocU1y49Z241AjqChYefAvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kuhwo6Br/SXIA2IZ0bvJrbV39UIM6SkgEHl7l1GqPY=;
        b=8DF85LYoBkHdftvK3Xi9GUzwUMnjKWKy6G0w0dytLYGnNn9Xcbs47eDJBUdHKAQhEp
         Fo8jUsxIJ069E3uRPAloBThFwO3RtGvZ5nnK66aQrci0jbBM8U5aI8Jmb+yCWVqF2gAq
         NKNxG7RfPUThxh9VothymkBLhBp7PGQbiCfeR0chpm3xM3sVBnmf+3Aja8lYNkqXWqjt
         1vhNNSbX/K9a21nCCXKiYJayXFIcvzrnN+KzfodGxmnyAOHtmlamO8CmwnI0ZwtzEO8i
         YuKohjkMnVhA8o62eNuFftDx8NlyHAU4vAOT9Z5si3ABLwlZUbyrCsLh3F02kgCRjaLm
         gzug==
X-Gm-Message-State: AO0yUKUIohAFZkI6JDMTW/EDfv9dMdwFeGl8jTlRRwrza2HbWM43L6Ss
	H+sDv6vRHfcSfWgxZ3bZok8CUDzrqOtzBHEjQIQ=
X-Google-Smtp-Source: AK7set97XHlhlULHvnXEiUh8JWU6vAwteZZtj4sMBmGkmqbiHYapUggiQvtpzoNKI/yCe5rSix03N+XHjRajewMIA7U=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr482951ejz.201.1675741874649; Mon, 06 Feb
 2023 19:51:14 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 03:51:08 +0000
Message-ID: <CACPK8XdbffU5yRSZF-zR2xv-+6aJK+hEXP8TOkW=SvS+nNTGxg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.3
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

Hello Soc maintainers,

Here are the aspeed device tree changes for 6.3

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.3-devicetree

for you to fetch changes up to 1480bcf074d34e754990204240f8473cdbef0072:

  ARM: dts: aspeed: p10bmc: Enable UART2 (2023-02-01 15:10:18 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.3

 - New machines

   * Ufispace NCPLite AST2600 BMC
   * Facebook Greatlakes AST2600 BMC

 - Updates for ethanolx, bletchley and tyan s8036

----------------------------------------------------------------
Ali El-Haj-Mahmoud (1):
      arm: dts: aspeed: tyan s8036: Enable kcs interrupts

Delphine CC Chiu (2):
      dt-bindings: arm: aspeed: add Facebook Greatlakes board
      ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC

Eddie James (1):
      ARM: dts: aspeed: p10bmc: Enable UART2

Jordan Chang (3):
      dt-bindings: vendor-prefixes: Add prefix for Ufi Space
      dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
      ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

Konstantin Aladyshev (5):
      ARM: dts: aspeed: ethanolx: Enable VUART
      ARM: dts: aspeed: ethanolx: Correct EEPROM device name
      ARM: dts: aspeed: ethanolx: Add label for the master partition
      ARM: dts: aspeed: ethanolx: Enable CTS/RTS pins on UART1
      ARM: dts: aspeed: ethanolx: Add BIOS flash chip

Potin Lai (2):
      ARM: dts: aspeed: bletchley: Rename flash1 label
      ARM: dts: aspeed: bletchley: Enable wdtrst1

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |  25 +-
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  13 +-
 .../boot/dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts        |   1 +
 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 360 +++++++++++++++++++++
 11 files changed, 655 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
