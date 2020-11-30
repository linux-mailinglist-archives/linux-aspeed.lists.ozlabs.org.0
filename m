Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92882C7E3A
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 07:31:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkwNc55ZBzDrB2
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 17:31:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nMiIsMha; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkwNR0j0DzDr7K
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Nov 2020 17:31:01 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id x13so5107389qvk.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Nov 2020 22:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
 b=nMiIsMha3UxRAI8vZLScX2bDFT3T4OijJ5bou1n/fEOjUWFYwuS3QnCubsI7It8zaH
 KaGxl/BJ12F2zIBH7MjB/b2ma3DAe1p8rTUmKL8LM1c2UA6SuhToH+hWU+UkcWC9uikN
 Mdz3mQOboxM9l1ANSqEMpMW/QhFM4wiYZk0ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
 b=PrjWCQbrRADKxskhnMOmKsxWesYQaS/fL8cFgQEJhIYzB/k9iClVu0PkdbSptnth8n
 G+txUGwt5giBsYWybxGJF9lc6rnzI88PFCVxW/5/wSgKmKG24Py9v7d2gMK7Q9YhHqAC
 OCNep0uHwTo9bcb5mPC8hItrfcBSzGvTO5ALQYcqjFIUTnLZ2RLHImmDaBV/6Rw+O881
 DTTi+V5Ky+bbhHXYaO4cXeGVokeZbuO+VwmIEk34kdjSh5hTR9dFpfp6zZbh2yVFFGbI
 1gya0N0ug+I56mLRodBSVNvnY+tl022enuWAFVIvwfHesM3KUH2Q5DKLwPerIhSeAt6j
 dRIA==
X-Gm-Message-State: AOAM532Tzr4KhPZzo+8ho/XmenFjKRdpbA/uieCQ0q4P5U3EySRe0mVM
 yNHx+qURqxe3Tw5tSntlU+uP+ELhfXS49JJ5RM0=
X-Google-Smtp-Source: ABdhPJxqT90NVWY+61RTtkBQ23jQdz+Ls+bu8p2zWyPN3Hhm8Lr/ml00x02T4KEFdUzhoqaueZVNmK39TWk+PZth4FQ=
X-Received: by 2002:ad4:5687:: with SMTP id bc7mr4544845qvb.61.1606717855656; 
 Sun, 29 Nov 2020 22:30:55 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:30:44 +0000
Message-ID: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.11
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
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

Here are some ASPEED changes for the 5.11 merge window.

The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree

for you to fetch changes up to 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11

 - New machines

   * Bytedance G220A, an AST2500 BMC for an x86 server
   * Facebook Galaxy100, an AST2400 BMC for a network switch
   * IBM Rainier 4U, an AST2600 BMC for a PowerPC server

 - Reworking of Facebook device trees to use common dtsi

 - A 64MB flash layout used by the G220A

 - Misc updates to tiogapass, ethanolx, s2600wf, tacoma and rainier

----------------------------------------------------------------
Andrew Jeffery (4):
      ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
      ARM: dts: rainier: Add reserved memory for ramoops
      ARM: dts: tacoma: Add reserved memory for ramoops
      ARM: dts: aspeed: rainier: Don't shout addresses

Billy Tsai (1):
      ARM: dts: aspeed-g6: Fix the GPIO memory size

Eddie James (2):
      ARM: dts: aspeed: rainier: Add 4U device-tree
      ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted

George Liu (1):
      ARM: dts: Fix label address for 64MiB OpenBMC flash layout

Joel Stanley (2):
      ARM: dts: aspeed: s2600wf: Fix VGA memory region location
      ARM: dts: aspeed: ast2600evb: Add MAC0

John Wang (2):
      ARM: dts: Add 64MiB OpenBMC flash layout
      ARM: dts: aspeed: g220a: Add some gpios

Konstantin Aladyshev (4):
      ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
      ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
      ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functionality
      ARM: dts: aspeed: amd-ethanolx: Add GPIO line names

Lotus Xu (1):
      ARM: dts: aspeed: Add Bytedance g220a BMC machine

Paul Fertser (1):
      arm: dts: aspeed: tiogapass: Enable second MAC

Tao Ren (6):
      ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
      ARM: dts: aspeed: wedge40: Use common dtsi
      ARM: dts: aspeed: wedge100: Use common dtsi
      ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
      ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
      ARM: dts: aspeed: minipack: Fixup I2C tree

Vijay Khemka (1):
      ARM: dts: aspeed: tiogapass: Remove vuart
