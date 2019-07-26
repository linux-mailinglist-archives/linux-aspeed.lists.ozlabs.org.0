Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2C75E81
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vycx21Q3zDqQV
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nJtUPr2d"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="koCsYE2C"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybd6RFzzDqQb
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9076F2230E;
 Fri, 26 Jul 2019 01:40:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=oSDr1xjwZ4K40
 /MK5vRNInuje81HUcQkw7+j8FhaZBE=; b=nJtUPr2doNBzYfahf8HEQokqeiFLZ
 sxeJD+ChRqORwbEUNp2ySw0VWf/IW4BFBtsj8LF7E3xy4azYDmrqEwWTZH/XylqU
 6ExCjwaOdxoR3x5V4+xW3lmboHwDfLRv+x+GyBXHroFn0Udupku4/8PfZRK0iaHz
 OIcbJP9v7oK1XMLmyVNtjxQeNc7Ylq1LLSkvpSxQ5qNsP479LkzvmllqT15OEDkD
 +Hg8b66dHkUxawRoVBDxRxIY1BWsUkQkRDjvHyabgigeKgOVonW7Q+zXkdi9mbJA
 x95QvYoh5Py91eRV/KGM27DzbGB+BM5eywVuw2cPqt1HWL9YXApa5Q1Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oSDr1xjwZ4K40/MK5vRNInuje81HUcQkw7+j8FhaZBE=; b=koCsYE2C
 IS3NbTVKd205d2oxynUGvnCbRE+BzZ2S7gSFgGE6pLPpu6TzObSirDmZEgFHTlDR
 Uh+7CeQ5dj3l0NEey+0jbDWFa5Us0IB5tqWsAaouibGTulb13XenSoZdSY0ENxdG
 SJgY6aAGAxGPg2Wg2VbtQ/UuiqxehM9wMMvTZKuGSxrzbyMU89kwu4afLR4vrbMC
 asYL1onjFlM1edk1I5Bhq3Ee8ets+iiy+BH0d5P1qzn/2uF3nM+PeWa7GoAdJY54
 482QIu1fFfKbbUFwsJJLkCzFNAfKkWOjLmzu4VFclD9928yPTJC53xqlIV8qvRQd
 41p5QBA2htFYlA==
X-ME-Sender: <xms:S5I6XfUrr0Gmg07ph10mXzZUDMAXM-CP0EE6xar9s5fY7_Ih7B_OPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 he
X-ME-Proxy: <xmx:S5I6XZH_kNpc_dcrOsnGt_JkI8VMWZuPEGTGxWgr8QMOA0ju1li6wA>
 <xmx:S5I6XbfTGuLD2lfstgbNJUp4younmbw9PgMHVsYDcU7ExFBZDAdWnA>
 <xmx:S5I6XaLoUkJX4Ziz1S267mH719wEXmgMNya4XB8HMZLcfhL1m3wdUw>
 <xmx:S5I6XV7hUmOJCV17GTVRUg4FwAceJNDlkG5Farmrh2b3GjXrkTOHvA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D6F8380076;
 Fri, 26 Jul 2019 01:40:24 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 07/17] ARM: dts: witherspoon: Cleanup gpio-keys-polled
 properties
Date: Fri, 26 Jul 2019 15:09:49 +0930
Message-Id: <20190726053959.2003-8-andrew@aj.id.au>
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

dtbs_check gave the following warning:

    Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 08facb2120b2..06319c6771ca 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -77,8 +77,6 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		fan0-presence {
-- 
2.20.1

