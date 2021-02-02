Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7CD30B753
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 06:46:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVDMS67BrzDr4m
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 16:46:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q64G8Q1X; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVDM80z8FzDqT3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 16:46:11 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id e9so11838674plh.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Feb 2021 21:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfAQJJOiqfJpwqSbeAm0bLmc69acbey6JfZBmykjrNo=;
 b=Q64G8Q1Xtgrmck8NQm4jnn56juX7QbIPeeQX3Uhihe9bvMekEKhbUJFmv4Q6XbzYUg
 FfP/aUk4Xh5U9tODV8Z7V6TP+UmImXOm2F5yrt8ki4N6T9f86m1AuWgHSL79X5E+cyar
 mZ4th07kAOuM7jt7sx+A19aC7NGSdnWwx5aFgk9qoDD5XJg1wMhsSogdU6J8JSZv4xi9
 kq2SR9IrC6ftLn1RERsx+g74w7ibM/SKjN7yWOXAkeKXBWsppKZNb52H9tC2TCru3i1s
 d1gEydGMZFwvVvnU2LwP6hwr8Sc149+RkfIytKcQ0tqng8m5gmZ5+2WC6vuv/Lt+w6og
 24Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GfAQJJOiqfJpwqSbeAm0bLmc69acbey6JfZBmykjrNo=;
 b=smukAg/WJRnaUeJZA6QOkdOYK3lDtiEdKlz2kNnd51r3Vhl4cNecBXnIG7VSxYfLt3
 41/ey8+HoAGCwmnGRCAz5XEJDlTkFt0em5XFd/f6Yy2dM0zpcSlnt92St3Wr1L5sm4QP
 T7zU9qzZ8aqXJBVA6HhwLTmQLex3GymJunbQOqYqsStILjpk0p5Fpq2S9YBGaJGnzzi0
 Ou6tSkXF7sO6Hs2sl0BGaxSmAL8ytYoxgsGGd8PFgOjVlGHo30IR//yP+Py1e200ji23
 ExvpkbmfrkS22MjwAtc3MIU11rAA6bEK1BBkCop5gav/Kt3fRaWPE/JqZJsEH8n8p2LY
 606Q==
X-Gm-Message-State: AOAM533PurAJWhjqn9mEtvqynG+s2ujiJFNNMiFiUvHpLwLt9VB5qSnz
 siUK+dGxgRzCNOVU0v6W4kuIwoka5Nk=
X-Google-Smtp-Source: ABdhPJw77F0Ms1Mav8c2DJzdO+6VRXbL7FJ6kwtRH1DUYObjNeA6QmQeOpCqPdp+WQge0UltBYzmBA==
X-Received: by 2002:a17:902:ea91:b029:e1:8695:c199 with SMTP id
 x17-20020a170902ea91b02900e18695c199mr2004237plb.6.1612244768757; 
 Mon, 01 Feb 2021 21:46:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id h23sm20707603pgh.64.2021.02.01.21.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:46:07 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 0/2] drm: aspeed: Support more chip families
Date: Tue,  2 Feb 2021 16:15:56 +1030
Message-Id: <20210202054558.344451-1-joel@jms.id.au>
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

Joel Stanley (2):
  drm/aspeed: Look up syscon by phandle
  drm/aspeed: Use dt matching for default register values

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  8 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 11 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 67 ++++++++++++++++++------
 3 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.30.0

