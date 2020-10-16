Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F528FD5A
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 06:36:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCCz948MYzDqXV
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 15:36:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ibn3w8Qe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=W7ay5OM4; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCCyr3hM5zDqX1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Oct 2020 15:36:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EF479F8E;
 Fri, 16 Oct 2020 00:36:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 16 Oct 2020 00:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=WXebYGUOxo1OO
 laEW5dDl3iLC0qxgbnBraqL8r8/PQA=; b=ibn3w8QeOpGy5z6YxsRL4s7DugbjY
 pcC2qXS0x5AsdKtiQZLbSoKE1TEDOz898Q7UwmaK5Xx4v9btkkqAeQ6f6TLIctm7
 6iL53dDQjmBt0p3dX6hTXBcqDJfJuGGyeZBHQT2pBjeAbmGOrxhYSVfnahvEPVBi
 egHW3ZYOQlkUXjy+xpfQ3psulga+ShRzdnyjiFe19RsXxzhIR5r9bgJguXOUjCNr
 pB2W7n9m9rue2Z+funoiLx66P+RGBXJJTfQRTSC6aZiEZNWq5r8sX7so0h7Qmxd8
 +iXJ6aCLI9zAGochRlwiJnz2jk/TUFz/TKWpTuhZZv4DSYkYHDDXYaU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=WXebYGUOxo1OOlaEW5dDl3iLC0qxgbnBraqL8r8/PQA=; b=W7ay5OM4
 gZTxeKzs4zVaV3+LIL+QVsxtM055iwA08B2HcOxuHX3M5V2n/XDs9eizH0waIVyr
 P19cfSmTT2CMMnXSjEdg3w1HmrYLcYdFT/l7mHkxdgFwNRJF/2M+fPr5qwHxoUwW
 +myVNM/kS9gJoV+faPRbvW/COMkNCMJYAu7GAjhXixe0qHS5WYIMk1q0l/FAY3dS
 02pcsGCp5D7HzKZu7nEIvkE8BPhegMSuyNo8Qij9/GUJM3hCrNanfgAJhjWuRosu
 RRzVEe3FyLh40s5Tlnoi6Ic+wuRoJI6b6kvke/YcU1QEpmFCXpcR7YiI45MEIyJg
 AHdsOQqAEn/aEQ==
X-ME-Sender: <xms:QSOJX78dpbHmPOvuwIKe81TMf_JpNMDxBrJ83RWb05HRGfNql80acA>
 <xme:QSOJX3tgEVJjzPV1-2RuDascabuw5eYzty82KAVzTrPLnppPERqlX4TbfZpBJVDW8
 up2w4wJQsuW3s_Sjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrjedrudektden
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:QSOJX5Du2CDI9BOqQJ92pP72W5hVtXySe9rS9M6LFNiLX4atifAoHg>
 <xmx:QSOJX3dfVvSj67SvFIVgHmmgRfyVBkd9CyoAfpPh5KYVrf6ejOEXGQ>
 <xmx:QSOJXwNUgxLzj1IQkwpuXdlkuEaUxgj4jMvxEUc6JNyAkHIarLdjww>
 <xmx:QSOJX1rzA80USFqw2VPqb3NjxQpT1Ny0284pluUMw6K-HW45yIneAg>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F7483280059;
 Fri, 16 Oct 2020 00:36:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 2/2] ARM: dts: tacoma: Add reserved memory for ramoops
Date: Fri, 16 Oct 2020 15:05:13 +1030
Message-Id: <20201016043513.119841-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016043513.119841-1-andrew@aj.id.au>
References: <20201016043513.119841-1-andrew@aj.id.au>
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

Reserve a 1.5MiB region of memory to record kmsg dumps, console and
userspace message state into 16kiB ring-buffer slots. The sizing allows
for up to 32 dumps to be captured and read out.

Set max-reason to KMSG_DUMP_EMERG to capture bad-path reboots.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 46f2f538baba..4f7e9b490e1a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -26,6 +26,15 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		ramoops@b9e80000 {
+			compatible = "ramoops";
+			reg = <0xb9e80000 0x180000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+			pmsg-size = <0x4000>;
+			max-reason = <3>; /* KMSG_DUMP_EMERG */
+		};
+
 		flash_memory: region@ba000000 {
 			no-map;
 			reg = <0xb8000000 0x4000000>; /* 64M */
-- 
2.25.1

