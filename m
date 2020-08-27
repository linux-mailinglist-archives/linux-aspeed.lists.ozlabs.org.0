Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B3253EA1
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Aug 2020 09:08:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcYjC60BrzDqcH
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Aug 2020 17:08:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ky0xDoZn; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcYhr4S4WzDqVv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Aug 2020 17:07:56 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC1F522BF3;
 Thu, 27 Aug 2020 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598512075;
 bh=Fn0rZm+UtPquTJVp8C3STQQnW6xRFaI+UQd529qNQHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ky0xDoZnV/jmiNfyFyChdT7vic/gauQEEwtiEYul7mLAQudlJfM+0jIbLXxpvd2Az
 oSApf3UxVOg6tJTW7MhA9TXFAtc2qlTSpXslGs40e3yr9biRBrAQLBa+v4NTfueJMR
 nWIjPh73I4zUJ30pIHgJZ21nvNoz3Hq1k/UYT/jI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Tero Kristo <t-kristo@ti.com>,
 linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] EDAC/ti: Fix handling of platform_get_irq() error
Date: Thu, 27 Aug 2020 09:07:43 +0200
Message-Id: <20200827070743.26628-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827070743.26628-1-krzk@kernel.org>
References: <20200827070743.26628-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

platform_get_irq() returns -ERRNO on error.  In such case comparison
to 0 would pass the check.

Fixes: 86a18ee21e5e ("EDAC, ti: Add support for TI keystone and DRA7xx EDAC")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/edac/ti_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/ti_edac.c b/drivers/edac/ti_edac.c
index 6e52796a0b41..e7eae20f83d1 100644
--- a/drivers/edac/ti_edac.c
+++ b/drivers/edac/ti_edac.c
@@ -278,7 +278,8 @@ static int ti_edac_probe(struct platform_device *pdev)
 
 	/* add EMIF ECC error handler */
 	error_irq = platform_get_irq(pdev, 0);
-	if (!error_irq) {
+	if (error_irq < 0) {
+		ret = error_irq;
 		edac_printk(KERN_ERR, EDAC_MOD_NAME,
 			    "EMIF irq number not defined.\n");
 		goto err;
-- 
2.17.1

