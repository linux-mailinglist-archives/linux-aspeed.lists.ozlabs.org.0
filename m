Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B642DDD72
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 04:54:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cxw3g09SJzDqWj
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Dec 2020 14:54:39 +1100 (AEDT)
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
 header.s=fm1 header.b=I599+f2i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=No0JzjlS; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cxw3R3b8ZzDqXS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Dec 2020 14:54:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 71C3C5C010D;
 Thu, 17 Dec 2020 22:54:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Dec 2020 22:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3IBtn55EkJHpw
 BMNVFMzrRkc/Dri1oJfvyFIx80EIec=; b=I599+f2ishGKydUibrqBNovepABuc
 Klh68PJWbwbq/NchtlJvvkqhhsL+KbS7LKOIHaVMjoXqA2GZiDMBJ1lqVMz2jcye
 Ho2HEs9bj3jHFwbwnIYXXVs+4To+VeO28JzsmrGd+QlOjo/nVAPFqgJDiVqhpEkT
 l6JtRsRgE1oOfpjrPdj/BW/tV4dhLqVJf4T8jtXLPKgErxj1oEGR7t/mK9wUoBjS
 bbWlmOwo9YKo02PhbOl+sxQwFJMOM1PmupgbbQnRM5zqTAqcx765y2BPyvW8htuN
 j6+Iu9wU2VZVSuFyWT+rrBRDg9XV57Gb2YW9QCkRVKravRUIicfmEje6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3IBtn55EkJHpwBMNVFMzrRkc/Dri1oJfvyFIx80EIec=; b=No0JzjlS
 VUq20GiuVnRLf97riXOVRZ/jmJXwEQfL/5F6LSAS0l4JxiMMEpwvAFqc5c6lZotL
 JnIjyCSzMOS4QPUEevFMabkPObLQViCYAT4RjU1QQyqQzsrHNcCILM5uHstppJ2z
 9UoS5bJBbcrdj1zAvG8zEzOU6tK74UY3GzlCNXPhXw1TsWTzjwEfB3hEEe7aIutV
 ii/oImwla6tCOCiCsMHx19bzZ0m1hH6lTi90WK5U87f7jmgM3PANY58ZfFJU9DP9
 9EhFCoBTqeMjLQSVmP2Csp8l+7a3ASXHZKC1/PIeqpXSygRsDnMyBWakaCGtCQQi
 YZr08Cv1GRKPTw==
X-ME-Sender: <xms:8SfcX5-yN8e5rHjpWXjYZAWst__-QkM5q3os6tQgY9r3HUL-vVXxJw>
 <xme:8SfcX9sDvLG7l4lRVsdENjOnBZKVYi5CzUdsAq5HFT6L5LV5cPn9WEBp9cas8PPyu
 5_8GkIb01NIP5hfpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelhedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduvddtrddvtddrjeejrddvuddu
 necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:8SfcX3C-yAfXDFKu9P-vx0dDr3CrkNwJtlhnCiEVEO7ae25UAfRORw>
 <xmx:8SfcX9chtZ9rdU_rSm4RXFrCY7l2gqVk7G3f6Ys2_uX86ezkN0TIzg>
 <xmx:8SfcX-NW_pwVdRhMof2QNIW6IADVj4TY7KjGOQztKFDvtGZQCZH4Uw>
 <xmx:8SfcX9c6ampYPqY846-4cqnK-tzlbDfkHo8RdraBByFbtiYnQIxzxg>
Received: from localhost.localdomain (unknown [120.20.77.211])
 by mail.messagingengine.com (Postfix) with ESMTPA id B02D4108005B;
 Thu, 17 Dec 2020 22:54:18 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v6 5/6] MAINTAINERS: Add entry for the ASPEED SD/MMC driver
Date: Fri, 18 Dec 2020 14:23:37 +1030
Message-Id: <20201218035338.1130849-6-andrew@aj.id.au>
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

Add myself as the maintainer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f..eae4322aae67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2826,6 +2826,15 @@ F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.
 F:	drivers/irqchip/irq-aspeed-scu-ic.c
 F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
 
+ASPEED SD/MMC DRIVER
+M:	Andrew Jeffery <andrew@aj.id.au>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-mmc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+F:	drivers/mmc/host/sdhci-of-aspeed*
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
-- 
2.27.0

