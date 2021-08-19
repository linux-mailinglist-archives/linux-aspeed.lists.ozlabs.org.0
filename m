Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF483F13CE
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqwSB6M2gz3bYp
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZmnS1X0d;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZmnS1X0d; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqwS53MgWz2yYd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:52:19 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id e15so3340906plh.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s9LzzzjCIKGbYZUYDa9u4GWaXQi07iSF8WpyAvcQM48=;
 b=ZmnS1X0dOH9EOWtj+Tka43Y6yGnrO7rbYevAnYwAawbX9xzgCWyDJQYL5sigE773/Y
 oUbbGjn8B//g/NPiI/FeyuxW9AfmFYsLoL+urrD6yJ/Gei2bShLaoyzwVtMfY/6zRIxG
 Wyqy0/hOUE+deE51UpjnnAsW5uLOQ08mBMh94gN0RSgJvslY0WzkO6rH/YlrwJrdxzyT
 fqD9N4zd2TlsichPhefj90wFd46ueDETFRw4JVbPN62CK4C+KTyM2jK5tv3F2tDBROVJ
 3TvS0WxAf3bnP0RGacW1LF1JlBETwp8+v2nribiLS2Lpql/9L4oOPjRaax3znx5NumGU
 HWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=s9LzzzjCIKGbYZUYDa9u4GWaXQi07iSF8WpyAvcQM48=;
 b=YgClP+5Wb+Kg7T7ajrWKWIix167FwmgU74TVvyqyeNLWynF01j5e/cd24GPdsdGTxt
 3wng8H0Kl8ZNX2WvGccmiWGd5X1JdHaBC0JxQqwQRAKoCRQmMB7Xyjd++rfZzqIUdWrg
 dtmywTcx/PKrL31Ah4MRhVZlbbwVXFX9hlCDkh3zjgnmLPMrI1TjQoEZc+y1Q//MAmBf
 l02IEgYBBbklJLCKUe8nNkgOCCPDCKR6Hr3DUJEs5wbioXScbkL2a2VqxcNQXElHafj6
 jbGWxvaP/8256ldv5MxK6bIJL31p8Cjs6BBkHiaJv9yBB9ffRy2R6wsm/txfqgTWng3B
 3FmA==
X-Gm-Message-State: AOAM531X/2RkDAVPpiIUFX82081/rBzk40TIhXi/bYmtLwtfAPDGeoSF
 SP3kUIZKnlCTf1qtnsUAfvA=
X-Google-Smtp-Source: ABdhPJyCojOaXvEhfJRHWO8wDQzaX4sl5w0cGIWZbYbyWi1VYC9YieHbhyfmg6zReqUpZVJCvnfbYA==
X-Received: by 2002:a17:903:1cb:b0:12d:b9c8:4e22 with SMTP id
 e11-20020a17090301cb00b0012db9c84e22mr10633712plh.42.1629355935808; 
 Wed, 18 Aug 2021 23:52:15 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm1860035pjb.21.2021.08.18.23.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:52:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] ARM: config: aspeed: Defconfig updates
Date: Thu, 19 Aug 2021 16:21:59 +0930
Message-Id: <20210819065203.2620911-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Here are some defconfig updates that we've been using in the openbmc
distro kernel tree for a while now.

Joel Stanley (4):
  ARM: config: aspeed: Enable hardened allocator feature
  ARM: config: aspeed: Enable KCS adapter for raw SerIO
  ARM: config: aspeed_g4: Enable EDAC and SPGIO
  ARM: config: aspeed: Regenerate defconfigs

 arch/arm/configs/aspeed_g4_defconfig | 16 +++++-----------
 arch/arm/configs/aspeed_g5_defconfig | 25 +++++++++----------------
 2 files changed, 14 insertions(+), 27 deletions(-)

-- 
2.32.0

