Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7370E128
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 May 2023 17:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQf8T1gPzz3f6n
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 May 2023 01:57:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.81; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 386 seconds by postgrey-1.36 at boromir; Wed, 24 May 2023 01:57:05 AEST
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQf8K6L7yz3c6v
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 May 2023 01:57:05 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4QQf0m224vz4x1vW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 May 2023 17:50:32 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
	by laurent.telenet-ops.be with bizsmtp
	id 0FqP2A00W0Jkz7G01FqP8J; Tue, 23 May 2023 17:50:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q1UH3-002t5m-9N;
	Tue, 23 May 2023 17:50:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q1UHH-00Ckpk-LW;
	Tue, 23 May 2023 17:50:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 0/3] Fix pca954x i2c-mux node names
Date: Tue, 23 May 2023 17:50:18 +0200
Message-Id: <cover.1684856632.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

	Hi all,

According to the I2C bus multiplexer/switch DT bindings, i2c-mux nodes
should be named "i2c-mux" (or something similar).
This patch series renames nodes for pca954x i2c-muxes that are flagged
by

    make dtbs_checK DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml

Changes compared to v1:
  - Add Reviewed-by,
  - Drop applied patches.

Please apply where appropriate.
Thanks!

Geert Uytterhoeven (3):
  ARM: dts: aspeed: Fix pca954x i2c-mux node names
  ARM: dts: nuvoton: Fix pca954x i2c-mux node names
  arm64: dts: marvell: Fix pca954x i2c-mux node names

 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 18 ++++----
 .../dts/aspeed-bmc-facebook-cloudripper.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 46 +++++++++----------
 .../boot/dts/aspeed-bmc-facebook-elbert.dts   |  4 +-
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 30 ++++++------
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 32 ++++++-------
 .../dts/aspeed-bmc-facebook-tiogapass.dts     |  8 ++--
 .../boot/dts/aspeed-bmc-facebook-wedge100.dts |  2 +-
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts |  6 +--
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 18 ++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  8 ++--
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  4 +-
 .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 12 ++---
 .../dts/aspeed-bmc-inventec-transformers.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts |  4 +-
 .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |  4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts  | 14 +++---
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts  | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts  | 14 +++---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts     | 16 +++----
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts     |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts    |  8 ++--
 .../dts/nuvoton-npcm750-runbmc-olympus.dts    |  4 +-
 .../boot/dts/marvell/armada-8040-mcbin.dtsi   |  2 +-
 .../dts/marvell/armada-8040-puzzle-m801.dts   |  2 +-
 29 files changed, 153 insertions(+), 153 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
