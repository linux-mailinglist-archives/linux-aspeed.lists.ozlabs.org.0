Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FCD29563B
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 03:49:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGqzH0v3pzDqTn
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 12:49:15 +1100 (AEDT)
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
 header.s=fm1 header.b=aNj5dml9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=oCuPdhk7; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGqy93rKDzDqS5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 12:48:17 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 41CB55C03E5;
 Wed, 21 Oct 2020 21:48:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 21 Oct 2020 21:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2iPeJ5v2usE/A
 Ob5Lfmq4TFbvL2qVWuNftG6FVML1KQ=; b=aNj5dml9ERzAUrgJkhwS6HJxmxs3n
 iRFiP9SpbX8QJNeP8ilTU07Nilbk9kLXtTcWg4rvfiWWIzJtW2iMmSz6tNtpmR8n
 ozo12CNgfqD6TffR+MLmCTc4BRNke2vcDzc4FEz0JLqXNfR69JPHysJF0O/ANaPa
 lfI4Lv8lxwyggpagsHGm6fUZInL2fsW+Ze3MVGE/+2mahRM7OJqLpnV2OoLVN+uZ
 D4idObrz5hT2f1v76EyiSdwU3OpNxo08uncHgApLVnTuFTqNfw5Rhqxn8tM67r6+
 f47NU41Ui64VqjDK3BCc78X1u23fhEl390QiOB9Jl/f/1WsJlGmRNnAww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=2iPeJ5v2usE/AOb5Lfmq4TFbvL2qVWuNftG6FVML1KQ=; b=oCuPdhk7
 1m772d267HfdYOteUufdoTrlkwAVRJS7P99/fCaHPgwodTsxtuF3oVROSZDUXGKg
 3ajiBYWkdb8VPTEgs0gITKZXw3vSuc7GvjfrNTrPOc753IlugXuEfmoeRY1eO01J
 Nb78KNX07PUj5UEr8GyMeOgugiqde4G5Y+lxFpH5vMCzMRzzrEHssBeBMKPYJQCo
 l3qC7J1RWwFvsp2a5xDMCjH733wGLOQAWjW2RsQq9MFMoMwYl3+0WPFJM9H0OdqC
 4gQk2oLu7wlNTtfAZQfe8XdhPYvjkUiLm9/lZd1skKFkCjkmTqe2j4VNiJODsgH2
 Yz42Sd2DwuFGUA==
X-ME-Sender: <xms:3-SQX5FmVEVAqmXRojHKVwQO3ZlN_8gPzsk7avUKuUc85laz36ASRA>
 <xme:3-SQX-UNuOw06vsCUneHXAGhnzh3hKxg07JiJyRjIRG6_v5Wc-F1xqfDTc_B51Sbg
 XEIAI_J4XBA72tsHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrjedrudektden
 ucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3-SQX7IAVoP0sD0-TbZreWQ-Gu5yUeu1y2FicQmCHU5mu5rsmo4r1g>
 <xmx:3-SQX_GjOXXgb1b0RMYH44ZFv9hN7mcRjHb9eQAOfJjyNAI8q2aTpA>
 <xmx:3-SQX_UXRQ-k3U1rsxQmdZr1lOesNKV2JTjEhh-ujZ2r8N2HX_7vTA>
 <xmx:3-SQX6REAfO2fhkx3aFIb98Dreup-YMuBosnelsmSK-4ZKK3Dyrg5Q>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A2A23280060;
 Wed, 21 Oct 2020 21:48:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH v2 6/6] ARM: dts: tacoma: Add reserved memory for ramoops
Date: Thu, 22 Oct 2020 12:17:31 +1030
Message-Id: <20201022014731.2035438-7-andrew@aj.id.au>
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

Reserve a 1.5MiB region of memory to record kmsg dumps, console and
userspace message state into 16kiB ring-buffer slots. The sizing allows
for up to 16 dumps to be captured and read out.

Set max-reason to KMSG_DUMP_EMERG to capture bad-path reboots.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 09b561429579..04efabe70d9f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -34,6 +34,15 @@ flash_memory: region@b8000000 {
 
 		/* 48MB region from the end of flash to start of vga memory */
 
+		ramoops@bc000000 {
+			compatible = "ramoops";
+			reg = <0xbc000000 0x180000>; /* 16 * (3 * 0x8000) */
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			pmsg-size = <0x8000>;
+			max-reason = <3>; /* KMSG_DUMP_EMERG */
+		};
+
 		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
-- 
2.25.1

