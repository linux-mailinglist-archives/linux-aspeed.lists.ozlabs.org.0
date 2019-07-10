Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF76647DB
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:14:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLlf4xlVzDqPW
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:14:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LPCmO4+G"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ogKsKni1"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLlC1wztzDqHr
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:13:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC558220A3;
 Wed, 10 Jul 2019 10:13:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VBwKd1WghoPxV
 Q8wzPfjIXtSva+XbmOsRragjWyFYUQ=; b=LPCmO4+GRtWF9BPtH5D+ayPoF1/Zg
 ZofzbOiq3/cjoBtADKEh211SiAjgYEZZLvn7+yZZNoKmK1AqRdpvwodgo3lSQrAn
 bd/+C8gPJRikXjsHnWenph59OQejanHUV8jH4RZcbtjvnHehVsgyo94eT+t5wBgJ
 OJrWH83MOj95rVcqq8htN1G1ai9DVaBRWTARtlJVLcqmBRNHgm3ahrH2Z6ZyjLhs
 XvBqJuXPV73Kik8VicvVr6YVzfkDCRK+ya2SK0AijokRvY/UaXKxFfBoqRN2Sulu
 laQl686mF0znAX8LtebjpzWUvf/P+SpZSL28UuTQsqaGAqvXoHKo9UxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VBwKd1WghoPxVQ8wzPfjIXtSva+XbmOsRragjWyFYUQ=; b=ogKsKni1
 U6jdZMgMBUQlrSXpRnEkOZrGp3CdA2Fjtq/0AE7VglI95FayedoWp32FibhRw+L5
 D6d82FtF7Rx9cu6c1iBYoJJAmocv9yRT6MjxE53Bl5h39XLFEcVEnR69SpSQdhjZ
 vAqYTUezSQ1vPN4/sUH9hUrVy4KvXn4zdD50ZF/6q0BZtMNQip1QNZ3YHX3lTiS+
 NfRYh9+xejHzfh4kL/Cs+hSBEsbt7+PfHWnbhA/pY1Bx85mv3ZOd7Yho5dp/v0jg
 04i0E9nfByoXUQrTTMVv8NAaWaP2CxN6YZd8CCBIVySIEzKecn5JrOgIQFHTjx3W
 g6Jr5WdN8fzDCQ==
X-ME-Sender: <xms:lPIlXW-AujqhJfgvPDqlYu8KttD_IymGfhrwMu8NZF4Li1-p2LjhEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:lPIlXQCEqmMQx5sKMPZVhVr2jZyGHMH6mM1CIjp4F4FXiNPyvX1zSA>
 <xmx:lPIlXYbzd1LNkXY1ec2eaO1-sXTXYAJOMnEhoVBI45Y0kuKP-TemYg>
 <xmx:lPIlXWA0LTHVxBbHnhI0REUtUevUTERv3b5v19xYcPI8tSx527SASA>
 <xmx:lPIlXSxIJ02fV0e8lRKtGZOAb38_C7Jbu0umYQKNAPxT1kw1-vXp2w>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id F34EB380075;
 Wed, 10 Jul 2019 10:13:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/3] ARM: config: aspeed-g5: Enable SD Controller
Date: Wed, 10 Jul 2019 23:43:24 +0930
Message-Id: <20190710141325.20888-3-andrew@aj.id.au>
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
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Ryan Chen <ryanchen.aspeed@gmail.com>

Enable various options necessary for building the driver for the ASPEED
SD controller.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 249eeeb55d59..9cb3cfd35a59 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -182,6 +182,13 @@ CONFIG_USB_CONFIGFS_F_LB_SS=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_DEBUG=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ASPEED=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
-- 
2.20.1

