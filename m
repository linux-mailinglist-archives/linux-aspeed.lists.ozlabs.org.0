Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D31CA56D
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 May 2020 09:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JMtS5y3hzDr2l
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 May 2020 17:49:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PxOeyEL/; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JMtG5mhwzDr2P
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 May 2020 17:49:40 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id x1so577618ejd.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 08 May 2020 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2ojn62szLR5yAed7Cpk2YDlU98vpC3/PF24hZzNfukc=;
 b=PxOeyEL/WMCKE3MykeDNUl697V1NpTyQ+qyuJgQxQ8veMFpQxgpdy0q0uitmgCQku3
 AnlRbwLIqljlfpjrPUWg2Tch4lPIPqQrWF1Dnoo0vadM5KzPZH53D9+GueDnlWl+v2j5
 IcKBukPfZVftBM8Wyrfw3H54TI86QA0J6V/4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2ojn62szLR5yAed7Cpk2YDlU98vpC3/PF24hZzNfukc=;
 b=ZWAxXebNJpF8NFmE0yVrpylqGEWlJElLlb9FHpqbVWLND5M7awxHV+J8UKlReKQZ7o
 XHtzrpNGUyCyxfW2UkUCFa1NpLfktccOkO7x5dy+D9Qy22ZaiTgyaxW7CZHi04mOfet5
 N9ZfHn2ns9bPw5MB8kDE+0bQxnD747ppJ+Plgtek4rPcSUSx9J1/k4atn0+XCc5uV5yF
 nDPyJpb96x6GXrIbuZNALBmW8CtjGp+T6lOlvXsPqkU1im8aHm+0pW5LMeSjUO0RNZyW
 lKJMZln8LLP0dITpy1eLLmayIEkjorYmey++H5k7SQTra6z2cmSyZlleGPfafs48Bwih
 cbSA==
X-Gm-Message-State: AGi0PuZ8Ef11/frHHH9+H7u/IWKJ4y1CiZOuu/j6PEXVogbt/KdveuJm
 4mtrMWARgxVRMiJgtgDZUybjqjM0uIe6BMBrz0M=
X-Google-Smtp-Source: APiQypJt1hvsyUFF0tzsQJYCtHjMMGdAT3QaHxDwrq0/Tkfdj2zjCuSUV+TqJSyReKLbgKVtk0+DWLYID9k0DtsoTxw=
X-Received: by 2002:a17:906:4c8e:: with SMTP id
 q14mr881699eju.208.1588924177282; 
 Fri, 08 May 2020 00:49:37 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 May 2020 07:49:25 +0000
Message-ID: <CACPK8Xd-=XFREvvS-mK_ECyn14y0GPAMyy5BpEEUYfaw4jAgsw@mail.gmail.com>
Subject: ARM: aspeed: devicetree changes for 5.8
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

Hello ARM Maintainers,

Thanks to covid chaos there was no aspeed pull request for 5.7. We're
back for 5.8 though!

There's a patch in here that causes some build time warnings from the
device tree compiler. I've sent a patch for that to the dtc folk:

https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/

The following changes since commit fa4c8ec6feaa3237f5d44cb8c6d0aa0dff6e1bcc:

  ARM: dts: aspeed: Change KCS nodes to v2 binding (2020-05-05 16:37:17 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.8-devicetree

for you to fetch changes up to fa4c8ec6feaa3237f5d44cb8c6d0aa0dff6e1bcc:

  ARM: dts: aspeed: Change KCS nodes to v2 binding (2020-05-05 16:37:17 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.8

New machines:

 - YADRO's ast2500 OpenPower P9 Nicole BMC
 - Facebook's ast2500 x86 Yosemite V2 BMC

The AST2600 machines Rainier and Tacoma were fleshed out.

Machines have started describing the GPIO names as userspace attempts
to use the GPIO chardev API.

----------------------------------------------------------------
