Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5947CB25
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 02:54:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbwt13YMz301k
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 12:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=huc845Tn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=huc845Tn; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbwp2d9Zz2xXW
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 12:54:34 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id t83so887785qke.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Dec 2021 17:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HFSYhlP839ztZdYk29Ex144WAucP2wu8MzPmrNXTlQA=;
 b=huc845Tn47CEh0haij4OJsh57TON22ZNkRaYpXqQlh9aCJAjs8sP8Fl/0k47xF82tr
 vRiWHtUdzQG7gZh/10V7K6RHG3hjv483l2ACcs4oYMHGSSH02skT0/ZUx8HdKzOOkMZ6
 3akzt+zq+ikss1bjqvR9CEo22ltUrag85BDY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HFSYhlP839ztZdYk29Ex144WAucP2wu8MzPmrNXTlQA=;
 b=cU2X6fSIoaK5LYEAHpPvws1zmT2FdOcJipC0SxjQRIEL4uga4/sXAC4itF8qizeJSR
 R6vPY2JL755VZQQHT2GqTFlfVxDAGBiyT0GtHw9dpz8o186eV7y7K7mjz2nHWVx9tVeY
 EHSjNoVw5BTctSoNGFHkhmYCIqsbjdbDkluqgtV3Mzsabs5lDpxuzGs61kDcAC0C/xZN
 MoWx5bjxZutY61G6LCVjFzV893YWH/zS6MxdgUmRp4wayJikoyNKRiY7NDPTWk45jkrq
 8UqO5KGEkTrw4bfcdQdJla281ldwlumonvaGsI1mJ85LUwXwQTmwW5s9UDLhojg9H0jA
 9t9w==
X-Gm-Message-State: AOAM531yle3NnMjhte1SMiVXAcShDrCuxE27k5jjAJlkQKabjGsxOH+I
 5enMjIxVrPngqtJjPMGJkzXi3ZQxYDWtlKZvHZM=
X-Google-Smtp-Source: ABdhPJwpXXAdFHNTEtfPzvHirKYCeb2CCGjAds6+T4yOYMQEzs1ifEBbU8o9BULp7bPgbte+1SZj3AVa8aC5mhHLDpg=
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr779610qkg.347.1640138070840; 
 Tue, 21 Dec 2021 17:54:30 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:54:19 +0000
Message-ID: <CACPK8Xd1RfMLRbwBWqo8nm=w0V2AubmzraVW3h==XBcs21+mnA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.17
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

Hello Soc maintainers,

Here are the aspeed device tree changes for v5.17.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.17-devicetree

for you to fetch changes up to 45cd8bbaaa18ab1c4f4387529db72b33be463197:

  ARM: dts: aspeed: add LCLK setting into LPC KCS nodes (2021-12-21
15:33:10 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.17

 - New machines:

  * TYAN S8036 AST2500 BMC
  * Facebook Bletchley AST2600 BMC
  * Yadro VEGMAN series of AST2500 BMC for x86 servers

 - LPC clock additions, to fix long standing missed irq on boot issue

 - Secure boot controller description for AST2600

 - Alternate chip flash layout, used by Bytedance's G220A

 - Various additions to Rainier, Everest, S7106

----------------------------------------------------------------
Ali El-Haj-Mahmoud (1):
      ARM: dts: aspeed: Add TYAN S8036 BMC machine

Andrei Kartashev (2):
      dt-bindings: vendor-prefixes: add YADRO
      ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC

Eddie James (2):
      ARM: dts: aspeed: p10: Enable USB host ports
      ARM: dts: aspeed: p10: Add TPM device

Howard Chiu (1):
      ARM: dts: aspeed: Adding Facebook Bletchley BMC

Jae Hyun Yoo (3):
      ARM: dts: aspeed: add LCLK setting into LPC IBT node
      dt-bindings: ipmi: bt-bmc: add 'clocks' as a required property
      ARM: dts: aspeed: add LCLK setting into LPC KCS nodes

Joel Stanley (2):
      dt-bindings: aspeed: Add Secure Boot Controller bindings
      ARM: dts: aspeed: Add secure boot controller node

Lei YU (2):
      ARM: dts: Add openbmc-flash-layout-64-alt.dtsi
      ARM: dts: aspeed: g220a: Enable secondary flash

Oskar Senft (2):
      ARM: dts: aspeed: tyan-s7106: Update nct7802 config
      ARM: dts: aspeed: tyan-s7106: Add uart_routing and fix vuart config

Quan Nguyen (2):
      ARM: dts: aspeed: mtjade: Add I2C buses for NVMe devices
      ARM: dts: aspeed: mtjade: Add uefi partition

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml |  37 +
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   7 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 267 ++++++++
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |  12 +
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 756 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  17 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  11 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts        |  40 ++
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts        | 470 +++++++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts       | 149 ++++
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts       | 255 +++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts       | 154 +++++
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi           | 311 +++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   5 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  10 +
 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi |  35 +
 19 files changed, 2539 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi
