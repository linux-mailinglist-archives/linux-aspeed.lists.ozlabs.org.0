Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D7CF2B21
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z8L5QHkzF6F9
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:47:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=navid.emamdoost@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZRJSPMG"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470SZt3P90zDqmJ;
 Sat, 26 Oct 2019 15:25:36 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id u8so4726597iom.5;
 Fri, 25 Oct 2019 21:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rHeRkxrHD5GX5EWDlQ98vXy+a783uwWXtM2tQKGXdug=;
 b=gZRJSPMGxM1UPw1FdEvVFtbG4SqDkm9JN/GP92+GDY/bQVm73xFX5T2lkdkRAXJ9uw
 4K927+DEPOjX0v2NhbOsDZjCOyTgg/PgzXqgwivEM6QeBnGHV0CLxMfG1XeHJninS6Jn
 d3HUaWWFRPVWG+u/urTqRNtrGbQyLiZdTXq6MhvYlWjtoC7vQBAz3Rn6Mb3cxkdt1/Po
 nUZHC0Eiw1kMMsF1PkX5MSMnY53N8J0Q3vB8vM9pSuefryXU7vr8bduXoiI452R8NKud
 SwAzjj4yI/LFANHdC8I/m+7ITtp+iUIKP8EtGIgHjMBdZ+gFerdXZYr/VS+jNVHKs/wb
 4H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rHeRkxrHD5GX5EWDlQ98vXy+a783uwWXtM2tQKGXdug=;
 b=C9YlHagJLvoJa+HJ63YdtPG3Yy6SppAJTVKbISVIcgzmx0eWIquLO7qmmx8sQl4nsT
 1WQ90DB1La47ELuhrnWHMFie/cJjKD/+kCSg4PF5Qwcb4HjXazHxx1w1RDVEsc9dToju
 J6YZEQ9JZ0LMx/e/Q2dWMwvjAjKDVMtaZHDvutah4d56C9uNzH2PNcIodmkRw2X0O7Wu
 akonz9RX0RdGutvY5MuMqFwW0VrbR/eSi5KOqJELcX3taskQT2spDMJ+576jDeacX6NP
 aih+h58NQjaWzfOtkuEa1w7xVdXmQ1IyNb8osOIJ63ASoKCuUigYR7LwwnvnEPcKybsG
 w5Xg==
X-Gm-Message-State: APjAAAWA5bx5erdKWZQijRr/Ua4Mr99uQScMuAqs6ykx+1bgZ9zXkVKQ
 JL+l7Nh8zuQ36qKgxPtptBc=
X-Google-Smtp-Source: APXvYqwyjakLVT85RTryWMHfy6AKHouMUXRj6cegqSHqrg9AmKKAZBYTX2iEX2LdU+HgQdpe1I/m7g==
X-Received: by 2002:a5d:980a:: with SMTP id a10mr7426699iol.225.1572063932870; 
 Fri, 25 Oct 2019 21:25:32 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id n123sm452068iod.62.2019.10.25.21.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 21:25:32 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Date: Fri, 25 Oct 2019 23:25:18 -0500
Message-Id: <20191026042519.29446-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:04 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, kjlu@umn.edu, openbmc@lists.ozlabs.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, emamd001@umn.edu,
 smccaman@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In the implementation of aspeed_video_probe() the allocated memory for
video should be released in case of failure. Release video if either
devm_ioremap_resource() or aspeed_video_init() or
aspeed_video_setup_video() fails.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/platform/aspeed-video.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..8c473356132d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
 
 	video->base = devm_ioremap_resource(video->dev, res);
 
-	if (IS_ERR(video->base))
-		return PTR_ERR(video->base);
+	if (IS_ERR(video->base)) {
+		rc = PTR_ERR(video->base);
+		goto free_video;
+	}
 
 	rc = aspeed_video_init(video);
 	if (rc)
-		return rc;
+		goto free_video;
 
 	rc = aspeed_video_setup_video(video);
 	if (rc)
-		return rc;
+		goto free_video;
 
 	return 0;
+
+free_video:
+	kfree(video);
+	return rc;
 }
 
 static int aspeed_video_remove(struct platform_device *pdev)
-- 
2.17.1

