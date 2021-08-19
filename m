Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E73F12CA
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 07:32:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqtgk1PWPz3bYd
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 15:32:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q/Y/nlRa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Q/Y/nlRa; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqtgc0ynPz30B0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 15:32:10 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id dt3so3023397qvb.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 22:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
 b=Q/Y/nlRa3gEiP7D2ymRx62azW9Y6xeo9lyO/AyKtMLlwqTq8h2QILIobGMGe/vrlaw
 fenV/Ztp0pjXGLnsDKO18cy9CdYcRxG6fQwVrTUh+Gc673s6oNO8UZx19CuYqLjNzJkB
 l20vwXerZDkzbXzll7qKsnKp1uSgJ6Ks8Z8qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
 b=Wfud+ErpPlgQ7EZggNh+ckN++Z2xqr40HxdyCAUZlUfo3O8dxMm8a1TKXB/Pr8kuzv
 FeNWDXnMx0fwSNx2oDZF6UCk6J3nrApN0H6D1UDSBpEtO+WO2c4CkBrdnmKdqFjizHTh
 F7fyhGWB/vrg2O7D28R8KGIR/00wikEkiP3Ct4c2n4YIbUKZ/hlyuK6srEcea4vX99iD
 oPCG5sPr+OkgQnZdgLKEtwO3EIkpFBMimTGeoctpyRyx7jLD58Nuj/AA8I6DqCDzjXpN
 lTiAHRbtn42V2dOvjrex6aadlxb3okIlAJdanhoVcaQwT3Poy2A993TYf1npzFmBnCs1
 xhOw==
X-Gm-Message-State: AOAM533T9DtZJOwhgyzo1HzpvoGwcxYvkqWwwdeYf5BVgQKEhyxXv6WH
 igt1b2tbA27r4wmVkFfpeXk0hje+ekQZlmiyRhY=
X-Google-Smtp-Source: ABdhPJyLFV4R3lBRTBpqUa3Y8sHajJUfmKf6QmuJrccBRv2MtowA33NMOZbJWKhHPTCr6fsQDVZ68YPQgciEMa+Lemo=
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr13006026qvb.61.1629351124799; 
 Wed, 18 Aug 2021 22:32:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Aug 2021 05:31:53 +0000
Message-ID: <CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.15
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

Here are some soc changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-soc

for you to fetch changes up to 2f9b25fa668218f22a85ebe8c55d1d132fc0019d:

  soc: aspeed: Re-enable FWH2AHB on AST2600 (2021-08-19 13:59:28 +0930)

----------------------------------------------------------------
ASPEED soc updates for 5.15

 * Two fixes for drivers that control the mapping of BMC memory over
   PCIe and LPC

 * Re-enable FWH2AHB on systems that have it closed off by default

 * A new id for the AST2625, an AST2600 variant

----------------------------------------------------------------
Iwona Winiarska (2):
      soc: aspeed: lpc-ctrl: Fix boundary check for mmap
      soc: aspeed: p2a-ctrl: Fix boundary check for mmap

Joel Stanley (2):
      soc: aspeed: socinfo: Add AST2625 variant
      soc: aspeed: Re-enable FWH2AHB on AST2600

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 31 ++++++++++++++++++++++++-------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c |  2 +-
 drivers/soc/aspeed/aspeed-socinfo.c  |  1 +
 3 files changed, 26 insertions(+), 8 deletions(-)
