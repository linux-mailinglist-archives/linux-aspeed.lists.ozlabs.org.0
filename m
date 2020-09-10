Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C32644C6
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 12:55:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnG4t5YMjzDqbx
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 20:55:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=esbEhAYA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=a6Ib4TWa; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnG4S28TPzDqBb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 20:55:04 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4607E5C10C1;
 Thu, 10 Sep 2020 06:55:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Sep 2020 06:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=sL1+RarEw/M9r
 JBb5UPxjs0rtv85M8sBG+GXBnTRj30=; b=esbEhAYArRbdZBpvZ8fBIJUSgz8PB
 UkvMvKRCsBLYipmil3rMY1HE+q/ON8txHsN/z2QbGBOpn/IHVI2RuDJTyK5AVFCw
 yi8KQojSOsXuPTLbYD8Fg6Kn34ul8YLQwje/4rsd/zyCiNSWLGgLp1mi5l3sq5Fw
 xeTNsRck6/zghjf8vgavXe31T2b2gh2yd30nGMW18QrRjuV8z26didwhxS9geYcD
 Dx3NpDM9tY9sdg77LJlwMqYKBrnnd9a7Bd9ztr8mHJuIGbFaqzv22bRHcWASCRYK
 pWWB+1UJTKW3fekzeCK7U6crHn1hqDzC5BOGvxcvfYEi9Lr4gpAXjzTfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sL1+RarEw/M9rJBb5UPxjs0rtv85M8sBG+GXBnTRj30=; b=a6Ib4TWa
 0KsKGVwBorqP+i122RuauIYgmPu7q4kjbag9g1cwWH24s+Nay6jWFr8Q2gaX8xxK
 mRpHo1kTSWfk5qImSc5hBmQnQn1iIG3YBH4G4/y/5IHW5kX6214ei1EBpo0pOlpo
 s1gxJdYLJUhgMiLja1mXReMvHL4yr9H353j7RL+QM7kmPaAdyUhT3ZC3vmDXdESm
 2VTjCWvg0jhSs6g1TJr3ueHusxxuCYAd+3vkDAZwPnFqem+sCLp8FsdhNwJw1K3e
 t6CjiUJx8mnQ93JvdxK78SSHxwcb5GupgmhFBhDVb9hut19ajlFfrJfPcUtDJeHR
 8nzo0anIe4xKYw==
X-ME-Sender: <xms:BgZaX25jQn4PywizkvRJUmN5rhipZTpsfZJ5m7_8-3djP-2Y_oQszQ>
 <xme:BgZaX_5F97xBgMdbOvp6t4vaqAn-lZKrvUfZj9nBZCnEL3k_-W5WZ8d_XTufMLEg3
 OhfS3fUmJvwORTeUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
 vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:BgZaX1dZs18Fpy0AbaUsV6vB0ltQ8WbEW2vkWEHm_0o0sYCq4qNMdQ>
 <xmx:BgZaXzKguPTU9j0TRcMjdnOLjMXQ9nk89Tt6rkyjWCqAtraKWZtHgg>
 <xmx:BgZaX6Ll5FhK8AgYL3qDzNSLWpMgWiyiyiFV31R2crCjH8mB-VABVA>
 <xmx:BgZaXy-A54w9Nv7-zae0vCRXAg5ZjGKul1Uz_j0S2ndssnSsOjzGAA>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15D673064674;
 Thu, 10 Sep 2020 06:54:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: tacoma: Add data sample phase delay for eMMC
Date: Thu, 10 Sep 2020 20:24:40 +0930
Message-Id: <20200910105440.3087723-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910105440.3087723-1-andrew@aj.id.au>
References: <20200910105440.3087723-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

