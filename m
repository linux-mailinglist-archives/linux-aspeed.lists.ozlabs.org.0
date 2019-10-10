Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C54D1E2B
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 04:07:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pZGK2cqMzDqZQ
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 13:07:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="R4zreAWr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gbX5yrEx"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pZG94wkbzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 13:06:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C44621650;
 Wed,  9 Oct 2019 22:06:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 22:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=x3RE897M5F/dnmR/2Ok3f4oZJT
 eYElmylbpXjY9R6Iw=; b=R4zreAWrlLRXLiFZci5z7dmfxEQouExBqH+Uw6yre1
 k3qF5/+TuikKp4N4VYgNEQLp1pgwDL466kRwB9VW55Oa3rcReKra/SNYLeiUiDRj
 gUAmIDiDkgEPlNyTRPrL1ILLXPM1hq+Trc5YgynmpBH43vkIZq8d2tDrZ0JsU8Ez
 IWTMvn2T/uPVavnhvz+iwobu0/0+Zc1R+N1mtc0CB0oUwMui/7Ro3gNUEDGgLv+X
 afdXzYFMoyXfICMoggo8lfEW4mjlDn/qLuywwnq3Rbx+L/bThm9HqvVfSjeoZZMy
 o+xXXYMld22QwX/Hvq39Zk6z5c6rYhKN9f594p4i53/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x3RE897M5F/dnmR/2
 Ok3f4oZJTeYElmylbpXjY9R6Iw=; b=gbX5yrExxC/b+xFBGN2bYcT8hjz+t0fQe
 0/+J8xXBMtUr1CtWpsu9AVl98cPk3mNA69cSebsgsBAHlqpbkM2tWKPsi5ga43lT
 IXjI19PklRm3GaXbUL/W9fexM7PXoFRqKG9awkvtJ/u4dtr8xAf6BaJIrqvS8uHN
 hTYka9gVtKnDvl6Y1FaoCaJlToFPMfFXwXzZ65iHu8iqp1OTCcdIC89Jyf9vEEgx
 z2qcaSwOgz353mLRmSCNEhkAQOT4OYK/hhBOiUpXJCS6/xhpVZpTKZpci4EFezrD
 IQGsCyuwNBS13bcK1a1+5r1lUIuYtH175bEsbaby5NR59K4Os8jSQ==
X-ME-Sender: <xms:PpKeXfq1M__LrjncpJ81iq4uhR2RTk_qFUjkuL3Sy5s1tDE2vAOWjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:PpKeXXCAu0Dj4TyIV6IZf2Uzi6WyrHP5frzgoCYm6-K8rUPLSNFNtw>
 <xmx:PpKeXVtg7E4hl5HlUHXaco4xqTGFhkPyIlMqco3s70S6dJqAANnxHw>
 <xmx:PpKeXeKKlUAZksDZBYPZd8PGhAufV5PkGtTYy98T16JmIK8mEj0s-g>
 <xmx:P5KeXTOIJFM-GV-fdE4iM5wcdN4iteNKcmq-chPXyXEdqRz07NnGpA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99D668005A;
 Wed,  9 Oct 2019 22:06:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH v2 0/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
Date: Thu, 10 Oct 2019 12:37:53 +1030
Message-Id: <20191010020756.4198-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, davem@davemloft.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series slightly extends the devicetree binding and driver for the
FTGMAC100 to describe an optional RMII RCLK gate in the clocks property.
Currently it's necessary for the kernel to ungate RCLK on the AST2600 in NCSI
configurations as u-boot does not yet support NCSI (which uses the
R(educed)MII).

v2:
* Clear up Reduced vs Reversed MII in the cover letter
* Mitigate anxiety in the commit message for 1/3 
* Clarify that AST2500 is also affected in the clocks property description in
  2/3
* Rework the error paths and update some comments in 3/3

v1 can be found here: https://lore.kernel.org/netdev/20191008115143.14149-1-andrew@aj.id.au/

Please review!

Andrew

Andrew Jeffery (3):
  dt-bindings: net: ftgmac100: Document AST2600 compatible
  dt-bindings: net: ftgmac100: Describe clock properties
  net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs

 .../devicetree/bindings/net/ftgmac100.txt     |  8 +++
 drivers/net/ethernet/faraday/ftgmac100.c      | 50 +++++++++++++++----
 2 files changed, 48 insertions(+), 10 deletions(-)

-- 
2.20.1

