Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4312F58D2
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jan 2021 04:15:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGTvX5R54zDsG1
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jan 2021 14:15:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=UBHJKtHU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ok63H03H; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGTvF0DXqzDqS5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Jan 2021 14:14:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A9F205C01EE;
 Wed, 13 Jan 2021 22:14:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Jan 2021 22:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=XoOzQyq8r+J+/QRDndikLwkl6s
 ZOoTHhqppNgPXoevU=; b=UBHJKtHUDXgkUai/PtA8gu7oTanN3OWM5YAC+RVCOr
 7NFzNPTnp9LmG8oDdBD3mX32TRwHfMZ6I5XrPCJAa9/A/9CsNEh+5p0rJ8BcnGdn
 LlRmpfCaUpkC7RMhFZPxsQHPsylcSPYnldxuxkSvrrRpOuO65icFsrXcVSYNY533
 5AO/Ze6JF8XNFMHdBdsg47HUWelrePeurn31KrP7KEELcz7w7TsHCHm0W8GvZIYI
 l0xO0pOSIPqbpvC6rVSKkjcmJR2B7AE5lLHZ8+i4mB8uZkW8DR/ei1P4qD0xLHNU
 pvnMM/E/+4E3lptiRh0fHIZZf/fzYR2rZcZ+hzJRkFrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XoOzQyq8r+J+/QRDn
 dikLwkl6sZOoTHhqppNgPXoevU=; b=Ok63H03HL9rGeiuzlM2TsCaXexYGhoWOD
 q+/3FWObErqnoE2msODrP+4gYr5EzTxZM+yViMGl4BBkac+3i+5/p9I3DW6REmVB
 z3tAD+2HSObrtdj2YL/0r91EKSWUX28pr9x3f+Y2Yyxjk/4qwsAP6gN1gBPGY8EO
 rfpSJfAguTLWgiGFKsHxsfqLGDoKZaWA7/vP61wZCaaQOjhnTv75utUn0Nv3a/DF
 zsVhCKd4SyBsvvTcb6hibKG0R9at7auaUDj1j1RRoa58j28CgxIKOJaBzKFY+R26
 Mw28NpnSOExM/jWFHzPJk0p0g/dF4YpYGN08yRC/hXvEbGjswtEVg==
X-ME-Sender: <xms:JLf_X1pmuVXqfxZN_FYlJQ1Umr9ldt4U9ND4zSwsX7YelvKmWejIyg>
 <xme:JLf_X3qM08AFZV2xT1x5_GCPRg4kdAvZZ3SS3fzs6yeoWKRwFFHPrbdaKuy9afH8D
 _Nt4QsSHdiOSLJWsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetveehff
 fgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecu
 kfhppeduudekrddvuddtrddujeefrdegkeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:JLf_XyPEIG6VSysiwhelSYTu6ZUVY1WWPTs9HJnp9lHAUxYnrWPCVA>
 <xmx:JLf_Xw5hUsMIISEPHoaE83mvOdMQZuHAYP3h9mj7RzLAZXceJsKNzQ>
 <xmx:JLf_X06rcQateijtP5RaP5P2M5O8C8Iddu_4_dhULx8zNx7K5wE00w>
 <xmx:Jbf_XzYpgfZVndtwnFaO0szdX7IVvJu1uRYAau8Vj1jGHKpdWzWVrA>
Received: from localhost.localdomain
 (ppp118-210-173-48.adl-adc-lon-bras34.tpg.internode.on.net [118.210.173.48])
 by mail.messagingengine.com (Postfix) with ESMTPA id B254124005C;
 Wed, 13 Jan 2021 22:14:41 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v7 0/6] mmc: sdhci-of-aspeed: Expose phase delay tuning
Date: Thu, 14 Jan 2021 13:44:27 +1030
Message-Id: <20210114031433.2388532-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series implements support for the MMC core clk-phase-* devicetree bindings
in the Aspeed SD/eMMC driver. The relevant register was exposed on the AST2600
and is present for both the SD/MMC controller and the dedicated eMMC
controller.

v7 is just a small change to the the kunit testing in response to Adrian's
feedback.

I've just done a quick build test of v7 given the small change and more
extensive testing done with v5. 

v6 can be found here:

https://lore.kernel.org/linux-mmc/20201218035338.1130849-1-andrew@aj.id.au/

Please review!

Cheers,

Andrew

Andrew Jeffery (6):
  mmc: core: Add helper for parsing clock phase properties
  mmc: sdhci-of-aspeed: Expose clock phase controls
  mmc: sdhci-of-aspeed: Add AST2600 bus clock support
  mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations
  MAINTAINERS: Add entry for the ASPEED SD/MMC driver
  ARM: dts: rainier: Add eMMC clock phase compensation

 MAINTAINERS                                  |   9 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |   1 +
 drivers/mmc/core/host.c                      |  44 ++++
 drivers/mmc/host/Kconfig                     |  14 +
 drivers/mmc/host/sdhci-of-aspeed-test.c      |  98 +++++++
 drivers/mmc/host/sdhci-of-aspeed.c           | 255 ++++++++++++++++++-
 include/linux/mmc/host.h                     |  13 +
 7 files changed, 423 insertions(+), 11 deletions(-)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c

-- 
2.27.0

