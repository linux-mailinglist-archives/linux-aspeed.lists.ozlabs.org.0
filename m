Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A13D35DF
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 09:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMDS5Z5qz30Cr
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:59:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=d0ZxzPrI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KVj3Hgfs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=d0ZxzPrI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KVj3Hgfs; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMDQ0JLmz3029
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 17:59:50 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2448D58163D;
 Fri, 23 Jul 2021 03:59:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 23 Jul 2021 03:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=yMNleqijxoKWL
 G2/iRJF83Hp6/4Eiy8KM4eaq0aduKo=; b=d0ZxzPrInqmmJP9WyhsLKYYrWHtdz
 r5nUAh83q6FssL1zuVYuCT3Kx5bWW/WpfCmg5IdWiSa+E1Xu8kWFG21GY4ZUwg6+
 KU3YlW3jjKfCgAxzzZx1ywevWx4/NuSvUq3ltkyRR3BRnCHMtMBe1hyeOvWW1dkV
 HxEbV0QoBIPOROvEju0lOlDYLOQ2G8p1pKrP4W2ovSxx8VmMNByFpzx3GEA1isdX
 JFEqYUj9OzdWxqyAhu0gmDed5dTRvPWPdk97etYuwNgXk/QYMRn4cP97OHVvVazp
 k3BL5fXVxEU177pOY3vFB/q50Br1eG9YtCs1OXjVCUoS642Zv1EnlhNgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yMNleqijxoKWLG2/iRJF83Hp6/4Eiy8KM4eaq0aduKo=; b=KVj3Hgfs
 h6uD4VUrAKDHz2z3yxYCgknIa1eJ2IjcSO7JVhUu/zgJVuH9bWcR+tYTrEOl/nnK
 6goAiSC2RDdqXn2cTQN8usnF2OiHVNaUNf73dNHz6YFipat4GXpV7NAUUJ3FZ/nG
 eBHMQO8lhtgmrZcDrKnvyW+DupCLTool/bdTQa004zAC2YFGj3pCzP6gnhxkF+Z2
 HSCRNo3NTqyL0Pvn2EAop4qM40IdLsuHLngRtqKEyyMScsV5Qf1xNq5nq3UQLwk7
 4QuglNsdYoHmVdp5Kk5UYwyYLZluxLM9nIXi8h0LFXT55QLCv7kG6UaZscxrtXsw
 8fqkFHBTAykO2Q==
X-ME-Sender: <xms:9Hb6YLyFT18ne0OgjIDNlyZvzB3qm98YUIj8kpgdlA35RWY1HnQmdA>
 <xme:9Hb6YDT1SKClqAJKJySJO9OA10ZuRaYQ8t97_MtZULFsKDaJ-4cfT0Skrts0WkPpx
 Gj11zdp46grUfEtdA>
X-ME-Received: <xmr:9Hb6YFV3reaabvItKImLjAvReOMz5Pu3wvHtqRYJ7sixj4K4Ntm1cgWWgZNtsbbNlkD15QP20TTXfkDT1ufrEgK_KvrrXVlkNRlQgxSTDaEoKzHBeU2XlNynJNdAbaKIenMisQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepudenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9Hb6YFiZUQ57LeD5qYIvtHdKw_99Mb3Vws-oQWyVZMRHbYVz-kW9_g>
 <xmx:9Hb6YNAe51HrnXFshOVt8wgxQeA1150f6NCTFV7Vz9Mf5qc6gjJG1Q>
 <xmx:9Hb6YOKavc3rizlJQnMPU2Bui15Hzhv3HJmh8lP5Pv-LGHVGL_Fi4w>
 <xmx:9Hb6YBvA395xYm1aCRhZoyUV2J_Ma808wRhqs7uCPaJbJ3F4cDlG-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 6/6] pinctrl: Check get_group_pins callback on init
Date: Fri, 23 Jul 2021 17:28:58 +0930
Message-Id: <20210723075858.376378-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Do configurations exist where this doesn't make sense? I lost some time
to debugging the fact that I was missing the callback :(

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index e4862552eb9b..4c436a419856 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1994,7 +1994,8 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
 
 	if (!ops ||
 	    !ops->get_groups_count ||
-	    !ops->get_group_name)
+	    !ops->get_group_name ||
+	    !ops->get_group_pins)
 		return -EINVAL;
 
 	return 0;
-- 
2.30.2

