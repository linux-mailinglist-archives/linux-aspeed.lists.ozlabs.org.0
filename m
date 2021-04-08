Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD535902B
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcVv0sxkz3bT8
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:12:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKqJJkE/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKqJJkE/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZKqJJkE/; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKqJJkE/; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGG2b6twFz30Cs
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 19:20:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617873635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0ekUImsTZau1bAPEDvtd4VEBVt+90KKsFuamUZCcWE=;
 b=ZKqJJkE/0mNYTX/VsEKJSxLeDRb5GgKv+l7RazImZsu3a3y66ITQ1SgQUZKDdLQ6OrD7Ci
 k35VsBi9XdX3/08av6v+UGtFqfyjkU93g/98whoMGZ4b+G+8GOzQTq2RXrMG3rjYtf4hRs
 BCiiKR0qAlgZxnAg8+uox5R6TDiN4Fk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617873635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0ekUImsTZau1bAPEDvtd4VEBVt+90KKsFuamUZCcWE=;
 b=ZKqJJkE/0mNYTX/VsEKJSxLeDRb5GgKv+l7RazImZsu3a3y66ITQ1SgQUZKDdLQ6OrD7Ci
 k35VsBi9XdX3/08av6v+UGtFqfyjkU93g/98whoMGZ4b+G+8GOzQTq2RXrMG3rjYtf4hRs
 BCiiKR0qAlgZxnAg8+uox5R6TDiN4Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-hJltZk7xPLOdIJAprlWYpA-1; Thu, 08 Apr 2021 05:20:30 -0400
X-MC-Unique: hJltZk7xPLOdIJAprlWYpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EEA5107ACE4;
 Thu,  8 Apr 2021 09:20:27 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB426690F1;
 Thu,  8 Apr 2021 09:20:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] drivers/video/fbdev: don't select DMA_CMA
Date: Thu,  8 Apr 2021 11:20:10 +0200
Message-Id: <20210408092011.52763-2-david@redhat.com>
In-Reply-To: <20210408092011.52763-1-david@redhat.com>
References: <20210408092011.52763-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Fri, 09 Apr 2021 09:12:53 +1000
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Mike Rapoport <rppt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Random drivers should not override a user configuration of core knobs
(e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
dependencies and manual overrides.

"This is similar to "select" as it enforces a lower limit on another
 symbol except that the "implied" symbol's value may still be set to n
 from a direct dependency or with a visible prompt."

Implying DRM_CMA should be sufficient, as that depends on CMA.

Note: If this is a real dependency, we should use "depends on DMA_CMA"
instead -  but I assume the driver can work without CMA just fine --
esp. when we wouldn't have HAVE_DMA_CONTIGUOUS or CMA right now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4f02db65dede..d37cd5341e1b 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2186,7 +2186,7 @@ config FB_HYPERV
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_DEFERRED_IO
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
+	imply DMA_CMA
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
-- 
2.30.2

