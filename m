Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C64359030
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcW53P2Zz30GH
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C+EcXCXD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C+EcXCXD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=C+EcXCXD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=C+EcXCXD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGGtw1Ttxz2ysp
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 19:59:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617875941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qRbCj/1Pw0sbqnFA7cAFN0KaHJ1niBYvUatQLNt7yA=;
 b=C+EcXCXDmxO/qA3t9kq9gwFCz0inZOfmIPnRPvFQtlXPcZ3ERh1GVBy457z8Zr3ptwiFBf
 Rp56qF700pmpRHpxi9wezA5xB4HO57Cda/ybS5ThsLEirC/oYD1tGMYDurq0BZjWih3agr
 ujHhtYCbzg/l7GlsQObw7ixND4lgsKQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617875941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qRbCj/1Pw0sbqnFA7cAFN0KaHJ1niBYvUatQLNt7yA=;
 b=C+EcXCXDmxO/qA3t9kq9gwFCz0inZOfmIPnRPvFQtlXPcZ3ERh1GVBy457z8Zr3ptwiFBf
 Rp56qF700pmpRHpxi9wezA5xB4HO57Cda/ybS5ThsLEirC/oYD1tGMYDurq0BZjWih3agr
 ujHhtYCbzg/l7GlsQObw7ixND4lgsKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-NppAuqKfOUeFeTzIB7gHeQ-1; Thu, 08 Apr 2021 05:57:39 -0400
X-MC-Unique: NppAuqKfOUeFeTzIB7gHeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8F5987A83A;
 Thu,  8 Apr 2021 09:57:36 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5501E5D9CA;
 Thu,  8 Apr 2021 09:57:32 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Mike Rapoport <rppt@kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com> <YG7TZa8VP458QS5y@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9826d7ef-7f7e-987e-c305-7ae3c533d591@redhat.com>
Date: Thu, 8 Apr 2021 11:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7TZa8VP458QS5y@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 08.04.21 11:56, Mike Rapoport wrote:
> On Thu, Apr 08, 2021 at 11:20:11AM +0200, David Hildenbrand wrote:
>> Random drivers should not override a user configuration of core knobs
>> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
>> dependencies and manual overrides.
>>
>> "This is similar to "select" as it enforces a lower limit on another
>>   symbol except that the "implied" symbol's value may still be set to n
>>   from a direct dependency or with a visible prompt."
>>
>> Implying DRM_CMA should be sufficient, as that depends on CMA.
> 
>            ^ DMA_CMA
>>
>> Note: If this is a real dependency, we should use "depends on DMA_CMA"
>> instead -  but I assume the driver can work without CMA just fine --
>> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   drivers/gpu/drm/aspeed/Kconfig  | 3 +--
>>   drivers/gpu/drm/etnaviv/Kconfig | 3 +--
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
>> index 5e95bcea43e9..a055f763d230 100644
>> --- a/drivers/gpu/drm/aspeed/Kconfig
>> +++ b/drivers/gpu/drm/aspeed/Kconfig
>> @@ -6,9 +6,8 @@ config DRM_ASPEED_GFX
>>   	depends on MMU
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_CMA_HELPER
>> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS
>> -	select CMA if HAVE_DMA_CONTIGUOUS
>>   	select MFD_SYSCON
>> +	imply DRM_CMA
> 
> Ditto

Gah, thanks!


-- 
Thanks,

David / dhildenb

