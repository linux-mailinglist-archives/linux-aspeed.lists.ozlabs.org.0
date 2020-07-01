Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F72100DF
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jul 2020 02:10:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xM7j0btqzDqnG
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jul 2020 10:10:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UVBVrK9P; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xM7S5g4qzDqmJ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jul 2020 10:10:27 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 207so9970895pfu.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2020 17:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=TfaGDCD2g4XwNF2LQM8smD7Ls5igldEPLNPkOLgGOjk=;
 b=UVBVrK9P5cqI6Y1NbKJi7eCmvRQcGX+HOwTYx+unDNaad18DhCyKSiEY2QkDpHHB+U
 rsPuUxQ1RXhabSz2ckiiKaEchpziF/0Oad9jS6I4aaCCj+0wuFHv9dQ5s6oSYNzB/Gbx
 qKL8EBArd5Tyfyhi1Kst1TjByqif6YN1bnxMhMEpbYBAJtmOcTPzpv4uMdcvRc3h1DDf
 7tyuq5J1Q1sThp1GHY52gVN5AkcnyqO/oRZwsogo+gEvXD+uofuxh0GUckjOaaZ1nMHV
 uPLbz6/PF/pz85nw8+hKVJjpC4kvB81ti9DGtbHq65b29uR1FEsG5dZrcs2smZhlW2n5
 bSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=TfaGDCD2g4XwNF2LQM8smD7Ls5igldEPLNPkOLgGOjk=;
 b=gs+lwqScr4olm5/7FuGHGnZ+GjanaFioF1ddvi02hFR0TEGLE3w5yrE4HTp+jBHmSj
 LArrxWv7yO8WUm0LurUdEgXLKwZ4YPgujE8kkmIbASSktSpyRtMWZJ1uB2oW3Ji4gkWz
 VTe+gO4NvSFw2bcGyabvtm3hQL2wb8TunijVrsoA3HK9wOH72ZKU7OtOjyFxkRPXmIjY
 Owr8YnaewlEkkzjLjLFf/i0aqFJtz/V/m+PqYCdRfCjhXb1ixhdMpuhYtVHmXk/6GQkQ
 OdJ8Occzt6cAQE8K4ydoTNswFAZ9bx+UQ8euzCYtatG5OOzSWFXCF0ZrY88z091XQJ8Z
 fw1w==
X-Gm-Message-State: AOAM533hVkKBbl6hxw6QXRcBqDnSv1SN+1/hDgJa+mNWGMI6MP3wrRuU
 yGxkIBndDvXYSqWqIObg1/s=
X-Google-Smtp-Source: ABdhPJz9r3Qty0PwtsfLIPdD7xfZz/OUNLuAb7CxkrOcvXON+mz/A23qYNl81SiutlSb899vJeHJ9w==
X-Received: by 2002:a63:e045:: with SMTP id n5mr18249330pgj.274.1593562223698; 
 Tue, 30 Jun 2020 17:10:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q22sm3763535pgn.91.2020.06.30.17.10.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Jun 2020 17:10:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] drm/aspeed: Call drm_fbdev_generic_setup after
 drm_dev_register
Date: Tue, 30 Jun 2020 17:10:02 -0700
Message-Id: <20200701001002.74997-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guenter Roeck <linux@roeck-us.net>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following backtrace is seen when running aspeed G5 kernels.

WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x138/0x198
aspeed_gfx 1e6e6000.display: Device has not been registered.
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3 #1
Hardware name: Generic DT based system
Backtrace:
[<8010d6d0>] (dump_backtrace) from [<8010d9b8>] (show_stack+0x20/0x24)
r7:00000009 r6:60000153 r5:00000000 r4:8119fa94
[<8010d998>] (show_stack) from [<80b8cb98>] (dump_stack+0xcc/0xec)
[<80b8cacc>] (dump_stack) from [<80123ef0>] (__warn+0xd8/0xfc)
r7:00000009 r6:80e62ed0 r5:00000000 r4:974c3ccc
[<80123e18>] (__warn) from [<80123f98>] (warn_slowpath_fmt+0x84/0xc4)
r9:00000009 r8:806a0140 r7:000008b9 r6:80e62ed0 r5:80e631f8 r4:974c2000
[<80123f18>] (warn_slowpath_fmt) from [<806a0140>] (drm_fbdev_generic_setup+0x138/0x198)
r9:00000001 r8:9758fc10 r7:9758fc00 r6:00000000 r5:00000020 r4:9768a000
[<806a0008>] (drm_fbdev_generic_setup) from [<806d4558>] (aspeed_gfx_probe+0x204/0x32c)
r7:9758fc00 r6:00000000 r5:00000000 r4:9768a000
[<806d4354>] (aspeed_gfx_probe) from [<806dfca0>] (platform_drv_probe+0x58/0xa8)

Since commit 1aed9509b29a6 ("drm/fb-helper: Remove return value from
drm_fbdev_generic_setup()"), drm_fbdev_generic_setup() must be called
after drm_dev_register() to avoid the warning. Do that.

Fixes: 1aed9509b29a6 ("drm/fb-helper: Remove return value from drm_fbdev_generic_setup()")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 6b27242b9ee3..bca3fcff16ec 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -173,8 +173,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 
 	drm_mode_config_reset(drm);
 
-	drm_fbdev_generic_setup(drm, 32);
-
 	return 0;
 }
 
@@ -225,6 +223,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
+	drm_fbdev_generic_setup(&priv->drm, 32);
 	return 0;
 
 err_unload:
-- 
2.17.1

