Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70818453D67
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 02:02:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4QP2P2Dz2yPv
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 12:02:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EZJQ7Twy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EZJQ7Twy; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4QL3kRgz2xXs
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 12:02:02 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id n85so997665pfd.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 17:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7oBWSRNQYBuq7Ls3gyfcTUAoT98uMmIpA6cFr+2S8n4=;
 b=EZJQ7Twy4XtkBJ6xmo89ZWKnjdJLgaA3wXyheo9LZEbzFGTAQmOMWJg2xOjkrJBKDH
 ViFYr2WxemnUPyVm3IaFVIu+zMDFclBvDH6CWOJK8V1dilbcjXGXPnGiUybnkIMyf6h9
 a7dO+c4Xsqi9W1oIRaL8OXXRbrQmquaEiDoDHyoVAhxIAw3q3MIFx4D2A5Eij8gGYi6o
 xxcyrqrvcoB4pI8mace58ycUAGnfw+geB9QrVhwthiIV2eFZHeTSroJ3pnSPLwp5hgIk
 VHHttRT0hf4PElkieAKn6dBFeYsTT+6LwXnBKd8qBStynGKlqZh/0PunSqO5t/M5DDLl
 uFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7oBWSRNQYBuq7Ls3gyfcTUAoT98uMmIpA6cFr+2S8n4=;
 b=yAyLM0XNKCtRFXaj5pwGJITSJQ0OEJPyJAu5XK9QMs224sUAk16wn5NHMFYBeUFPmC
 uCFkgfIooE7hMQluD3yCUtkpwEbBvZhOth4dfjXIxDOwhqZEDmsqWlVpMpMUN2Xta4cH
 ksAOHOTaMWGPhofpoCzu0XBL3IQ4bb1TxDqRhCwqN3/aBkUQAPqKyTl3bbohkXhPXDT7
 LCrDbzxNP8XReSgFvvFhNqq3DjU7GhoTbNwgREU2cU97KbVN/O/NGGNZkxvnhivFqldB
 yWCHztZ0iFgWCoCqldZRICxkHOB2w8akowiN/V1KxMwAiwUNivU5iXFusFygr4asf70i
 bg4g==
X-Gm-Message-State: AOAM531RunaXQacTWRxdSov0rNbdNFrCtZ+DQHCMQiWn8WAkVPsUlW9w
 f66az/aqyUTKyAVTWL1cilE=
X-Google-Smtp-Source: ABdhPJxVNb6EQTVlevYB6oIqe9z7J2nPJJPRnxGhpFM+o8goSZBR6EVRZM4t4zBNoARvAGM8clrGhw==
X-Received: by 2002:a63:8048:: with SMTP id j69mr2385989pgd.135.1637110917919; 
 Tue, 16 Nov 2021 17:01:57 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id p19sm22517713pfo.92.2021.11.16.17.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:01:57 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Oskar Senft <osk@google.com>
Subject: [PATCH] drm/aspeed: Fix vga_pw sysfs output
Date: Wed, 17 Nov 2021 09:01:45 +0800
Message-Id: <20211117010145.297253-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Before the drm driver had support for this file there was a driver that
exposed the contents of the vga password register to userspace. It would
present the entire register instead of interpreting it.

The drm implementation chose to mask of the lower bit, without explaining
why. This breaks the existing userspace, which is looking for 0xa8 in
the lower byte.

Change our implementation to expose the entire register.

Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
Reported-by: Oskar Senft <osk@google.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index b53fee6f1c17..65f172807a0d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -291,7 +291,7 @@ vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
 	if (rc)
 		return rc;
 
-	return sprintf(buf, "%u\n", reg & 1);
+	return sprintf(buf, "%u\n", reg);
 }
 static DEVICE_ATTR_RO(vga_pw);
 
-- 
2.33.0

