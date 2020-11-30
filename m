Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DCB2C7E4A
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 07:42:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckwd34DJ9zDqJf
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 17:41:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=l6bODzPG; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckwcx0Hf9zDq5t
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Nov 2020 17:41:51 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id k3so5132154qvz.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Nov 2020 22:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
 b=l6bODzPGxrdcLVgrkechssNiqLkRpX9WT8LeswM/031xZokPqcNgulSTnmyVeosJtJ
 +p4niSgGUL3kf8ugVnFCEAMAFktMyu5W0sejbPS/OW9MSDzIgEk0t12JqwE352+1Q1UM
 tJj2nQskac0vytch8rLOPsoJdCwufHdXO1l44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
 b=Y652f7MQaS1vlOSKlvmIKIplA6d+BZbBexrxSoJa+R71ejfRJQv2dKCxP5PC0X23lh
 03EUAWELvPTAGmhrFnAtvFhet/uPZcf8q7kalh+wSiFUAkj0HMszyc+alN/IMhN6m37Y
 hOAezmyp//oCzEpFZ9uonf0xMxmpWq+RfqNOlA673uwBMINmZni31VhCXB2xUTKbKE+a
 1Htzge51Qob92nvK/9At8jU52JWAWzoEZ6OfnMCBe9fC2u3y+1F1nM1rXZqNrmGHJdME
 gjBmcEniL7WWzTXu4FVNAi6FDNhx4YdXsanJTZ0UqmDAbOTW3VFEjf/6GCiEJYNdPkdV
 g5Xg==
X-Gm-Message-State: AOAM531llUGDS0Ig4B+quB0zmBsfghpQ9hdZr4NiVl+YrWYjxTvx4bOu
 FM/aSbipjKHDH0UqezQogYlSlJ9Z2EM7ZB+7eo8=
X-Google-Smtp-Source: ABdhPJxa/Le1uLRFRYP53fUxHYNmUKAq37dxseEtROHnYq1o89Km+OP/pXw2TYoyxUv2xqW7yinMpFianyxDaV+jmtU=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr20713780qvd.16.1606718506893; 
 Sun, 29 Nov 2020 22:41:46 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:41:35 +0000
Message-ID: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
To: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are some ASPEED SoC changes for the v5.11 merge window.

These are mostly the 5.10 changes without the XDMA driver, which I
didn't get a response on my question about where we wanted that to
live[1]

https://lore.kernel.org/linux-arm-kernel/CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com/

The following changes since commit 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-soc

for you to fetch changes up to 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.11

New drivers:

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

Dan Carpenter (1):
      soc: aspeed: Fix a reference leak in aspeed_socinfo_init()

Joel Stanley (8):
      soc: aspeed: Improve kconfig
      dt-bindings: aspeed: Add silicon id node to SCU
      soc: aspeed: Add soc info driver
      ARM: dts: aspeed: Add silicon id node
      soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
      soc: aspeed-lpc-ctrl: Fix whitespace
      soc: aspeed-lpc-ctrl: Fix driver name
      soc: aspeed: Enable drivers with ARCH_ASPEED

Tom Rix (1):
      soc: aspeed: remove unneeded semicolon
