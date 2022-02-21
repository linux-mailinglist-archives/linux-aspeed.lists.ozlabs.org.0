Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB34BD866
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 09:58:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2GRY3bTcz3c5g
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 19:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fHdjhnCW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fHdjhnCW; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2GRT4BWkz2yHL
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Feb 2022 19:58:11 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id a19so30397514qvm.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Feb 2022 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/YkJCPAEzy9lvOQKx0L5i2HCzqQLZCPvdJzlwKqKMEM=;
 b=fHdjhnCW9k6koHGoL8t0LOjJFnL9DQxPvu/mqvFIyz74CqTTFK5blmbV8pDrWfCJ2p
 xaGBIItbNHH+AjmvHGPtX0i6hlhwZWjX/48k1q0qQneg7qfoOm/RGvUYPPLLs5jEh+Am
 +MMMyBPVojm5Pfxvz1rGjef4YjE/7F/x9D29k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/YkJCPAEzy9lvOQKx0L5i2HCzqQLZCPvdJzlwKqKMEM=;
 b=yFu8xQEpk1l5ZUnWvATB6az8TjVqBg1mk4l444ZOBWvYl+n4up39/pp7Ff8kIFYHDn
 5Kn1yyuP0IMy9chbuJQ7cZ46aj/pex0z9iZBDo9FtyMdsQaVn4VKn0Fcm0GNm1DubD1w
 PBMCcEEBepCgL6TaixZU8WDHsDgSCNaWAF84Pxq1P4Nu785AC/MlEuVAM1cRp9IY5d3n
 Po0PCE8WlOO80FbaC61ST3cvFuhax4k+J5op45m4UyUAUn/EYkGRmDTa1visYDLHTCzi
 ywUYXT9Sy//Ew40DugzMk17jQOkeaAOQQAx+uuXPW4rZkqWiG6aFRqvg7dtki9faWDkc
 S1xA==
X-Gm-Message-State: AOAM53235x92aOesd5XtrY9n7705m/+l9h9lbjRQd8YJLhjqnJC+4Kl7
 3tQ6taiw1CMELo96Z9sbuq9ra12vc5BtCG5p32w=
X-Google-Smtp-Source: ABdhPJyn0WKGnhrzzpq1dvCmFMToH/JR7TwORUjkh/VfxntXGt87JDwSK+2FAU/rsYrtr9hW1TgvTzyVhYeQ6BCfaMI=
X-Received: by 2002:a05:6214:d6e:b0:42d:7cb3:aa49 with SMTP id
 14-20020a0562140d6e00b0042d7cb3aa49mr14608483qvs.107.1645433888187; Mon, 21
 Feb 2022 00:58:08 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 08:57:57 +0000
Message-ID: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

A straightforward pull request of aspeed bits for v5.18.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07=
:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.18-devicetree

for you to fetch changes up to 43fd3d4d95cee85e187e5c4ef1d991f77d4d928c:

  MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki (2022-02-21 13:00:50 +1=
030)

----------------------------------------------------------------
ASPEED device tree updates for 5.18

 - New machines

  * Quanta S6Q AST2600 BMC
  * Facebook's Bletchley is not new, but has a large update

 - Small clenaups and additions for Everest, Rainier and Tacoma, and the
   flash layout

----------------------------------------------------------------
Jonathan Neusch=C3=A4fer (8):
      dt-bindings: arm/npcm: Add binding for global control registers (GCR)
      MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM architec=
ture
      ARM: dts: wpcm450: Add global control registers (GCR) node
      ARM: dts: wpcm450: Add pinctrl and GPIO nodes
      ARM: dts: wpcm450: Add pin functions
      ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
      ARM: dts: wpcm450: Add pinmux information to UART0
      MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki

 .../devicetree/bindings/arm/npcm/nuvoton,gcr.yaml  |  48 +++
 MAINTAINERS                                        |   2 +
 .../dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  |  43 +++
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi             | 384 +++++++++++++++++=
++++
 4 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.=
yaml
