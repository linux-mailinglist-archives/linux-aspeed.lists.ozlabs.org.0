Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96328AD23
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Oct 2020 06:39:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8mDJ4dhwzDqgr
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Oct 2020 15:39:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nU7uQ0hR; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8mD04Wh1zDqVK
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Oct 2020 15:39:11 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id c2so16676423qkf.10
 for <linux-aspeed@lists.ozlabs.org>; Sun, 11 Oct 2020 21:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpWfSYwTmxBzkXDi9ht7uL8LFxGO5JzEbAJnVgaiE+c=;
 b=nU7uQ0hR6wJjdWA+ED+sikls3Urhi/cl8eNleJbNfjGbqwKo7zCEkywRHTc7K3jBkz
 Hyf3gr+6FCDB2hatcKdnG8zwLPgj2qv/GT72VXlOzM35Lbr2YkQQYN3K0NBCOyAkn2CU
 vAGPm7dFAe5q1Nykt7UDg+llyzoNG3DVtOVFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpWfSYwTmxBzkXDi9ht7uL8LFxGO5JzEbAJnVgaiE+c=;
 b=HZNu12sdJse4dJq1O9feBZ5sYojbe2YmOXC1FiLj2VTnV7kJnDywQpw5d03u8WRnlZ
 ROqtCjbqdQHpzcMsmDet3Lub52kb9UCRHnqofMAeLgdVHbf9yf1BXB/4LkE6YqcXow8z
 iPmjZkwINCVmmNfFTRKc669jj+8p09WCFlJ/Zxu87S8DgoYoIyMs9BpDKGIIzTvK3M16
 jcfX1/4XbxzzQjR4sp/ZhotLR3V6b/D+7oUVzHFXIx4zHnf8jzFzY+zAyz7PJvlEu6XV
 FAQnQRKRnab++KEQWMWR1H2KjlQiZtx0WBITShqzG6a05GbP31O2uv/uErjlLkNpYKDK
 3OFA==
X-Gm-Message-State: AOAM532RFH0VhIPLpfkW2/8SLwz0wZ0qSF+Fe5IaepZrycXlXyJIPgv5
 dbUE9aI3WsJUJ/rC1F+17CfOY6/9AeEVypchykGHHWAa
X-Google-Smtp-Source: ABdhPJxMnMaMZnf67NjzBaX5vchMC+7Xo+nOk0fNRJ58YDhTE2vwQffIxSTvvFe2bSZywyWdiFwrGtVmwtV88lyxzsE=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr8376653qka.55.1602477548637; 
 Sun, 11 Oct 2020 21:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201011230131.4922-1-rdunlap@infradead.org>
In-Reply-To: <20201011230131.4922-1-rdunlap@infradead.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Oct 2020 04:38:56 +0000
Message-ID: <CACPK8Xej8SoJxrJBL2NB2PnGwjFQ8=oWsfALv2g2r7HxxP9xZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/aspeed: fix Kconfig warning & subsequent build
 errors
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michal Simek <monstr@monstr.eu>, kernel test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 11 Oct 2020 at 23:01, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> kernel test robot reported build errors (undefined references)
> that didn't make much sense. After reproducing them, there is also
> a Kconfig warning that is the root cause of the build errors, so
> fix that Kconfig problem.
>
> Fixes this Kconfig warning:
> WARNING: unmet direct dependencies detected for CMA
>   Depends on [n]: MMU [=n]
>   Selected by [m]:
>   - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=m] && OF [=y] && (COMPILE_TEST [=y] || ARCH_ASPEED) && HAVE_DMA_CONTIGUOUS [=y]
>
> and these dependent build errors:
> (.text+0x10c8c): undefined reference to `start_isolate_page_range'
> microblaze-linux-ld: (.text+0x10f14): undefined reference to `test_pages_isolated'
> microblaze-linux-ld: (.text+0x10fd0): undefined reference to `undo_isolate_page_range'
>
> Fixes: 76356a966e33 ("drm: aspeed: Clean up Kconfig options")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: linux-mm@kvack.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> ---
> First sent on 2020-09-07.
> Feel free to fix the Kconfig warning some other way...

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Randy. Sorry for missing it the first time around. I'll merge
this into drm-misc-next.

Cheers,

Joel



>
>  drivers/gpu/drm/aspeed/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20201009.orig/drivers/gpu/drm/aspeed/Kconfig
> +++ linux-next-20201009/drivers/gpu/drm/aspeed/Kconfig
> @@ -3,6 +3,7 @@ config DRM_ASPEED_GFX
>         tristate "ASPEED BMC Display Controller"
>         depends on DRM && OF
>         depends on (COMPILE_TEST || ARCH_ASPEED)
> +       depends on MMU
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
>         select DMA_CMA if HAVE_DMA_CONTIGUOUS
