Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB82359034
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcWD1ywnz3bTX
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UNNx+EGN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UNNx+EGN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGHHt3Skcz2yYZ
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 20:17:14 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B02961168;
 Thu,  8 Apr 2021 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617877031;
 bh=ivICCofV+HelFF0TfxwG+thYyuD+sKqQrEHToDgsMAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNNx+EGN0stAmujBkpKG7B+a3LZ9QOfURYpggW8gdYq7xt5P1gLMLgwM1dC5MpZ1P
 X7O4uDbSKKlPnIU+8/Y6gRxg4fPUuzhIsu8w6Fwb8B4xVKXHz8CvWH4QrtvBFITSEV
 Sxnv93leCr2IDHcwq6kptb/L86gB1Q+cqPtKBLHQ//heoRdly7V3dD/x0CXRA503pn
 1M5OyO5KbAozxLmR9Dpq5Oefs1XuUJn5xBFlPTXTgFi1TPnK0/r/Y/ZRa7Exep2Gdn
 1zCmFnWIMn66t09SBdrHP7u2VGOwHIiutu2GPaNpPda2430uojqFF+YO6UXZrmbRAJ
 /5bajopeTFScQ==
Date: Thu, 8 Apr 2021 13:16:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/2] drivers: don't select DMA_CMA or CMA
Message-ID: <YG7YGxN83VxtKAeo@kernel.org>
References: <20210408100523.63356-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408100523.63356-1-david@redhat.com>
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
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mm@kvack.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 12:05:21PM +0200, David Hildenbrand wrote:
> Trying to set CONFIG_CMA=y with CONFIG_DMA_CMA=n revealed that we have
> three drivers that select these options. Random drivers should not
> override user settings of such core knobs. Let's use "imply DMA_CMA"
> instead, such that user configuration and dependencies are respected.
> 
> v1 -> v2:
> - Fix DRM_CMA -> DMA_CMA
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Peter Collingbourne <pcc@google.com>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> 
> David Hildenbrand (2):
>   drivers/video/fbdev: don't select DMA_CMA
>   drivers/gpu/drm: don't select DMA_CMA or CMA from aspeed or etnaviv
> 
>  drivers/gpu/drm/aspeed/Kconfig  | 3 +--
>  drivers/gpu/drm/etnaviv/Kconfig | 3 +--
>  drivers/video/fbdev/Kconfig     | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
