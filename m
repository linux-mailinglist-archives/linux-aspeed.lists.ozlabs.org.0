Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B8F2D4C
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 12:18:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47819y16pTzDqgL
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 22:18:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="O1wJTP+X"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47819b1MmWzDqYB
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2019 22:18:26 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id d13so1616659qko.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Nov 2019 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cHp2qtZCmJzlBoq/Xk9LsI9551B1bvQtpCRnAo5FMd0=;
 b=O1wJTP+Xz/KnGDPT+YLVktyZOIFCCfum9Jhex6rkfO7ebfRcTJjXTt7lQE+xS96HY8
 syHjUp5wUWUbw3SlIDrymLfNTyssvx280v36/rXvcfmxuXs1gUoQQiyAnIlxypoy9BLe
 bropARI+KOLli1lDJv3BiJBkEyr7bxYX7Tt3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cHp2qtZCmJzlBoq/Xk9LsI9551B1bvQtpCRnAo5FMd0=;
 b=pGCUMpUXoCER+km/b30qk27aPftgSBUpp8Y0ScegSf3RccqJDgttrfLYvntlv1VJj/
 xmWCLeyLFjjAUCKcXFF3qic9J5ZPUPYQ7WFtI012djWKoYN69iP+JmbI+c/abuC5+568
 SaoBR9pHlp6mTDO5/ma1n9dVkBVckkKjm1cOjZCu9D1sXlHlndvBMW+haMjx1OH4ioHi
 OqBbGDwpYli46XQliAVO+M5OGpTS801IQK2nsRWKwHq5WGos7RMGG5gHY0DAPAGocv/N
 mLv+yknCXoiaASqrO/H0PxfCftBWEvq28eDODhpE+E2BmCOhlIjeE8Przm55W1HHr1S5
 dnAA==
X-Gm-Message-State: APjAAAUkZJaATajVMZz2kzq0ZBiwWLlOihdBMB2zVADI3kbOyyhBbbBH
 AXcXb0yNsvnHZb7LWlBr4XpPg0mqV+lKsQ+6NBQ=
X-Google-Smtp-Source: APXvYqxK9ze2gG5qRJC4Skh438B2WONVorpHWqG1x35JtcctN5cgUOYyPqSJ4sY0dW2SpjoR4Jwq+7U4zR07xEE5vf0=
X-Received: by 2002:a05:620a:208d:: with SMTP id
 e13mr2239020qka.208.1573125502255; 
 Thu, 07 Nov 2019 03:18:22 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Nov 2019 11:18:10 +0000
Message-ID: <CACPK8Xe8XiJ+oEp3_AXO5Mox-mXWVrOJKQLJMKJxg1WdYCTzMw@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.5
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

Here's the ASPEED dts tree for 5.5.

The following changes since commit 3eca037f2dfce07a31da0a837ac35d6d846614b0:

  ARM: dts: aspeed-g6: Add timer description (2019-11-07 21:23:56 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
    tags/aspeed-5.5-devicetree

for you to fetch changes up to 3eca037f2dfce07a31da0a837ac35d6d846614b0:

  ARM: dts: aspeed-g6: Add timer description (2019-11-07 21:23:56 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.5

 - Lots of work on the AST2600 boards as bringup continues. There's the
 eval board, and two IBM boards called Tacoma and Rainier

 - A new flash layout for OpenBMC systems with larger flashes

 - Better support for the MAC clocking when talking to a NCSI device,
 making Linux less reliant on u-boot having done the correct thing

 - LED fixes for vesin and fp5280g2

 - SGPIO support

 - Facebook network BMC cleanup with the common hardware moved to a
 shared dtsi

----------------------------------------------------------------
