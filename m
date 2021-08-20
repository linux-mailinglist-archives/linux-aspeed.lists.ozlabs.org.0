Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669D3F2718
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Aug 2021 08:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrXWs40Npz3cHb
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Aug 2021 16:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ez0h2GnA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ez0h2GnA; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrXWm6BpNz301g
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Aug 2021 16:57:38 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id q6so5004625qvs.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
 b=ez0h2GnAsw9nyE6vHO8RTsKE7gM+sQUsTEeXabzp3YmS25OfoZLxlpR4L/D7yWeEIe
 uspj/QajhSi908C79vGMfY6GEk6fH3/h3oGGSJncmlbOJEEzO5UfZU6UUkz90WY2bCJB
 qmSQlbolBZgfAe3wg+3Lct26+ViHXBvax6/Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
 b=lPI4gJg/J94cqixK+P4koyadwlNfhahoqNoycPix83wR3F3gQvzVtyKQG51drGjFws
 9DtvRm9XjX7U11PlNkqGM9ix2Ahm8nQEJ6YhbU6g3X43+MA0lFKrQiywPgCtnHNz3jGv
 clZJInPHe9FtDwPEXxdhoW6E1SKANmVsuizykdhHCr4K+A25ofvbNDyOb7N+vuG5FK1l
 7KnyNWBIUK4suhXvsN/GdQA/JF9JiW7NYo6Cy3gaq9WKTgO5xMm5pVdaHY3q3vJfLiSN
 PonxATz+rPkYiqJQGmMsBijTuQ5BNjNekkoRD5z6f9ZKA6ASatPOY1/NCxnDondBhYxX
 Kwrw==
X-Gm-Message-State: AOAM532nz4l19Jpg0MtMOnlDCYWV2WxGizwPOyriKYV5Xwwjv1gjDGKF
 UCG2Ga1WXT2Mkocy9lzi/0MvcJ59WxAAii7yDFw=
X-Google-Smtp-Source: ABdhPJz6OTbflJCYACZ7DsAZ4MzA345+fqJTPHx13X/1ctgZxWuqPYzlVf9y9O4aPTz7L1d2eL6e/6Tkw7sevDTQTeo=
X-Received: by 2002:a05:6214:cc9:: with SMTP id
 9mr18358394qvx.43.1629442655136; 
 Thu, 19 Aug 2021 23:57:35 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Aug 2021 06:57:24 +0000
Message-ID: <CACPK8XdzKdnyrpjKukGWieBhLgQnBs+y=LuSr_weot=Ovy3+9A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.15
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

Dear Soc maintainers,

This is the last of the aspeed pull requests for v5.15.

Apologies for drip feeding them, I was pressed for time so I started
with the most important and worked down the list.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-defconfig

for you to fetch changes up to a4836d5ad127fe31fecb29878d81f2e9b4a5591c:

  ARM: config: aspeed: Regenerate defconfigs (2021-08-19 16:33:43 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 5.15

 - Enable new KCS SerIO driver

 - Enable SGPIO and EDAC for AST2400 now they are supported there

 - Switch to SLUB and enable SLAB_FREELIST_HARDENED

 - Regenerate defconfigs atop v5.14-rc2

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: aspeed: Enable hardened allocator feature
      ARM: config: aspeed: Enable KCS adapter for raw SerIO
      ARM: config: aspeed_g4: Enable EDAC and SPGIO
      ARM: config: aspeed: Regenerate defconfigs

 arch/arm/configs/aspeed_g4_defconfig | 16 +++++-----------
 arch/arm/configs/aspeed_g5_defconfig | 25 +++++++++----------------
 2 files changed, 14 insertions(+), 27 deletions(-)
