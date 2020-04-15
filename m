Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 665751A94B3
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Apr 2020 09:42:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492DpH46yXzDr3D
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Apr 2020 17:42:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=dDWOltVk; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Dnd6L7fzDr3B
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Apr 2020 17:41:39 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id d27so8669536wra.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Apr 2020 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8LdowvRj6y5F/lzc0z+wTLajfnWKM9lBo0QaQxdrxw=;
 b=dDWOltVkXSOBk1IiL8MGDd4W/Djoa1TmmKBWN/ACzBJhTGB6DVnNb+bdfp7yXv+ILx
 bPVlegHUcpx/jn37fxJlmy6MggQXsKXqt1jbmKh2owgqv35hUekH2fvR07MARNAxxDcZ
 sKHEmL/k4jUdpxWPK3HUwx3VS8Y1uye7JNtWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8LdowvRj6y5F/lzc0z+wTLajfnWKM9lBo0QaQxdrxw=;
 b=t8WOWc+ynkwJ7/Xclh59jJ1C6k+oz3G/EY5onNShehZWuzQnKzw2lE9MRLCK5hafzz
 cimDcv/Hd0ik2Bpi9+a2VcG8FcVUj9/SG7cbiXKJOEIEIlvaAEc0uYUC/nSpXwWZESP3
 afX9D6OopBPQj57GNbM9pfwGWidy0R/8vfZ+k9625GWDNEA4EaU6+LUBwJn+i4sMzRnh
 PFoODsctHONz7kHsJ7w4ZMezA2+MLGltOCiR87E0ZKN8an22KiigmROvoKHUoCwjHJku
 xDqRycRj/5r2+yXZ0/LFFMIT+kBEnJ5Md2MfrOJtuw9HmIfgHA2o4bRzNgqVYOt5GhgC
 VMsQ==
X-Gm-Message-State: AGi0PubD9ZNP8ijrD/4T1rFmQwFMRgpnR4wZHzNwaQkYypx08gfSRt5t
 cqQIb+TLj8MEP4AXXw6hfmkTPg==
X-Google-Smtp-Source: APiQypIr7FTFgGbKeiSR3G8G8hKb8rSC1ydf5oz/DSRkwR5KNFKQJDnHsecYRWgMt0sIJI+cp5eSjA==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr26643336wrr.131.1586936495555; 
 Wed, 15 Apr 2020 00:41:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 54/59] drm/aspeed: Drop aspeed_gfx->fbdev
Date: Wed, 15 Apr 2020 09:40:29 +0200
Message-Id: <20200415074034.175360-55-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

No longer used since the conversion to generic fbdev.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index a10358bb61ec..adc02940de6f 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -12,7 +12,6 @@ struct aspeed_gfx {
 
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
-	struct drm_fbdev_cma		*fbdev;
 };
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
-- 
2.25.1

