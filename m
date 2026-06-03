Return-Path: <linux-aspeed+bounces-4181-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kE42Ml/VH2q2qgAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4181-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 09:18:55 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E76351EA
	for <lists+linux-aspeed@lfdr.de>; Wed, 03 Jun 2026 09:18:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=NKyx2Cat;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4181-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4181-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVfFR2w3Nz2yQH;
	Wed, 03 Jun 2026 17:18:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780471131;
	cv=none; b=e30stXzEUFIhG1eNeTXNhr9/5AkT8JA2xiYnTDMev4WCyCeIMlotNc+swjrAnDPxL3h+Whqcr79+e6NG92Cq7C406SjEwu+M+csBKMMbybZUmBDwFUsey5KEWOQRH9L7FUQVYhkweW3U6U/dfeNGRJsIGwGsgjyuSyTpfKl8qCZ0d4pRWjuV+AP/VDSpdWGup/cFMiuoI7mU94bBLDP2cZcxNh+Vra7hY/6S/ImotBv/mZcIT+X9yk2i5GYDA9Dxo5QPdPgEw42Bo322Nw/lZH1tCaei/h3dXEohZGDkLd84aYtK6khwGgeApDVLPlwVmBztmUJF39JcWuGl3rhN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780471131; c=relaxed/relaxed;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=CgO28uExCC++fSm+LY/2OlqspXQfM3FyR2kB05EGES3wtFYgGgfKbdRKSoBKyQy1cxgaW9dBxRkKRaI4tG/uwloXwZSKt5RURSTbRlrfzjq4Ifw9Aa0fZ2Kgb1u1dKPdZa6+a1xWG6eZ81w3GVQDh0ZIqvy/tYdt7f3P9G6LPOCA6KOIfa5wlxuQgloP9LWKaHDolwju3YIR/JEX17mE9VyW0C+MhL+8JxVkmgc7LYIrSxSHjYaj6X4cnaO5ED8kx6Ia4E++PXPcb5dS3MF9uFVoZr2EDGKMEAsmJQuHP06bT7ZzKo03StnNbzh84XyBr+zEOv02GAf5G1SBCFabgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NKyx2Cat; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVfFQ1frtz2yNn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2026 17:18:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780471127;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=;
	h=Subject:From:To:Cc:Date;
	b=NKyx2CatndWRFcz4jUeX3R9F8lteKdztwG4DlJlQ5HB7ZZdsHTr4O3xArvyGt3dv7
	 KHl74V01O88gBB7sP7UH2Ubh0AAQIqnMpZCQ5SJZcG5rhR65cs6rS3N5PstQPhty5C
	 +sv+4+hppj1+avwMSza3zSVQNvSRVyhBUzAht8WBzbMb3tQ3/W1uP34PFHIxc6tsnw
	 74q37neyo0wodQFl3P5FxWlV1/dBpQ1HN0L37UaeVXnJA0FZEmqr/kb+3BdACgw19h
	 U3g+0cLuTwlBAr24dhUWWsI4HBz3KHp3upuBzExVNa2a2k5hP6iizHVePx3D6zhMHc
	 n2/xSwzTbZWDg==
Received: from [IPv6:2405:6e00:2428:1c7f:23a6:ec69:2b14:b7d] (unknown [120.20.104.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B237960087;
	Wed,  3 Jun 2026 15:18:45 +0800 (AWST)
Message-ID: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
Subject: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes for
 v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 16:48:43 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4181-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE2E76351EA

Hi SoC maintainers,

The first attempt[1] missed the preamble, so here's the same again,
this time with it included.

[1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.c=
amel@codeconstruct.com.au/

Cheers,

Andrew

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-devicetree-0

for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:

  ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 1=
2:44:26 +0930)

----------------------------------------------------------------
aspeed: First batch of ARM devicetree changes for v7.2

New platforms:

- Rainiera6 (Meta)
- SanMiguel (Meta)

Updated platforms:

- Anacapa: SGPIO line names and interrupt configuration
- Clemente: Remove TMP421 nodes
- Kommando: Enable networking via MAC2/MDIO2
- SanMiguel: Line names and interrupt configuration

AST2600 SoC updates:

- Describe PWM/Tach
- Describe I3C controllers
- Reorganise I2C nodes

Other notes:

91b9aed7381c ("ARM: dts: aspeed-g6: Add nodes for i3c controllers") current=
ly
causes a new warning:

  ... /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compa=
tible: ['aspeed,ast2600-i3c-global', 'syscon']

The patch necessary to address it has an R-b tag from Kryzsztof[2] but as b=
est
I can tell is yet to be applied to the MFD tree. I've left the change in fo=
r now
as the warning will resolve once the binding patch is applied.

Lastly, as part of improving support for the Kommando card Anirudh has also
addressed[1] the persistent pain we've had with the phy-mode property for t=
he
AST2600 MACs. Thanks to Andrew Lunn for being on the case for a while now, =
and
for those who tested Anirudh's patch.

[1]: https://lore.kernel.org/all/20260525-asus-kommando-v3-0-e6a0ca1b4a3e@g=
mail.com/
[2]: https://lore.kernel.org/all/20260425-poised-accomplished-hyena-d2c1a0@=
quoll/

----------------------------------------------------------------
Anirudh Srinivasan (1):
      ARM: dts: aspeed: Enable networking for Asus Kommando IPMI Card

Billy Tsai (1):
      ARM: dts: aspeed: g6: Add PWM/Tach controller node

Colin Huang (1):
      ARM: dts: aspeed: anacapa: Add JTAG CPLD TRST pin to SGPIO map

Daniel Hsu (1):
      ARM: dts: aspeed: yosemite5: Add MP5998 power monitor

Dawid Glazik (2):
      ARM: dts: aspeed-g6: move i2c controllers directly into apb node
      ARM: dts: aspeed-g6: Add nodes for i3c controllers

Ender Hsieh (1):
      ARM: dts: aspeed: msx4: enable BMC networking via MAC0

Mike Hsieh (1):
      ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes

Neil Cheng (2):
      dt-bindings: arm: aspeed: Add Meta Rainiera6 board
      ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

Rex Fu (2):
      ARM: dts: aspeed: anacapa: Add interrupt properties for PDB PCA9555
      ARM: dts: aspeed: anacapa: Correct SGPIO names for monitoring

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |    2 +
 arch/arm/boot/dts/aspeed/Makefile                               |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts |   18 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |   34 ++-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts       |   20 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts      | 1012 +++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts      |  672 +++=
++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts      |    5 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   15 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                         |  552 +++=
+++++++++++++++++++++++------------------
 10 files changed, 2074 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.=
dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.=
dts

