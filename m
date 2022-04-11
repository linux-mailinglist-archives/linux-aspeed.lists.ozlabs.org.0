Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46AD4FBB40
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 13:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcRwJ5k8Hz3bWD
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 21:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BOWRda3q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4+XMYwR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BOWRda3q; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4+XMYwR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcRw96Pfkz2xrm
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 21:49:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649677747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C47F8Jf0+w7gVUhWNRSlQXSM6c8V9lKVzHcSZtA8aT0=;
 b=BOWRda3qMo3DvNfpioY0rlvydpLPkLNnqZsFO+iNIA6eRw0r5HreODBw0qU+VJuStQBymE
 5S3Ve1PmFN+iBJVim8YTDvbl/fqPs7QktlFStv7Jw3OGTwkFM5H/Jx7YiBllQ4WiaHkjz0
 1NWIALNHOhOxZAWgQt+55/aubT1lweU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649677748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C47F8Jf0+w7gVUhWNRSlQXSM6c8V9lKVzHcSZtA8aT0=;
 b=i4+XMYwRcRsSg7lek1mECoSYLKQhPo9tBffAc2q3qnNRh+U4ZoyTHKyPD9uDkiSYpzjrQ7
 TWKWd27tx9+8SZLeBNtN7dz5/qOE9gCPzyzqEjkJCMvomVAMGTroh4ZKNubWVHG3y2bOYF
 SrjZDgkx7DCIoKBNKSqjcRInOEm7xMM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-D3FmqeEoMpuN-L-EXBchLw-1; Mon, 11 Apr 2022 07:49:06 -0400
X-MC-Unique: D3FmqeEoMpuN-L-EXBchLw-1
Received: by mail-qv1-f69.google.com with SMTP id
 eo15-20020ad4594f000000b004443ac37d09so3920002qvb.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C47F8Jf0+w7gVUhWNRSlQXSM6c8V9lKVzHcSZtA8aT0=;
 b=PfVwvjThgVKcVTeh+oTGevTntN3tvZL5F9rgFRsQwibKhHtU6s2r6SOuXRpU5BfBdu
 0DQ6XcSyfhLAtfAzVocIxZuR5QZWnpKsMEPdHRsr8JvyK8Skbf76H2g80zpoWAy8NfQd
 NTT2BGGnSQDGQ7eLImGShtLHX+PlSbHh8fvZg06K0XjxTPq7Jbb3vK5FNY5+KT4W0jdN
 sTqNy5FFYLUI99IGOFX5W1Wk3I+qRWJAOVtuGCLOgXgoUmgGrQtoILFPiOnAlR/JStGT
 RqK4HvJvI5fPWYVNdnpxFtVsGzPa9EFpvZKayakOwb49jDT07U6qPTC5486yj/Tltyn2
 V/BQ==
X-Gm-Message-State: AOAM532e+fqyxH+8LLFUzLCAV8YwW8GEh6OA54eCcnSPFhOlaEfnjFWP
 +GUh2hB8P/Mj0aHPEIMjwF0DP3MV5ETJRE5pFtJqi1eybxh1X6E8sctb+w3t1yvcCII9x0m0m48
 /H1mp5T8k+pSOgukM5P1zaekTFw==
X-Received: by 2002:a05:620a:471e:b0:69c:2e29:7b4c with SMTP id
 bs30-20020a05620a471e00b0069c2e297b4cmr1110899qkb.65.1649677746258; 
 Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcqVRzfFf+DL9+gv5UvinGvDX/+g+sbF3Fgbqad296zbxs7VMoB+NJJ4/qusVtoIB9uMIObg==
X-Received: by 2002:a05:620a:471e:b0:69c:2e29:7b4c with SMTP id
 bs30-20020a05620a471e00b0069c2e297b4cmr1110871qkb.65.1649677746034; 
 Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 r123-20020ae9dd81000000b0069c362d5cb6sm138083qkf.105.2022.04.11.04.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 04:49:05 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220410150828.1891123-1-trix@redhat.com>
 <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
Date: Mon, 11 Apr 2022 04:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, alcooperx@gmail.com,
 linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, yashsri421@gmail.com,
 balamanikandan.gunasundar@microchip.com, stern@rowland.harvard.edu,
 bcm-kernel-feedback-list@broadcom.com, linux-geode@lists.infradead.org,
 christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, s.shtylyov@omp.ru,
 neal_liu@aspeedtech.com, rdunlap@infradead.org, nicolas.ferre@microchip.com,
 quic_wcheng@quicinc.com, miles.chen@mediatek.com, gregkh@linuxfoundation.org,
 cai.huoqing@linux.dev, claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/11/22 3:22 AM, Andy Shevchenko wrote:
> On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
>> SPDX
>> *.h use /* */ style comments
>>
>> For double words, remove
>> with, also
>>
>> Spelling replacements
>> wayt to way
>> wakup to wakeup
>> Contrl to Control
>> cheks to checks
>> initiaization to initialization
>> dyanmic to dynamic
> Something really wrong with indentation above.
>
> ...
>
>>   drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>>   drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>>   drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>>   drivers/usb/gadget/udc/core.c             | 4 ++--
>>   drivers/usb/gadget/udc/trace.h            | 2 +-
> I believe that Greg's bot asks to split on per-driver basis.
> OTOH I don't see anything that can be problematic if in one
> change. So, it's up to maintainers then.

Yes, whatever folks want. I can split these.

I have been cleaning up the comments in other areas and am trying to 
strike a balance between too big of a patch vs peppering with many 
single changes.

Tom

>
> ...
>
>> --- a/drivers/usb/gadget/udc/amd5536udc.h
>> +++ b/drivers/usb/gadget/udc/amd5536udc.h
>>    * amd5536.h -- header for AMD 5536 UDC high/full speed USB device controller
> At the same time you may drop the filename(s) from the file(s) as this very
> one shows why it's good not to have a filename inside file.
>

