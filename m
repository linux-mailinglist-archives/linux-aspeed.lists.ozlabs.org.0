Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C838359031
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcW71xXpz30Dc
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs59GdyP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs59GdyP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Bs59GdyP; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs59GdyP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGH2Z3s5dz304L
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 20:05:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617876338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=stVmdVHDbOoSxNmjFvxne1obfQicq305VBZ17FdaCM0=;
 b=Bs59GdyPwlxiDxuy4nMWpjIkZapCRq3cFN25PFHysgehVYvLaIGp6gZW+OF9WWnymDV+mR
 iV379cRgMtfq85Jhw5xS03ZfhosvBvuXpCzSPJPYkyvvxIuHRglHNEXkaVjXkoebUrFD6Q
 TMwKDLTTX4QxPStAsNXMrKkllzG09X8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617876338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=stVmdVHDbOoSxNmjFvxne1obfQicq305VBZ17FdaCM0=;
 b=Bs59GdyPwlxiDxuy4nMWpjIkZapCRq3cFN25PFHysgehVYvLaIGp6gZW+OF9WWnymDV+mR
 iV379cRgMtfq85Jhw5xS03ZfhosvBvuXpCzSPJPYkyvvxIuHRglHNEXkaVjXkoebUrFD6Q
 TMwKDLTTX4QxPStAsNXMrKkllzG09X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-R8LwhTuXPW2xbmMgCHV62Q-1; Thu, 08 Apr 2021 06:05:35 -0400
X-MC-Unique: R8LwhTuXPW2xbmMgCHV62Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA571006C81;
 Thu,  8 Apr 2021 10:05:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DDB19D9F;
 Thu,  8 Apr 2021 10:05:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drivers: don't select DMA_CMA or CMA
Date: Thu,  8 Apr 2021 12:05:21 +0200
Message-Id: <20210408100523.63356-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Trying to set CONFIG_CMA=y with CONFIG_DMA_CMA=n revealed that we have
three drivers that select these options. Random drivers should not
override user settings of such core knobs. Let's use "imply DMA_CMA"
instead, such that user configuration and dependencies are respected.

v1 -> v2:
- Fix DRM_CMA -> DMA_CMA

Cc: Joel Stanley <joel@jms.id.au>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Collingbourne <pcc@google.com>
Cc: linux-aspeed@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: etnaviv@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org

David Hildenbrand (2):
  drivers/video/fbdev: don't select DMA_CMA
  drivers/gpu/drm: don't select DMA_CMA or CMA from aspeed or etnaviv

 drivers/gpu/drm/aspeed/Kconfig  | 3 +--
 drivers/gpu/drm/etnaviv/Kconfig | 3 +--
 drivers/video/fbdev/Kconfig     | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.30.2

