Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF594359036
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcWJ41QRz3bTf
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aaNAU9CD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aaNAU9CD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aaNAU9CD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aaNAU9CD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGHl01PDgz30B5
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 20:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617878232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLjjLoz+QeRsQ1MOoIX2RgV24dAqIxs+wPP9bncu07U=;
 b=aaNAU9CDlpk4dMcFbfT3TaK6v8gGrYl6XrwUrQYqgp16Ccal71HH9TXHpl6LhelycUwDA+
 OOt5vgWq17kbPKdfOzfXgJEeR6z00HEXqgaQ7KDJE/MYUlrF6S7ixe+qsToyOSdOD/lEg2
 S3c1zu3aNZKs2W64MkTPoerciGMgkho=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617878232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLjjLoz+QeRsQ1MOoIX2RgV24dAqIxs+wPP9bncu07U=;
 b=aaNAU9CDlpk4dMcFbfT3TaK6v8gGrYl6XrwUrQYqgp16Ccal71HH9TXHpl6LhelycUwDA+
 OOt5vgWq17kbPKdfOzfXgJEeR6z00HEXqgaQ7KDJE/MYUlrF6S7ixe+qsToyOSdOD/lEg2
 S3c1zu3aNZKs2W64MkTPoerciGMgkho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-2LSDVNSAMvy_w6wcmDZmyA-1; Thu, 08 Apr 2021 06:37:08 -0400
X-MC-Unique: 2LSDVNSAMvy_w6wcmDZmyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761D4CC622;
 Thu,  8 Apr 2021 10:37:05 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A5151001B2C;
 Thu,  8 Apr 2021 10:37:00 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
From: David Hildenbrand <david@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0b1928a8-99c3-f1f1-ad66-40145199d9bc@redhat.com>
Date: Thu, 8 Apr 2021 12:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On 08.04.21 12:27, David Hildenbrand wrote:
> On 08.04.21 12:20, Arnd Bergmann wrote:
>> On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> Random drivers should not override a user configuration of core knobs
>>> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
>>> dependencies and manual overrides.
>>>
>>> "This is similar to "select" as it enforces a lower limit on another
>>>    symbol except that the "implied" symbol's value may still be set to n
>>>    from a direct dependency or with a visible prompt."
>>>
>>> Implying DRM_CMA should be sufficient, as that depends on CMA.
>>>
>>> Note: If this is a real dependency, we should use "depends on DMA_CMA"
>>> instead -  but I assume the driver can work without CMA just fine --
>>> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
>>
>> 'imply' is almost never the right solution, and it tends to cause more
>> problems than it solves.
> 
> I thought that was the case with "select" :)
> 
>>
>> In particular, it does not prevent a configuration with 'DRM_CMA=m'
> 
> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.
> 
>> and 'DRMA_ASPEED_GFX=y', or any build failures from such
>> a configuration.
> 
> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?
> 
>>
>> If you want this kind of soft dependency, you need
>> 'depends on DRM_CMA || !DRM_CMA'.
> 
> Seriously? I think the point of imply is "please enable if possible and
> not prevented by someone else". Your example looks more like a NOP - no?
> Or will it have the same effect?

I just tried (remove CONFIG_DMA_CMA from .config followed by make) and 
the default will be set to "N" (when querying the user). So it indeed 
looks like a NOP - unless I am missing something.

-- 
Thanks,

David / dhildenb

