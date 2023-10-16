Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0257C9D0C
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 03:48:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c0huh/re;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S80PV6c7Sz3c76
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 12:48:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c0huh/re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S80PL5FYHz2yst
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Oct 2023 12:48:04 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99357737980so651223366b.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Oct 2023 18:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420877; x=1698025677; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gi9c7eKRL4XqjpqT3Lj//N+9Q1k9fI+kzxaFF2cLfM=;
        b=c0huh/reRjNqu+heOevoX9G0x/EPC25/aZJNQy8uQCnIGW2xsKRh+pD+iqc+CnlhfT
         iSHX3fXG0tIOCfYhcbTwQoCt30b9lWvgn1F0BELW/TtUrkfFqnRIYXrVyO63C1HplVfR
         2xUU0Y1C/ENJZspW6pcGWcYbRurk2/gC2PalM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420877; x=1698025677;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gi9c7eKRL4XqjpqT3Lj//N+9Q1k9fI+kzxaFF2cLfM=;
        b=kkfR0QXkDRmpu2KteXZfA+eYhdno6R0vUhCqvpFR3qhSIx+gNhUojG6NEi310yebFG
         oT0kXxkc5RlPrvbENiBSNWwPjw/ku7H09RCBaeA6oWwYsbqWKlco1x34LvboTFh99xPT
         VOJiZ9RCeLsu3JL1AB9JqtPCnT0cDsiQLmMW+61nVqHVHJSxTwezjEgbZw9rnm9ZB4Sl
         O5wTp5ahOqxWGaFzeUdrITkEMy1FtzVxbB3x0v69vm2tM9MZIHt3JI5N22jcoUP3wvch
         DFTpZJBnlTqUUq/RS/iw2ZCbwR/vUtFq4IV2qC+rocFZkGO15AtJdeCBPxC4XPKeI9f7
         F8Fw==
X-Gm-Message-State: AOJu0YxvogNAQy/2YtR6EMy9bbJ5glSCqY/baHxC9qnsEl+2t5n3QQNY
	3G3Czc1QuL8saTHShRTRFgXJJoAFNifWiUIn/kIMF+FqMTo=
X-Google-Smtp-Source: AGHT+IEeNVVDtf63s6s5ORKap+0q4n2lmr+oL3UCh6TIq2jsgVIqT9pZ3aPv49+cZqQMMqe8NW6/XpdvZKFWgvQ6sQ0=
X-Received: by 2002:a17:907:3e94:b0:9be:6ff7:1287 with SMTP id
 hs20-20020a1709073e9400b009be6ff71287mr5051490ejc.57.1697420877178; Sun, 15
 Oct 2023 18:47:57 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:17:46 +1030
Message-ID: <CACPK8XebMAQvgQTRH+KoaTFg7CzRkS79Fz3Kn8p4mbaezWGkUQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.7
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

Hello soc maintainers,

I've rejigged my gpg setup and I'm now signing with a new sub-key. Let
me know if that causes any issues.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.7-devicetree

for you to fetch changes up to d024ca2792b17577c48f0cf23d648cea6f1a0b9a:

  ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port (2023-10-13
14:59:03 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.7

 - New machine:

  * Facebook's Minevra, as Chassis Management Controller using the
    AST2600

 - Updates to Ampere's Mt Mitchell and Mt Jade systems, and IBM's
   Bonnell

----------------------------------------------------------------
Chanh Nguyen (6):
      ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
      ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
      ARM: dts: aspeed: mtjade: Add the gpio-hog
      ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
      ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
      ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port

Eddie James (1):
      ARM: dts: aspeed: bonnell: Add reserved memory for TPM event log

Yang Chen (2):
      dt-bindings: arm: aspeed: document board compatibles
      ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  66 +++--
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    | 302 +++++++++++++++++++--
 .../dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts | 265 ++++++++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |   8 +-
 6 files changed, 595 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
