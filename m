Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646C2780BD
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 08:31:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByMWp0314zDqlQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 16:31:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cx9RKXul; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByMWj3QCbzDqkV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Sep 2020 16:31:45 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id t16so1326866edw.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eNzU8zw/Rrb/H3yOro2Zm/S2PjWhkVAd5D4pSDtZvHE=;
 b=cx9RKXulsD4mAwwHZbmR+QA/MzFy1F2+T5H6ae52NxmFQZBYrJ1g7t93UVC8hcKK0X
 T8F2xEGvrD3UVChDbowKE61o5gSlLLEjw0XGjRhId1MEI45K9D0dhKrLTyf72QYatrvf
 mFDY9Ge0C/6c+c5AUY+ydNl1Frp3sKEOlNs30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eNzU8zw/Rrb/H3yOro2Zm/S2PjWhkVAd5D4pSDtZvHE=;
 b=VcCpjBiXCwYir3uGM2OXXUyy29sXPRUgWVXZn2fD7Mh8VDlfY7XXHMzlkiC8r8jFrX
 w16hOrvYH7WZo/P5+4YIzCmDUMzc9C8VYbO2ieA+4cj94fLEhyyYbTJkDd/KL99o4HfQ
 ztc6AdpsFKjDFz6XpoONSmDVpa3TYWlADhZqW6ENrytQTkzPbr0KOEf2dRrBgu61J62P
 UAn6rggY3f+bYyESNDdel6XgP7Cye8IR0AnNOvsptG1c2Re9zoc6biTYIwYQvQQPQpoX
 nIAdebRRdfXTkZEzVbnP2uL3K557sgUJeYhkTf/bX3ryhuMruHAGl0joFiBerUuz7KGg
 Aq+w==
X-Gm-Message-State: AOAM533erpMCuyScNRrb3e0bUwNhWG0mkTX3R5MTLWWC6plmi35rt5Kh
 BkMjkK8n/vXjG8lLi7uMOLOQxqRh0dG/QKT+glw=
X-Google-Smtp-Source: ABdhPJyf+gKHvKk2o0a+gcLBkRy50kE3qXo1BSD/P5RxDJ+XRUczTxxHMnh7khmo2Vo3YvXAn4aJ1LpmPc/DnmL6c6U=
X-Received: by 2002:a50:ed02:: with SMTP id j2mr2493684eds.137.1601015499959; 
 Thu, 24 Sep 2020 23:31:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Sep 2020 06:31:28 +0000
Message-ID: <CACPK8XcP_j7q+jWN6_JGaEcfPy=zSQHyizp1LOw05zFB4L9iGQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.10
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are some ASPEED changes for the 5.10 merge window.

The following changes since commit e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:

  soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.10-soc

for you to fetch changes up to e55f541e51b5136fc0ced0bdf2b33ee3cca3bc96:

  soc: aspeed: xdma: Add reset ioctl (2020-09-25 15:32:57 +0930)

----------------------------------------------------------------
ASPEED soc driver updates for 5.10

New drivers:

 - XDMA driver for the BMC to host PCIe DMA device
 - SoC info driver to expose revision information

New features:

 - AST2600 support for the LPC control driver. This includes
   setting the LPC2AHB bridge up in a backwards compatible manner.

Cleanups:

 - LPC control
 - Kconfig
 - Bindings updates for AST2600 strings

----------------------------------------------------------------
Andrew Jeffery (1):
      soc: aspeed-lpc-ctrl: Fail probe of lpc-ctrl if reserved memory
is not aligned

Brad Bishop (2):
      dt-bindings: aspeed-lpc: Add AST2600 compatible strings
      soc: aspeed: lpc: Add AST2600 compatible strings

Eddie James (4):
      dt-bindings: soc: Add Aspeed XDMA Engine
      soc: aspeed: Add XDMA Engine Driver
      soc: aspeed: xdma: Add user interface
      soc: aspeed: xdma: Add reset ioctl

Joel Stanley (7):
      soc: aspeed: Improve kconfig
      dt-bindings: aspeed: Add silicon id node to SCU
      soc: aspeed: Add soc info driver
      ARM: dts: aspeed: Add silicon id node
      soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
      soc: aspeed-lpc-ctrl: Fix whitespace
      soc: aspeed-lpc-ctrl: Fix driver name

 .../devicetree/bindings/mfd/aspeed-lpc.txt         |    8 +-
 .../devicetree/bindings/mfd/aspeed-scu.txt         |   26 +
 .../devicetree/bindings/soc/aspeed/xdma.yaml       |  103 ++
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |    5 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    5 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    5 +
 drivers/soc/Makefile                               |    2 +-
 drivers/soc/aspeed/Kconfig                         |   53 +-
 drivers/soc/aspeed/Makefile                        |    2 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c               |   37 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c              |    2 +
 drivers/soc/aspeed/aspeed-socinfo.c                |  133 +++
 drivers/soc/aspeed/aspeed-xdma.c                   | 1205 ++++++++++++++++++++
 include/uapi/linux/aspeed-xdma.h                   |   42 +
 15 files changed, 1615 insertions(+), 21 deletions(-)
