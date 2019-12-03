Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D054910FD46
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:08:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S1300DgJzDqTT
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:08:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HoCUb2TW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wqHg7fkM"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0xT0QSJzDqVb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:03:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DB13223F7;
 Tue,  3 Dec 2019 07:03:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Gipm7m4Tc0Hwk
 IsIKnuKaGFXgVbJL2mzXRy4PtSExJI=; b=HoCUb2TWOTVibuL05Jm1oaRGlSGtg
 anpaCsVMsx3JjzSnZf9vAWQyatpWsS4IHPOwWKVQ9v+gm6hizuq/6BTC5MGEJ49b
 HH1LVCTQCQPTGlTUYd6sFUv3ZncIb2RbB2LkfD+dmNyAeA5LOacJ5dMBo27YHSj/
 R9I2k3rOjgQuEbEg4MSo8sCxkoaML0rW10KqydX3ccbhcNHiK0xlW7LOaYaeoVtr
 Db4II82AFBcnoQzUGoRarsD+9gA32klz6ogodIJNsIvsLXmHI0LtNLLOKzupVNp6
 ZjLOygeD4JANhlX34YF4dtbGfzAryB3qDZHusaRDHVtbz2YA1I7te09Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Gipm7m4Tc0HwkIsIKnuKaGFXgVbJL2mzXRy4PtSExJI=; b=wqHg7fkM
 +LAArarWwgpH3wAUwS/iy0YCbbx0QbNLfc7AxWD6pF+zOlGg/I6ehJXnLBkuoyL6
 RSQ7sl5nyho5xe38zSHRA52atiHeUXGz8PWEVIUn5RW2f/7u56bQrCpN5bxlSUsb
 ffKa/8O4nP4ZC3j6/rtCMin0LkKoTaG2/BLbeaTj+MHNitoDluM0/jieTuOlR3P6
 B2tr6L8w7vaNoV5bv3QQmTKEkP0s01s13X6Eu1u2AajGLFxw+f7cyG2MSM50ppid
 qL/zBPXlNWFxO3lNTrRFkqxtClblHDo831qU5qiiQyd19wCgjyvcgCKb8XLq9g2+
 XK6533wK5j8Hpw==
X-ME-Sender: <xms:Ck_mXVdxgy51DcjeMGXlPKit4e9E0zpPRl7YWmqaypJL1N5lDJ_OQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeple
X-ME-Proxy: <xmx:Ck_mXSzs0qyhOIWNMF1_j8MuLqmkiwnQAlibFb7X0Kid_oU1hX2SJA>
 <xmx:Ck_mXZW9glxsbglXYM0PMp0lHirRkDayCZNaPHOtB8bKxkoIi247ZQ>
 <xmx:Ck_mXcYl367aqQf7g1AfrDTW8ojElgyfL3V56LOETuINIGJdkNQkxw>
 <xmx:Ck_mXXc-6VWjTAP4rq4qSUuV8jIoYSdBmvbwFMVpEiCBvrdIO3Sg3g>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 035D130600EA;
 Tue,  3 Dec 2019 07:03:18 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 10/14] ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
Date: Tue,  3 Dec 2019 22:34:11 +1030
Message-Id: <c7b124576dc133cc03119507e472dec18c048438.1575369656.git-series.andrew@aj.id.au>
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

Fix the following warning:

    arch/arm/boot/dts/aspeed-g5.dtsi:409.27-414.8: Warning (unique_unit_address): /ahb/apb/lpc@1e789000/lpc-host@80/lpc-ctrl@0: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/lpc-host@80/lpc-snoop@0)

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 +++---
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 46c0891aac5a..e1d4af06c217 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -346,14 +346,14 @@
 
 					lpc_ctrl: lpc-ctrl@0 {
 						compatible = "aspeed,ast2400-lpc-ctrl";
-						reg = <0x0 0x80>;
+						reg = <0x0 0x10>;
 						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
-					lpc_snoop: lpc-snoop@0 {
+					lpc_snoop: lpc-snoop@10 {
 						compatible = "aspeed,ast2400-lpc-snoop";
-						reg = <0x0 0x80>;
+						reg = <0x10 0x8>;
 						interrupts = <8>;
 						status = "disabled";
 					};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5757d3f0e947..013d1f98ecf1 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -458,14 +458,14 @@
 
 					lpc_ctrl: lpc-ctrl@0 {
 						compatible = "aspeed,ast2500-lpc-ctrl";
-						reg = <0x0 0x80>;
+						reg = <0x0 0x10>;
 						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
-					lpc_snoop: lpc-snoop@0 {
+					lpc_snoop: lpc-snoop@10 {
 						compatible = "aspeed,ast2500-lpc-snoop";
-						reg = <0x0 0x80>;
+						reg = <0x10 0x8>;
 						interrupts = <8>;
 						status = "disabled";
 					};
-- 
git-series 0.9.1
