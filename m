Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC284FBC8B
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 14:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcTMK6yXXz3bXG
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 22:54:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfKd5xtH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfKd5xtH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PfKd5xtH; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfKd5xtH; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcTMD4Wz1z2xsm
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 22:54:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649681650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1ACZnv4dSvd+7MrAGFUMxiOskXRQlu4NrC+OOGZ4+w=;
 b=PfKd5xtH4QmsjeaAWMaDdrQV5UQzKM2IpqCVwtQpB0JZbETYGhVQHVDOWC769gUd+tgqW4
 p7WRvz1PnwFi0rQaHyei8UCGEWPiO2/XMpXAq2VTn70KBhHIRFQEUMYaaahqKMNuuk4x4G
 jTM0PT8jwfFaJsFtJeLHNz5BiQ2zCt0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649681650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1ACZnv4dSvd+7MrAGFUMxiOskXRQlu4NrC+OOGZ4+w=;
 b=PfKd5xtH4QmsjeaAWMaDdrQV5UQzKM2IpqCVwtQpB0JZbETYGhVQHVDOWC769gUd+tgqW4
 p7WRvz1PnwFi0rQaHyei8UCGEWPiO2/XMpXAq2VTn70KBhHIRFQEUMYaaahqKMNuuk4x4G
 jTM0PT8jwfFaJsFtJeLHNz5BiQ2zCt0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-__6KZKtGNNm7wUXMovnTzg-1; Mon, 11 Apr 2022 08:54:07 -0400
X-MC-Unique: __6KZKtGNNm7wUXMovnTzg-1
Received: by mail-qv1-f69.google.com with SMTP id
 e10-20020a0562140d8a00b00443c3595342so15669014qve.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 05:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/1ACZnv4dSvd+7MrAGFUMxiOskXRQlu4NrC+OOGZ4+w=;
 b=olmGZm6aHF6F9WwMBoR5wQEpl8o2RlgagZiL7OUxt/Mt5iLft6oCKwL7AONnvPlTbv
 kksJFr88gBsDKj1K1p7U10+yKRClOtU67etzUxUkJ1G4oOWemV9lGoYA2/Lf7BdfNn0w
 fqC+iZlgxUpXvJGYllrco2SxfEAXhrP4CHdaxkMkii2BXImiFtmtQXk0/dnIfpGiJ4cX
 zrHSnx24su+49O3DIfPqGNYxVpg/+fIMiaf6WEq1cogGNFw06cc9o/4JR/ywif9eFMUC
 dppGre47oV41ySKtIWHyFl5ty7lxJakr8ciIYQG+s2BBEECdOePZSiHnm1/u8LOWuFGi
 dBlA==
X-Gm-Message-State: AOAM533JS5by3y2x7zQKDYl9cyWG2WXua3XMjSGWfT0U5o4PZBKlDMQO
 /45NhNgO2xO397IyerWr8kTW2efT+jc3m1EDg7LQtzAZV8tLxj4zMfnleX7PlXBEGFtRGf7cyAS
 ih53Ifr7owq4ok2asOjINVWCVsg==
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id
 p3-20020a05622a00c300b002e34bd016c2mr25226558qtw.575.1649681647013; 
 Mon, 11 Apr 2022 05:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIV5iyeYsK7wzpSCFV5IpaPDdchJGJP14JRpC3RjdeYl2PVrL9nHiY7ZV4YJ2cEFBR1V74hQ==
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id
 p3-20020a05622a00c300b002e34bd016c2mr25226533qtw.575.1649681646673; 
 Mon, 11 Apr 2022 05:54:06 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 x82-20020a376355000000b0069b971c58c1sm6531215qkb.60.2022.04.11.05.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:54:06 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220410150828.1891123-1-trix@redhat.com>
 <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
 <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
 <YlQeEC41m3UeOeiE@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <2f22174f-8618-8f5a-6adf-3d2befa8450a@redhat.com>
Date: Mon, 11 Apr 2022 05:54:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YlQeEC41m3UeOeiE@kroah.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, s.shtylyov@omp.ru,
 neal_liu@aspeedtech.com, rdunlap@infradead.org, nicolas.ferre@microchip.com,
 quic_wcheng@quicinc.com, miles.chen@mediatek.com, cai.huoqing@linux.dev,
 claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/11/22 5:24 AM, Greg KH wrote:
> On Mon, Apr 11, 2022 at 04:49:00AM -0700, Tom Rix wrote:
>> On 4/11/22 3:22 AM, Andy Shevchenko wrote:
>>> On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
>>>> SPDX
>>>> *.h use /* */ style comments
>>>>
>>>> For double words, remove
>>>> with, also
>>>>
>>>> Spelling replacements
>>>> wayt to way
>>>> wakup to wakeup
>>>> Contrl to Control
>>>> cheks to checks
>>>> initiaization to initialization
>>>> dyanmic to dynamic
>>> Something really wrong with indentation above.
>>>
>>> ...
>>>
>>>>    drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>>>>    drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>>>>    drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>>>>    drivers/usb/gadget/udc/core.c             | 4 ++--
>>>>    drivers/usb/gadget/udc/trace.h            | 2 +-
>>> I believe that Greg's bot asks to split on per-driver basis.
>>> OTOH I don't see anything that can be problematic if in one
>>> change. So, it's up to maintainers then.
>> Yes, whatever folks want. I can split these.
>>
>> I have been cleaning up the comments in other areas and am trying to strike
>> a balance between too big of a patch vs peppering with many single changes.
> Patch series are much easier to review and is just as simple to apply as
> a single patch, so that makes it overall better for you to do.

ok

Tom

>
> thanks,
>
> greg k-h
>

