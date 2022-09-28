Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A465ED3FC
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 06:44:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MckRm32Wnz3bZs
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 14:44:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iDCAmKSR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iDCAmKSR;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MckRc671mz2xvr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Sep 2022 14:44:27 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id x18so17880920wrm.7
        for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Sep 2022 21:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=1PfKcGXTKrr3UV/m0HPi+qVvDseRBuYOzsnEs9kMkLA=;
        b=iDCAmKSRu5xkdoyJpzhMzzv3YMUHwtEfPaG89XbhRxSmEnEHcKvCNzYSDhOQL6UU7O
         DkUaD0lxqDYxTlegIFaYbRRickvjfCoUGfOMu2LIWPQmS9rHZAv7rH5aOHNpR+8pr4MQ
         AoswscjpFoHrpd2r+OhTHgCwUVSsTHzs6zbi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1PfKcGXTKrr3UV/m0HPi+qVvDseRBuYOzsnEs9kMkLA=;
        b=OAJAyJeQIv4HQhLoUc54oHSLOwde5VbVC0Wh2jKa+isrwbBl7r+ArY19Auwmzx+sde
         X8m21UcJefc7POIRxOV6JPq7vq3DZJEYOWLmjHJIaopiQJFdX2oBG2vJKNB8K51nm8an
         pJzR8eyRz8WsAySPgK5JwPXN/vYo2cxhMSHwsgC182x3wRCcdn2macVTQ/7XiGqLuQ5r
         hrVIWWRoONCCGxafRyuyTXq4QTi0TWr5wIoi+ah/Psw1DEH4alxFUSmFrgHy8Fug4SMa
         ad2j4p/tawu4LDxs6sITTUD1MX499D7CwKfns2EbadErmVgApc5HVnuokww2f519dK/b
         7GDQ==
X-Gm-Message-State: ACrzQf2zIUviDEIDXBvZU73icaROuZONm+YQU04v7e4N9k1F8RgGlGi7
	ck6iLAuyvrGpLWQZfm3kmvHMG6oqDu6cv7B1NKyDkdMCjparwQ==
X-Google-Smtp-Source: AMsMyM7SZLOgC1tGxnPlSxrCi21CpjzhGRnBvxUSkNfPyahkIsl/3XPWtD96QSQCuIeLoRGJIH88OAa9Fqfq30WmPj4=
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr18925621wrt.549.1664340263678; Tue, 27
 Sep 2022 21:44:23 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 04:44:12 +0000
Message-ID: <CACPK8Xepnci+f+7Pi1jtXod8Jmt+OnJYfDRENjiP-xDBQwFCVg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.1
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello soc maintainers,

Here are the aspeed device tree changes for v6.1.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868=
:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.1-devicetree

for you to fetch changes up to 73b4476562de2a26debc076801ca28148076c79f:

  ARM: dts: aspeed: ast2600-evb-a1: Add compatible (2022-09-28 12:31:40 +09=
30)

----------------------------------------------------------------
ASPEED device tree updates for 6.1

 - New machines

  * AMD's DaytonaX AST2600 BMC, for the amd64 server
  * Ampre's Mt. Mitchell AST2600 BMC, for the AmpereOne arm64 server

 - Fixes and updates for bletchley, mtjade, yosemitev2 and the ast2600-evb

----------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      ARM: dts: aspeed: ast2600-evb: Enable Quad SPI RX tranfers

Joel Stanley (3):
      ARM: dts: aspeed: ast2600-evb: Update I2C devices
      ARM: dts: aspeed: ast2600evb: Fix compatible string
      ARM: dts: aspeed: ast2600-evb-a1: Add compatible

Karthikeyan Pasupathi (2):
      ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
      ARM: dts: aspeed: yosemitev2: Disable the EEPROM driver

Ken Chen (1):
      ARM: dts: aspeed-g6: Enable more UART controllers

Konstantin Aladyshev (2):
      dt-bindings: arm: aspeed: document AMD DaytonaX
      ARM: dts: aspeed: Add AMD DaytonaX BMC

Potin Lai (2):
      ARM: dts: aspeed: bletchley: Add USB debug card IPMB node
      ARM: dts: aspeed: bletchley: Remove hdc1080 node

Quan Nguyen (3):
      dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
      ARM: dts: aspeed: mtjade: Remove gpio-keys entries

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |   2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  25 +-
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts      | 319 ++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |  95 ----
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 +++++++++++++++++=
++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  13 +-
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    |  15 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  56 +++
 10 files changed, 963 insertions(+), 112 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
