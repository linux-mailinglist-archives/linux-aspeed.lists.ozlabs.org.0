Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9E4F43D
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Jun 2019 09:59:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45W7HM41w3zDqcN
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Jun 2019 17:59:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="OeGnkvv7"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45W7HD1hryzDqVv
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2019 17:59:01 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id y57so9411006qtk.4
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2019 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=l6JkMxGCR4TkYnMh8TfPneR47DulikqSuvDG9umnXVI=;
 b=OeGnkvv7y+Ei1gULqYCugFOXLsimmG0XO0QLTsgjHQqhvu46hc3KZiXn2iwsY2zpcq
 WKflQC1BRLeYcJ+LUHpDai9Y2b7nFA+xKT1OzmiNg9FuQm2gL5UwXyAh6eya8DaA7n/c
 obGOyU2qw+xF8uXItSvl31hPY5U1/jdM8bpBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=l6JkMxGCR4TkYnMh8TfPneR47DulikqSuvDG9umnXVI=;
 b=iZFFa5yL0lYMtD2DfnGhSSmk9v0wS7wWBPxPOYYme3EjsMaKN9KFrrQoQMoqjZZVRV
 VpeEnge5uDPHOt6jizccsR6M1pVuu/WzY0rISxqgdkTqT8Qx8MAdrOmYn2qvf9cKa/9w
 1pa0T8mXn1lu64b+apq6+KUdGDP+QNQKtHAKkBgy0wucqT52QHXHY2gorXkFcpluiDRb
 zGq8o/PfbDjva5wTbKlFGFQ4PcxbZEdD3p8xy7po2ylXjF0izTz8HCO9CRsBfUkir3XZ
 G3miUskO2Z/exw5Noc6hvwHwBxacZANsLxNDn2aQ7GxfqlMiJOeeNtzSL+bURYv7L7JP
 tyVg==
X-Gm-Message-State: APjAAAUgm+UeNB8qHH2OtlBlxKr49N2UzC1EQcxYLeDMjTz4d5xEcYdN
 DoCy8eQFxNO3wVkxf0VpTE4V9EcaKQqPQ/umTGQ=
X-Google-Smtp-Source: APXvYqwe++A1xs7ZZPPxAlWbW4nT5c67yseQmkyeJUk2auF7XiQNd32xDW1+ryWZ+Jb9yUeztgGVmIN6hcvMI5JnFBE=
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr48970818qvc.172.1561190337785; 
 Sat, 22 Jun 2019 00:58:57 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 22 Jun 2019 07:58:46 +0000
Message-ID: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.3
To: arm <arm@kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi ARM maintainers,

Here are some defconfig updates for the ASPEED machines. I haven't
sent one for a while, so there's a nice collection of drivers to add.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.3-defconfig

for you to fetch changes up to 2d8bf3404bb0e65dffb7326f7fb6e96fa3cee418:

  ARM: configs: multi_v5: Add more ASPEED devices (2019-06-22 17:12:17 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.3

Add new drivers to the ASPEED G4 and G5 defconfigs, and to the armv5
multi defconfig.

----------------------------------------------------------------
Joel Stanley (2):
      ARM: configs: aspeed: Add new drivers
      ARM: configs: multi_v5: Add more ASPEED devices

 arch/arm/configs/aspeed_g4_defconfig | 10 ++++++++--
 arch/arm/configs/aspeed_g5_defconfig | 14 ++++++++++++--
 arch/arm/configs/multi_v5_defconfig  |  8 ++++++++
 3 files changed, 28 insertions(+), 4 deletions(-)
