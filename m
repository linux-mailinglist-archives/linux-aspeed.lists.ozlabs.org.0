Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529E265AD6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 09:51:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnnyR6NdVzDqnv
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 17:51:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=rQ+puJdd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kXkU3shw; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnnyG3kY4zDqfF
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 17:51:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3D4EBC45;
 Fri, 11 Sep 2020 03:45:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 11 Sep 2020 03:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LnsJv6GD9nTg0
 2V8m96sV6eOoWxSDw59yWZqnOxCD04=; b=rQ+puJddY/Re8G6ofonEu6PbNLLAT
 YphOh0zR6nNXYEld7wPoLniBIUsnd/l1bIYw+9s3WuJ0tLCdxKiLvgoH8QhrmZvh
 hPruPezPK6fdVRAd6nTWi2NXnFhmSocPCF+GlNGjm+1XWKcBGfLRCu0Ij0dImHCe
 cTB31FR7+UkIY2zZe4aafUAkhl89Ar/fwg79BznYoNnq9IiJvsNtl8xqqCMhmmuV
 1VfCnyMQXv/DuovDCkq4BFG22fMMs5BsdIld2piE/RdhpXGzFajZliFTNZindSp8
 jgoxPg4LFN0IAxO5VGqqHbCYEwc1MwRqkhgYyicPqLLtS2f+5BpE4ZMQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LnsJv6GD9nTg02V8m96sV6eOoWxSDw59yWZqnOxCD04=; b=kXkU3shw
 5je9QLC1OMJ/59DNvPtiEbmqf+3GhLJI9TAf2VQhae7mx7UjmsZk40HtHtHm9QjU
 BEBwAvNMspNvXzY36y7GRCnxasXJRkAJx4/JFvHPZDaT44g9wK4p5ib5riWa/L8m
 QmjKm0t9BTFnfpJftsjl92lyc2Tndug252WoirjjnITmaYkYSF4ZVlpEfqrybY62
 dsx8GZkzS8e0S0R4cv9wS/MoTgwMF0ScVmlwSZxwdKJAKbGEfjklojmuRFHlNKPd
 hr/b39nYT8NnGrkIyaoj+K5T7w9eS9p7XH/H6Fx3fzJnrQwgoxqo5PKjmg1Kw4E3
 D2gEgLT6cyalVQ==
X-ME-Sender: <xms:IitbX0uJKdbGKJbLu3q_f1GJx26hCnX1EvOTGTUK__wObWCkvFycWg>
 <xme:IitbXxfzImQ9K170eWsQsil-eJBB-mrFo8cP31vZzR_q_TUCsQgzZOKH-4fkvN8eW
 2IAgDjS34n1VvzlqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IitbX_yC3AuQTnRmNREDD0YcrKfNw2s6bkn1kOXVqzcibiu6t_oJZg>
 <xmx:IitbX3OZxbfWshor7r83rWM-JNc6w-c2WepqKyNegnYzV54aBYCzdA>
 <xmx:IitbX09sRzP2DX-N_DewxxhYt_9guYSpdiFUJjL_qQScl103-Gc27w>
 <xmx:IitbX4ZBxA6AitlLHLFISFjfqpo70EBWAI_wT8qUf4frrp9Hf_PfYQ>
Received: from mistburn.lan
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A1BC3064683;
 Fri, 11 Sep 2020 03:45:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: dts: tacoma: Add phase delay for eMMC
Date: Fri, 11 Sep 2020 17:14:52 +0930
Message-Id: <20200911074452.3148259-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911074452.3148259-1-andrew@aj.id.au>
References: <20200911074452.3148259-1-andrew@aj.id.au>
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Adjust the phase delay to avoid data timeout splats like the following:

[  731.368601] mmc0: Timeout waiting for hardware interrupt.
[  731.374644] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[  731.381828] mmc0: sdhci: Sys addr:  0x00000020 | Version:  0x00000002
[  731.389012] mmc0: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000020
[  731.396194] mmc0: sdhci: Argument:  0x00462a18 | Trn mode: 0x0000002b
[  731.403377] mmc0: sdhci: Present:   0x01f70106 | Host ctl: 0x00000017
[  731.410559] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[  731.417733] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
[  731.424915] mmc0: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[  731.432098] mmc0: sdhci: Int enab:  0x03ff008b | Sig enab: 0x03ff008b
[  731.439282] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[  731.446464] mmc0: sdhci: Caps:      0x01f80080 | Caps_1:   0x00000007
[  731.453647] mmc0: sdhci: Cmd:       0x0000193a | Max curr: 0x001f0f08
[  731.460829] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0xffffffff
[  731.468013] mmc0: sdhci: Resp[2]:   0x320f5913 | Resp[3]:  0x00000900
[  731.475195] mmc0: sdhci: Host ctl2: 0x0000008b
[  731.480139] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xbe040200
[  731.487321] mmc0: sdhci: ============================================

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 5f4ee67ac787..94ec301ceb73 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -179,6 +179,8 @@ &emmc_controller {
 
 &emmc {
 	status = "okay";
+	aspeed,input-phase = <0x7>;
+	aspeed,output-phase = <0x1f>;
 };
 
 &fsim0 {
-- 
2.25.1

