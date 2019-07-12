Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC066566
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 05:56:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJxb5pKRzDqq3
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 13:56:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Rfe5+eXu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FuxgV8Iu"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lJXL1Z8bzDqC0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 13:37:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 774A922196;
 Thu, 11 Jul 2019 23:37:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jul 2019 23:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=bzkTfMhJlLnueEo28/kxpkBvpN
 8gKMiWuRYbkXw0wjU=; b=Rfe5+eXuxJ6UQh2jCP3Gqz+NopKtTMxWrzCwbz4LhT
 GFwII3XdQoBAmEwDZaM/mLwBANHg0fyPh9F/xYmqJ2z+YsLFKVaaDlyRFPsFaT00
 bKOWlpiRrTiBjBOtqWEotqGC/AHOudz3mREpmUkoYa78goN/1rpkL0CKooiYOMHz
 XwAz3s0TELWyVkFYJ1ktRtfCrEPlmPxXG4up+FWrpdgcTgnfGIdDPmrWY0R7dbaj
 tu+HLw+7L3zC+a/WBw0m6dgRM22ge7RM2m9YsinZcwQ3WWI3+0+ifZ1V8J2Ad5fs
 6mRUM83E/B8sN67V5EIkU2dBAGRGscClJuxbBAQRwo9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bzkTfMhJlLnueEo28
 /kxpkBvpN8gKMiWuRYbkXw0wjU=; b=FuxgV8Iu6kVa+P6POmQGOd86Wc3QaIgiG
 tuGsH3tiyc2Xr0eJIguy3YMVCU/o0A1Oyr/GRi0IRqXNYGCaSnOfSeea74BgQ/A/
 Mh3xChOqJu2D//+qpQaU1wdCIhDhbRzy19Jr78VwmxSRlIOFn/lRjo3WF3wnjir2
 jy89HESCc5n0pKuXmqyWZWcRzudt3N2Q7JpUAbdrnicsxTzrg6nFt5IpO/SVkxAn
 zO4swmB53LysJC3pla9xvTzxefmMe8qMWY8lwJa/2XGbpBDx3+ERWJDD5tJlwDLP
 D2avjKMLR7txmiV5fnIrQM50Fel/n3Hy5xeakwuXJoAZV2BPPvpug==
X-ME-Sender: <xms:fAAoXfmQB6Kgou_Ho2-YWzYiwAPU3OcZ9A6AFijvQkZEYPJunjfutg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fAAoXdmAMLXHke1Mf8skr-Vq7j-4-Q_cv18c-YFYIBr41b5Mj7RfXA>
 <xmx:fAAoXUiiGLzAG6mb9J2WXHfRVmbOdyV4IuS8wURvH9cKO5HBuZLaSA>
 <xmx:fAAoXeUh8t6Y6wJP0QRSh7--ISy-pr2fDu0pPZjT3PEMZqGwAU3OAQ>
 <xmx:fQAoXfC0A5rLU7UzjxpmPtJ-mNAG26uYezfbToU_LtZ-8xmuLUn9rw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E968380079;
 Thu, 11 Jul 2019 23:37:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Enable SD controllers
Date: Fri, 12 Jul 2019 13:07:24 +0930
Message-Id: <20190712033726.25237-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

v2 drops the "Swift" patch that accidentally modified witherspoon.dts instead
(thanks Joel), and leaves sdhci1 disabled on the EVB. v1 of the series can be
found here:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/001984.html

v2 reflects some of the changes driven by Rob's review of the bindings document
in v1 of the driver series:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/001994.html

As ever, please review!

Andrew

Andrew Jeffery (2):
  ARM: dts: aspeed: Describe SD controllers
  ARM: dts: aspeed: Enable first MMC slot on AST2500 EVB

 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 11 ++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi         | 28 ++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi         | 28 ++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

-- 
2.20.1

