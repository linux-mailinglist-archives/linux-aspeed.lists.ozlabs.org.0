Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C338647EF
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:15:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLnH4GpszDqTk
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:15:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="X2ZKFxpC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IcQ5AsDf"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLmz4fthzDqHr
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:15:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 09CF522110;
 Wed, 10 Jul 2019 10:15:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=T/5pb6r/UoVQt8P3l97DTHCU6/
 +Zf8y3qrrQsrsydeA=; b=X2ZKFxpCWG3Vijn9d9lOXXbc0Tm0ZcveoseEiLPESJ
 NIwSCViJpbee2BpHt8yymxP7MdVLg0GO91xe6PLRBhigOi37/mK/XmFR+mo9wGON
 lIqVqlkt2ozpkt1EM66VQChveVJ0JA2kufF+eM+cWJRci2KRLbyjoDYXSwjpiD4/
 Nzptg96Ft0X19C42uR2dpGW6L8r2jIS57RJt5poeeuN+dsYrLuvPAWZ8Pu059Den
 Vb8y8hKhzRi4IRN0ESw6KRoNbosTXTGKuf7PWVwJKza3YswZsUDkiW9/7+9ABpQG
 CIJ+R9R/+/5j/tGbzq+YTMKcpNaZkHWk87zLALvN7NNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T/5pb6r/UoVQt8P3l
 97DTHCU6/+Zf8y3qrrQsrsydeA=; b=IcQ5AsDfvkKnRbGfZ6moQEyceuLeKth25
 u9gVS3tkhfdIcS8zFsPNe+GPGvQOd1rWG4kQGTtmvitHkHtjVPogEX1PHn44NK2L
 EXQE+oCOb3sfRv/sY3kX0IAE1HuF3kwrGyd5OfGLTw5p9CJbzjq+Ftb6OsLIl+my
 fND3QEsmO9ydoYBooSJ/v5vp040VsKtUuC4STYhI1rrUk2aEhI3le3z7hoqI7lQ9
 NosJ/lmkmnEFhh7aX0tjPUECWBEOZ8CITaW3ngpm8b0ZdEkwggGC5GOkk6ESd7TS
 f5ZEuAsZikckqMRLSKfx5vP1wd1emIOyeQmNS10MEUFmREFdzH67w==
X-ME-Sender: <xms:7_IlXQpoHYjDQmCVOpHmjt_-tpzTaFGY4XpbHeVYzZSpyPBIa_uMgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:7_IlXdetVpmyM7uZUhUAOnWmVbJG7FsDMXo6el8cQohmnS3MrF-3_A>
 <xmx:7_IlXeLE2LtUOUMDARsIYouBCvUpOZuproX_7c17LH1oeftv9-ACZw>
 <xmx:7_IlXauriFBbV7gwAcvljpN1_T4NWD532XBj-AI6UMofAr747060Ig>
 <xmx:8fIlXXDNKuZJTMZtWUR2d-z9tV5LUB72y9Ot435UDHbg7jfEzdt31g>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E8408005B;
 Wed, 10 Jul 2019 10:15:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/3] ARM: dts: aspeed: Enable SD controllers
Date: Wed, 10 Jul 2019 23:45:00 +0930
Message-Id: <20190710141503.21026-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series describes the ASPEED SD controller in relevant devicetree files,
enabling the MMC slots on the AST2500 EVB and Swift machines.

Please review!

Andrew

Andrew Jeffery (2):
  ARM: dts: aspeed: Describe SD controller in DTSIs
  ARM: dts: aspeed: Enable both MMC slots on AST2500 EVB

Joel Stanley (1):
  ARM: dts: aspeed: Enable both MMC slots on Swift

 arch/arm/boot/dts/aspeed-ast2500-evb.dts      | 18 +++++++++++
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 18 +++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi              | 30 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 30 +++++++++++++++++++
 4 files changed, 96 insertions(+)

-- 
2.20.1

