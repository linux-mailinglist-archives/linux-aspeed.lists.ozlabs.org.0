Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D575A6E07A7
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Apr 2023 09:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pxrfq4fXyz3bbZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Apr 2023 17:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fGPEP/Bx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fGPEP/Bx;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxrfj4y1pz3bT7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Apr 2023 17:23:56 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id xi5so35031621ejb.13
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Apr 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681370633; x=1683962633;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ql5Do4NIOwiBMn1MBftygs4Legcy5XT8a+gOumAZ0g8=;
        b=fGPEP/BxnivPQ4bemAIXIqVAeQ1yZlvRk2w0VGdvzRQt6DbHLvPth4OLy3bLTqiO5/
         gxK0UiO4+SORJy4LOWI+qzVhjycACgATb5JPBiA4RPfmef8U4cAnUeA/+z8FcjduiBXR
         6k57Y/Lk5aH+3Pku9dkeyAqD1uSYgBzUECOQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370633; x=1683962633;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql5Do4NIOwiBMn1MBftygs4Legcy5XT8a+gOumAZ0g8=;
        b=cU7O/IVdFmBrWEUCC4D07wOEi8caoWJBvhAPLV5Ej55GXRvMCVhktuhnPbQrtT12UC
         jjfgPr8QITWHJz2KMaQp6+XJ3sc0jazCy5mdH9DK5khE5dJcive4ULJN8RNfaOvawWN1
         CP18d5z8tVpsGnKa6PLIg/14yuSD/ka8J/wDYYZVHXdmu857Gsi2+wL8WtYLaz+w5TyQ
         d7Zv83GOe2sJp9j7qZyYhEvHCKbpYqyXtIsL7ZJtjWoD4WlrKFMn/Ba0VTjwVAcxqmEW
         uvWNYpUVvi/RzFe4JA1WShpRc2TeZLyy8M/eqXh3Hdqo3ipledyLQ/g4rAMJyDLa4+Fw
         3vMQ==
X-Gm-Message-State: AAQBX9dBtIuDkSqMdQ27vNYuA6ITyrQ4cEVO38M+HBSg7pmw4kSrKsFq
	M96E43nAKOd/Vp9n5k3p6n3Pe8R+Ew1i/TGVv3c=
X-Google-Smtp-Source: AKy350ZRdbvovOQMYN2DjpLBfPxvrpd+xwRinIn1FhDpSfW+DBSoFUUjrwEKFA3aH42hsnhCSYb6gZMZaxKVY/uOW9E=
X-Received: by 2002:a17:906:c455:b0:94a:5691:b12b with SMTP id
 ck21-20020a170906c45500b0094a5691b12bmr767712ejb.11.1681370633503; Thu, 13
 Apr 2023 00:23:53 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Apr 2023 07:23:41 +0000
Message-ID: <CACPK8XfmK5S=1PQjBQHb6daDR3qTWN-_NLoXP7+ZDCk13wDxcA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.4
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here's the aspeed device tree pull request for 6.4. A bit late, I lost
track of time.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.4-devicetree

for you to fetch changes up to 7d4f0b0df7c5ec0cec834f87591423a7bbd1bab2:

  ARM: dts: aspeed-g6: Add UDMA node (2023-04-13 16:43:15 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.4

 - Fixes for romed8hm3 GPIO, asrock SPI clocks, bonnell eeprom

 - Misc updates for various BMC systems

 - Add AST2600 UDMA node

----------------------------------------------------------------
Chanh Nguyen (1):
      ARM: dts: aspeed: mtmitchell: Enable NCSI

Chia-Wei Wang (1):
      ARM: dts: aspeed-g6: Add UDMA node

Delphine CC Chiu (2):
      ARM: dts: aspeed: greatlakes: Add gpio names
      ARM: dts: aspeed: greatlakes: add mctp device

Eddie James (3):
      ARM: dts: aspeed: everest: Add reserved memory for TPM event log
      ARM: dts: aspeed: bonnell: Remove MAC3
      ARM: dts: aspeed: bonnell: Update eeprom size

Lakshmi Yadlapati (1):
      ARM: dts: aspeed: p10bmc: Change power supply info

Zev Weiss (3):
      ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
      ARM: dts: aspeed: e3c246d4i: Add PECI device
      ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks

 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |  6 ++-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  |  4 +-
 .../boot/dts/aspeed-bmc-facebook-greatlakes.dts    | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       | 24 +++-------
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  6 +++
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  9 ++++
 7 files changed, 118 insertions(+), 21 deletions(-)
