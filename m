Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B447CB29
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 02:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbyP15f3z2xtv
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 12:55:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XTjBGn0w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XTjBGn0w; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbyK2qt4z2xsx
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 12:55:53 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id m25so585122qtq.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Dec 2021 17:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KmpwSeOQl/QXGSnivi72HaYeJIGlBFlV9jlga5Atti8=;
 b=XTjBGn0w756fQPrPI26L5to+oyhssIy2zdDvxoDGjoJrW8qnEz+oyLd4APhv/T/447
 lLmYjGD4p6NGNEZgtqhXAmYD/upSrvTX59E00hbjiNyN8lggW7BqKbtk3Sf/tr8PCpku
 eXORwRYHsgGFKBewyivNB9iKqrHqPA85Au7kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KmpwSeOQl/QXGSnivi72HaYeJIGlBFlV9jlga5Atti8=;
 b=tY2J4q1nTtgGBF0Oej9FEeQt84bMn3sv9U+czo8sVMEqmnGSrg6gQexn5NJTl4XFTY
 E7LPsZsa8OlsXm884l1upS/z3S4vt6twLmbACSApzaN1ZFGqXmOKfNKvfnWK1xf3H9I1
 HC+nNwK5eEMjtbSMLId3g/ncu3HBgVFIALBQUAqh4gfvcC6AyoOxxt0u7asUU+FqWd05
 ySLvEZIa20rQzkfZIDstp5CurUMhziixALLGUy9SCzVOcQYzaK9s1c16bWZrmwzWc4Yc
 YFp6Hv7sr0T6+2V85cRQPCcFktjMogn+MMvTRwpsW5QGuK5cxFwvnHwsMC1u9RRgDwBa
 fPWg==
X-Gm-Message-State: AOAM532lGDXlsPA9cGfdr9EwgaoVwi3uxY+UzdzpDmOEDdrwk8qxdrDG
 4f2lpB8pbjX2FEBwXYnSpi6LO8+8/buKu62o3YA=
X-Google-Smtp-Source: ABdhPJyF7ZbgfJsQdSxtdlu7B7xBtMb507XLSR6NmqaZmoheT4ZN5mE79OYaqyVfY+EyNgs+lTNxfCA7quoz9F4+CC4=
X-Received: by 2002:a05:622a:38d:: with SMTP id
 j13mr740008qtx.159.1640138150024; 
 Tue, 21 Dec 2021 17:55:50 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:55:38 +0000
Message-ID: <CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.17
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

Here are the aspeed soc changes for v5.17.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.17-soc

for you to fetch changes up to 79ee56da2e4f49adf174dd7a2e10ce488506c865:

  ARM: aspeed: Add secure boot controller support (2021-12-21 15:56:30 +1030)

----------------------------------------------------------------
ASPEED soc updates for 5.17

 * Fix for deferred probing of LPC clock

 * Display secure boot status when on AST2600

----------------------------------------------------------------
Jae Hyun Yoo (1):
      soc: aspeed: lpc-ctrl: Block error printing on probe defer cases

Joel Stanley (1):
      ARM: aspeed: Add secure boot controller support

 drivers/soc/aspeed/aspeed-lpc-ctrl.c |  7 ++--
 drivers/soc/aspeed/aspeed-socinfo.c  | 73 ++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 4 deletions(-)
