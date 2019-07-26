Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A4475E80
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vyck2Mm3zDqF0
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QR5/9S5O"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HnH9utGY"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybb0KdVzDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D404222D2;
 Fri, 26 Jul 2019 01:40:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/iT1MTk1oKRrE
 njkLxpsHJsTgTurlfgvdf/YXz3Xh0c=; b=QR5/9S5OAR1o9JfaaovYhbPDOOu/m
 nRcQ9F4FGb5xlQjwaVFWi5PGSdziwoDGgQBni42TgFdnoqsK+khHdH1JOwSRLhWY
 aNawF5J+P6o99xKu3rpbwRyA+2aY261t8H1a9mcixArC7E8JfISsaXRQ469HCTFA
 4JLnPB7g3lC3tWuLntagu3CTaRsRMYxxhykuIy4xvQRO2wBxrk66f8d2e9ZS8Aqx
 HFTraM1yS2lWxYmwuWRQU+vnyatKKyjlVhUljnvW0LZk0pvgnycbwZzmAVHAEJJ6
 OhSpvcdUVEeCcZVqxDRJURVjEQ3aEipKM8VIu0H1yuTbwnuRljAdwyXfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/iT1MTk1oKRrEnjkLxpsHJsTgTurlfgvdf/YXz3Xh0c=; b=HnH9utGY
 q+bypQ5TAg7SQpLFGakmyV7ul4a0xJWHWrKjZI4SIAQO0QBB3xh2/aPMUJXxfJQI
 1nEZSABOB3j3Yl/c/C7NRdOYr6mjPlpLFT3e7gfIGSe2ZsoaiE7zxxjJ+vgzUvgS
 a0hTGmpXg8TLzdHK2xPif1fQOG9g0bIaBefbaOAVoJEiLAjLOVH+D+QUpdoZPSMU
 DbcewYhJ01KvplSttcZGaupdKvSYPHI1G6XVLFDw+lQmWZgpawDDy0jygj0hOrV+
 CmDTa71sTUk9XlAR4teYwRSahejhmQMM1HFlpyGELpxIw2/TQx32dzm1wApl9EwF
 dNqmLXgfm2NzkA==
X-ME-Sender: <xms:SJI6XVJnmfqlIod26b9fhxMMiuJ1jBxYAqaMSJpUkaX3jOOAq6VHQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 he
X-ME-Proxy: <xmx:SJI6XfYvNUQ96KBk3i3O0X_pZ6b07rwvobAeTK6MeTljclwN3lcnXw>
 <xmx:SJI6XXCz0lUE2YFnNDFaGZk5aenft_DjI5-u8LDe8Jt2kQs4y8WfRA>
 <xmx:SJI6XZbZEVrqPJcfYoUbIqy4u1n0i0d7XVbLsNy912fWOc-FJJv4aQ>
 <xmx:SJI6XdeXLTGkF59UyS_ne131-Bi4Zgp1Le4ybwiw5SHu9ukZAN8g9g>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id F0183380076;
 Fri, 26 Jul 2019 01:40:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 06/17] ARM: dts: swift: Cleanup gpio-keys-polled properties
Date: Fri, 26 Jul 2019 15:09:48 +0930
Message-Id: <20190726053959.2003-7-andrew@aj.id.au>
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
 Adriana Kobylak <anoo@us.ibm.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

dtbs_check gave the following warning:

    Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Cc: Adriana Kobylak <anoo@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index 2077e8d0e096..9f934509ca1b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -82,8 +82,6 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		scm0-presence {
-- 
2.20.1

