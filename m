Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F07D1E26
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 04:06:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pZFf1y9mzDqbw
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 13:06:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IkjsmFJD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="xopbKxbv"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pZFX04lYzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 13:06:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 80EF421E90;
 Wed,  9 Oct 2019 22:06:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 22:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=BbKe8lAB6aLlCjfJZgxJtnIxN4
 5+vPNsWUwa92cPHoM=; b=IkjsmFJDTlGNZMhcdiYMZUiNjofp+H76r88IYAzXiN
 WuTBqVVhfNGstxu50I3HT4g3wnANmqXqGnHN7lMrjfRe6QZOj6UqI8vA/N/CDJlT
 /9KQfZ37JV1y92ZVwV51YzXAF2EKohI3H/PGpsexi2NNQEoYPQsDrXM4W0m26B+h
 P8z2Jws7+5JFGcahZGYX9KNUe6XJtH94F2+B7hoQTfswArnzbBnVmzg1mc4Q8pdR
 bsFyXaZ4yw+Nxqkaep0r7JoWva0TrUL0V3ihhpKGXSIQi7JVIVsW/TrTNvr/Z/nm
 EQfR4cC//S5UvMj5T2FHWFypJtQw/6B9UESI+yMj8m4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BbKe8lAB6aLlCjfJZ
 gxJtnIxN45+vPNsWUwa92cPHoM=; b=xopbKxbvIBWIRZ2xt2xLRt6jYHaIeBghS
 uxIRxQk+aXuQIzqAqNbEgpy1mtAuUH3vRP21B2tC3O3YXUSdIFoIBDr+ATx5OAM7
 s0ur2yMDmvuhfCN0tuMsJjGkRpfJ9O1kd9WJX2/Q2XZqu2KTegLI2MBlOpHk6pT5
 +hJs8pCPEzjrvVgQzO5YaNsvD2V9DaztoJ9/FefK/Qc6jlWGuI5CfOIgEKya8nWw
 PTt2kRHj1Kq18+5PBIFtYxSc6iUhz6sG/nwSA5nJMSEexiej/knNZ2IaLXcUAixS
 1jfOFdrpl9dTftpXayl4ynrGqhjZyFXlvXofJVv42LqoPpCt6fUrA==
X-ME-Sender: <xms:HZKeXQII42Z69vCLC3eQl4QskYdZGdvDyYSNlH8kP8f6mr2Cih8c7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:HZKeXatCnlPNFR-ESBZ4AC0xo6CjE9-Q-CtPma4Z6E1NciFDbKvWBA>
 <xmx:HZKeXdQSDGMF0a4wjnCwi5-NKVucxhimWnp-RD3cB_lvE_4-To8-Fg>
 <xmx:HZKeXQOyv-U6SiPDk-1uTm6J8yuVjUuooDJdNCCdOeyB4ACqj-GwSA>
 <xmx:HZKeXVzii6CfDaNDRUM0xX_ObCob9TA4uzy6bETopK6S16Y8g5R5-w>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02CF580061;
 Wed,  9 Oct 2019 22:06:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: ast2600: Expose RMII RCLK for MACs 1-4
Date: Thu, 10 Oct 2019 12:37:23 +1030
Message-Id: <20191010020725.3990-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series is similar to that for the AST2500 but I've split the patches out
as the AST2600 driver is new for 5.4 and I'm hoping we have a chance of
slipping them in. Maybe we can get both series in, but I thought decoupling
them might make it more manageable if not.

Regardless, the blurb:

This series is two small changes enable kernel support for controlling the RMII
RCLK gate on AST2600-based systems. RMII is commonly used for NCSI, which
itself is commonly used for BMC-based designs to reduce cabling requirements
for the platform. NCSI support for the AST2600 is not yet implemented in
u-boot and so unlike the AST2500 the kernel can't rely on RCLK already being
ungated.

v2: Rename some macros and clocks based on feedback from Joel

v1 can be found here: https://lore.kernel.org/linux-clk/20191008113553.13662-1-andrew@aj.id.au/

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
  clk: ast2600: Add RMII RCLK gates for all four MACs

 drivers/clk/clk-ast2600.c                 | 47 ++++++++++++++++++++++-
 include/dt-bindings/clock/ast2600-clock.h |  4 ++
 2 files changed, 50 insertions(+), 1 deletion(-)

-- 
2.20.1

