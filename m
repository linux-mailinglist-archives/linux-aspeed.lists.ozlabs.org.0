Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B435C75F
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 15:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJq821y8Tz30Fn
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 23:19:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ifujdcit;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ifujdcit;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ifujdcit; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ifujdcit; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJq7z12GBz302l
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Apr 2021 23:19:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618233545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZXD0Vjr7M6pXQoqoYaNJ9fIJMRtCGqZKUK6a7IbIAM=;
 b=IfujdcitXd9kYzsj+8DDlnMxAEjGbadVBza3cHUTz9FUaG8Yd9XzCtltvTBh5btJ4Md062
 e0XtzAvn94j3qcrWUUs9/h5aYJj1WyfjDRc2XzXDp1kM6+av/4bR/79iKg9neQZiE19BVq
 x94D0YPCfff5/1n++f+Di2qy3WWhCgE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618233545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZXD0Vjr7M6pXQoqoYaNJ9fIJMRtCGqZKUK6a7IbIAM=;
 b=IfujdcitXd9kYzsj+8DDlnMxAEjGbadVBza3cHUTz9FUaG8Yd9XzCtltvTBh5btJ4Md062
 e0XtzAvn94j3qcrWUUs9/h5aYJj1WyfjDRc2XzXDp1kM6+av/4bR/79iKg9neQZiE19BVq
 x94D0YPCfff5/1n++f+Di2qy3WWhCgE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-aVkiYBXjNSO0lmMF1qjtzw-1; Mon, 12 Apr 2021 09:19:03 -0400
X-MC-Unique: aVkiYBXjNSO0lmMF1qjtzw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l9-20020a05600c4f09b029010ec37d1c58so2102047wmq.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Apr 2021 06:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7ZXD0Vjr7M6pXQoqoYaNJ9fIJMRtCGqZKUK6a7IbIAM=;
 b=FYY4Rido6nfWdTMTPBJwkX2Gr0e9h9jjoBZXKyMSyy5x99fp3WQxjFG6YMBNlVe321
 cHn8mwgIA40uDFHkvydzfhJuUWOTKSLu8dLWOw10YBy0RI/gxHaQULJK9TM7jP+amEx/
 4qG+o/m6dYskEDWlv95q+P4yzspke06fWB9ZI4gQ19Dk5l/1leUth4Bx8iJP+Af0Uj9r
 FeIPttWNkSRDDVQYfIIkDugSVLZn0/BYymhoE+o0aCKy88cAFvpaVcGQ+OZeCfSrRHz9
 UrZimBaTSQTNbRlxpeOO+LlyyViNLUNAIk5GujG3T81G64JgrSK/O02uZ/PDUSDcaDrh
 NFNg==
X-Gm-Message-State: AOAM531zsLmOomq05KEO4s1baPQqUnx0uq9oM+B0Gn2whGYgmghBZbaT
 sKVZrT45l+qb2F5mfN3ZM5LDH7p9ZWE20X4YZTUtUvvkRKIa6bhUqNnhfA2gytmcaqTD/xphOYp
 YF5Ahrb3gJul0fTpJu1bz/y2QSw==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr14516005wrq.33.1618233542680; 
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7xYSMl1mhv7IAg348AjhAJnlfD0ElxtQIBjiZbX8gXBrQUGHbbh/j9IzPlcTzIMjQzJv+hg==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr14515964wrq.33.1618233542418; 
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c66cb.dip0.t-ipconnect.de. [91.12.102.203])
 by smtp.gmail.com with ESMTPSA id c8sm14836856wmb.34.2021.04.12.06.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
 <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
 <34350446-0e0e-6947-40bd-fabdccdc835f@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e996ca72-7857-ba50-0e7e-f0c3dab3a931@redhat.com>
Date: Mon, 12 Apr 2021 15:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <34350446-0e0e-6947-40bd-fabdccdc835f@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Eric Anholt <eric@anholt.net>,
 Christoph Hellwig <hch@lst.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12.04.21 15:12, Robin Murphy wrote:
> On 2021-04-09 14:39, David Hildenbrand wrote:
>> On 09.04.21 15:35, Arnd Bergmann wrote:
>>> On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com>
>>> wrote:
>>>>
>>>> Random drivers should not override a user configuration of core knobs
>>>> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
>>>> which depends on CMA, if possible; however, these drivers also have to
>>>> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
>>>> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
>>>> driver cannot do it's job properly in some configurations.
>>>>
>>>> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and
>>>> DMA_CMA if
>>>> available") documents
>>>>           While this is no build dependency, etnaviv will only work
>>>> correctly
>>>>           on most systems if CMA and DMA_CMA are enabled. Select both
>>>> options
>>>>           if available to avoid users ending up with a non-working GPU
>>>> due to
>>>>           a lacking kernel config.
>>>> So etnaviv really wants to have DMA_CMA, however, can deal with some
>>>> cases
>>>> where it is not available.
>>>>
>>>> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
>>>> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
>>>> of recursive dependency issues).
>>>>
>>>> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
>>>> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>>>>
>>>> With this change, distributions can disable CONFIG_CMA or
>>>> CONFIG_DMA_CMA, without it silently getting enabled again by random
>>>> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
>>>> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
>>>> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
>>>> DRM_KMS_CMA_HELPER.
>>>>
>>>> For example, if any driver selects WANT_DMA_CMA and we do a
>>>> "make olddefconfig":
>>>>
>>>> 1. With "# CONFIG_CMA is not set" and no specification of
>>>>      "CONFIG_DMA_CMA"
>>>>
>>>> -> CONFIG_DMA_CMA won't be part of .config
>>>>
>>>> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>>>>
>>>> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
>>>> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>>>>
>>>> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>>>>
>>>> -> CONFIG_DMA_CMA will be removed from .config
>>>>
>>>> Note: drivers/remoteproc seems to be special; commit c51e882cd711
>>>> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains
>>>> that
>>>> there is a real dependency to DMA_CMA for it to work; leave that
>>>> dependency
>>>> in place and don't convert it to a soft dependency.
>>>
>>> I don't think this dependency is fundamentally different from the others,
>>> though davinci machines tend to have less memory than a lot of the
>>> other machines, so it's more likely to fail without CMA.
>>>
>>
>> I was also unsure - and Lucas had similar thoughts. If you want, I can
>> send a v4 also taking care of this.
> 
> TBH I think it should all just be removed. DMA_CMA is effectively an
> internal feature of the DMA API, and drivers which simply use the DMA
> API shouldn't really be trying to assume *how* things might be allocated
> at runtime - CMA is hardly the only way. Platform-level assumptions
> about the presence or not of IOMMUs, memory carveouts, etc., and whether
> it even matters - e.g. a device with a tiny LCD may only need display
> buffers which still fit in a regular MAX_ORDER allocation - could go in
> platform-specific configs, but I really don't think they belong at the
> generic subsystem level.
> 
> We already have various examples like I2S drivers that won't even probe
> without a dmaengine provider being present, or host controller drivers
> which are useless without their corresponding phy driver (and I'm
> guessing you can probably also do higher-level things like include the
> block layer but omit all filesystem drivers). I don't believe it's
> Kconfig's job to try to guess whether a given configuration is *useful*,
> only to enforce that's it's valid to build.

That would mean: if it's not a built-time dependency, don't mention it 
in Kconfig.

If that were true, why do we have have defaults modeled in Kconfig then?

IMHO, some part of Kconfig is to give you sane defaults.

-- 
Thanks,

David / dhildenb

