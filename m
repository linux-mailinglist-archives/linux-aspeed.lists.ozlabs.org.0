Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5635903A
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcWS1DKhz30GH
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ar0/Ev9C;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ar0/Ev9C;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ar0/Ev9C; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ar0/Ev9C; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGRv03pfLz30Fc
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 02:44:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617900278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfhnCQAyCfEthQPScFLk5+XhVK1UjdBG138qICZvuow=;
 b=ar0/Ev9C0RCZwi438X39cNfOMLl1aBxWyLAyi6OyKjc/zmU21i8LPN6N//W+yq4FJzONLH
 4bNCvaseHH+G98bKUZPu2XxiX4jNnubPWEEZJnpEkiC2wbd0vRl6off2h9mF0ecii+Kn54
 wndNFJqgSqM1p/J1PSyOJyr7ZUDhsiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617900278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfhnCQAyCfEthQPScFLk5+XhVK1UjdBG138qICZvuow=;
 b=ar0/Ev9C0RCZwi438X39cNfOMLl1aBxWyLAyi6OyKjc/zmU21i8LPN6N//W+yq4FJzONLH
 4bNCvaseHH+G98bKUZPu2XxiX4jNnubPWEEZJnpEkiC2wbd0vRl6off2h9mF0ecii+Kn54
 wndNFJqgSqM1p/J1PSyOJyr7ZUDhsiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-x1HZ9uJoOgSGPofB8dKw8A-1; Thu, 08 Apr 2021 12:44:34 -0400
X-MC-Unique: x1HZ9uJoOgSGPofB8dKw8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2FB801814;
 Thu,  8 Apr 2021 16:44:30 +0000 (UTC)
Received: from [10.36.113.26] (ovpn-113-26.ams2.redhat.com [10.36.113.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63A0A60636;
 Thu,  8 Apr 2021 16:44:24 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Linus Walleij <linus.walleij@linaro.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
Date: Thu, 8 Apr 2021 18:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08.04.21 14:49, Linus Walleij wrote:
> On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
> 
>>> This is something you could do using a hidden helper symbol like
>>>
>>> config DRMA_ASPEED_GFX
>>>          bool "Aspeed display driver"
>>>          select DRM_WANT_CMA
>>>
>>> config DRM_WANT_CMA
>>>          bool
>>>          help
>>>             Select this from any driver that benefits from CMA being enabled
>>>
>>> config DMA_CMA
>>>          bool "Use CMA helpers for DRM"
>>>          default DRM_WANT_CMA
>>>
>>>            Arnd
>>>
>>
>> That's precisely what I had first, with an additional "WANT_CMA" --  but
>> looking at the number of such existing options (I was able to spot 1 !)
> 
> If you do this it probably makes sense to fix a few other drivers
> Kconfig in the process. It's not just a problem with your driver.
> "my" drivers:
> 

:) I actually wanted to convert them to "depends on DMA_CMA" but ran 
into recursive dependencies ...

> drivers/gpu/drm/mcde/Kconfig
> drivers/gpu/drm/pl111/Kconfig
> drivers/gpu/drm/tve200/Kconfig

I was assuming these are "real" dependencies. Will it also work without 
DMA_CMA?

> 
> certainly needs this as well, and pretty much anything that is
> selecting DRM_KMS_CMA_HELPER or
> DRM_GEM_CMA_HELPER "wants" DMA_CMA.

"wants" as in "desires to use but can life without" or "wants" as in 
"really needs it". ?

-- 
Thanks,

David / dhildenb

