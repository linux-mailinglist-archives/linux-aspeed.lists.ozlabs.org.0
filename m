Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF20647DD
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:14:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLlm72nKzDqNZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:14:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="S3pX6hE3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H1b1O1tj"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLlG0rCFzDqP1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:13:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D47BF22116;
 Wed, 10 Jul 2019 10:13:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=59zr7ar3J2+Mb
 Uw+g9i3S5rctQUpSiUdlC6O+B+OKrU=; b=S3pX6hE3bn5MBplfmjzefPLZID+uY
 PFlJ4EI7EX4/3kyQG4Bbd2YbXm2LlgO7VjeEj1GLq6De4txUfNDOvtk3YSo6Xv8z
 AU+BZXLQpkBLpV9X9KG9fgYhrc20gU2tYSM5boVxyu5bT7dO6yQj7ovflss6+4Vc
 3y7mZxg6pQT/YM8xk6cjyJZp3gJsmQXm4rRqL7JWMXztPoPJh1U1kShcKqsMJxjv
 wFihh6y+ZUdkANIqFS9hkZ5SwuXoMdjdZv68cVl60gI/dAVY/9oJQ9brkc2uz1Fy
 D9HPQer6D95bngJ2SCc9cn28jZWdnYpuJU7KoUn4y1hqDNnqyb3tExoNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=59zr7ar3J2+MbUw+g9i3S5rctQUpSiUdlC6O+B+OKrU=; b=H1b1O1tj
 Ep36ro92b9PTugCl9A4Wb+t/dd6jzm1np4XSq27K309m4oNjF/bWnd2LKskrnGs/
 wn+xV0rsQUFpEwSOqD0Nnp2Q43iL54xy3diQNln5thWOXJxP2lL2HDnP1dOahVda
 CEomX8fVZlpyxqW4h6qfJspJv67V/q8LUpT8OP8qvo/ir7tNiGY0VnkhFJGXXza/
 FeGE/At4QwsMPdM8Xgz2xHIoYftrP0jthVu40CZVn2X2FWdAC6RFM9yMEIeEANOn
 mP1pvvCuVTYYzIH32OLpitiNyV50dkNLtyTUvx2l2DBxV4Jt6LR446Z+3jro61He
 400mgrleJik8mw==
X-ME-Sender: <xms:l_IlXTyUs-Re8Kv_0Du6OnYYS7xXNDyUErM0adjKB3sC-0EF3J8sDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedugedrvd
 drkeehrddvvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:l_IlXXnynii_CsXIeNcZv6pZrz-TdTk4O-FPEZzbG6lSlT_gYCx6tA>
 <xmx:l_IlXQH9EJ6Jf2i_MwULNw6yXZTg-l43TgsrRM2Kp13MdQ554SdoXQ>
 <xmx:l_IlXfU-CoQqEQCjIwS_tv-GbvCeOWgLfD4p_LkFLuybsg0_uXRjSA>
 <xmx:l_IlXYpTKuec_2edicKj8pgHylHEasU-KlfdoRIJzS6BbgeGGsUnaA>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EFD5380074;
 Wed, 10 Jul 2019 10:13:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 3/3] ARM: config: aspeed-g5: Enable EXT4, VFAT
Date: Wed, 10 Jul 2019 23:43:25 +0930
Message-Id: <20190710141325.20888-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710141325.20888-1-andrew@aj.id.au>
References: <20190710141325.20888-1-andrew@aj.id.au>
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

From: Joel Stanley <joel@jms.id.au>

Popular filesystems now that we have eMMC support.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 9cb3cfd35a59..13db73e15539 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -217,8 +217,11 @@ CONFIG_FSI_MASTER_HUB=y
 CONFIG_FSI_MASTER_AST_CF=y
 CONFIG_FSI_SCOM=y
 CONFIG_FSI_SBEFIFO=y
+CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_UTF8=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 # CONFIG_JFFS2_FS_WRITEBUFFER is not set
-- 
2.20.1

