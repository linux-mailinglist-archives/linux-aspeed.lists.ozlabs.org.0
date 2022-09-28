Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE865ED3FD
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 06:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MckRr14Prz3bb2
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 14:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=T6qOtTba;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=T6qOtTba;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MckRc6TN6z2xy4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Sep 2022 14:44:27 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id cc5so17883043wrb.6
        for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Sep 2022 21:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=UbIdGPHTQb0rSyUCqwB7KsZpj7r2X4N4SUM3dLW5wRw=;
        b=T6qOtTbao+oc5+lfR1CrJOinJ2d7LfNIOdBM/zoz5Q3Uykpxza4+GQ0XwvlBJ3hZVF
         LgCzSVp3Eyf3AlWK3Y6Q44SLpEoe31kAVkApgVYilMY5mIhbNv5CtKTSd/W62xMGMVZ7
         wUSDVTJsB4wd7pli4xhHH7hnoSCP3HKsoRIZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UbIdGPHTQb0rSyUCqwB7KsZpj7r2X4N4SUM3dLW5wRw=;
        b=esWlNoGsDMrCrzbaTl2SOAhyztJ7lK/ti1As3aUJ2/FXs2kEmjgME4Xevb92+yYzKl
         iQs8AMbQRo8snP8+79RLPGhQfqnOUINYZ6UGDGiWiyvhFVJmNSlH8du1bwBi3bxNTD98
         XRZ3s28TNm5jk3MvOte8WIsXL959yZtrJNb+EbcRKbncd7Pb2tzhu5pf6CJdea8hTbQj
         25+smdSX+p0M+AvchUN6DkCTtttcmjWA1MxNc1L65O/YMq45QX8tDTSjPH2lkyTHhy0o
         XGQENHIXiZKMxm7kroZkmlS9fGMNQvOvg3WVgfhpzG9e2u8UyDvRtb8L8br7yR8YGeyK
         BnGA==
X-Gm-Message-State: ACrzQf33g7QQUNIcibdyJbQVQy54Y5h7DA+YhohTruwjrBrA0qUrsOs/
	1As4q7hYRXYD4dN32hgQhV+zOfoucxh04ayUcD4=
X-Google-Smtp-Source: AMsMyM4M7MRQ8DivtDCUCQYo6LwQksQkEsZJGlIrOSAMy13q8S4xwp/hAm/ZHbhJEVlUWJhJbYe1PiOOSj031vMlEhY=
X-Received: by 2002:a05:6000:1a8e:b0:22a:f55a:94d6 with SMTP id
 f14-20020a0560001a8e00b0022af55a94d6mr17982701wry.606.1664340259828; Tue, 27
 Sep 2022 21:44:19 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 04:44:08 +0000
Message-ID: <CACPK8XeLzL3hT8fwVw9fV7Ccduz_PNhZn_67z2yXefCEha6jJg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 6.1
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

After a brief hiatus that saw me absent for the past merge window, I'm
back on deck and catching up. This branch has a long awaited sync of
the openbmc defconfig (where most of the aspeed code is consumed) with
the one in mainline.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.1-defconfig

for you to fetch changes up to e0d468427882556b8815e09769bbbc3281478b1e:

  ARM: config: aspeed_g5: Enable PECI (2022-09-28 12:34:02 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 6.1

 - A long awaited sync to make the config closer to that used by OpenBMC
   machines

 - Enable PECI to provide defconfig coverage for the subsystem

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: configs: aspeed: Add support for USB flash drives

Joel Stanley (10):
      ARM: configs: aspeed_g5: Add mp5023 driver
      ARM: configs: aspeed_g5: Add TPM TIS I2C driver
      ARM: configs: aspeed_g5: Add PL2303 USB serial driver
      ARM: configs: aspeed_g5: Enable MCTP stack
      ARM: configs: aspeed_g4: Enable OCC and NBD drivers
      ARM: configs: aspeed_g4: Enable IPV6 options
      ARM: config: aspeed: Enable namespaces
      ARM: configs: aspeed: Refresh defconfigs
      ARM: configs: aspeed_g4: Remove appended DTB and ATAG
      ARM: config: aspeed_g5: Enable PECI

 arch/arm/configs/aspeed_g4_defconfig | 10 +++++++---
 arch/arm/configs/aspeed_g5_defconfig | 20 +++++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)
