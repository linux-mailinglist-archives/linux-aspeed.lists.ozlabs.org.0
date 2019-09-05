Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2727A97B2
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 02:44:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P24r5vSNzDqy9
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 10:44:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DUOjf08v"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P24W4ZVXzDqtv
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 10:43:53 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id v11so667068qto.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vWtL2Vub1f+32siEIcYJodOWeAIoKseX4/7ukdIJ8rM=;
 b=DUOjf08vaf+rDQo0po8Z+oo2S2EhpkZ8EiRQxGgVm1LSslML92VV/8+I4c4y7fFNRW
 vaLdtbReVGCMKdFKjj3pI0SlhgTi9udAKNktgiAiF0NhKFNbynjTdfzh28y0C2MbGsaM
 GsU0pjlWzOnLvRmOnXrLirf8zcpYFJLRTDVzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vWtL2Vub1f+32siEIcYJodOWeAIoKseX4/7ukdIJ8rM=;
 b=F2Z6PTn3xGj/R72L6izUmi1r/m255YZ73iFxCjEegPoGk8N2F4UoCeZf7vuo4k4Kx8
 D0iHtcGQIdf4uHlBAbewvRlgXmMNOwATxKEZSbPP8XfpMgdiZBboXECwGmIN8gXizbJu
 xY8ZLO3kVmETo6zRDuxi3ERsvbydtB6kCYqWINYoUoZxjXQalOwDdjGbHDsXQ440BK6x
 GNOft+VgaJg32vrKujDbp3X64hvBM7Y2a44GWlfvbmFfAXEpDGWISYTvSp6bn8Oxsgxa
 t0yGbnHYizvFgZhXQjry0d6e2dnAUq2ZCSRZXb6koI9Q6o3WYlHunBfoLKojrxzFgXyJ
 OKxQ==
X-Gm-Message-State: APjAAAWASvg31ibq9dFzQwvr0ea6LGiN8TY9jJBCdWkc06TXqJWP2sZu
 Zbo66auNctgnV8qJ7f5xt9rwUqGb6gQ7zloyWxo=
X-Google-Smtp-Source: APXvYqxh+0oAV4ZBPS7dGr9Y7LoZnq29Cfydu9xInfMG6mrl3YTwB+pT8pISnzJLoVlQ4OMWr1UILB7SE5B2VG8tB70=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr923228qta.269.1567644229728;
 Wed, 04 Sep 2019 17:43:49 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Sep 2019 00:43:38 +0000
Message-ID: <CACPK8Xdp4gVuetmiu2bRTTH6oHhRrC7FELHWKVB2ZGSbPbH7HQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.4, round two
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello ARM maintainers,

Here are some late fixes I collected for the ASPEED boards.

I've thrown the commits on top of the ones in the first pull request, which
you've merged. I've not sent a second pull before so if that's not the done
thing then let me know what you prefer.

The following changes since commit 49b0f3be0b86292eed6f6aedadf4252131d9c111:

  ARM: dts: aspeed: swift: Add eMMC device (2019-08-22 15:34:20 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
      tags/aspeed-5.4-devicetree-2

for you to fetch changes up to 89b97c429e2e77d695b5133572ca12ec256a4ea4:

  ARM: dts: aspeed-g5: Fixe gpio-ranges upper limit (2019-09-04 17:34:34 -0700)

----------------------------------------------------------------
ASPEED device tree updates for 5.4, second round

 - Alternate flash support for Vesnin
 - Minor cleanups and fixes

----------------------------------------------------------------
Eddie James (1):
      ARM: dts: aspeed: swift: Change power supplies to version 2

Ivan Mikhaylov (2):
      ARM: dts: aspeed: vesnin: Add wdt2 with alt-boot option
      ARM: dts: aspeed: vesnin: Add secondary SPI flash chip

Joel Stanley (2):
      ARM: dts: aspeed-g4: Add all flash chips
      ARM; dts: aspeed: mihawk: File should not be executable

Oscar A Perez (1):
      ARM: dts: aspeed-g5: Fixe gpio-ranges upper limit

 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts |  0
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts  |  4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 10 ++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi            | 20 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi            |  2 +-
 5 files changed, 33 insertions(+), 3 deletions(-)
 mode change 100755 => 100644 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
