Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AB2F58D8
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jan 2021 04:16:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGTwb1BPszDsM9
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jan 2021 14:15:59 +1100 (AEDT)
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
 header.s=fm1 header.b=TT2Y9XJx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HF7EbpQP; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGTvd5Yh9zDrpw
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Jan 2021 14:15:09 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 232F35C01F3;
 Wed, 13 Jan 2021 22:15:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Jan 2021 22:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R9UFuHjtAK1qQ
 YI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=TT2Y9XJx6o5kizRNy4MAGIOQ3EFGO
 zbWTFGak2KnxFNIfwkWuijLkhgnOb1DyiZII5Fedp85p+tp9zpOI2HIkTCIJIegI
 qtobpI5ut+stQ1OkBlXhcNBrPMJ0rCCzOoXFEPC2v6Pavpj3mj7Qj/LIPGfP7eH/
 JQAO4V7yEXROBH1KXCOZah1bwL2Iz2u09Jzebi8nU1tpHztxl4YAFCGjshUVg0YI
 2zsVe7ulI467cEo9TRq/oNlcFpaqLrWIzTKl8ag8LgcuU2XwtFnsV2jQhVxARKhK
 pybZbAHAn5PGuIq333kA9eKIUtVK9uEkXKxWYmlB46kKe40jqEtT4ENgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R9UFuHjtAK1qQYI8cmha4Thpo1402hfejrmvtlGfR4Y=; b=HF7EbpQP
 8vOfcBDfR5TAbgkPTDRBzLfAudjHZZkyokMXnIBmrF/x3ZPhlrbFoAUDk1eYHJEL
 UOAeo8ceqvZBVhw6EdZvMexEyik1K1iPIFuHKZTPE4kCJFFD4Ph0LIE/dvkPtlz4
 8gNX8qBZ9Vxx47cGpV354itsgCMU6ITIKs58HaRiQfulWLBcEhujrcSiAHO6W5F5
 8yPLxRfxRhSbo9PGX1x+FRPN/7Ag+5fEaib7luhVhOqAZhHVMpHhrNs1a6bs8z+E
 UyUIyWwkQJ3NjewjZMxA/zgGvw5aLUY7ZrWZij0fXX7+E6ZtXuPuq8mK1f0v1vbu
 Dv6seHlSr4sdFg==
X-ME-Sender: <xms:O7f_XzQ9KNy6qlVcmt1i2Zngfasko9imabqjYFTqn8DE00oWVR_tIg>
 <xme:O7f_X0zjBLAot8hRHOpN8TVeNOWzGVGTYZk81r3LsRyVOAGGwQ5DI0hyNRun331hx
 CtxGr2aJo7rlfQ59w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepuddukedrvddutddrudejfedrgeek
 necuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:O7f_X41nu78WC1fRtlTfUgy2UjwY3adVvk5f674Cwd2lTS4zbE3xDg>
 <xmx:O7f_XzAxswI2yVi9TEaOMox5rb1lfz-btQROcPMx3cbyyHJmdfDMkg>
 <xmx:O7f_X8jVAFkJ70QMsCHniftNNyyC4W8-5U1gRi5Jnt3dOhI7fzHDSg>
 <xmx:O7f_X4jY3SsE9qekIYxhARj2tVxt3yQ1S8TJhkvNZPBrlcOx5zczKg>
Received: from localhost.localdomain
 (ppp118-210-173-48.adl-adc-lon-bras34.tpg.internode.on.net [118.210.173.48])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC2E724005D;
 Wed, 13 Jan 2021 22:15:03 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v7 6/6] ARM: dts: rainier: Add eMMC clock phase compensation
Date: Thu, 14 Jan 2021 13:44:33 +1030
Message-Id: <20210114031433.2388532-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210114031433.2388532-1-andrew@aj.id.au>
References: <20210114031433.2388532-1-andrew@aj.id.au>
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

