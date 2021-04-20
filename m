Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2D365300
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 09:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZgN49QPz2yZQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 17:14:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=epN9bBJk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=epN9bBJk; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZgL5YFLz2xdP
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 17:14:22 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id j3so18125978qvs.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
 b=epN9bBJkCDeaCFZK4qljnKoh/ZCer6Rl808fLEaqfAI61COv6SK8+5txip0nKWOV2T
 8YivqJwZJji6p5MTPqJcsIxSzaIMmefZbS36FWMBs4iDJ9zVmLm7d0VaONZU01tSTrH8
 KXFE/4cldW0e4ppsjxfhrGpVyFeb/Q6Kk5b9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
 b=DJM7R3HJ7cWUB1CsuTNnyTUialRmbtYP8Lw/zSF0M2cyoTknHNLNIcxG+M6OTudleQ
 IxKfZiK0AfQnKZsyiyKBq2Tjsa66qXgXAmCQH9+QZ3SWhbNzh6nJyVSpcVFpnAWtvPg7
 sFBOVgIZmf5feTbKRmsd0GhcBtYFkXhcxOj5DsIsW4cruz9TCHlkgWuiRORT3R4JPtT0
 vLZ4Do2RfwxRqtECgvkOmmZ9dynq/TsryIeprZLtJFonWHkzuV1GjTt6kIPWAXMqquIf
 e3COhEnn1UWiYFZp0ZBnoutNrZKHeA0Tvtz9Zr4ckUSh2Vjl9wROr8JtlAmx9kJmmIZA
 1UHg==
X-Gm-Message-State: AOAM531H7rCyzAJvdy01KNfserf78WTP3WArUSV7wJXsC+RN/vvqqQbb
 yD+vJQanvkjznPHJINKaaDlAYqlXJy3uEkLw83I=
X-Google-Smtp-Source: ABdhPJzifDtmp1KOcVZM5c1KCJUCPffdbs83Eym8asAMyev9EXi87+eBIcYJ56aJG0CRxMAUN9hKeYSoXSxnjqXJPt0=
X-Received: by 2002:a0c:e950:: with SMTP id n16mr25332659qvo.43.1618902858747; 
 Tue, 20 Apr 2021 00:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:14:07 +0000
Message-ID: <CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com>
Subject: [RESEND GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
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

Hello Arnd,

Here we go! The second try at a second set of changes for v5.13. I
think I've sorted out the gremlins, thank you for your patience.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller

 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |  30 ++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |   5 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 306 +++++++++++----------
 4 files changed, 201 insertions(+), 142 deletions(-)
