Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9D16258A
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Feb 2020 12:31:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MJZx6DTyzDqSj
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Feb 2020 22:31:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=bZ3GcoAk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=cx/Wg/eA; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MJZX64JQzDq7h
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Feb 2020 22:30:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D8610727;
 Tue, 18 Feb 2020 06:30:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 18 Feb 2020 06:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=Dg2Cd9EZBtYB1HWPx6/lUlj2Ii
 YhZqrvqg7YHhAG3aY=; b=bZ3GcoAkurSfDs9AeIRql7IS0oB+3lENUOtz9+/KcK
 l1/3CbkoWiTCkhI+MIn+0JtunJZQ1p9GEhaYHbbyLMPhRX0XCRvmJQYSfnAD6YcH
 hyu0INbXLMgfFI/9C0lxGtPjG46KByzpVo+GAd0AgDrk5s8imUfai/budHWiObuZ
 osKy6PDf0n9O8VzhbyOzIMlXwe+ktPEUe5zUvhPE/Qy7SKNNKBGLeNi6HMg6lmMW
 qYMRqjtI//ThZ8symHWY533BddicjuT5ql51x9NJYwBtmGLg+1+dGY5F/6XPbf8P
 S9KjH25e1NFWLWJHLHvEz4cvIHN3Hc+Q+jqUX26rJBQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Dg2Cd9EZBtYB1HWPx
 6/lUlj2IiYhZqrvqg7YHhAG3aY=; b=cx/Wg/eA1Hy4SSleVZwqCF1wCWeF+MjBm
 KXFjRAvqdclkdQetYFGD6/8Qw5WOQNf4MijYhp57D6m5Yd0G5GrBjOzTDEhtUGuy
 NPaqe1cSYuILqjj2I5FVhMq80OpWAsBMobFzpOEuWXEmFNLZZZbql7IxBKp5Y7Ha
 +6sHerWIEL79SauZEbLMTjfW+RSERhEZIP7Bql2qth6nJfa5PIvB5Fu2A9xGZQsI
 paufJOxO7HtUP6942t0A+wKR1n+Edi+AVzDtOmYJIyvpkudYA+Z1ZbahQLT+8KoT
 Etatf4jpNDHfRcUbNmXm6ywZ+Xt72fRHh5hS+ra6/g0y+0ocCYbZA==
X-ME-Sender: <xms:7MpLXj4xtwTuHmXD0o08Rt_dl9BRvnCrImoQz2_NbCJnLB8lI_w43A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepudegrddvrdekvddrgeeknecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7MpLXm9hrLLQwU1VaPo0_5zqzlUp8TC6nuFjJrrN02dMPnd8rYTx6g>
 <xmx:7MpLXqcxpakDEBW4zo3RC8U8yd1Y7cFzZWmU2ViUl5S3u64U6z5kYw>
 <xmx:7MpLXrLMfo3Q3tjOB3D5WUmQWACf-kQqsVWbJBcu7Vj6CtMmbkuACg>
 <xmx:7cpLXlcbukHKbtcHOrt7XghT_mq7DKpX-0Qla09Jb4e0SS0xBiKXfg>
Received: from localhost.localdomain
 (ppp14-2-82-48.adl-apt-pir-bras31.tpg.internode.on.net [14.2.82.48])
 by mail.messagingengine.com (Postfix) with ESMTPA id 937DD3060C21;
 Tue, 18 Feb 2020 06:30:50 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: rainier: Enable VUART2
Date: Tue, 18 Feb 2020 22:00:52 +1030
Message-Id: <20200218113052.28392-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The second VUART is used to expose multiplexed, non-hypervisor consoles.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 6232cd726a7f..61d4140a2601 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -540,6 +540,10 @@
 	status = "okay";
 };
 
+&vuart2 {
+	status = "okay";
+};
+
 &lpc_ctrl {
 	status = "okay";
 	memory-region = <&flash_memory>;
-- 
2.20.1

