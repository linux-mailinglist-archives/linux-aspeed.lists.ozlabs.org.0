Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1F7299D
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 10:13:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tp506KnDzDqKZ
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 18:13:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="k+q7UAhc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GFIe5u//"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tp4r2C8GzDqDc
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 18:13:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A211B1BE7;
 Wed, 24 Jul 2019 04:13:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 04:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=Z9cu/jAfTLPXGSW6gAaNx3qAdg
 J+sFyDlgrk5M8Y63Q=; b=k+q7UAhcAM26oYO9hUAagwzL+hrHSR5s1p4h3DUQVf
 U3oIxLHjx4rde1dUZb3afCorQ47ps3UvIeWll38clz3gIQSrUXZLsTcKduGXhJig
 M5TDhditvHG6Wpop8EwwNbYeJOnupyh8HCP8xRxD7xR1W4bdWBlh+HnWy14AWr1a
 ehnYd/38CqNYPW1mhoKfUl+eL3Wu+4+BY5YQgXq+KptsKc2Vi5XE7KfpAnEC7S0n
 7u12uMdmE7Z+VlUwF/3clczCW9aT8DZDgvBVyEZVgOpT7E1wUXoR3kc0DR6CAO6M
 ChGbhsmZvMPQGfJ5ueLDxtjr9VYqFbbY7H2CC5W3lUoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Z9cu/jAfTLPXGSW6g
 AaNx3qAdgJ+sFyDlgrk5M8Y63Q=; b=GFIe5u//MOSehrg4pLFa6fzeaefHTTHsC
 KcE4DtVvZqDdLSceuqsQt74U+Fx+UA3axFB9xLje/Zb6P1GbPk/I4g4I1j561/1r
 JzAKtd/Ra8UErE38HeG12g3eV73lZy4jnhHUYVIb64bSM0gfwDAUphRHwrYKXtrJ
 qcXBgtxmr8wPK7lxymd27AgKja3OcGk3WvlTLUm+8pw0XePcfUqVQmuW8hVszxgf
 J94UMeUPDWMiSyGdSwbJgC5+VrurGAoy2Dr65wseWzAuvVyQ+1rQWo6KnC3C8iIt
 wWnie7Fzf/Nf5il8bON/iYJWq8WO2hRRaXvbAUjIdQaZKVncbKs5Q==
X-ME-Sender: <xms:FhM4XdYl6s_v0frgxQfX-eAxBSB57mw8dBAcmK27Bs_7YjhXcUg_pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeelgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilh
 hfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:FhM4XToB9bhuKD6ybOqqYrcDVYdn-dvk50NL61v-LwO7mQPfIfvx3Q>
 <xmx:FhM4XcI2RIvOldexMpK96YaIO-5G9jytay0HYhfJ-Ztm1QwL-a8F_A>
 <xmx:FhM4XWbVBuikG1oH89_lRhBz9FV561KMHpeEQTIfLsvmUBKtopUwqA>
 <xmx:GBM4XVPmw2y04_DCBD8HGgbOG8QP_NcgdJT1ysI4NMLMBin7QWcMMg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97BA080060;
 Wed, 24 Jul 2019 04:13:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
Date: Wed, 24 Jul 2019 17:43:10 +0930
Message-Id: <20190724081313.12934-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

Joel and I decided that going forward we're not going to name compatibles along
the lines of SoC generations, so discourage any further attempts by removing
the remaining instances.

It's probably best if we push the three patches all through one tree rather
than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?

Cheers,

Andrew

Andrew Jeffery (3):
  dts: ARM: aspeed: Migrate away from aspeed,g[45].* compatibles
  pinctrl: aspeed: Document existence of deprecated compatibles
  dt-bindings: aspeed: Remove mention of deprecated compatibles

 Documentation/devicetree/bindings/mfd/aspeed-scu.txt         | 2 --
 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt   | 2 --
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml  | 5 +----
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 4 +---
 arch/arm/boot/dts/aspeed-g4.dtsi                             | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                             | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c                   | 4 ++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++
 8 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.20.1

