Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C634375E82
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vyd52YB3zDqPn
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M3HqskOp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gQ50PelC"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybj3xF2zDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D42AB22131;
 Fri, 26 Jul 2019 01:40:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Sz5g0+Dl2yQ1i
 F6zWdflObP+DugVbiRkNpKSed5kVRQ=; b=M3HqskOp669nEECYO+2mMlQLHS0at
 8mGJjd3E2rx1RXUnz/ZLOuzO92TnBRsgC3WgySQKfv/6lHfLU0iasmyer4dTphQZ
 fGjlkdWRXQnpE984mAYs7xMXjP8AAyMIzrNthugvem1RsxJ5YeHlpyic7QxJ68Jd
 Ku6DCBLYkx6V76YAxx85uxhaLc4ZNngG/D4kfN1FTe5ZrLBE601qCRyWqITNLvFz
 S58npquHNCDphz+3rEHhVqDuzpS38JU8VitVtLVkHu6RB/W8GeFP6x3oU+3MSGIf
 RefH5rBlcOmozt74qe+dsHjn0w9ekDT+i5++Ik0CwP8M7bSWRCttlOBkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Sz5g0+Dl2yQ1iF6zWdflObP+DugVbiRkNpKSed5kVRQ=; b=gQ50PelC
 FRIo7RxYhk8WqEpbdthcrQczqKm4kC3tMoi+dbpoFksjNul329FMbymPdBmrHYqP
 DgEdGk2fEBU60OS7IZxKmGnRUh+L1bt549fMcMZx/DXNR9VIQftJKrjXNFUnUVrL
 zm17dRtqSMtcGOjD1HwD56reRFKp8b+L53nRq/nMRFcxpr7wgaFuRHFztRXdPmkO
 TgX07EbViZ0mUa1IQ9uHpIj1w+r65YOG1lEbFJ8QW/g4oGeA/RmOjEBz970Rmiet
 nXyDwcB1uHNap9LKXTQRWPqHjE2ZEs1JPIaEFNM1qKRjahi/+1eHk/o+Sa3x2Til
 K0GoxSklQIIz8g==
X-ME-Sender: <xms:TpI6XRONu7akzQ89w22D7UhdiCVFTo-CKmTtCW7ZUGK0_rQ6gLqa1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 je
X-ME-Proxy: <xmx:TpI6XWtvaP5vkzUO0x0DgE_ZXPurQ9HOUQHpkU57bmlCF-lhX9dGRw>
 <xmx:TpI6XdItkjrYbTUkJ4XEt7t_GlhXDfe2_vOORuLIS-hQOkVvbNTLNg>
 <xmx:TpI6XVPf_psBKf-WqiMAixAfjlFg4AjFuHxo_ZLhAx_6kNzKeNe0Gw>
 <xmx:TpI6XWC_C2q7edRFFvq41OnZO4cBMZesLTnbsvqP1tuS19jzN7T4iA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9D43380076;
 Fri, 26 Jul 2019 01:40:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 08/17] ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
Date: Fri, 26 Jul 2019 15:09:50 +0930
Message-Id: <20190726053959.2003-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
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
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 +++---
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index dd4b0b15afcf..ed78020f6269 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -296,14 +296,14 @@
 
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
index 3b4af88f9b80..a8a593dd2240 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -408,14 +408,14 @@
 
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
2.20.1

