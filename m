Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB029563A
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 03:49:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGqz76D8xzDqSt
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 12:49:07 +1100 (AEDT)
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
 header.s=fm1 header.b=FmwTa0NF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CPFfekN+; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGqy70myVzDqGv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 12:48:14 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BD2F55C0294;
 Wed, 21 Oct 2020 21:48:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 21 Oct 2020 21:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LeYg3ovVd+ANv
 CklcliZyb+l/2FOsOhdoIPAGLxaS+0=; b=FmwTa0NFUW8gpmahGFfIhNJxJL7GD
 MuxOJdTLH60IAfx/oy55yskb3tpipfSsj6ypKzpmgrNbLMRnI8gS4ko70KQONX6I
 Z+Py5Gnh7PshNXxXLu+kaR5BDzZWiMHFcqjDrRmOvLl422lDJVNbBYfBpBpP97Db
 fmXBpaAgouQnj79xD6vjrZJOQXi8rIvoFEgTwy+hh+Q9MOIDyz0I6DZZPe0cev3a
 edLWH6v2YgidIU+biAWYDY4shT6UMeYMWBQ2jPjDGdQMaz2jg2XAZFieCAjdEXOL
 4P6J8ynCfvBWvNLxAFZi4yhoLZamdbcxWBZsd2LL27tzpqZkalV1HnOnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LeYg3ovVd+ANvCklcliZyb+l/2FOsOhdoIPAGLxaS+0=; b=CPFfekN+
 afoxsTw2ReZK8VXfhXywv35VOu+Lwo9mEuR33aLKjjHotU+l98Iq0JfFFpR98DT0
 1NpsiPNHicP3/FbnlsvLCjL46AmYnNbeG+/yo6P7YfACcZoa7cYTd189e4U/PE8N
 TWvXzKtX3rSgaI7hSAJe1fBf14va63AmIkooDDBCcIXMMUNZV0JIaRI8UC52mAXq
 IKaQRkIT9fe64fbiR1Rj16fZZFexcuwnXrj42QZDSCczU/Au9E77DUPDS87cUTye
 41bJbgbK0c/jNLxaJoZpGRgDO6Q17wBK+y0/X16ZD51IgwyFA2tfEqGriqUu7N1A
 sHq6THzL0ZQ3GA==
X-ME-Sender: <xms:3OSQX-Ue77OQVrgmlVzRil_YfFEDPE1SYZlaVMQFZwvz0md8zzABqQ>
 <xme:3OSQX6kBpMsnzR2GKYHjXgDNyRXs6U2OXMqOcTMFkwkXV3YgaDObe7xURkmfZw8dl
 Pn2pY_weyCEWn-CMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrjedrudektden
 ucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3OSQXybjfhurgzFq8EQ4GhTOYppzWZKI19BNB-wlF6_KRBheYSDBwA>
 <xmx:3OSQX1VHBlX1WDkz8ahHjGDBLQXChT9hSdB0bOIt_dwO3x7bdtCThg>
 <xmx:3OSQX4mBYow1j71fu2DSDZb4CaG05kEFICHdCmME5d1C7snjz6ESkQ>
 <xmx:3OSQXygtGofrFxFdDKzFwKnO8iKtVmkOSTa8D-oyj-UtRyvlKEZ-Ow>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A0C23280060;
 Wed, 21 Oct 2020 21:48:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH v2 5/6] ARM: dts: rainier: Add reserved memory for ramoops
Date: Thu, 22 Oct 2020 12:17:30 +1030
Message-Id: <20201022014731.2035438-6-andrew@aj.id.au>
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
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 802027a3c43c..8431cf1b32e6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -55,6 +55,15 @@ flash_memory: region@B8000000 {
 
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

