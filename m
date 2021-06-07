Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF139D29E
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 03:31:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fywmy1ktrz3036
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 11:30:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=e57ywDic;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jrfBPDSH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=e57ywDic; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=jrfBPDSH; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fywmq3L0Tz2yX6
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 11:30:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 900305C00E6;
 Sun,  6 Jun 2021 21:30:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 06 Jun 2021 21:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=GRzcE4hI5AG2i78thbcMf/cB97
 dZ01L3NdzHyw2+Nv0=; b=e57ywDicKtu87q+d8RSK+Uh9L+fpAXqXjvcuSEdrNA
 4iHp3kY2ObBLPAtZqbbaQoNrY3Fu0qtd3G5q2F6DRnpOwCTgsK1qNs4Mvo0tiARr
 Bnyzxq8IzTvKZC5PlVnAWHSNAB2/yVEFYp3Wr+eA5dYW1X+uSqllNBfCrOgL+sZO
 m99glIg3eGoyH1S8TIDMfe/EFMEKv8gkrY7mgGibogV+eGPZ0SA/ZT3GBWJvonM2
 MoW3Odv/3r5OInfFmeQzpPXUC1yR0STMXiHw4RNszb++wEDNNbpZbAIMIe0xrxSp
 sEtXFbNteFGjeuoJ0xdpsT9LrJFmzzaWDYPJdrts6PIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GRzcE4hI5AG2i78th
 bcMf/cB97dZ01L3NdzHyw2+Nv0=; b=jrfBPDSHqWTSn1tTrDWLEYuUwOHA3dRg2
 r3x5OHNhDPozYBJj8tiGWPYrcTQtUvroc2ghN9bfxBIAjWsFwrCo92r1AFUYnFCi
 BIBo5hgOwRTIaF283gcjpHZdoIBIwHr2nwcvN9vxa3NBVIHuLR6K70Fct1CB1XkP
 tqh9oG79mhDBYV9bG52Wg+H5XAYZ2+R5KExo/m7qV+7oEuXW6Yf6Q60VMtBGjDYY
 yTY9andCckGWOBT1ZI9lBNuAKyYLqovPDnuOiWtyW+2XFooce05pfBRt+cLqvkIK
 i4lhY+l3xRT9dbFjeSNZs0QKRbeTNOXlvU1qzOFll6y5rAG4szjyQ==
X-ME-Sender: <xms:wXa9YEWDXwXFZ6g8NYlLZY_702XFeDVqDcXqN61vA4OdvtGDD5vqAw>
 <xme:wXa9YIn-LDtYf-omv_F4Kquy7u8LEEQ1Y1iMyHkNfLIg5mreol-J5IfL4BLGsK8nD
 BigXcdMJ5GE2iMrHw>
X-ME-Received: <xmr:wXa9YIbOgwrK3i4IsRFBsD2AHpHvLd1Vgl_naaekebiFIZpr6wyN1sFZctMZicU73zF8-YmsprQUX2MioLZOspj1aFld352E2Sc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:wXa9YDW_FsLN34ITeOFGjIeUOTXP3_6AE6GpQAYsYLqgC5f8my6Jgg>
 <xmx:wXa9YOnLmIp8wO6HSs98XjMzbLoyEgoTDkZSnkh4R-hUXYKZ8fw1cQ>
 <xmx:wXa9YIfE9NN3M8bUSqsZfw_sf9fUhZiipvyQY7pJYvRzl06OLFvb3w>
 <xmx:xHa9YMZD-CLNWEsaYLvqgHtO2oNiOxVYIBaF_Dsn2Kv0788WEYsX0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 21:30:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-of-aspeed: Turn down a phase correction warning
Date: Mon,  7 Jun 2021 11:00:20 +0930
Message-Id: <20210607013020.85885-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 steven_lee@aspeedtech.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The card timing and the bus frequency are not changed atomically with
respect to calls to the set_clock() callback in the driver. The result
is the driver sees a transient state where there's a mismatch between
the two and thus the inputs to the phase correction calculation
formula are garbage.

Switch from dev_warn() to dev_dbg() to avoid noise in the normal case,
though the change does make bad configurations less likely to be
noticed.

Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d001c51074a0..e4665a438ec5 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -150,7 +150,7 @@ static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
 
 	tap = div_u64(phase_period_ps, prop_delay_ps);
 	if (tap > ASPEED_SDHCI_NR_TAPS) {
-		dev_warn(dev,
+		dev_dbg(dev,
 			 "Requested out of range phase tap %d for %d degrees of phase compensation at %luHz, clamping to tap %d\n",
 			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
 		tap = ASPEED_SDHCI_NR_TAPS;
-- 
2.30.2

