Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6047D647D8
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:13:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLlK6JQgzDqR1
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:13:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UjhvK8Wy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZnSFQJZj"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLl83MQPzDqHr
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:13:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AD75216CA;
 Wed, 10 Jul 2019 10:13:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=5v+hHlvidFmtFgjlAm3pBo2Tz+
 GoKLc5rUvGwtlDRfI=; b=UjhvK8Wyhx1ZV33kRimOa4uTyTlXlS9qqz4B0PEdy/
 pqtBMjnHxlL6U0qzZ7uwfbeHZ6XHfx4Y2VdvRog7tOSMNpXxeVJ6t7TDR534VISG
 jrCqUhXIkQb44AsCK+QRPb6C+i3YB9vk0+heVW3y+rVPvAUHmdTewNc96KwyTOA1
 vurtdnQx8lpJbNyK6PXWkj2rRLJj/ZOJnprezTPMb2qGqgzGyAQsBk0S4v9bhP9t
 XqAHMYmEzsD5rd7MkxpCSFyswD11WgvnCIFhzydKO7nrMVBV/qzPql3Dj0Zj0iyC
 6QeA+IHrISYFwNKe1amAW8XCpHJSLLAtOpqTJltbofNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5v+hHlvidFmtFgjlA
 m3pBo2Tz+GoKLc5rUvGwtlDRfI=; b=ZnSFQJZjNMJbxNMefR08ouzswfBXEdBkC
 dM3EJ5by9Mvt9okUvPzyG6FuRVjWpv2+yHYLiKglNvP1S+WouK1PMdNTEjBbc39k
 JJHGP7T7/rYCN8/kwMwzIPp/1MHzmcWaFn7b6gO2fFFPHsBURAfSxshyzXcNBpy1
 VQ+KyaX82n8d49we7bxMK7vVNiQwhAVbCxmmKCVKtwzYUgtm3qol0Lmq0jqlGgH5
 hKanjKp/xcPK9tU8lEVayrYDrQYOd3IY5YvedFKZmdjhZXeND5BfjKfJVD7cnFNa
 knjps+1Z41meU8/LbQJNxJSggsNeFZeAC5zAXDlVM+Tgs8QqvsvKw==
X-ME-Sender: <xms:jvIlXTXRXnLZtST76DPU1uXq_K8okxZpsf6JWfLQwuOuOMChic3nHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:jvIlXXSB08Fd9eGNS0FTotHtfnt1k97BhdcZQKMOxw3JEgZ1e7qKnQ>
 <xmx:jvIlXaGvlBgj01ZpDRFQjjqxg0Gwhzp6pIp6r6grlniSKxcpOa79DA>
 <xmx:jvIlXfS0r2GV-C-Nwcyv5U7bbYwg2rJh24nBk_a_AK_U0tUKC1CI7A>
 <xmx:kfIlXU-nxT3rL2IjsA7AspTCVFV729-B9KbNcKCok6sSNywHwrwhgA>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E724380086;
 Wed, 10 Jul 2019 10:13:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/3] ARM: configs: aspeed-g5: SD Controller support
Date: Wed, 10 Jul 2019 23:43:22 +0930
Message-Id: <20190710141325.20888-1-andrew@aj.id.au>
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
Cc: ryanchen.aspeed@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series adds SD controller related bits to the aspeed_g5_defconfig.

Please review!

Andrew

Andrew Jeffery (1):
  ARM: config: aspeed-g5: Refresh on 5.2

Joel Stanley (1):
  ARM: config: aspeed-g5: Enable EXT4, VFAT

Ryan Chen (1):
  ARM: config: aspeed-g5: Enable SD Controller

 arch/arm/configs/aspeed_g5_defconfig | 64 ++++++++++++++--------------
 1 file changed, 32 insertions(+), 32 deletions(-)

-- 
2.20.1

