Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EDCFBE82
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 05:09:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D7Kf0JN1zF72C
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Nov 2019 15:09:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AEdGfcWC"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D7KW2xYvzF71W
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Nov 2019 15:09:35 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id c9so1811427qvz.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 20:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xX0IGDGxZ7reuqUqxv2ykfm89rjIDO860DefvQbuA98=;
 b=AEdGfcWCvY7niHYo86gHc9yGERFpCe6WrSATcr7cwx/TjEmNACXgn8/zSykyRaPTtp
 j+AMAYeYUZeIWLQxJbTMQgFf+f176qMfkwrUTl/OWJmYCBJ2IEnwlfsQA86lsGV6pGAy
 yc3z2dohp+S8120xpch2MjrfMQwMbY49rH+ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xX0IGDGxZ7reuqUqxv2ykfm89rjIDO860DefvQbuA98=;
 b=db4bbgZW6GMHECM0UdN2mXg7hXSE3VB1f+nH7D6u656FBT1t1JS2SoucA9v1CMCcdB
 f0R7eLk4T3wBVcvDEYfTaw7Mv7rEPRkHe00kanldUJSgucpZtmPz2GLli/IWrIcS41tv
 OxK29R5d7UL0as0EAoZs1pdqt/Nfo4oFSbv7rGJ8cSx6+/BhJn9foDvymOFsJzGiyElV
 Yvh5soGWwWKMfgtH6cVfn5eKwmgCjH08F8E4nM9viesyyH7QnSOC1gHpwSrCPRH1nZ7q
 eZ4sji+WZCPXiUkt6vNAaAD4nweyK1MbVzVr7bidgeHk4rIRTn3ftcbsQYfHrRkhFkJR
 PcCQ==
X-Gm-Message-State: APjAAAUUXSI1kDZrfVhmfVt20/UfB1a1V8acjgYK2FVh7NZTsIkQVJV8
 H4tcVPfj71CumMvysA2701kfMTiER+VNoqcIRIM=
X-Google-Smtp-Source: APXvYqye5GQ3dpU8avlSfFo3h9SALnUM70KR5nxoGWJtnrLSAdjx65WKjJWWtV5Blx8yCcHEJn80qKk5MMhOZTIqFpI=
X-Received: by 2002:a0c:edcc:: with SMTP id i12mr5075940qvr.20.1573704571059; 
 Wed, 13 Nov 2019 20:09:31 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Nov 2019 04:09:19 +0000
Message-ID: <CACPK8Xc3a=6irkTSfwyPrr=nWv_fa9nMxthtC2AyqFJEWvuMwg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.5
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

Here are some defconfig changes for 5.5. There is a diffstat and shortlog below.

The following changes since commit b50a85c023f494047a3767398ca589d1c801f22b:

  ARM: config: multi_v5: ASPEED SDHCI, SGPIO (2019-11-13 14:38:39 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.5-defconfig

for you to fetch changes up to b50a85c023f494047a3767398ca589d1c801f22b:

  ARM: config: multi_v5: ASPEED SDHCI, SGPIO (2019-11-13 14:38:39 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.5

This adds recently merged drivers to the aspeed g4 and g5 defconfigs,
and to the multi v5 and v7 shared defconfigs.

----------------------------------------------------------------

Joel Stanley (5):
      ARM: config: aspeed-g5: Enable 8250_DW quirks
      ARM: config: aspeed-g5: Add SGPIO and FSI drivers
      ARM: config: aspeed-g4: Add MMC, and cleanup
      ARM: configs: multi_v7: ASPEED network, gpio, FSI
      ARM: config: multi_v5: ASPEED SDHCI, SGPIO

 arch/arm/configs/aspeed_g4_defconfig | 18 ++++++++++++------
 arch/arm/configs/aspeed_g5_defconfig |  4 ++++
 arch/arm/configs/multi_v5_defconfig  |  4 ++++
 arch/arm/configs/multi_v7_defconfig  |  9 +++++++++
 4 files changed, 29 insertions(+), 6 deletions(-)
