Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B723C10FD49
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:08:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S13613nYzDqWY
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:08:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XxtWYWUR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ETp2ylEL"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0xb2Xt7zDqVb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:03:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A5BA222E3;
 Tue,  3 Dec 2019 07:03:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/hvogHduJxRwm
 aquvl+a1y8LeZNJY1nYzSCajcYwu10=; b=XxtWYWURLN8iLOs50KYgoLDM1oI31
 THAkwVkFcoEnWV0VQZYvWXIn6vj88AwN0pvN+fB76dxQ9O2QRi1gmxSpaQy8hGLj
 k2PKPvxup67PCQ1tlPqBKQUs7A+Ey/vJ0pHydKFIOSAv1I7g25FAnfYpjnBy0jM5
 Pd4FdWVqxUf3/468ZhmCiTnK+BVIbcpN/0Ypf9INXP29eTh+YIAOKrrFQrdWmZJf
 3uRhD4p0eCsbMTvYluO1L+0VxTvx1hQvg0kaSA580/iUMoSOMl7EUQ2vSC5SPyh+
 wVA3RXDwmJs42wEJYpAeZE1GwRm/MzwYlfLEswucCmdbczbkWMHYhEeWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/hvogHduJxRwmaquvl+a1y8LeZNJY1nYzSCajcYwu10=; b=ETp2ylEL
 ojiAh0jB3UPPj51x/rVpeUhR1bfhA+nm0NkVfi9nmXEwtMny6Ye9kLcuKJn87ZJQ
 fRWzc7/nBZxY/RLuoeaEn+ROIJnJ7raWOTa2cc1Pkzbn20BbK6pTojLHMbrpcoIK
 niInPPO5sEbKpdmH8gkSWtW3Il9KKjRyfykeVj0pY44aNuKG1E/geOaTkpRKgv4y
 2xbvmMQ8TfqBgrjue/MgKJeWojr52wWpzngfGffaK+n3jtGg5JeJGu6Rln8bIIZz
 D0zh1eBvxcEL8mROl2RB/lWYmoEgH9sUy7jvE6sfbAodv5N7Qxk8XG93LBXlJzNM
 RVRKqQAsyGRr2w==
X-ME-Sender: <xms:EE_mXTD2kfha3HtSndD1MjH1TbNt40rf5KeuUoY28AjzM67zJURfVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddu
X-ME-Proxy: <xmx:EE_mXS0NH7hL0fw-a4Sb_6okbdMQApewa-Gh5EvPPuEot3XzzHMrTg>
 <xmx:EE_mXa_J0HYd8JQvXkUdVeSzJAK_cDsRykvnaCeQImcC4nqTCjQB1Q>
 <xmx:EE_mXdU5NXfIu8V-xfqBy_VpCRK6-QqZ1CW_t3tFgBWhEv2khlL0UQ>
 <xmx:EU_mXUQCt3dZnkp4Zb7yIrf_bSqceuC_yelaGzKINceRqDqFwPWvug>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E96030600AA;
 Tue,  3 Dec 2019 07:03:26 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 12/14] ARM: dts: aspeed-g5: Sort LPC child nodes by unit
 address
Date: Tue,  3 Dec 2019 22:34:13 +1030
Message-Id: <b45b4fbba8d80c1e6d0603f2dd0c2d3d69efc62a.1575369656.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
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

Lets try to maintain some sort of sanity.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 57c9e45c9e16..954781b82fe3 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -473,17 +473,18 @@
 						status = "disabled";
 					};
 
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2500-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
-
 					lpc_reset: reset-controller@18 {
 						compatible = "aspeed,ast2500-lpc-reset";
 						reg = <0x18 0x4>;
 						#reset-cells = <1>;
 					};
 
+					lhc: lhc@20 {
+						compatible = "aspeed,ast2500-lhc";
+						reg = <0x20 0x24 0x48 0x8>;
+					};
+
+
 					ibt: ibt@c0 {
 						compatible = "aspeed,ast2500-ibt-bmc";
 						reg = <0xc0 0x18>;
-- 
git-series 0.9.1
