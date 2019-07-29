Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A3778438
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 06:40:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xn6R5QlmzDqCZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 14:39:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V0DU1Qt5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D7o1MtGy"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xn5x2hFxzDqCZ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 14:39:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E8AD31D33;
 Mon, 29 Jul 2019 00:39:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 00:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=aqDU4EJqoCCG0sbaEmhbBDMZxp
 GS5Qk0n3blj0qrY7s=; b=V0DU1Qt5FZp2J8YCNbDMJyQtL4gS/RKuZT2t0NtFUy
 IDWhwX6cGUDRQa26nQDLF+V6VVDkqGpaFLdbJ7o7Y6Myk5+E/CPSGG/w2y9SjSCi
 en6xKY1hTNyGV3YOtkOXZC7gjEjNh80gduqWqnhCX7E6VgnltjIItXObqeEMTEGl
 9FEx4hzjwax5DtfosqZKs7RG2rOXs3eGJU8y1r0sYIaQPS/yHkekThacH0EpA9b8
 wKccBW0mzv/LWu0/Z98GeXsQh1uzxZBwj+UsKStqBbZXw5ns5sv2jSP/wevw3A4d
 RlUPo5Dk2hTO+CFGUlraDPUeqzMkND00zAUvwfHN3NHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aqDU4EJqoCCG0sbaE
 mhbBDMZxpGS5Qk0n3blj0qrY7s=; b=D7o1MtGycyf+htTiAJA4NOCFllGhivzeq
 7hYqitUWcC7lsVKvXIoOhcug1xfHv5m18WatdzHbY9A0iJpmBDhyMYXhEI1UHdcc
 cyp9TNo3XGqKUi1+CrjbeaQQuFamE2wSvC+8WiA8U4kHseelIwO/zKA0dyCxONN9
 J8UHTxZ+bsKzV5Vrp9KBiyVcQ5AbPxX3TDbBAzyClM6pdmyio7U+Gvx40BDZDbKi
 6UKi1yO/4fd0ocnGOCmiJNqIAerQuzJqHBKp21B+thgeWzILAm+y2GpEwFBN7lUh
 Hmp8heM/7GdArQmxiUQJVZlXGJ88faWiMzJvFpJ9sinUNBoIrWauA==
X-ME-Sender: <xms:e3g-XcWXJeCMW08lzP5IQ4N8b_zBlmLVOkeBx_Qxe-zp4UKaopDlXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:e3g-Xc6Jo7c1iONOpE6_x2Z9U-0esifmvVZrk7eWf_rKYIvyfAAGpw>
 <xmx:e3g-XTLKV9uNT0_8vZLHnnPFZsR-ZOmGGBSloVn_IONUH07iDuABcQ>
 <xmx:e3g-XdKitd4qu_YK8gF3pFubhbbK4EBCw6x__LyEt3G4KMvMe3ACNg>
 <xmx:gHg-XcMbgkzccTTFY5IJnxncxLjKr1gqTVrlah7BZMhvlwzvPoq7xg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8E5788005C;
 Mon, 29 Jul 2019 00:39:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH 0/4] net: phy: Add AST2600 MDIO support
Date: Mon, 29 Jul 2019 14:09:22 +0930
Message-Id: <20190729043926.32679-1-andrew@aj.id.au>
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

This series adds support for the MDIO controllers found in the AST2600. In the
AST2500 and earlier the MDIO controller was embedded in the MAC; this has now
been separated out and the register interface rearranged (again).

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: net: Add aspeed,ast2600-mdio binding
  net: phy: Add mdio-aspeed
  net: ftgmac100: Add support for DT phy-handle property
  net: ftgmac100: Select ASPEED MDIO driver for the AST2600

 .../bindings/net/aspeed,ast2600-mdio.yaml     |  61 +++++++
 drivers/net/ethernet/faraday/Kconfig          |   1 +
 drivers/net/ethernet/faraday/ftgmac100.c      |  37 +++-
 drivers/net/phy/Kconfig                       |  13 ++
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-aspeed.c                 | 159 ++++++++++++++++++
 6 files changed, 268 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
 create mode 100644 drivers/net/phy/mdio-aspeed.c

-- 
2.20.1

