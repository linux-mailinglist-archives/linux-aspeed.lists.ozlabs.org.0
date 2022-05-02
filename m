Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31689516AEE
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 08:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsD6W6jdyz3bYn
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 16:42:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=USojnC1K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=USojnC1K; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsD6N6Cr3z2yPY
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 May 2022 16:42:18 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id y3so10503907qtn.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 01 May 2022 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QbcbEFU0Z1L9p+CYAY5GhkPGx/m4T8Xb0TJTTP3V3oQ=;
 b=USojnC1K9L0pp14wEIarZla7/3QV76DGVneAUU8o20QwD1wKMU6FS3fbhbBRYN2Fqc
 KCzhGbLFdiJ13M60ojMSAbFfjqjy8f5zMiXGGvtFz8ERDcApifvrUWdro0DWyU8LCnGu
 DpgY0E0H3x3BNHUcMqTjgSJBDL5oZsK1vbfsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QbcbEFU0Z1L9p+CYAY5GhkPGx/m4T8Xb0TJTTP3V3oQ=;
 b=46nVM/jE6DtNbGwBCoZlVFsc3tRx08qPriHTB0jQWpYwnrPFp0RZON2fUY8DkCdwAj
 NlqAE1CgMpJKMZg8rlVo/UKQvLnd51q3lxiMtDMnIK3+E0S4fxMXYF86bTkXxn2kjzuV
 X+XypRkOqzOGW4/q9nn7ds4jLuaA+pfU4C53EwUHXF+waij9dGOjNriSMFCTkjfrx5LI
 MzvseJnNcYPx6kAC8WhYh8vCa22Crm1kzQwXprQ1qyhnL4wPufI4K9M44o4AnzLqiFKT
 vP/Xx777GMTzjUIKqpmzFQ830DKb+W3AQX6zhiqMltURdlTcTk2fzIPUER2C80EYHLLO
 ThtA==
X-Gm-Message-State: AOAM5323nLU+iwYB1cg8KOrzXAwpHm+VoTHhdqGjUIw7/+lZ79OAwQSf
 geRMDJ7F0NKzbvuewXznFZKL1FVH+MJ87L6xxlA=
X-Google-Smtp-Source: ABdhPJw2d5haWCp22JGGOYyeFjezanqHtJZ1iJOvgBzXFfYeog3X69H7zQkWjOw7hm5u0g7nX1WnCShesYLo+VXQhR4=
X-Received: by 2002:a05:622a:c4:b0:2e1:cb5b:9b5c with SMTP id
 p4-20020a05622a00c400b002e1cb5b9b5cmr9197254qtw.69.1651473734785; Sun, 01 May
 2022 23:42:14 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2022 06:42:03 +0000
Message-ID: <CACPK8XdhLfafOfqvR0r7p6V6AhtNXD4uZGaz7Y+Y4P-rc9p0tQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: Fixes for v5.18
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

Hi Soc maintainers,

Here are some device tree fixes that I have for v5.18. They have been
ready since the merge window closed but I've not been available to
send the pull earlier. If you'd prefer not to take them now then I
understand.

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-v5.18-fixes

for you to fetch changes up to 32e62d1beab70d485980013312e747a25c4e13f7:

  ARM: dts: aspeed: Add video engine to g6 (2022-04-13 11:53:53 +0930)

----------------------------------------------------------------
ASPEED device tree fixes for v5.18

 - Quad SPI device tree corrections

 - Reinstate GFX node that was removed

 - romed8hm3 machine fixes

----------------------------------------------------------------
Howard Chiu (1):
      ARM: dts: aspeed: Add video engine to g6

Jae Hyun Yoo (5):
      ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
      pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
      dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
      dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
      ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group

Johnny Huang (2):
      pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
      ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi

Zev Weiss (2):
      ARM: dts: aspeed: romed8hm3: Add lm25066 sense resistor values
      ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c              | 17 ++++++++---------
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml        |  4 ++--
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts       |  4 +++-
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi                | 10 +++++-----
 arch/arm/boot/dts/aspeed-g6.dtsi                        | 10 ++++++++++
 5 files changed, 28 insertions(+), 17 deletions(-)
