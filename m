Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B835742C4
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jul 2022 06:26:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk1dw6Sghz3c3y
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jul 2022 14:26:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P8boJ2oW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P8boJ2oW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk1d95jQPz2xKf;
	Thu, 14 Jul 2022 14:25:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EAFAA61EC3;
	Thu, 14 Jul 2022 04:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1F6C385A2;
	Thu, 14 Jul 2022 04:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657772745;
	bh=i8j8lN8pZ+HBk9c+r3zEGf+7yulVsOuUqHCIcEWp5X8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P8boJ2oWMc1eMcBkSFOxAcRTLiIaMgqNWYCVfjv4Me5M1QZPrZJpJHrdqrfRlezdv
	 679LT6yyP5feH7yBSniPe0rkmLzlZm003LnbLyFhmLlXpWE+Op6LovE9uX1idXG11S
	 V8GxVz4OolZU+zbPg9NDlzAHGXvnY+hEh2sKhBCo7y/QW3PbsynXrl2t1ExoTdpMI9
	 +Z2G0dS3mUBGzcu5FF59nt18Ejd6GZqTORns78p9uh56lJsRh3395KXr5ip3IwfEqb
	 XumVlbAM3C6Zrp/LwWnYsTerMI+tM4d2Ic2TqEDsBtngYeiIySv2wQHedKjnbDrCnX
	 H2i0PqShSJOxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/15] pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
Date: Thu, 14 Jul 2022 00:25:27 -0400
Message-Id: <20220714042541.282175-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042541.282175-1-sashal@kernel.org>
References: <20220714042541.282175-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Haowen Bai <baihaowen@meizu.com>, linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Haowen Bai <baihaowen@meizu.com>

[ Upstream commit 84a85d3fef2e75b1fe9fc2af6f5267122555a1ed ]

pdesc could be null but still dereference pdesc->name and it will lead to
a null pointer access. So we move a null check before dereference.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
Link: https://lore.kernel.org/r/1650508019-22554-1-git-send-email-baihaowen@meizu.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c65d560d48f..e792318c3894 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -235,11 +235,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
-
 		if (!pdesc)
 			return -EINVAL;
 
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
+
 		prios = pdesc->prios;
 
 		if (!prios)
-- 
2.35.1

