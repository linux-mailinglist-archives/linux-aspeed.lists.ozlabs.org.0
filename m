Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C74B3F30
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 03:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxnc807Phz3bVt
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Feb 2022 13:05:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PeEKjS6m;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PeEKjS6m; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxnc35xs6z2yfc
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Feb 2022 13:05:06 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id g145so13310623qke.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Feb 2022 18:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH45NlfdWRTfweoUutUuJvBXViZnbk5RQ/1+2Xcuqxg=;
 b=PeEKjS6mLh0yV+FjsVcrUmmAf98M9Ce7Z+8NDNQ+UmEtnI7mHx3A7T/CULb0a5uxGi
 od82XtsfRt28HryZe67RGewDJr6AtVJ1VxxlzFHm+bAc4A+HL0GcARixvYPdtG7wKBME
 xRb09UXgR0ylwGumT7cMc1SWuN1YfFAdofEWFnEiqLcEkthQGImMD0QO02dkhfUba6In
 O1Uwll6ee1Q2kZiStzg3K/Uee7yncwPyeGNMP9oF7GuXcP4Dinrde5WV5gBhgapzkrO5
 FFAwEf2fk3SlcLDCG3u/ZCZe90Tx/ZwX9o8unwfWL7020xu5hqXPA2QBtOyL/pRsKlVO
 eYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH45NlfdWRTfweoUutUuJvBXViZnbk5RQ/1+2Xcuqxg=;
 b=F3tqK4L58AvPgP4Htc5VgOuKQ2SNIBVAroqFYdiaGRg4in9zfxoIWkAfmsB2BVYIBY
 gaDpby9mG9NgsiaOxbCl4Iug+LAeZ+VstJg9LpadUvwnspDTrzXLRCLB+x1yLEYpA9yw
 /r26tTT/YRTDwqWkv7JoFgQIr3mvSBWqzc+7OjaHoiq9bldKKbZxbXcmDjyh2/RT1mbh
 an78OHHkT/G5xnwODhL3vfIWdgnh3mMKJji75O/xlBL37kUI4TjD+8W16JBJxfMaE17v
 cPXcMgXW+/0mAtQI3EHuCQQX+4MpQqZu7F7+wIaplWXpjXsI4Hm2kwhpsCxPthHhOHbU
 u4xg==
X-Gm-Message-State: AOAM532Rq/mg5GJLHtxZWTtS831SJTBaknOapxXkXrD1GDNOXz67rwjK
 uMuGR5koytsWiVF7c6JlhKk=
X-Google-Smtp-Source: ABdhPJwnbbKlb6/+9IP4/B70ReOp8eVtnIAo8INn36B5rGjuPolaQSEqwMy798c1jC/joZUZwXPeyg==
X-Received: by 2002:ae9:e642:: with SMTP id x2mr3160677qkl.29.1644804302805;
 Sun, 13 Feb 2022 18:05:02 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j19sm12424487qkp.120.2022.02.13.18.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:05:02 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: joel@jms.id.au
Subject: [PATCH] drm/aspeed: Use of_device_get_match_data()
Date: Mon, 14 Feb 2022 02:04:54 +0000
Message-Id: <20220214020454.1714560-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Minghao Chi \(CGEL ZTE\)" <chi.minghao@zte.com.cn>, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 65f172807a0d..9fe1983bd9c3 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -132,7 +132,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct device_node *np = pdev->dev.of_node;
 	const struct aspeed_gfx_config *config;
-	const struct of_device_id *match;
 	struct resource *res;
 	int ret;
 
@@ -141,10 +140,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	match = of_match_device(aspeed_gfx_match, &pdev->dev);
-	if (!match)
-		return -EINVAL;
-	config = match->data;
+	config = of_device_get_match_data(&pdev->dev);
 
 	priv->dac_reg = config->dac_reg;
 	priv->vga_scratch_reg = config->vga_scratch_reg;
-- 
2.25.1

