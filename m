Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D692D295639
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 03:49:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGqz21Lx0zDqTd
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 12:49:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=po0V6KL+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kBOv+hQY; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGqy43tp1zDqGv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 12:48:12 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B4ED5C015E;
 Wed, 21 Oct 2020 21:48:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 21 Oct 2020 21:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tUHYwtIxaM6ck
 HbC9dCkhEpa/U/JJI5HJTKQyDZ8vu4=; b=po0V6KL+rctLeAnabW1bGG9wZiqUB
 +Son43Jzhs0nU02smfLGWR9G8KJYyhPL64Kc0f7YEHcU9HH+5ZkH0JTYf7Kse5qC
 3K/yKPgFjv4pJtBmB8gP10DxdwKNYy9ynXGXgAbtiMsHZ1Z+reDnKLQcHePcphWd
 ILI83zAVwiEGIkdmA4hJfWIVgEEn78+2Kz9k8w8mKONnvvPkTe6tCM3DKaUlxgmF
 FNMTxPtcM3rMu3zrGvplfGdBj96eLBphPKEudUzAb4ZvsyY3UQRHoGmO+/hYhuR/
 Ogjm64drLjJmwKlBdL+Lyc7s6bACGaySrJWeu3vpMy5dDeq4Mc7KwHdeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tUHYwtIxaM6ckHbC9dCkhEpa/U/JJI5HJTKQyDZ8vu4=; b=kBOv+hQY
 OoTHIKqzFyT5zF6OIj94OX5OGILIFrqdu68lYoLVDwQq68BdgLgKtAQ32Vs0AzZG
 wFAjRyzm0KVOcD+XnqB1IkHvtQEV6cKwzBOdnsdrAiPhNhSZEpoGec4nOPAh+Fqm
 5GzmcB2povaGhPtlnnSFgFkVyrACgYOh6GzyLz7rUTBnd+9o//lqaXWiqN+U9aMZ
 OG0JK7bmdr37lRTxbABb9O7PYBEcsJLH0zRgDW6O6Btb5s9WbUd0s4mphJllFyyp
 kaLzmv+0ASx72ep+lKJPoME7MzADCB9g5dBvTiVaw2/ewNGGtLHhE4Tr+6b8KBOd
 l+TTLX5xJLL6eA==
X-ME-Sender: <xms:2uSQX50lFhxl-REYddiZ2ZauiXO7lftmRYeo71v8csLooNSSmb6avQ>
 <xme:2uSQXwEu6_VATN0UnFPWRtIjkQcLbATfEGVhYqnTthXxBf2gznDIv_0uMojMtOYZ2
 Usl8NfYf0yshN5Cuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrjedrudektden
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2uSQX57Uwz4y66tfkDLfu6NMcqfcihec1iyKf_G-I-aHp9_NGn92-w>
 <xmx:2uSQX23n8vTBokcFTjUfsFzphsybiwQ496uyykt72rv2NXEu1EvQLw>
 <xmx:2uSQX8E7GKL26WGd_uhtcxBfx1zkBDp_ry5UrQkYn4H7zC02j3kPcA>
 <xmx:2uSQXwAqAWayPqjMzvy-zIvbkdi0InPVI2uBIkb5GGRqVfv-gQVOCg>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15AB3328005E;
 Wed, 21 Oct 2020 21:48:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH v2 4/6] ARM: dts: rainier,
 tacoma: Comment reserved memory regions
Date: Thu, 22 Oct 2020 12:17:29 +1030
Message-Id: <20201022014731.2035438-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201022014731.2035438-1-andrew@aj.id.au>
References: <20201022014731.2035438-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There are some nuances to their address and size, so lets try document
that a bit better to reveal the hole between the reserved memory for the
LPC FW cycle bridge and the reserved memory for the VGA device.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 136ff156a512..802027a3c43c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -47,11 +47,15 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		/* LPC FW cycle bridge region requires natural alignment */
 		flash_memory: region@B8000000 {
 			no-map;
 			reg = <0xB8000000 0x04000000>; /* 64M */
 		};
 
+		/* 48MB region from the end of flash to start of vga memory */
+
+		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
 			compatible = "shared-dma-pool";
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 52f5876c08cf..09b561429579 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -26,11 +26,15 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		/* LPC FW cycle bridge region requires natural alignment */
 		flash_memory: region@b8000000 {
 			no-map;
 			reg = <0xb8000000 0x04000000>; /* 64M */
 		};
 
+		/* 48MB region from the end of flash to start of vga memory */
+
+		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
 			compatible = "shared-dma-pool";
-- 
2.25.1

