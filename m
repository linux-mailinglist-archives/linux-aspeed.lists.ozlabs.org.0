Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE47158E1
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 May 2023 10:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVm8X5lK4z3c9r
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 May 2023 18:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZX3q9h8g;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=osmtendev@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZX3q9h8g;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRHp255Jlz3f6Q;
	Thu, 25 May 2023 03:13:29 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af31dc49f9so15728601fa.0;
        Wed, 24 May 2023 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948405; x=1687540405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLaYB6ykUUoKJWW7JHm8qTFZjj1iIIA5/Xf0xG1DJC8=;
        b=ZX3q9h8gI1zn8AhnDA9j78mTMauKuVELGWU/Z0rari3BTsjpRiroPO4610te2cj1Cd
         tIZH+5V2Ix0405wZHuyU/QDDixqqRh+yT+c4iE/ue3rPb4Tx2fxkoUj9P3yV+X2r4Rn0
         eRSYt97OFjaKt1CByeQadofUeuY2fFoeAQOZUJFs+3LqX/zZwanP65yZof2u17lFntkV
         2YCZSSZsSgQViOPx11GQ0KyKGoe2yvlAJPQOWW8pfZ1EoJ4tXFmv0evZNT6/vTxUXcJa
         Eb94qaNxJxyyu7c7TQ0wmNFCxP5Vd+sLyDD0pB1obujkc+nqpYFLp6lSQbViBvyrXpM0
         Vb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948405; x=1687540405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLaYB6ykUUoKJWW7JHm8qTFZjj1iIIA5/Xf0xG1DJC8=;
        b=QIjYvVqUd2fjrbfbgs+FoEWFlUp5qB+QKPVFQY5SQDuzSQXSlb9ctjQ/zskhqnmwK7
         RCKpwL0j+eURUWGy8uCjd9HQ/5PsgPqgM014yDBFVDRzKB5OwuwOxX0tbaCCH/23KVei
         LYHlFT0PZpLGOpdW0eo9MmwT37vW4We0m2eHPDIF7BhQ6m1G2Aq5eY1IeBeaBGyPrfNk
         0mvJFjboi9mm/YupMhdaGpcwEAYJn76hsT+ZNCfMTQShMTUwsyK0EiQ4IOHvgQKc4nJO
         OQD8IOzT/Wrcy2zJn39F9rt5xQqpygEoblkzceZMkn6wZWFAvWnRrjJFx1/BxJ+kiSJd
         Hy6A==
X-Gm-Message-State: AC+VfDyOmJE0NLTq6gnmaJMUax3GFDy+g6dztRigwMfwHBqUcDai8KQ6
	l+OTDme+gMiFPzL98g3JdAA=
X-Google-Smtp-Source: ACHHUZ6X4BePgc4bqVEgf5O0ZPcPYB9uy0dbicZ0wrt4hQvl2Q4ScIBiTeeQtQloMwlHtzGTvJqJUg==
X-Received: by 2002:a2e:b17a:0:b0:2a8:c858:fb9 with SMTP id a26-20020a2eb17a000000b002a8c8580fb9mr118541ljm.29.1684948404999;
        Wed, 24 May 2023 10:13:24 -0700 (PDT)
Received: from Osmten.. ([103.84.150.66])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002ac8164d77fsm2173602lji.86.2023.05.24.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:13:24 -0700 (PDT)
From: Osama Muhammad <osmtendev@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] aspeed-video.c: Fix error checking for debugfs_create_dir
Date: Wed, 24 May 2023 22:11:37 +0500
Message-Id: <20230524171137.22128-1-osmtendev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 May 2023 18:40:56 +1000
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
Cc: Osama Muhammad <osmtendev@gmail.com>, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch fixes the error checking in aspeed-video.c in
debugfs_create_dir. The correct way to check if an error occurred
is using 'IS_ERR' inline function.

Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 374eb7781936..97847f44964a 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1976,7 +1976,7 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
 					    &aspeed_video_debugfs_fops);
-	if (!debugfs_entry)
+	if (IS_ERR(debugfs_entry))
 		aspeed_video_debugfs_remove(video);
 
 	return !debugfs_entry ? -EIO : 0;
-- 
2.34.1

