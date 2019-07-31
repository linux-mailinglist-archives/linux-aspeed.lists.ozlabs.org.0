Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E17B933
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 07:43:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z2R01tGnzDqZC
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 15:43:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="g7MN1DY1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i5xBkoT3"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z2Ll6CcWzDqXR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 15:39:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E6642D4F;
 Wed, 31 Jul 2019 01:39:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 31 Jul 2019 01:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=f6SwHiquskKyzal6BVgx/Zrb83
 M7d3YW34Dxd8xOi/I=; b=g7MN1DY1j9rZdpYORY8nL/SkjVPP9amQQ6Ol+aXOL1
 75Cgfy18cKd6+ssH0oOz3n7yYP+nlnPSqod16gcxdXcMx9pE14K2SFSf6/luls5u
 JphFHxcZh/ovi/Q4uGC7Og/ct+1NnN9zCnNk3sa1m+ocS2693kgbjimy3t4qegds
 hZII0pm/H8nklvVIkOOQ3JrwKtCZ7u4DGygNFPhNSA7lKtbH5vxxCsmkOGl7YT5W
 RBbJSRWOqsaK2lK1GMWmf9PMZnZxHagbU29IJaGEtPyserJhpVEoRXthPev7LbGi
 eXngVDCjC0WBidytA0t07ccGFSO9lGSFuVCl8wBYw8uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f6SwHiquskKyzal6B
 Vgx/Zrb83M7d3YW34Dxd8xOi/I=; b=i5xBkoT3kOfJ7Fozu8U1x3mCDqVDbaGJi
 hW5j7MVRghRgV4UUqd7BsH+FN1J5Ffey9ZReBvuVB51o9kaDcNQ/tJGbJ1cdw3m1
 jFJcbTap/SsQj4NW7jmsyhcVwGAcN5fwekb6ohoymp4NjfnNCOdtccLepKOo/169
 /7jgkGAWQzcX1gMu3UdiGLLpMnuzOhghv6uqG+KqRdnPzp0drOrRM3cvb70dUcUl
 mveg0t1PJ+C4DvGiVpbFo0iwbQWzvxeGJb0rRUAmglkQwwqpfRBYBFkoEqRUkdNi
 NI2P0sJCs3ehdBaCR0St9p7NktQyf5qW/iv9aPQ7xRgqeACnHvtUg==
X-ME-Sender: <xms:qClBXZXWhe-ZQDDEHt39xzZJV1vT5Nk1WP4T8AYQICf5aoyLv9SzqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qClBXTpGDNuSmIbPncJh21n4Sf0ss0RejHuzWA4hv3rAOLNcRuRxMw>
 <xmx:qClBXaVOdGKEcDyq-7JxJ0S_ajEy6NdCoqsQTywn439lc82Dng4C5w>
 <xmx:qClBXUGdN3rrLeLl3XtvCSrNpwfDySjv8adf7tD_SwRNJ9jE38lxGw>
 <xmx:qilBXVZcJHTBJAO8KEKpy2dp-GtEoJUAEkilKJiKZf9U4ox-z_TfPQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05C728005C;
 Wed, 31 Jul 2019 01:39:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 0/4] net: phy: Add AST2600 MDIO support
Date: Wed, 31 Jul 2019 15:09:55 +0930
Message-Id: <20190731053959.16293-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

v2 of the ASPEED MDIO series addresses comments from Rob on the devicetree
bindings and Andrew on the driver itself.

v1 of the series can be found here:

http://patchwork.ozlabs.org/cover/1138140/

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: net: Add aspeed,ast2600-mdio binding
  net: phy: Add mdio-aspeed
  net: ftgmac100: Add support for DT phy-handle property
  net: ftgmac100: Select ASPEED MDIO driver for the AST2600

 .../bindings/net/aspeed,ast2600-mdio.yaml     |  45 +++++
 drivers/net/ethernet/faraday/Kconfig          |   1 +
 drivers/net/ethernet/faraday/ftgmac100.c      |  37 ++++-
 drivers/net/phy/Kconfig                       |  13 ++
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-aspeed.c                 | 157 ++++++++++++++++++
 6 files changed, 250 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
 create mode 100644 drivers/net/phy/mdio-aspeed.c

-- 
2.20.1

