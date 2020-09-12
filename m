Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1226867B
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 09:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqdmc49V3zDqWq
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 17:49:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=POua7IFv; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bph8z5Kq8zDqLy
 for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Sep 2020 04:33:50 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id l17so13686247edq.12
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Sep 2020 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sDdNABI91Tfr3hqKhoVLbPlEvPq5j5lfipsDHNaq4ik=;
 b=POua7IFvCe0e6K6KYqXq0wSmVk2tqbCN7sftakcwvJNpHX0YWSIhY+GoCljfJ7I85a
 4TjrNL9eFYYu82+CcAtWBegXoOq2YF0aCOYUldzXY7tyTzld4fgEXkuqPPpTpTNYMOnp
 1xxCjpKqHLog0AVRcRXJoisHzc6dygviNaZR7Iydf2rPC7KhdbwvwEtpA0zPJp31fNPX
 7sye9aW+jbSAuy4nufR2RvSzrugllPJUjN/1lSVihOPtB3/mMPvs9ve6zmhqJGYsMIfk
 bjp4PjbSBK4SXk4iUrxMcnOqwoBGa4lzz9DfHlq0J6UjZoiifd7GzPWKmfXvmhxmzXrk
 3Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sDdNABI91Tfr3hqKhoVLbPlEvPq5j5lfipsDHNaq4ik=;
 b=kEluU9Ma4gvw37RDKRvoevmRs1nHl5HX7We0QiDjtdY80fVgkU0wzy/csCgUjWtT/Q
 CcT2+pb50hS7WULyqxxx4LWQxek1dz84aVztP/v4qt0x0YEwKdYRmC3cnrF8l583JFEN
 QnlWCyHoTykkqeyUQZFveF3O+BSSIgfSpNyMvgGpm6BBKltCQn1ihthPRCPnJ80TUz6t
 seVVJcbFioK2to2f1p+epy9t0brKrxqZQTI+unlNJq1Zb77AE8b+ZM09m8Igrd7eZer5
 6jW3hd60fX5D70LMENrl8nXjF28cKX2MySRe0wWl54xWyNEZo02st/5gl5rcGXce3FWR
 JX3A==
X-Gm-Message-State: AOAM532h1TynF/TysKLuQF9Dc76g6vEP8yHnqAGteqBmPv5jXFQLuCMb
 9JGh+n6T14GnSr2eG+eVNVg=
X-Google-Smtp-Source: ABdhPJxhXt41CHf1+Qod2riES3Z2vcmnrRmGcoecWnMBU11QIqnqWnaonf9eRAkhxYhvUjVqdDursg==
X-Received: by 2002:a05:6402:2c3:: with SMTP id
 b3mr9567811edx.213.1599935625874; 
 Sat, 12 Sep 2020 11:33:45 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dd9:a000:10b6:eb2f:be44:9365])
 by smtp.gmail.com with ESMTPSA id v2sm3589248ejh.57.2020.09.12.11.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 11:33:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
Date: Sat, 12 Sep 2020 20:33:34 +0200
Message-Id: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Sep 2020 17:49:20 +1000
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
Cc: kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
does not mention that linux-aspeed@lists.ozlabs.org is moderated for
non-subscribers, but the other three entries for
linux-aspeed@lists.ozlabs.org do.

By 'majority vote' among entries, let us assume it was just missed here and
adjust it to be consistent with others.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on master and next-20200911

Joel, please ack.
David, Daniel, please pick this minor non-urgent clean-up patch.

This patch submission will also show me if linux-aspeed is moderated or
not. I have not subscribed to linux-aspeed and if it shows up quickly in
the archive, the list is probably not moderated; and if it takes longer,
it is moderated, and hence, validating the patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26af84f97353..f2561c3fc9db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5448,7 +5448,7 @@ F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 
 DRM DRIVER FOR ASPEED BMC GFX
 M:	Joel Stanley <joel@jms.id.au>
-L:	linux-aspeed@lists.ozlabs.org
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
-- 
2.17.1

