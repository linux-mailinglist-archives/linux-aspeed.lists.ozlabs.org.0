Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D1CF1DA
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 06:42:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nPp63jgSzDqMn
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 15:42:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NcX1aAJh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kQVGJmp8"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nPnf4jm7zDqML
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 15:41:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD4BF531E;
 Tue,  8 Oct 2019 00:41:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M1iyDZQoxGoqP
 BEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=NcX1aAJhfI2m+KY1MqxeL5glZ8dlm
 MQtK1zf9enX1F/D9v4LBYV0TO1CgzpfTuv3qrMB3AiISoXNrnlfKp0QvHDVBa2YL
 HAo4thHiEqwosYGd/370kDe0/W3GGM83OKIFs3F4y/a/4Ha9BK7Gno+3YVoGB3tL
 H8STlOLLsPc/vgIs8F7se78tle+jo/1YiYfF+ccCMKf9V1NPAZYYsEnggVa/ohha
 m1tQfd6I7Gh+JDYcn2ZQv0e0JRM3iG+YTpPPCY5mgx1bfOph1ppmUkWPCC5JgUxx
 isCr0if/vNia579GamANLzP+ydQWNG06o2Y4d+MILTEnEC0/P4b13TN+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M1iyDZQoxGoqPBEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=kQVGJmp8
 j+HdX5TRgaW2zULCxq8T1QJbxdfmr+ZIOC7ewEGjLuuDA8fm+nhwBKBez/prRlfX
 b2amqO3D2BIwuywb0E/L669kz2Fl1xS3L7T1oseZgtpcrNq3ryyJU1HhSxRIc+jh
 ZeXjuHXXPWk+AfYYAnS00yU/BZc9fgi1IRyECgY3lYryUhgshaQT+nYzCjWaldog
 MUCj//Ihs/egJtlURe7oHGIqBMcn1YX3dBqRlECr47+GdUYutYM27XOw4ag58I9j
 7o8Habj8TxXJfYamHAhXGkwr7Cx1C1Ba4UmT8qu/O6Q8S+XNrEufXIZ8xrTMlt9K
 b3zC7cP6q1ptlw==
X-ME-Sender: <xms:exOcXcxw3io__sw_1WbFc3cL7cdzvlkU5g28VkHiKrQC4e0MxP5CmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 vd
X-ME-Proxy: <xmx:exOcXanJcndheNID_1QJZo5UqlblEluqqSLEVcXVUycFhuMDit_A1g>
 <xmx:exOcXWgsuruBvYRyNKmw9Kjgl0VhqPtFQjZ1swOtuB0R8HfDXcpYzw>
 <xmx:exOcXVd0-h2D7dXrATaeallC2mQCJGVE7FuJxJEF58QpkOOtPihTFA>
 <xmx:exOcXYfC4AGe1h1j8maPIOz4r8QjFtJ2yF-dQ0xJce5V-AGK4BhIkg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09B4C80064;
 Tue,  8 Oct 2019 00:41:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 3/7] pinctrl: aspeed-g6: Fix I2C14 SDA description
Date: Tue,  8 Oct 2019 15:11:49 +1030
Message-Id: <20191008044153.12734-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
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
 johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The I2C function the pin participated in was incorrectly named SDA14
which lead to a failure to mux:

[    6.884344] No function I2C14 found on pin 7 (7). Found signal(s) MACLINK4, SDA14, GPIOA7 for function(s) MACLINK4, SDA14, GPIOA7

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index ff208b7c75a8..9079655cc818 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -87,7 +87,7 @@ FUNC_GROUP_DECL(MACLINK3, L23);
 
 #define K25 7
 SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
-SIG_EXPR_LIST_DECL_SESG(K25, SDA14, SDA14, SIG_DESC_SET(SCU4B0, 7));
+SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
 PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
 FUNC_GROUP_DECL(MACLINK4, K25);
 
-- 
2.20.1

