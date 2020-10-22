Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A83295637
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 03:48:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGqyh5b9BzDqRy
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 12:48:44 +1100 (AEDT)
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
 header.s=fm1 header.b=eXhu2n31; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RDw8CX6+; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGqxz5HCLzDqGm
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 12:48:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B7915C03E5;
 Wed, 21 Oct 2020 21:48:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 21 Oct 2020 21:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=v0DMQ6dObuNyK
 dn77ktOvd+tbDfcGN731GrYvUp6F48=; b=eXhu2n31z2cPH1XqKPRJiMFPd+pMS
 hLBLMTLwqwNVBJ6hKHr4WFqClTkpyeBrbO7II7XkvytGHBkmOBlUgKVoNdjbYwKI
 M5UmO08vKbc4nhEy/cnUOumeXuF054B6WgOzXwMy4SynXtIpS7146zov6on7IRX2
 ygwps30UHrec2d8Z3kJEGYWHrQpJl0DM065vILNM6ENULXIAeH1thmOlctdGAc3Y
 PwvbbjC8nRCGkBRgjXcOkv/C3+bUYvXy10Sr1z8o6/AOcqT4eItey2zirz5BV5vA
 5MxGPihXvFzymjxIg6OpDWkT3TVMy/9DK/7VKTcpwcj0dmbCbdYyS8lxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=v0DMQ6dObuNyKdn77ktOvd+tbDfcGN731GrYvUp6F48=; b=RDw8CX6+
 6FwB0T/YVLtd4gT3vBK1lgGJhPMq+UJbNJfcvLAnSuC3yzp4+ksQnghpBTqgugEG
 tfAJvZAnv6qzhrhNM0bKMV5/NtPTM8d5Kj7LAFat9sDH6WYRV4uAekDTUTbrr6Ux
 SvCl5UaRq5lvl5mtJ9coS56BQn9pO82YHpvdd0E3TOgA5sj6mxLJ+JfveMWdeQzT
 oOw/H7OATYFdpe9vxEmLn3+IyKt0pGsMEwHhtJeFheLiRS4rX7UAHA7S2T8j4HzA
 RTcl4pE38pq4Bg/51ISCQZ7xJoR5ifIhfT4g8Zc0ytzqXowWC5vhvn5zt8vxs2ws
 S3IW1gHNhSdibA==
X-ME-Sender: <xms:1eSQX0xK3Lp1_UVYtvl8ULbgdzagm256AYnPlzBqJQrd2XX0xii37g>
 <xme:1eSQX4QGkig3LD32KcWcUP8--UV3gz_tlcyk_K5GuXfmx-PIF4Oqx_SAVPDziN-aA
 QsyGNSysXxcUAwaHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrjedrudektden
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1eSQX2W2F-kN6E-lC0iXr6V_DF5fkFuz0d0l52-IZEX_U2WnrnssKQ>
 <xmx:1eSQXyjT9oxAWAp6OAGuMbIU9sAczBUaz3ZO18sFBgzAb90G0rj58g>
 <xmx:1eSQX2Cc8Vtgxv5F-djbuxRa3uBw161uLi275UOrUnq1jd-OAiApuA>
 <xmx:1eSQXxMLg6xMEw3tOJRVS4sprSaeTP5d_i833SJ0-3FIpQjVcjWQKw>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1765E3280063;
 Wed, 21 Oct 2020 21:48:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH v2 2/6] ARM: dts: tacoma: Zero-pad flash memory region length
Date: Thu, 22 Oct 2020 12:17:27 +1030
Message-Id: <20201022014731.2035438-3-andrew@aj.id.au>
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

Makes it easier to understand the magnitude at a glance.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index e86c22ce6d12..67ab57ad4d8d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -28,7 +28,7 @@ reserved-memory {
 
 		flash_memory: region@b8000000 {
 			no-map;
-			reg = <0xb8000000 0x4000000>; /* 64M */
+			reg = <0xb8000000 0x04000000>; /* 64M */
 		};
 
 		vga_memory: region@bf000000 {
-- 
2.25.1

