Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BD6331AE
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Nov 2022 01:57:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGQpl2F8fz2yN9
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Nov 2022 11:57:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Wn7LxHxN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Wn7LxHxN;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGQpd4HNxz2xkx
	for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Nov 2022 11:57:44 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id x5so18386540wrt.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Nov 2022 16:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLNpOC+EKWhHYX3ClfPrj2d8ABDTkig29CHfa3CG5z0=;
        b=Wn7LxHxNYEUcNzh5Yi6H7zMJ37MUheNt1yCSxSgFx4Nd19to9uIfW10w5VhxWTOa2u
         /I+0m0Glugebfu3wA5PTRVCTuY/bPYaxKjsXTyqqRMpADGP3NidUypMw8zvYzpX2n9Rg
         AMXXNT97A2/YSYROnpkAlf13MuN4Iu/wNv6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLNpOC+EKWhHYX3ClfPrj2d8ABDTkig29CHfa3CG5z0=;
        b=nrxr6MnH7UHewESuTBCrtwF8dA6a+v9bCmpEQ8XbY/seqmZONylmm9RYPKF1Y5tIK3
         EZNH15cVDYUv/7Dd2LEZXtz4hwqYqmUOqF/fC78GNpHpEt0vOVlkXAib+8K9rzDJuDxS
         okzBHyrK86A63hK30AzmruWFr/Wcrg0mzldU31e968MlR8SRIe1XxxrcyXc8D959IrH4
         8sImya3Zx1dXV+lKAH5qn2wOZtEW1Rqm1z7h3TwD/XG5ZNEMnq0CxloH0DSD4r/N6VLo
         h+pQtW1nWDvNganCLEBvt7ukAHOfQx0zHWFSNUmgCF6ALEOWo6hcmdhUq/aTBQsVofIJ
         xH8g==
X-Gm-Message-State: ANoB5plgjsgVCzykBE/yFUPAw9E7gEAYPLb2htoYQ6cu/h2iLlwSq0RQ
	iue/bzDvIGxYa8vJaorio8izOOj/GlNzHyQDT/k=
X-Google-Smtp-Source: AA0mqf4zegYOqBDXBohUs5DvvquRK2r81ahOv/8Tc5r8so4t4oYa7n5dSAlPXleW16X3sA1ToHjCec/d5wZBzNh5ZAU=
X-Received: by 2002:a5d:6642:0:b0:236:6a28:eeda with SMTP id
 f2-20020a5d6642000000b002366a28eedamr12373629wrw.315.1669078660427; Mon, 21
 Nov 2022 16:57:40 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2022 00:57:29 +0000
Message-ID: <CACPK8Xfsc8BaL_qAgV+3Rk-AFcQoDVfTpMzHvq_rR-UYqwpNNQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.2
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

Hello soc maintainers,

Here are the aspeed device tree changes for v6.2.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.2-devicetree

for you to fetch changes up to 3973fc0f9f07fc4186bb581014404fbf77a659b5:

  ARM: dts: aspeed: mtjade: Add SMPro nodes (2022-11-20 20:47:32 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.2

 - New machines

  * IBM Bonnell AST2600 BMC, for a Power10 server
  * Delta AHE-50DC AST1250 BMC, for a 1U Open19 power shelf

 - Removed machines

  * IBM Mihawk AST2500 BMC, a Power9 server similar to Witherspoon

 - Fixes and updates for bletchley, mtjade/mtmitchell, rainier/everest

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: dts: aspeed: rainier,everest: Move reserved memory regions

Eddie James (2):
      ARM: dts: aspeed: Add IBM Bonnell system BMC devicetree
      ARM: dts: aspeed: p10bmc: Add occ-hwmon nodes

Joel Stanley (1):
      ARM: dts: aspeed: Remove Mihawk

Potin Lai (7):
      ARM: dts: aspeed: bletchley: Change LED sys_log_id to active low
      ARM: dts: aspeed: bletchley: Disable GPIOV2 pull-down
      ARM: dts: aspeed: bletchley: Bind presence-sledX pins via gpio-keys
      ARM: dts: aspeed: bletchley: Update fusb302 nodes
      ARM: dts: aspeed: bletchley: Update and fix gpio-line-names
      ARM: dts: aspeed: bletchley: Enable emmc and ehci1
      ARM: dts: aspeed-g6: Add aliases for mdio nodes

Quan Nguyen (2):
      ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
      ARM: dts: aspeed: mtjade: Add SMPro nodes

Santosh Puranik (1):
      ARM: dts: aspeed: rainier: Fix pca9551 nodes

Zev Weiss (2):
      dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
      ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   12 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts |    4 +
 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts     |  418 ++++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  213 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       |  921 +++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   57 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  244 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        | 1381 --------------------
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    4 +
 11 files changed, 1705 insertions(+), 1553 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
 delete mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
