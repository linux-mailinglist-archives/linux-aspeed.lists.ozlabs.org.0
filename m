Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A63D35DE
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 09:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMDN0q3vz30D7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=UaJkAHfS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MuqPGjGj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=UaJkAHfS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MuqPGjGj; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMDK3shvz30Dg
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 17:59:45 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F669581634;
 Fri, 23 Jul 2021 03:59:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 23 Jul 2021 03:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M4brAVDojAQdO
 LA2SxZ90X+cdLlh9vmdPo456Vzq22Y=; b=UaJkAHfSJlqvnLlAxoVYhMu3YGzIW
 C8YJ40iQz6oS+vLeDZVdyww2Cj8HAxYPlcTcbNzB6fis99yiJfVPMq1dcPhreeZd
 D2Fg/WWiN1YIyoGtoPH4KiIGzCFXY7vXWdxgSTnhjaACW97200Nb19HyEje1UaVS
 69AyaIaGURK1s6JF+AdipI1TYP1UsAqZ0SqjhudGp4xqttsHWi/LjySiHy7NFSeR
 DMIUGZcpnWvCU05o9rRiIU6uC7LPq637dMWJCAFe7MQyacqI902mz62/CnMxEgNi
 s9QP58ybb/iRtDFQYEX6nXfVhwhILYVW+C0oxGAbYUuN+KqktTEBUKnAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M4brAVDojAQdOLA2SxZ90X+cdLlh9vmdPo456Vzq22Y=; b=MuqPGjGj
 z4RqTO2akb/D6DrmY7u2KCRcbO82GvxBZGdgcG4eGCO8PnaCbEZSbaIjfgg8e7fc
 nVaxtbL4mAkGAgcDMaLLdF/QYV0SN572zXfFkOU9bmtyrDOvf8mcEqMymYhH1Spi
 V3ySplcMvCaoxjPsdeFNhPeB7vfm0WVpsPJG4BJ3flFV9SOmKFmIDyHryiY82pz4
 zIoFZHvoyWgcq21XbbO0M7QAua7V7i8UywG4pwh0rqGuDMb/5FhSlrxViU4ibTV0
 R9Th43nCXkjxbHZleHo0KXKV/ZknPSvLgi7fIs4euCGGLBJKuJYNEUlC71uP2xtq
 f9cncUhGeDr/1A==
X-ME-Sender: <xms:7nb6YKaGMre-FUnYXQkybNb0OB4kri70aJkMHXp9IPNq-L6o58uz3g>
 <xme:7nb6YNaUesLqBgvj58hDHasJTAVgVp-zK-5ALtU5yFGqxrITOaVjT1QkRO2F2Q6Hl
 txWd6CgLTCAGgTZfA>
X-ME-Received: <xmr:7nb6YE_7kbBN18eHGUSFFyO7cg0q3gGeSR2yjl2Tam2gn6yepcWlXReSRW1gcmyYuexPkP4k9gpoq6T2XiNKy-FT6nFP1L7KUQRu1PO6iCQOETHY1iYW20D3rJcz-1KUlhh_aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7nb6YMpmqMny-sMDSLFOiy4Yr-yysHbycOJ7ArI8UueOa4NW8jXVhw>
 <xmx:7nb6YFoEiVPT-hXy_bQ_6TjDeBFdmU5FOJNMQoAq_YwG7FPGIHvRnQ>
 <xmx:7nb6YKRSHjtBc_soCP-epuQONTd_68MukeVAzPd4Nz4IgHPv3VWwtA>
 <xmx:73b6YA3OLPULSetxTXX94unDxJgE3dg1BbSvQIzgR2fAdUCbAqe66A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 5/6] ARM: dts: rainier: Add presence-detect and fault
 indictor GPIO expander
Date: Fri, 23 Jul 2021 17:28:57 +0930
Message-Id: <20210723075858.376378-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Expose the ability for the hardware to indicate that it is present, and
if it is present, for the BMC to mark it as faulty.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 76 ++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 941c0489479a..84651d090965 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1685,6 +1685,82 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	dbp0: led-controller@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		ngpios = <8>;
+		gpio-ranges = <&dbp0 0 8 8>;
+
+		led@0 {
+			label = "led-fault-0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "led-fault-1";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "led-fault-2";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "led-fault-3";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "led-fault-4";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "led-fault-5";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "led-fault-6";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "led-fault-7";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
 };
 
 &i2c14 {
-- 
2.30.2

