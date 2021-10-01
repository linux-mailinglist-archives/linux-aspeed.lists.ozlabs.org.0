Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A741ECC4
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Oct 2021 14:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLTFr40nlz3069
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Oct 2021 22:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=p1BeaFQ3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.120;
 helo=smtp-relay-canonical-0.canonical.com;
 envelope-from=colin.king@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=p1BeaFQ3; 
 dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLTFl13Jtz2yhl
 for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Oct 2021 22:00:26 +1000 (AEST)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C559440186; 
 Fri,  1 Oct 2021 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633089618;
 bh=xoVeBwEbq5yYbiC4MKK88HqPxlCFGkYEHA+6yK4TZTA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=p1BeaFQ3coUHtNeEOxSWXmLfJIOD2R8e8FtDlN3E4OAKig7Wd0rxW1Mhx1drNO9dX
 w2rjQ/A32OQpuUe9lrBVfHweu7KZpUGqXto90jf0HrDEWLwK2PamMgJ1ww2eWp6Yrb
 NK7ppO1l8n73F38kpKfYvqC7rBI/eqJgZFPFax2xWI+5ExE8KBYqQPIjLjhHezD17O
 deBMeiL8VLAygvegr/ER3nWo9st/BgZfYnDEpKly73jSCo2Fp/71ZhdWDnY1pA5Wqj
 V867cDEXBTLiDirFjE4hpUN8vmOrJymx7xtcpP3xL5Ir3mNRnV2SjLao5vHv2thlVc
 J8rTqh+z6BiZg==
From: Colin King <colin.king@canonical.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH][next] iio: adc: aspeed: Fix spelling mistake "battey" ->
 "battery"
Date: Fri,  1 Oct 2021 13:00:18 +0100
Message-Id: <20211001120018.17570-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/aspeed_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 3e9850a43372..a957cad1bfab 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -581,7 +581,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 			}
 		} else
 			dev_warn(&pdev->dev,
-				 "Failed to enable battey-sensing mode\n");
+				 "Failed to enable battery-sensing mode\n");
 	}
 
 	ret = clk_prepare_enable(data->clk_scaler->clk);
-- 
2.32.0

