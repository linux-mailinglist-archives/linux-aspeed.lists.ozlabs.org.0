Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33DF3B8D28
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Jul 2021 06:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFlg941cwz2yxj
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Jul 2021 14:32:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FkWPmGQX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FkWPmGQX; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFlg35rM7z2yL2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Jul 2021 14:32:14 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id v17so2315358qvw.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Jun 2021 21:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
 b=FkWPmGQX3BLG1gJRHwscUBE0g7ow4mpQOlLBQ0IgCC51x7Cmf3b9OFxJRRtt6Wsi0f
 gD5oFrX+a479C1xGk3wsyVvOEoSIAPsgLq2OqvoO0dyeCl5MeeUu4OqxDGZHHg20Go6K
 hvz2BoEFv5zUeDAlLyhD1+DcbiJRbfIThMcfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
 b=SishnquKCd3NgT0jlBtAfyJ+fqID0si1SSGJOunlh3csK0LYPUj2JBVVkpxEy5IGRn
 u6pga/WnNpptv2AFbVruQJC8FRCvKJUpL1lZewIq6/4jMnz8636zNRYoBsfF20jF2phr
 2HfwbiggLXL0e9aXmaOXi2sSE07+BKsWZEmyqM+IpLF8C8Al/siEicARmEtLSmHTwDM9
 H7RIO97K7hq9fWP8x7TzmlNAldTMXe+zKHUjJX5lB+rljN5C0rNq9VjLbvRN3nCwxJmA
 ltloRkcNp+qCHS3cK0mwDsy5jAIoRcmBuzKFqSeY729LUIo+N0nt/+wqmc4VKkfklz2I
 xVXg==
X-Gm-Message-State: AOAM533SOxk8CxNfnMPmgYKyHWr33uBAcsp3HjxUVzTuWnr1YoeHtYQm
 sarIgbXfkbWooXqr9O5bDCKms6QIbEZQdI8kkIk=
X-Google-Smtp-Source: ABdhPJyvbSh42hrNgpYeAMR1+1kC/eGTFXnpd3MmgjT334Jw16Tx7OzUCX/fFZK8JW0WGhgBu0/4Y37FGDUg1bY5AVM=
X-Received: by 2002:ad4:436b:: with SMTP id u11mr6159929qvt.18.1625113930426; 
 Wed, 30 Jun 2021 21:32:10 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 04:31:59 +0000
Message-ID: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Zev Weiss <zweiss@equinix.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are some minor fixes for the aspeed device trees.

The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree-2

for you to fetch changes up to ab4a49d36010564c70fe5586a4c2b1985866616f:

  ARM: dts: aspeed: everest: PSU #3 address change (2021-07-01 13:41:33 +0930)

----------------------------------------------------------------
ASPEED device tree fixes for 5.14

 - eMMC phase corrections so Tacoma and Everest can boot

 - VUART irq polarity fix for e3c246d4i, using new bindings

 - I2C address fix for Rainier power supply

 - GPIO line name fixes

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: tacoma: Add phase corrections for eMMC
      ARM: dts: everest: Add phase corrections for eMMC

B. J. Wyman (1):
      ARM: dts: aspeed: everest: PSU #3 address change

Joel Stanley (1):
      ARM: dts: aspeed: Fix AST2600 machines line names

Zev Weiss (1):
      ARM: dts: aspeed: Update e3c246d4i vuart properties

 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts      | 9 +++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts      | 5 +----
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts       | 6 ++----
 4 files changed, 11 insertions(+), 13 deletions(-)
