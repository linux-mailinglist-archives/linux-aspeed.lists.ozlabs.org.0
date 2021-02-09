Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F404A314F06
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Feb 2021 13:38:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZj9B6YgCzDsjy
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Feb 2021 23:38:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eA6ZzChd; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZj8v1C04zDsfS
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Feb 2021 23:37:48 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id j11so9659446plt.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Feb 2021 04:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=967eBecaBcf3bDwc7ufrOcSaPwogO+dzRNci9Jx2sbo=;
 b=eA6ZzChduHPTMqwvb080DCcMO6PxKR4dC8i99uTS6GPwbftMVKTI0y2NMeGPEA5iT7
 LVdymh2XXvbCwxxAlilErz8rXcaHeMl19WBeWpdc4+qpMnbIScoAz0Q/WwW8eYjGCBP5
 avvt4zuLjAWlDk2BSzjKIGKsuTyqnrXHzFOuykV+cWFnQJ4o97JTMYJNWhavUzOa4WCU
 7eeRPXZDDjOxdyjUE5RIgQ8QiwECY5frzAz3nVmBArfJTAPwKtHQqBbnI53bHw7UvM7Q
 8MwihYKlXOq4wF/ucOZCMkMmF41c2OtcujftQ7Dc0oxzkMcvx+tGDCCRjZlvDfm1Rejb
 LQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=967eBecaBcf3bDwc7ufrOcSaPwogO+dzRNci9Jx2sbo=;
 b=T4VToHQvJjV82Dqc6k9L11QAN7vxhkDmVDhrIFq6x32wAoLRIO+fnrPjOiPbD7GdNe
 6lbNc6vbxyK2nQOyesyS/2HEDb1v1ByXYtXVy0RjjBmt+SgP7+NQmTNyA9N5r2OCgmfB
 ZNgMvuFTxyBLg4Y0z1Der5Nm1hPBT//6g9saG1HWTUGv2YnLwGjg+MRraNgW94rbju+4
 khTUTy1UB8ZcKJ9QFMQyjZsKdV6Yuswf/jtkV/CY2yp1SVCocQbcXiDRYcIwOW7R6Lyc
 +QkgCyBXEnnj+Ta182zR3aERVsbc88mJl93axSZcHWfM5K79L3ZqZlAVx2N3CcIGeabN
 4wOg==
X-Gm-Message-State: AOAM533V2iHFUAIPlFzATmMt7bjXGnsXylD1iMAplHuliriJHBEFWYoq
 PM1p1tBoWrSxKkh1TbRyS4Y=
X-Google-Smtp-Source: ABdhPJy2UCRzy8/Etrbhoxi2JKfFS/m8pcIjipjpZgBGckQh4989njKh4Vzf+9yBqb6vZRlOXaS5bg==
X-Received: by 2002:a17:902:9f8b:b029:e0:a90:b62 with SMTP id
 g11-20020a1709029f8bb02900e00a900b62mr21141320plq.70.1612874265242; 
 Tue, 09 Feb 2021 04:37:45 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i7sm22584395pfc.50.2021.02.09.04.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 04:37:44 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 0/2] drm: aspeed: Support more chip families
Date: Tue,  9 Feb 2021 23:07:32 +1030
Message-Id: <20210209123734.130483-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The out of tree vendor driver was recently updated to support the
ast2400 and ast2600. These patches begin to add that support to the
mainline driver.

With these two cleanups it should be easier to support different
families of BMC system on chip with this driver.

I will merge them through drm-misc once they have been reviewed.

v2 fixes review from Jeremy. Thanks!
v3 fixes the dt match table declaration

Joel Stanley (2):
  drm/aspeed: Look up syscon by phandle
  drm/aspeed: Use dt matching for default register values

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  8 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 11 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 67 ++++++++++++++++++------
 3 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.30.0

