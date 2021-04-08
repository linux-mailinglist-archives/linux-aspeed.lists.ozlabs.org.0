Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB1359037
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcWL2VxVz2xfw
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ec63m1aT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ec63m1aT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ec63m1aT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ec63m1aT; 
 dkim-atps=neutral
X-Greylist: delayed 3796 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 21:01:04 AEST
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGJGS5Qpyz301g
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 21:01:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617879661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQhqnjeZkCOh2eK1FDK8AD+p6DMcS/hFEdzGcfPMAFo=;
 b=Ec63m1aTQBul7FiRa4W1fUa+u8Y3xF7Rt5hKP916XhJsNnAkzHDHEGY/1YLa02TqagJW+I
 FQsnPiGlcOVV/FMGEQjMxKdSqeWZl3g4qndfEUnWmdlbNW0ckgm7Nu0nGMKw2nt7vTve2p
 bTwr+nKMLI/RuUF0MnU86rQ3U4NttXE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617879661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQhqnjeZkCOh2eK1FDK8AD+p6DMcS/hFEdzGcfPMAFo=;
 b=Ec63m1aTQBul7FiRa4W1fUa+u8Y3xF7Rt5hKP916XhJsNnAkzHDHEGY/1YLa02TqagJW+I
 FQsnPiGlcOVV/FMGEQjMxKdSqeWZl3g4qndfEUnWmdlbNW0ckgm7Nu0nGMKw2nt7vTve2p
 bTwr+nKMLI/RuUF0MnU86rQ3U4NttXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-cf3ok8EPM6mmTtU9zSKjug-1; Thu, 08 Apr 2021 07:00:57 -0400
X-MC-Unique: cf3ok8EPM6mmTtU9zSKjug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E56F83DD21;
 Thu,  8 Apr 2021 11:00:54 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF0CA5D9D0;
 Thu,  8 Apr 2021 11:00:48 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
Date: Thu, 8 Apr 2021 13:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>>> In particular, it does not prevent a configuration with 'DRM_CMA=m'
>>
>> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.
> 
> Ok, at least that makes it easier.
> 
>>> and 'DRMA_ASPEED_GFX=y', or any build failures from such
>>> a configuration.
>>
>> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
>> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?
> 
> I thought you were trying to solve the problem where DRMA_ASPEED_GFX
> can optionally link against CMA but would fail to build when the CMA code
> is in a loadable module.

Yes. I was trying to say: it works with this patch just fine. The issue 
you described does not seem to apply (DRM_CMA=m).

> 
>> Your example looks more like a NOP - no?
>> Or will it have the same effect?
> 
> The example I gave is only meaningful if both are tristate, which is
> not the case here as you explain.

Okay, thanks.

> 
> It is a somewhat awkward way to say "prevent this symbol from
> being =y if the dependency is =m".

What would be the right thing to do in the case here then to achieve the 
"if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?

One approach could be to have for DMA_CMA

default y if DRMA_ASPEED_GFX

but it feels like the wrong way to tackle this.

Thanks!

-- 
Thanks,

David / dhildenb

