Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF07435A5A
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Oct 2021 07:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbln0dtvz2ypB
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Oct 2021 16:35:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=W/GkOBcU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=W/GkOBcU; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZblj0RWMz2xXV
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Oct 2021 16:34:54 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id w8so5150284qts.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Oct 2021 22:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
 b=W/GkOBcUgbznUu6AFf4sEGPIgLXPobT/BxjC+RQ3UsOXTtnV5s6Hu7Ehbf53dn/0dW
 die3vh2BoBfZDlbB/dS5zHgJleBKE0Qhk/wgjqtCn4fxrG4pT94SfjyDUzNfI/VGaKoC
 wFijimLQhIyC+PKSWs3jla26tom1jdJut+KGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
 b=Od4Ol2FxBblaWYh2kZ2NQr2KQu1asxoCeVNWe4Ig5gRm3aXHTmxYhzY/GXtWaLRIKn
 ELenfumxOf6cwB/yITey5qRoZo8keyRqbKovd52whik0r83l2QCDYofd2UbbGjc6O4Zk
 6BGOHyv90leiTdfKayfD5GV8wnh+nju+bQWs8yT5gwptrDy9A6xFCQAP6VmfTAmyYuvH
 SfQod2pAcqdYa04bYkmucEyA3TA6EkTT3r13RZHTIluPdYYYrKsmyz+6Zuim70N95F8b
 OpO9zajaEGW+BcXfFj4Rqs58P5xSM8+DHjhLS2xhwR+YySmcmVxyEafMaZnmYpS82lpA
 sHZA==
X-Gm-Message-State: AOAM531/unX9Ymh79g29mqKvRIUkkSMWHfeiic+EDlsJJgvf0OS5aw+s
 V5REnosQ/+/tk4oHKcK4IFH9k32+n6QPRPEQ9JAN+faE2Po=
X-Google-Smtp-Source: ABdhPJyMzuyXO0SBIINy0WPCXlJC1D/b24gY7qkNEliyXfFi81yGd9amHY8WRVOpNJ9LSE4dVghPNhwf5FLlVMDmErM=
X-Received: by 2002:ac8:5f06:: with SMTP id x6mr3827041qta.295.1634794491508; 
 Wed, 20 Oct 2021 22:34:51 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 05:34:39 +0000
Message-ID: <CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.16
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

Here are aspeed defconfig changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-defconfig

for you to fetch changes up to 52a490e0efac02f236295cf43e136a1cb3a786f7:

  ARM: configs: aspeed: Remove unused USB gadget devices (2021-10-15
15:02:32 +1030)

----------------------------------------------------------------
ASPEED defconfig updates for 5.16

 - Add options that are enabled in the common OpenBMC kernel

 - Re-enable DRM_FBDEV_EMULATION

 - Turn on the various sensor drivers that are used in BMC systems,
 so we can boot test where they are modelled in Qemu

----------------------------------------------------------------
Joel Stanley (6):
      ARM: configs: aspeed_g5: Reneable DRM_FBDEV_EMULATION
      ARM: configs: aspeed: Disable IPV6 SIT device
      ARM: configs: aspeed: Enable commonly used drivers
      ARM: configs: aspeed: Enable pstore and lockup detectors
      ARM: config: aspeed: Enable Network Block Device
      ARM: configs: aspeed: Remove unused USB gadget devices

 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig | 35 ++++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 13 deletions(-)
