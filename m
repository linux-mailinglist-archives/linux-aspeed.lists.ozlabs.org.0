Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC79C44B
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Aug 2019 16:10:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GcV51N6HzDqY6
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 00:10:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="icdgnHCD"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GcTw4k6NzDqB4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 00:10:12 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id b11so15548782qtp.10
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Aug 2019 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ix5Fxc57rohsvqsDlPiVkf1CiayftDRsDvGjRw//vMY=;
 b=icdgnHCDw2lLR8YnW6CxpTHY5akD/R9sahPJnOomMzU74sl45H2fAHFtIoTK3J9BsK
 OEf+m2+epqdfUaejDWBB7AlLWXU9alxxKmH39bPrbt3qXjvGQfNo8DXt7zGVzCMO7VBU
 vLnDwQmjsNJ6vkP/tURpzc3cX0eVfVELTZr0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ix5Fxc57rohsvqsDlPiVkf1CiayftDRsDvGjRw//vMY=;
 b=kmb2E8Vrw/yJHXt9cLZuMnRk4u4w0nkWC7U9Igsq+KCRyBPObwuasCox6kLVilYmWo
 BamUdKIvjO2vVC/kaKd9D6g3ayXa68gs8nRtHmCTIuj8cYKSiZWfBQtIO7jnIe6HjgRP
 jmuYAu1hnLg1eWYenYpLY0/PbLd9RJY06ZXKJ63fD/pK8sAS8+rQmnkVheDRXgBQhZ6C
 xHM6ttJkXaJpy/n3iNBnMINA+oHgLj2bQoRJMLdnQbBi042TAU8dY7lf/YAhyDDespWM
 d1lM3SzfpqD4l3ukSNov0QhR2elyvkkdp2Cn1zatxhjFV2XpWkeVyvEtXdwXHp3Y4Y5X
 FASw==
X-Gm-Message-State: APjAAAWDWHUERJc/9LQQ37g4EEueRwWSsdprcyRobGRABa10tA6740l/
 FfFZy6se3CkLo2HyWvnb5kFehgifjNx/vNidALw=
X-Google-Smtp-Source: APXvYqzFrE96OFY5U5o+hgbd1rMHJJMXrR6dbp7JfVZKXs7/QspfFIISONVZdI96hmz4Ggr2nLLZh29Q8JdCic7ikC8=
X-Received: by 2002:a0c:dd83:: with SMTP id v3mr11831705qvk.105.1566742208271; 
 Sun, 25 Aug 2019 07:10:08 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 25 Aug 2019 14:09:57 +0000
Message-ID: <CACPK8Xc1aSp5fXL3cEzC9SJsCXG2JwsSPpQrW3a09dkvhCyHHA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: arch changes for 5.4
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

Hello ARM Maintainers,

Here's my first mach-aspeed pull request. We finally had to add some
code here to support SMP on the shiny new ASPEED AST2600.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.4-arch

for you to fetch changes up to 87dfe49691a3aefd66ebe76a4a0cc9e872d2587b:

  ARM: aspeed: Enable SMP boot (2019-08-25 23:26:52 +0930)

----------------------------------------------------------------
ASPEED architecture updates for 5.4

This adds support for the new ASPEED AST2600 BMC SoC.

----------------------------------------------------------------
Joel Stanley (4):
      dt-bindings: arm: cpus: Add ASPEED SMP
      ARM: aspeed: Select timer in each SoC
      ARM: aspeed: Add ASPEED AST2600 architecture
      ARM: aspeed: Enable SMP boot

 Documentation/devicetree/bindings/arm/cpus.yaml |  1 +
 arch/arm/Makefile                               |  1 +
 arch/arm/mach-aspeed/Kconfig                    | 17 ++++++-
 arch/arm/mach-aspeed/Makefile                   |  5 ++
 arch/arm/mach-aspeed/platsmp.c                  | 61 +++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/platsmp.c
