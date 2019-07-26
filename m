Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7F75E76
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vycG4KT0zDqF0
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G2BHcXk0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RaX88la1"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybR3NVXzDqQ3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 394F222131;
 Fri, 26 Jul 2019 01:40:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HIlXPSjKgK5qU
 xVhM3BUkxF4hyG95XBN2iVQvkJ99FQ=; b=G2BHcXk0PJY9s/xfFwAzcYhSMCR0C
 DCHepIqJGNpIF2ZZdJkbsTjRizyTOeR/1/E9mhNgWgI19IZkBGnni8NGhgr4UETb
 xx+9httKsAukin6Jr2QRz822tnDNjZa5mdo1YBTUzKfiKshsAQL7KcweOWm9UDmZ
 /5wUdHYvm8XK6Kplb3i7SMZL3W/RiyqpcbqUGK8/AuyK2jQcLOm1CQZG3lw7lKkK
 L4nAWwkeh71f/8U2rb2aF22S8tdEby3plP23AxXu6KoBWfXVOnPmunup8EXd0NA+
 wRp6JD81sLzqefeGj6hQ6SLIgXx0LsCclX1ZcTjq5XvWYSBxc/eXWEigA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HIlXPSjKgK5qUxVhM3BUkxF4hyG95XBN2iVQvkJ99FQ=; b=RaX88la1
 /8mfNU9bjbL+KsZrAQIMq5BHujxJYav2lzb0uASDWeogcfZzmCQuyZrxT34iBLJC
 D8u7Lv7pWDjIzFE0LCPPswMaw56qKGl7/AyKQCxl/2s28qfvBRj8w4RszXkwZ5Ul
 IDwQ6VIQ6P/fBqKBGsG2tjxItHHeW3AqooPJgCd3H+sAgUOSbMHuDKk5ghaqT76b
 5zxDeDW5k6BGcO5+BAPxKyzxUMv2ZCWhY85TrRFosAQil30INRhK6REo3yUTfvj1
 K+Tx7GcI7RttQT1pa+ZG7PCpyZpqdXsLFGOQg/9bk9G4RdDPbTr3xB0lis6xxQ7z
 Gf+VBKKcoeCHcg==
X-ME-Sender: <xms:QZI6XbsKaVGsM-KOKcH713c2RoXLLPECCb7af3KTALJQ6bs-5p9Edw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:QZI6Xd7lsMlldboqtKETyZcNu4OQ387q6XMenBKZoSZ0-A-comDLAA>
 <xmx:QZI6XaKLNWBDVqr0dKwFExgmjJjkbJbxClWYxnurdDJhv0EE_EmDHw>
 <xmx:QZI6XXT09mFm8fjXsnRj3MivOzSX5BMYuZaodn6WFqL-WbwAggHcrw>
 <xmx:QZI6XYJJsJWWmL4I4lKgTtwX6o-uF79RdcwLgSe-rZzpQI0YGLyuaA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1ECD380076;
 Fri, 26 Jul 2019 01:40:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 04/17] ARM: dts: vesnin: Add unit address for memory node
Date: Fri, 26 Jul 2019 15:09:46 +0930
Message-Id: <20190726053959.2003-5-andrew@aj.id.au>
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
 linux-kernel@vger.kernel.org, Alexander Filippov <a.filippov@yadro.com>,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fixes the following warnings:

    arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: /: memory: False schema does not allow {'reg': [[1073741824, 536870912]]}
    arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: memory: 'device_type' is a required property

Cc: Alexander Filippov <a.filippov@yadro.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index 0b9e29c3212e..81d9dcb752a0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -14,7 +14,7 @@
 		bootargs = "console=ttyS4,115200 earlyprintk";
 	};
 
-	memory {
+	memory@40000000 {
 		reg = <0x40000000 0x20000000>;
 	};
 
-- 
2.20.1

