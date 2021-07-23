Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E643D35DB
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 09:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMD93lDKz303c
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=JSZnIxLp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EeTsDFpJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=JSZnIxLp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EeTsDFpJ; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMD207Vkz301k
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 17:59:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1EAE1581648;
 Fri, 23 Jul 2021 03:59:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Jul 2021 03:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FL7d3DKD/w/mD
 2Cy6ISU7AvGUnJr6NtK3PC+jbi7Vek=; b=JSZnIxLpHBR3Njwf2tb7V9IoNe/HJ
 jylTJnK1aspzSiYLtzIXiWXN0emgYGI7xozW+Xobmzh0k+s08qPx3qT9G/m6XNNM
 M3ExHWI34mojpdfjTqDgMHXrUHFtcvklGzx2hYcjy2vjCjLtXlCvrjHNlR+bb2iy
 zsNftFoEgxWr9dW2wbs9CWwHErsfz563TCpqBUPJH1TJdy8HM05B8o/3aTpFplmx
 ozGxM50nYeZ/XlEnyhYqcVwFNcBSjD5tV+Yk2wI0vLy0lbsIXml0MbQzqkdKcwkM
 wtMaZcNzUP1UR1AjcXAyEP9yqMd90265R8QimGMDhKNLeJCBk/MrmtwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FL7d3DKD/w/mD2Cy6ISU7AvGUnJr6NtK3PC+jbi7Vek=; b=EeTsDFpJ
 AHLazN3xvoV6v35U9PMiextcf+3Jrm7k51n6N/W6EdwQoCOdjRvAZttJGCow4/SA
 9vtMd0JULQzphfOkUNBCYpIcPyLIjcFplJvE4TXYLU/ADy2PJkVAt4yNa2p3tTqy
 Tlr/jmVdSIG8iZ1BbxxKdU1anCBrQYQyneIE6NmAX9BGuITYMzEFTBlVg0KTmf5y
 q0G6s4akqYkmP6KA9FOxCyyaoVoWuCstE2jAUvQlDdbCEPsTATEDutKn4LpLjz3W
 c4cyDeIdm4vS8CelnRSCOuagPTGQooqA2f4d8M41Idyp7Rp8zKlhxsT1/Bl/0jmK
 5bberMT3Bc6cZQ==
X-ME-Sender: <xms:4Hb6YEVdM6piquGt5Q6Ee6U0l4JiHVTShf_TFjK4ihAt4AF-OK6iPg>
 <xme:4Hb6YInQPLe19jkBnz1RloDT4bRIW-aG5mIc5Bvuc_PvNJxcreqBtCXhkI2ImAQgS
 scf-QTnr4rBImlqpA>
X-ME-Received: <xmr:4Hb6YIY47Ksx5e8NCSP9J54FohptXMT-ie_JMb4MGQDKP37S2KT-lvPQoAY3dWqs9sPR0YOq2YJaNdiJaLhGvPnz2yz7po-dafA4xyglCUz5t6hEPSTVBVksxvLwt7hcvGaepg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepudenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4Hb6YDXhxwIZv9hQeoKLOmhqwIPcYj389UpJQspeyJ5iAaVr2hMUKA>
 <xmx:4Hb6YOlFkJJzAZSfIoo800VTgv3Ro8SnvgP8zkuFYtf2U2iUtMBilg>
 <xmx:4Hb6YIe27wchFW2sDHbQo3E0gVrXDqH0utiv6zOwdms-aqeJCxnV0Q>
 <xmx:4Hb6YDi5m00nPkURVXoqVhl7PUCQhJ-QRvJApJMBg9EQzrhpDpBeuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 2/6] pinctrl: Add hook for device-specific map parsing
Date: Fri, 23 Jul 2021 17:28:54 +0930
Message-Id: <20210723075858.376378-3-andrew@aj.id.au>
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

The devicetree binding for the PCA955x LED/GPIO expanders was not
written with pinctrl in mind. To maintain compatibility with existing
devicetrees while implementing pinctrl support for the PCA955x devices,
add the ability to parse a custom device node layout to pinctrl.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/core.c          | 6 +++++-
 include/linux/pinctrl/pinctrl.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9c788f0e2844..e4862552eb9b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1063,7 +1063,11 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	INIT_LIST_HEAD(&p->states);
 	INIT_LIST_HEAD(&p->dt_maps);
 
-	ret = pinctrl_dt_to_map(p, pctldev);
+	if (pctldev && pctldev->desc->pctlops->dt_dev_to_map) {
+		ret = pctldev->desc->pctlops->dt_dev_to_map(pctldev, dev);
+	} else {
+		ret = pinctrl_dt_to_map(p, pctldev);
+	}
 	if (ret < 0) {
 		kfree(p);
 		return ERR_PTR(ret);
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 1ceebc499cc4..2eeec0af61fe 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -95,6 +95,7 @@ struct pinctrl_ops {
 			       unsigned *num_pins);
 	void (*pin_dbg_show) (struct pinctrl_dev *pctldev, struct seq_file *s,
 			  unsigned offset);
+	int (*dt_dev_to_map) (struct pinctrl_dev *pctldev, struct device *dev);
 	int (*dt_node_to_map) (struct pinctrl_dev *pctldev,
 			       struct device_node *np_config,
 			       struct pinctrl_map **map, unsigned *num_maps);
-- 
2.30.2

