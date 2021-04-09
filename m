Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9F359536
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 08:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGnsj5l0cz3bTh
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 16:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=B67LEXXf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=B67LEXXf; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGnsf5Kk1z2yy3
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 16:14:46 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id c3so4826915qkc.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
 b=B67LEXXfgUlYFemvN+DJR7IYbvMH3mkXnOcevWgTrbqUc0CCPaMU+JYsg6zlQQ39tg
 CqOlZAHS8pilJzDBQQdxg8x53R3TWbJIxRmaXY9ScNs63C8XEMDtt3JF6910/nkjF00m
 gTRpG9uVnxB0d1EubDsXdNDqK/7r2lczBaPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
 b=EgOcG2cHJELg/k0HTugGOPLjoWiaai1g4xqW0AqlVcoLBYLVHHQifrn5sTqyYRCj7q
 LyeXehYhBl49aOj1lOnuWiv4MDfldU1ZyvlDnu90r7zM5PZVzz/iyz6YAZLaKVhtgNUD
 axtJF8KyqRlGBVGvusnOVDXMaMRrq3rw7dZ1ub3wRt/gCm7lISkSVwd3QDJW2IzQDZbe
 5bN7cTJvS9jquyVoczQFUunVisT9gKZNfGF5hJ7EloUIyPd7J4xcUcxTX09oAFnuKa0s
 8w+ngobx4fKSxhSy4s59/r/nUiOq+pPzGf9k1+YtKFWh3oLQeMstfo3yZSnaJj6FBsJ2
 /pqA==
X-Gm-Message-State: AOAM533AeLKGpDdxJi1O088weCbYIe1X372YDfqDRpogwN/OsOgxdHF+
 RzflRj4LDNMuPblB7dSKdptTJH+cQuqFvvM/R5E=
X-Google-Smtp-Source: ABdhPJx2tT32pLMBe/ETq04appLjgR5JqaPIOwjjPXDIviNZnJEEKdWtCGh+Ko6rd/Bw2dFAt/4A9EMFCeGXfn9YOE4=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12431122qki.487.1617948880016; 
 Thu, 08 Apr 2021 23:14:40 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:14:27 +0000
Message-ID: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13
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

Here's a pull request from me for the ASPEED and Nuvoton changes
targeting the v5.13 merge window. As you can see I've chosen to
arrange the pull request as one single "BMC-related" set of changes.
If we choose to continue with this, in the future I will cover the
ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree

for you to fetch changes up to ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13

The ASPEED and Nuvoton pull request now comes as a combined BMC pull
request.

 - New machines

  * ASRock E3C246D4I, an AST2500 BMC for an Xeon E-2100/E-2200 mini-ITX
    system
  * Quanta GBS, an NPCM730 BMC for an x86 server

 - Power10 BMC updates for Everest and Rainier

 - GPIO line names for Mihawk

----------------------------------------------------------------

Alpana Kumari (2):
      ARM: dts: aspeed: rainier: Add presence GPIOs
      ARM: dts: aspeed: everest: GPIOs support

Brandon Wyman (2):
      ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
      ARM: dts: aspeed: everest: Add power supply i2c devices

Eddie James (7):
      ARM: dts: aspeed: rainier: Add additional processor CFAMs
      ARM: dts: aspeed: rainier: Enable fan watchdog
      ARM: dts: aspeed: rainier 4U: Fix fan configuration
      ARM: dts: aspeed: everest: Add FSI CFAMs and re-number engines
      ARM: dts: aspeed: everest: Add RTC
      ARM: dts: aspeed: everest: Enable fan watchdog
      ARM: dts: aspeed: Add Rainier 1S4U machine

George Hung (1):
      ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree

Jim Wright (1):
      ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add missing fan nodes
      ARM: dts: aspeed: everest: Add size/address cells

Matthew Barth (2):
      ARM: dts: aspeed: everest: Add max31785 fan controller device
      ARM: dts: aspeed: everest: Add pca9552 fan presence

Nichole Wang (1):
      ARM: dts: aspeed: mihawk: Add GPIO line names

Priyanga Ramasamy (1):
      ARM: dts: aspeed: everest: Add I2C components

Vishwanatha Subbanna (1):
      ARM: dts: aspeed: rainier: Add directly controlled LEDs

Zev Weiss (1):
      ARM: dts: aspeed: Add ASRock E3C246D4I BMC
