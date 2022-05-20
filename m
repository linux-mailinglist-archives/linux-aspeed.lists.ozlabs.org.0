Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE352E329
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 05:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4C6F4wCGz3bkV
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 13:35:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NmqrYE2c;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NmqrYE2c; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4C671Kqvz300Q
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 May 2022 13:35:10 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so3679015wmr.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 May 2022 20:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=RsspTnky8wBT4eD5g1aW2BHX4lOGWhiOULBVmitpB44=;
 b=NmqrYE2cIoYRISM5bg4s6/mcOkVD5so63MhAc3RlzIRzi/V+1jt8GDHiwjvJHGKEBd
 pTUv1ulmOUWotXjSJ7sLRYpFxgNyWwNn8xTu10ojbvQHR93icUFEz4tS5uoGL2m9YLYM
 gKX7IJqKQ9JT9BG/XUELPZNG1pIV6S8bzER8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=RsspTnky8wBT4eD5g1aW2BHX4lOGWhiOULBVmitpB44=;
 b=ykWCjeSrw1VvEvRx4f4fnHLVJG0twRJTLAET6OmKS5XXQwlXIiKEjABuZB8yd5Ev2a
 NKvm85rQiXmeFYaVEEt8JuhMZHtmHBlKWfCoP+0Zek7rNRl1i3Ld9lGMmcy6QmycrVQc
 AMKdSNSK/8CWSJ2jbDFGwB10PLU0FbVbzudpPXIk5DiKJWtrXnco3XxykynCyCO9XigL
 rSUWd1ihciGU1dgJZ0k5ZW/x/r/HADutbE2KSGzKRE8BDfC+/YFXgLgl3Q376dDCjND0
 taWy0Vl0o4i9pKS5r3H/xi+QW6C48pH8UgJnlHLnor/RHIMvdydUdRLACoPPAnBmqf+2
 13WA==
X-Gm-Message-State: AOAM531olrqJJvhDg5P45Ddm2EJh6VXpi34+b6uHEHxddnlCITSWJFyY
 Evr41MC0PoHMplgEnCw4D5WUI/3SjdPM1V8u9Iw=
X-Google-Smtp-Source: ABdhPJzmke6Q3ll9vqmiN/8q3kK3N7WRTqtonBvGVGuPyGiHAsa5U75PZxMDKbImXBqe/Y4a91kgWDNfRbQBWINYoic=
X-Received: by 2002:a7b:c017:0:b0:394:5631:62bc with SMTP id
 c23-20020a7bc017000000b00394563162bcmr6936908wmb.190.1653017702807; Thu, 19
 May 2022 20:35:02 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 May 2022 03:34:50 +0000
Message-ID: <CACPK8XfUmFxU8Y6C+aZ2+=dT7=fCfs2=2_aYqyRjoXCoeQaUWQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.19
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Soc maintainers,

Here is the (second) device tree pull request for aspeed socs. The
first ended up being the fixes I sent, which Arnd decided to put in
-next.

The following changes since commit 32e62d1beab70d485980013312e747a25c4e13f7=
:

  ARM: dts: aspeed: Add video engine to g6 (2022-04-13 11:53:53 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.19-devicetree

for you to fetch changes up to 8dc7aa0a7246ad0f718d91d09b4d48460508627b:

  ARM: dts: aspeed: ast2600-evb: Enable GFX device (2022-05-19 17:18:56 +09=
30)

----------------------------------------------------------------
ASPEED device tree updates for 5.19

 - New machine:

    * Nuvia's DC-SCM BMC

 - Enable AST2600 GFX, the BMC-driven graphics device

 - Add a bunch of devices for the AST2600 EVB

 - Updates to the AST2600 Bletchley machine

 - Backwards compatible changes to support the new spi-mem based SPI NOR
   driver

----------------------------------------------------------------
Brandon Wyman (1):
      ARM: dts: aspeed: everest, rainier: Add power-ffs-sync-history GPIO

C=C3=A9dric Le Goater (2):
      ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
      ARM: dts: aspeed: Enable Dual SPI RX transfers

Graeme Gregory (1):
      ARM: dts: aspeed: Add Nuvia DC-SCM BMC

Howard Chiu (3):
      ARM: dts: aspeed: ast2600-evb: Enable RX delay for MAC0/MAC1
      ARM: dts: aspeed: ast2600-evb: Enable video engine
      ARM: dts: aspeed: ast2600-evb: Enable virtual hub

Joel Stanley (2):
      ARM: dts: aspeed: Add GFX node to AST2600
      ARM: dts: aspeed: ast2600-evb: Enable GFX device

Neal Liu (1):
      ARM: dts: aspeed: Add USB2.0 device controller node

Potin Lai (7):
      ARM: dts: aspeed: bletchley: enable ehci0 device node
      ARM: dts: aspeed: bletchley: switch spi2 driver to aspeed-smc
      ARM: dts: aspeed: bletchley: Enable mdio0 bus
      ARM: dts: aspeed: bletchley: update gpio0 line names
      ARM: dts: aspeed: bletchley: add pca9536 node on each sled
      ARM: dts: aspeed: bletchley: add eeprom node on each sled
      ARM: dts: aspeed: bletchley: add sample averaging for ADM1278

Tao Ren (1):
      ARM: dts: aspeed-g4: Set spi-max-frequency for all flashes

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  39 ++++-
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 182 ++++++++++++++++-=
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts      | 190 +++++++++++++++++=
++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  38 ++++-
 9 files changed, 431 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
