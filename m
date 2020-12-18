Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 587732DDD73
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 04:54:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cxw3m5rwtzDqXY
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 14:54:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=dqc7UpKH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OF9XOxZu; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cxw3X4Z0mzDqXd
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Dec 2020 14:54:32 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 945275C0115;
 Thu, 17 Dec 2020 22:54:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Dec 2020 22:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Q1FwOOJn9VJrF
 xg4mu6zSOR772E69sWYabsnaXN/CgI=; b=dqc7UpKHs8arqoIaKPwepMkO+ZqbE
 74vwIesaPS2J60ELgm9Ggg65Q2TqpZ8RRU+X1nWN6cO6SvAF3xrZWNnmwsD+wO46
 BKeGZ3roRDy31zwvBR/zJsVn1l1YQYMEEIEAxwpYjRlQ7k22GabHkBGOA7CNGNRm
 IT/VnGwSBuiZedloqDNkYzjTE2gWgdqsqymFk7vSgF/OYc9vQixDt1nM62qDNrWw
 jSaSg7EPx4UYGaTvFl/2o3zFeS8PqAbQ0SkKTh5naXCkaXKnmuQhD/2BTChqvM+v
 Kae7/kjWdlaq6IaHoUTO5rRgq0TlrniKNZbFemuHGnkeHoDKKo26cmQdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Q1FwOOJn9VJrFxg4mu6zSOR772E69sWYabsnaXN/CgI=; b=OF9XOxZu
 oR7r0fVEWhGVNhedSC1BYAJ2Ao/7t+R3BhpwgG0uHJh7pZnMpvYc2gvFWGU4IwIP
 O2pzwG0fbseOrBS1w7xkoXOjTNVhJoY5g/8CZSSQwYjUd8mKnKgBgNchqcXwHcOH
 a65GluG3jdSqET6HKsRmgFMunLPfKJ5zVRVjYCfNiZUxqzqsnkktWV9gtHqohLiu
 kCkBD7RoQSLhSYaA5cNM+iDObA4ha2UJFPFsiGlzUVvFcd/9ZDhsc7XDOKO1IIy8
 3Cq0Xy2+b4KGRuxTAYH2qV0PpcIRhuD5PSfkSj+cdr+FZypZCGNtlUimRmwzjgUo
 OkV3pDQoAgDECQ==
X-ME-Sender: <xms:9ifcX0VYLMr2iNvgyeYI2JwFnGD5PzgfWmz9IWdSaVK92xEpe8tDbg>
 <xme:9ifcX4mvwWk4SH3hNWvVu-4dA6DJ5uJnJHoxpkm0pV6SPLiO0ic-8faq475AWpFvr
 FKsDmpcq0sgYtzDeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelhedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduvddtrddvtddrjeejrddvuddu
 necuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9ifcX4Yr2aIX74Y4E0BRqCyxdU2yZCQq3hrV2Ss2R1-neenPwm2RXg>
 <xmx:9ifcXzVY_QtRceW-p9oyO7cz8zz9jVSaHGHL4zRBKuew7l8EpHv_Og>
 <xmx:9ifcX-nwPTvKnYJRPRsMwld2SQvkYJ6QxKyaZylFUhc2nOcEdCKyVg>
 <xmx:9ifcXwUuCjqhnib2hOw04Nxhl_om-cRQAkkqi8Zkm8KvGlUiv-uWAw>
Received: from localhost.localdomain (unknown [120.20.77.211])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5FF7108005B;
 Thu, 17 Dec 2020 22:54:25 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v6 6/6] ARM: dts: rainier: Add eMMC clock phase compensation
Date: Fri, 18 Dec 2020 14:23:38 +1030
Message-Id: <20201218035338.1130849-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218035338.1130849-1-andrew@aj.id.au>
References: <20201218035338.1130849-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Determined by scope measurements at speed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 21ae880c7530..ab8d37d49f30 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -186,6 +186,7 @@ &pinctrl_emmc_default {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
 &fsim0 {
-- 
2.27.0

