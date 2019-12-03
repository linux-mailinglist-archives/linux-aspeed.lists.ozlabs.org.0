Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695010FD4A
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:08:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S13F0ppKzDqW0
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:08:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ekUTd1xt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ht/pNLsZ"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0xf3L8lzDqVl
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:03:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 453B4223CA;
 Tue,  3 Dec 2019 07:03:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=GwW2ZPokeQOuM
 x+qEgChoiysoCIuDajacTWg+pdJvas=; b=ekUTd1xt56OIqNoNCpcmvBQxYPntc
 eE1s4rwx+v4BSTs1ToM9PxpacFP2xBnhzA/jRkjY2vCRPuDmlBzeyqZOZNlU1env
 75hSXMWoGO/KT9lvIB1M16Y9NKiC6zHZFDhsMm7LehBRSz8KJqE2U8kXKy/DK2mz
 /MpJYY/F3JL9kg7mmYLhiwjHdjWGek5RlDDhPfMmHsUi3AvgWDUWUPvVPewiGpQs
 sFBWPTTwgjKLXVzibeh/K1DBMbQyJCr5ThKlq3ILi/J48+Q0i8F0n49tTncmloT4
 jGyxZfzzJkug0tL0p6/ApzzxunN0HuLJnTdRmGWOgj0b27dqXArgKkoiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GwW2ZPokeQOuMx+qEgChoiysoCIuDajacTWg+pdJvas=; b=ht/pNLsZ
 k/5XPCDc1YA+RXLQyl1IuaWQy5XmJL5jp4BO9qqbb/xzntE/5ceJ3+eIv8SFVNL6
 9E4Xq5hVQo7BlKEfLjoTu/gCSPavVfhKkV5XYjXpO95DwJ6v5gl2mvrhLoXH/jnq
 kby1X7ltx8LafS+6p17L+NeesrELZ6U1jAQqHr9EG6naHjbOxKAFXUH5wdeBRhJW
 s5s6GHUErFz6RjcXTHhwRJAn/HAlvx1Nn5S0SDcPLsRpWnH7mtvAjF9Cad0RIK54
 2nr5xI2riyliU2Q+WXEUoCte3mO4kw68wnzitUKhfIjx9c49Kpsva2B7WVDO3qoR
 T4pWvvMBGRAU+A==
X-ME-Sender: <xms:FE_mXXmrpuvc96CcaaQ_m6sc53j98lW4e7qMbGPbtPCi8UIsemda2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddu
X-ME-Proxy: <xmx:FE_mXWo3tCS9G8LOecLk-8lyx99qNAaxW_Pnt2Wo3Gjnt4me9VhIcw>
 <xmx:FE_mXU8CGsdSNA7Lth8ckQhiQ6ms9Q5jBkeTsuzMF0WZH-inKI-ctQ>
 <xmx:FE_mXS3ZhMT_WfbF1GH8ja41mlm2746EeXblfe1xCd0-3hGWphpUfw>
 <xmx:FE_mXbPxISBTIvh9cu-_o_h9ybAcVmkN2vT2KlcZ8v9Da-qE2-PEeA>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7035230600AA;
 Tue,  3 Dec 2019 07:03:29 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 13/14] ARM: dts: aspeed-g6: Cleanup watchdog unit address
Date: Tue,  3 Dec 2019 22:34:14 +1030
Message-Id: <eaf3a37fefaa6f05ef7e4b6bb2c41be84c27316f.1575369656.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

arch/arm/boot/dts/aspeed-g6.dtsi:204.28-208.6: Warning (simple_bus_reg): /ahb/apb/watchdog@1e7850C0: simple-bus unit address format error, expected "1e7850c0"

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 5f6142d99eeb..ffe0d76c5ac0 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -385,7 +385,7 @@
 				status = "disabled";
 			};
 
-			wdt4: watchdog@1e7850C0 {
+			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
 				status = "disabled";
-- 
git-series 0.9.1
