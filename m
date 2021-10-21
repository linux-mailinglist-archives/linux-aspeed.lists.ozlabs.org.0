Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E523435B3C
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Oct 2021 08:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZddF4cRsz2yn7
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Oct 2021 17:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lALUmGpx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lALUmGpx; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdd94pcgz2xtf
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Oct 2021 17:59:25 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id j12so6079413qkk.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Oct 2021 23:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
 b=lALUmGpxCJbC96/zmuF9gHKCXTP4nrjuxWYNttCdVFtygtabvSPcmHoo0NT3LKuMKg
 K94P752P5emkntHyXyXxbKi60kcnTjPZPWv/beOtcKrx+lkEkBqNIhlYYnaJiwqugFEZ
 wVt9FuDJ4GGnmWuCdOR4MZN3VlZPHuzTHlLjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
 b=WJX0HiCBTq5LumE5lxy6ebAA7TjbYFu2pLaoFyhs2JfhLVhzQw7RbKD/OdpWGMTfOw
 RnGPE45lah5VNCqdOEdTgqO7e0SMnGhIJbuiscd/0DXVCaExNH4k0KlRtwkA3kKigRGM
 MpVgoRucU2nJFeBDaYJ2UHg/kAFnsX1iz8yXPIpkHsffbcG3dTiCfueKllm69u/9lXUw
 UY4nJfOzrgjSKRnkxpkFi/kSc8kKe2ZERHmgq/Voj0QdNanLDEKPzdBKjZ+L05im/YGK
 0gvyDQpOCBv1lMbSrBO8e28jfxpb0GzvU37vPUtNfXVC5cXcCgL/0c2nYLl7bwWsoMsr
 kuqQ==
X-Gm-Message-State: AOAM530KcWrGkhdOA5thhix2mE1K/geR0A+AIHw2P2bbFRsRjaeifqg8
 faXrDtJBAs85s9yKsrUqbJu2lhVOxuew8j7LwoE=
X-Google-Smtp-Source: ABdhPJy7LpdJkyKOVfpFc2II+KybhaG4y7eBWsQMf1M8zZAqipes7m1MQxwVLb6ADiNS2ub2DlQuRD6wRcaRxUlWqEU=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr3020098qkc.36.1634799562103; 
 Wed, 20 Oct 2021 23:59:22 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:59:10 +0000
Message-ID: <CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16, round 2
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello soc maintainers,

Hot on the heels of you merging my first pull request, here's a second
one with some changes I missed the first time, and some patches that
came in since.

Of note the two IBM P10 platforms now have all of their device tree
changes in mainline, so that's a milestone for them. They are our
biggest Aspeed BMC device trees, coming in at 2400 and 3600 lines of
description.

The following changes since commit 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62=
:

  ARM: dts: aspeed: fp5280g2: Use the 64M layout (2021-10-14 18:25:17 +1030=
)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-devicetree-2

for you to fetch changes up to f9241fe8b9652e6751f4ae684efe0148e3c157c7:

  ARM: dts: aspeed: Add uart routing to device tree (2021-10-21 16:59:53 +1=
030)

----------------------------------------------------------------
ASPEED device tree updates for 5.16, round 2

 - New machines:

  * Inventec Transformers, an x86 family server with an AST2600 BMC

 - Updates to the Everest and Rainier sensors, gpios and KCS devices

 - New UART routing device tree description

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: aspeed: p10bmc: Use KCS 3 for MCTP binding
      ARM: dts: aspeed: p10bmc: Enable KCS channel 2

B. J. Wyman (1):
      ARM: dts: aspeed: rainier: Remove PSU gpio-keys

Chia-Wei Wang (1):
      ARM: dts: aspeed: Add uart routing to device tree

Eddie James (7):
      ARM: dts: aspeed: p10bmc: Fix ADC iio-hwmon battery node name
      ARM: dts: aspeed: rainier and everest: Remove PCA gpio specification
      ARM: dts: aspeed: everest: Add I2C switch on bus 8
      ARM: dts: aspeed: everest: Add IBM Operation Panel I2C device
      ARM: dts: aspeed: everest: Fix bus 15 muxed eeproms
      ARM: dts: aspeed: rainier: Add eeprom on bus 12
      ARM: dts: aspeed: rainier: Remove gpio hog for GPIOP7

Isaac Kurth (1):
      ARM: dts: aspeed: rainier: Add 'factory-reset-toggle' as GPIOF6

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add front panel LEDs
      ARM: dts: aspeed: rainier: Enable earlycon

Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO (1):
      ARM: dts: aspeed: Adding Inventec Transformers BMC

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 735 ++---------------=
----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 634 ++---------------=
-
 .../boot/dts/aspeed-bmc-inventec-transformers.dts  | 328 +++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   6 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   6 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   6 +
 7 files changed, 470 insertions(+), 1246 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
