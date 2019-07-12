Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AE66563
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 05:55:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJxP0WWXzDqNK
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jul 2019 13:55:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Fvlec1Jq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q9mRD1Qj"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lJQK3Wg6zDqmq
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jul 2019 13:32:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 458DB6A;
 Thu, 11 Jul 2019 23:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Jul 2019 23:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=0/ELW1INd9ZqSD2iZt9/xN6YTT
 BSlrGKdOYRNFKIJUg=; b=Fvlec1JqxpZpVwTKbLfwLKFE04wzCcdk8i1EZaFGr2
 ZzpcXbiFhQNj1yx/AEXqDHQ9Sm3gLkC0CYXzTZsSVUbkOYFBsofkPcr3wuwV/FNz
 6w28BN4CKQEwTznF+gw2rrmCUHKSrtPhsPoL9KMm0C8iuqMDEypGZIZ2AfrNTi/Z
 8NHm4HBtBiDHvyybIOgMgG+l9uMb4FdHyX63nGBdm1bStV9R0mvwiqxjxsp/Z5qE
 /1NMdPdd7L69Psx3T6T5zajbxJZL86Kem8/gHO1Hl4PmeR14pD1JdZs75qyGAVPV
 4DU4T+p1LCPojanvrjq4i1Ufw8nL2x/ZTnpqeecMYiOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0/ELW1INd9ZqSD2iZ
 t9/xN6YTTBSlrGKdOYRNFKIJUg=; b=Q9mRD1QjsjyrkWoHz3RBxWy8mnvRMPD0i
 55YXDJWdg6+gf170T/VczeiyTaGBYuRg0ZVh9U4zj7qQ6MG5co+2UMP+2q8LGjst
 Xn1RtmERh9h0NtC79ra59js5DJy717Toj6Lw736k5NT7Tly2sRZvE2zxmIdSMC8N
 BC+py1aRqwOsN/Xq8E4bl9n/bKnh+MFaoQb2fuBE4WVBLVXCVoGLxj+yHdVYZJK0
 ieKyvyM2K6qz55lZaWcYUuBg/TqP1Xnafs5sxUjFlsME/MrxnNfmXW0ts4QO/IJu
 fdbDytVQMT+9dA5+bmFgxkqAwwLgGuiCYFsLE2P5zN6CJFNl1Sbxw==
X-ME-Sender: <xms:Q_8nXQSdE5Erss_8QGL61LhbuZjUCt5Mwy_FM3ZOU3CnuyI4AYtndA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Q_8nXbQi68ssdcsMFb_0pb_VRRKJyffOPTyfAmIgDfdA-nYAwqZoFg>
 <xmx:Q_8nXZ6UsDQk92KtFurGIkDvBCvvpwSGEVI4kuothvpFXHB2VLheug>
 <xmx:Q_8nXRQjzrie9wXFy0adIKGp-9xxNxNFv40V2CTQFN_XoP7KQujpsg>
 <xmx:RP8nXTwqR9PV6Po46uzcDzzT7U6ki-Rkf2a2xnKl2UeggYyY2im12Q>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AA238005A;
 Thu, 11 Jul 2019 23:32:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 0/2] mmc: Add support for the ASPEED SD controller
Date: Fri, 12 Jul 2019 13:02:12 +0930
Message-Id: <20190712033214.24713-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, ryanchen.aspeed@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This is v2 of the ASPEED SD controller driver. v2 primarily addresses Rob's
comments on the bindings in v1. The v1 series can be found here:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/001988.html

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: mmc: Document Aspeed SD controller
  mmc: Add support for the ASPEED SD controller

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml |  90 +++++
 drivers/mmc/host/Kconfig                      |  12 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 326 ++++++++++++++++++
 4 files changed, 429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

-- 
2.20.1

