Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1414232A
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jan 2020 07:20:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481M415V6vzDqZm
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jan 2020 17:20:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hDz2Guv4; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481M3m30kkzDqQj
 for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jan 2020 17:20:33 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id r14so29046972qke.13
 for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Jan 2020 22:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=veSRAwdL+IkKpSiX9FZ7exJpiVjqG9c6YRouRhwRQyI=;
 b=hDz2Guv4huWbV10bTxAhdHNZHTAnETlxVsVQgjVVlEqUMQNhd0I1wv55UY1GgvXKN2
 IZsXsl0DLfYv/WUss1b2qQvDtyj5ddUgm/d+F25m99NqW8pwUdY46MjBCyy4W/K9+TR2
 4cyvUWf89UyjcPK11wBxBt9eYxNkPAgdl6Pk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=veSRAwdL+IkKpSiX9FZ7exJpiVjqG9c6YRouRhwRQyI=;
 b=FGez+ZBpR7mxP0UKoeYU3I+tPqmrOonzVNhpT5K81WoqnZFmcIemrdjPIbTUAzUYNW
 jqiPKWpGKBaV2ly7sjfLiXR9cNSW046RklKWlflo+kB39ReNVJ+pO4NfKIne7uILj33L
 UzYVoebAl/5SDqtZ9VDWvGTaRmb0hFfjuokCRH2X4swU2mcEs1kVc65pSGAENLbs/Kfn
 /GZTpSAUcw4+hPt7W4yxFoMTtn4yOhSnn+IQCJV0EitMOit/1x0VWIs/DgpgHz1kFUBv
 MKnDwReXEwen56LS5OW5daF4rlQnfGR7aeqXaWXkmT9Efsrr+jjOqx3zJKH9Svy0ecvE
 0R2w==
X-Gm-Message-State: APjAAAUY4nWdPYZqZczfSERgABWGxhhhm0kIsMuM6FQeU4d8CXzUIB9j
 +XrRUiZtKg4de3LaBaTBg4PYCioBZi+9E25OmCc=
X-Google-Smtp-Source: APXvYqwPCfCAIvg/mW/SSEIZrnSmxvGUEbfDpPmWZdUa4dkQmqF8uTDXkIP+CoYpNqJjR8RsTpVfMGixNz16+gAi79E=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr50338653qku.414.1579501227792; 
 Sun, 19 Jan 2020 22:20:27 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Jan 2020 06:20:16 +0000
Message-ID: <CACPK8XepSy6D4CNWjSWDDK0p7Dx_rneWne4t4uyy=di5nx3zmA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.6
To: arm <arm@kernel.org>, soc@kernel.org
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

Hello ARM maintainers,

Sorry for sending this one is a bit late, I was off at linux.conf.au last week.

The following changes since commit 39be9e84f65be599919c7069bdad24dc2d9cd65d:

  ARM: dts: aspeed: rainier: Add UCD90320 power sequencer (2020-01-20
15:50:57 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.6-devicetree

for you to fetch changes up to 39be9e84f65be599919c7069bdad24dc2d9cd65d:

  ARM: dts: aspeed: rainier: Add UCD90320 power sequencer (2020-01-20
15:50:57 +1000)

----------------------------------------------------------------
ASPEED device tree updates for 5.6

 - Cleanups for dtc warnings

 - Ethernet hardware checksum cleanups. A bug in the driver was fixed so
 machines don't need to specify this anymore.

 - Misc improvements

----------------------------------------------------------------

Andrew Jeffery (13):
      dt-bindings: pinctrl: aspeed: Add reg property as a hint
      dt-bindings: misc: Document reg for aspeed, p2a-ctrl nodes
      ARM: dts: aspeed-g5: Move EDAC node to APB
      ARM: dts: aspeed-g5: Use recommended generic node name for SDMC
      ARM: dts: vesnin: Add unit address for memory node
      ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
      ARM: dts: swift: Cleanup gpio-keys-polled properties
      ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
      ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
      ARM: dts: aspeed: Add reg hints to syscon children
      ARM: dts: aspeed-g5: Sort LPC child nodes by unit address
      ARM: dts: aspeed-g6: Cleanup watchdog unit address
      ARM: dts: ibm-power9-dual: Add a unit address for OCC nodes

Eddie James (1):
      ARM: dts: aspeed: rainier: Switch PSUs to unknown version

Ivan Mikhaylov (1):
      ARM: dts: aspeed: Add SD card for Vesnin

Jim Wright (1):
      ARM: dts: aspeed: rainier: Add UCD90320 power sequencer

Joel Stanley (1):
      ARM: dts: aspeed: AST2400 disables hw checksum

Tao Ren (2):
      ARM: dts: aspeed: netbmc: Delete no-hw-checksum
      ARM: dts: aspeed: yamp: Delete no-hw-checksum
