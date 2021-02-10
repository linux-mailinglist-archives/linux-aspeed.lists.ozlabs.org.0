Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532E3166C1
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 13:33:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbK1r0J3zzDvZm
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 23:33:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UWUHSPK2; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbJvs2qQ6zDsmJ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 23:28:39 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id x14so1389294qkm.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 04:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
 b=UWUHSPK2UgUR1Opbv/hP+s9OXD8+lmPO3KTBgt2KyxMCb5rUpC+M5kQXYKKTI6FpCu
 duv1gcgxmy042asbgJC4Adw4BNM86J4Qrqe0iF0rSPMrgZ8Y8u4uwz7WPl/ihBw5Wuiq
 VGaeK6v/PHrOZqy9raO2rEcAKY7kPqrPcaMFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
 b=tU6xzgPZJqjmx4BtUFlo7OT1a0nVCfeefIqegRlngv0ft97oCYzI1IusS3Ee3qsgGb
 BHAGdIut+aNXX5kQup1po7REe8Vajb+Al9Q5ATCovq+arez8gUFTaXqvyE8nN7B5Hq1y
 W6TxJt58bf5hz0WPyJ6pOd91F0VVdbru4SKdx/Xsay6N4xSq2VB8L9sq2TACgkFbCkSO
 HFH1AHzJplXBmfoCCYqeSwzC5vxcR64uCJl8xceayDDxMdgJkTOAE8WZ8+JW2TTGMBGG
 DExhbQilNRweZEJy5omP5sVgeywpfsZGUgv40mON7Rlo4mb92u0ZNwlN16Zg4JOJzqq5
 WN9w==
X-Gm-Message-State: AOAM530pG8FDvFKZ/I0+HW+xjQhugScNSsf2lbslSA49OjdFZppEAs4G
 +QyDDAkxTlaU65NdNVFH+nx1tbihMX7vtUKRMDg=
X-Google-Smtp-Source: ABdhPJxjIvSwIe2LcPNfvc5jPUF+6QlqW8H70/X76vGSIgNLwakHY/aQ7AyZjlqjYEgZjUXBB1iDcH472vf7tDszxzw=
X-Received: by 2002:a37:ac10:: with SMTP id e16mr2984793qkm.465.1612960115018; 
 Wed, 10 Feb 2021 04:28:35 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:28:23 +0000
Message-ID: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
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

Here's my late pull request. I've deferred some LPC device tree
bindings rework that need a closer review, so the contents of this
pull request should be straightforward.

The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-devicetree

for you to fetch changes up to a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.12

 - New machines

  * Ampere Mt. Jade, an AST2500 BMC for an x86 server
  * IBM Everest, an AST2600 BMC for a Power10 server
  * Supermicro x11spi, an AST2500 BMC for an ARM server

 - AST2600 eMMC clock phase configuration

 - Proper clock support for LPC snoop

 - Misc updates to ethanolx, mowgli, ast2600evb, g220a, and rainier

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: aspeed: rainier: Add eMMC clock phase compensation

Ben Pai (1):
      ARM: dts: aspeed: mowgli: Add i2c rtc device

Eddie James (1):
      ARM: dts: aspeed: Add Everest BMC machine

George Liu (2):
      ARM: dts: aspeed: inspur-fp5280g2: Add GPIO line names
      ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver

John Wang (2):
      ARM: dts: aspeed: Add LCLK to lpc-snoop
      ARM: dts: aspeed: g220a: Fix some gpio

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable secondary LPC snooping address

Lotus Xu (1):
      ARM: dts: aspeed: g220a: Enable ipmb

Quan Nguyen (1):
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

Ryan Chen (1):
      ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci

Ryan Sie (1):
      ARM: dts: aspeed: Add Supermicro x11spi BMC machine
