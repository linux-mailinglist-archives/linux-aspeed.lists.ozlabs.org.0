Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14D131E19
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 04:44:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sJCM0m2mzDqMG
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 14:44:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l47vIneS"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sJBp6jxszDqJT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jan 2020 14:43:46 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id x8so27819508pgk.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jan 2020 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VltYEuA+2PApmtgRMm5FF8qb9zrgm0zOyAmewmF0puQ=;
 b=l47vIneSa/hFEkETx/SuB1kevgPx1rLNRqSo/Ms503wbbhPZFWpn6Y0VH+ml5EHGwX
 Z8MjxcYNwT4QKu/bgCwxC94ge6v6noxf6kblwdoLuKYJzUnNf6ep3t2LcQ7Czo44V3na
 ND6a6HAxw5KsTlN1SUyixzT0GcTyWZKfJtJDBuSDRhgGJ+/PMyNmgxh6yj2JvgHYnwNU
 oLPyCwpEGojBiLYLM7HzVbfQsrg7Yr/r+Cu1ckFmHqt4XMyCSs2rEBSPc65TTyqGE7hq
 LAHD+t0sNtfO1GjTa3XVo+ZHcsyfByJaSi7PcK321b5zbAh0huZvRVJ2noP54Xdgyz2B
 sjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VltYEuA+2PApmtgRMm5FF8qb9zrgm0zOyAmewmF0puQ=;
 b=hMlY8XIyBitGW1UpZ6qUUUBV8HETDhcyqe2gt2lw/GqRK1qBKg7T1GXW/Nk5kKITsT
 D/y/jOfFr8/VgTWU50HNcL2RGw0MNSTiXHKYDKpNfPoKT8UDloS4Uk7TGYBdtkQHtktS
 DpQ7zqTvi+2znE1Ba1h4LifTbsvbqBLOXRAek7sPNaqDR9PFHa+Qu26eBeK9UTGmuj12
 iTQNDlAkcpJMrA5ztdzXLsPMUXMlWKzwK2LHNTHphvs6J+Gx1Qtm8oE0uq8yb/zL8pnu
 YuFJejfApV/SIpGgqg3CuAIbd1oCGKfwGy/coAADovgT35xNZDYtzNtrWyMNZs5jyFB7
 PM6g==
X-Gm-Message-State: APjAAAWgUL3UT3f0QMCF2ukftypPk42R/eG8qFQEM0/KCN4Q535Niw5Y
 g2E65Xefd2sbbxuvlai0RlQ=
X-Google-Smtp-Source: APXvYqzZw/5ojo17tCaUt9PV7komeSIywJmrYJhVJN67fb/Rxn2Dvbo59Qfw2xEZ5of4zJw5FPOBDA==
X-Received: by 2002:a62:1d52:: with SMTP id
 d79mr112174863pfd.144.1578368624291; 
 Mon, 06 Jan 2020 19:43:44 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 19:43:43 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/3] media: aspeed: Rework memory mapping in probe
Date: Tue,  7 Jan 2020 14:13:22 +1030
Message-Id: <20200107034324.38073-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107034324.38073-1-joel@jms.id.au>
References: <20200107034324.38073-1-joel@jms.id.au>
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use the recently introduced function devm_platform_ioremap_resource to
save a few lines of code. This makes the driver match common platform
device probe patterns.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d8593cb2ae84..8f849d9866af 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1655,14 +1655,17 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 static int aspeed_video_probe(struct platform_device *pdev)
 {
+	struct aspeed_video *video;
 	int rc;
-	struct resource *res;
-	struct aspeed_video *video =
-		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 
+	video = devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 	if (!video)
 		return -ENOMEM;
 
+	video->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(video->base))
+		return PTR_ERR(video->base);
+
 	video->frame_rate = 30;
 	video->dev = &pdev->dev;
 	spin_lock_init(&video->lock);
@@ -1671,13 +1674,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&video->res_work, aspeed_video_resolution_work);
 	INIT_LIST_HEAD(&video->buffers);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	video->base = devm_ioremap_resource(video->dev, res);
-
-	if (IS_ERR(video->base))
-		return PTR_ERR(video->base);
-
 	rc = aspeed_video_init(video);
 	if (rc)
 		return rc;
-- 
2.24.1

