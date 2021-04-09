Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360B35957D
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 08:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpCQ1cMYz30L8
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 16:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PXJMuB/s;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PXJMuB/s; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpCN1G4tz2y68
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 16:30:06 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id x11so4816793qkp.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 23:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
 b=PXJMuB/sRtry0TFRSRVSvL9b1Obex34q0EYuMI0KevjzaahGxSYOdPJj3p7uQMktf/
 SmDk9QgSUPq+OoXavw9h2kYvWLge9VXenmNjZbO+kUFE75AhlFQGG35rCT128ILSFQJa
 hfO1qs7pyU+lY9CFAMh9YRXev0ZMrHy0InAZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
 b=eGKE/G5ah6XNyPfBUp9zazmsgOSAPDuy9EUw19x1Ewy6w5ltGulTC8llzZC4OUtjXm
 n5yytHQ6OAkV0k2ER34DGW6xZWyX7vLhSmiGHmuU72I9euBqYTjJbQEpKfcKiKQlASz6
 yTCe3af8t6ImO+XWXDd75x85qtl/wymnGaRmvVOtQcSQZVRLSMsAP/sshfG0U1qL/1OM
 nrlPyPxxuKtoLEzkh75sI++rZeJPwku4FlkTTuiqGJYU3fhH0wwY0F3LSw1Q0Q8trr+q
 1N62UIdJWDPzdZ77IOp1KZTe4M65E3rK8I8zrNP+ggWml8Fz2ieT0Da22kGRC8ya4urx
 Iekw==
X-Gm-Message-State: AOAM532t1/XkyPPLAZ15cS+4exNcTxS8BL0fTfnEfBpG3DHrlYvKswjv
 kQZcjrwHWDm8wYFA2fqpMmBAH+I37cWAX+qIwBQ=
X-Google-Smtp-Source: ABdhPJxgu3cBHKkUKgRIxfjzhkmIIhaArUkzZ7ELQ+REDApTFFkya83HBLiA9F2iqAllfdJfMfC0rTiuwzYTrj86UsY=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12472020qki.487.1617949804254; 
 Thu, 08 Apr 2021 23:30:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:29:52 +0000
Message-ID: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: lpc changes for 5.13
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
Cc: Corey Minyard <cminyard@mvista.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

This is a pull request containing a slightly messy device tree and
associated driver changes for the ASPEED systems. It corrects some
design decisions made when first mainlining support for the BMC
devices on the LPC bus that have stopped us from being able to write
drivers for eg. KCS.

Andrew has worked with Chai-Wei from ASPEED on this process. These set
of changes have acks from the maintainers, and allow Andrew to go
ahead with fixing the KCS drivers in the future. The branch should
apply with no conflicts no matter which order it is merged.

If you would like to handle this another way then let me know.

The following changes since commit 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.13-lpc

for you to fetch changes up to 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

----------------------------------------------------------------
ASPEED LPC updates for 5.13

These patches fix the ASPEED LPC bindings and LPC-related device drivers
so in the future the KCS driver can properly use the hardware.

----------------------------------------------------------------
Chia-Wei, Wang (5):
      dt-bindings: aspeed-lpc: Remove LPC partitioning
      ARM: dts: Remove LPC BMC and Host partitions
      ipmi: kcs: aspeed: Adapt to new LPC DTS layout
      pinctrl: aspeed-g5: Adapt to new LPC device tree layout
      soc: aspeed: Adapt to new LPC device tree layout
