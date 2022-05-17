Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356452C797
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 01:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Tp12smPz3bs0
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 09:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MAvqRFZM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MAvqRFZM; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2g1m5LkGz30Lp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 May 2022 01:26:03 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id f4so19140863lfu.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
 b=MAvqRFZMqTF2/qVoqgWL5T0C+ULSZS7SdHzVh6LuDRdT51k+tjmab0c7gpzsf0Ql7k
 ReP/eAAoQU51GsQD4Bz0ywyVLUNnZh/mE3GNKvawkR7gvPqBw5mXHXDDgdkNrpfTpAs1
 bAMk6xyeJ1g4mnjcaeSQMvlpPsF4rbwLd+zy7LuQWikYbxdBzh0GZpJaYHhJxcWDRPdr
 liBJ3i5eBbWp55RwkiZwR+iHlOp6uft4OXTRqqT9OHhoOaU24sAJ7WOwFhn0hed1CrBs
 PnWxpalasLu5anySlBVesTRozNRF6F1oQ8HwZT5nEhEcwxQOOhte+RNCH6dwDZuqzYvq
 U0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
 b=o/gOHtCHXJDvZpnzBYWZZJ8t3vkwADDWFy4jimmN0MwT5Jw7dCBQrYkQNlWQqS3tH+
 OoZOUcw4IiNmWPXvzqDThXiGbcKtbPd/S4WMys8A2cdDRozjvYyQs3hLxDsdtPzvybb0
 qNVQz910NU+Gx8z9/tI+Lx8R0wcKNJTc2RP7Pu5k22KMr+LsJooRun+y+GVL8BTxrAv5
 gEX/NJBD5r93IwaKJbvTbyHJ5Y26i33JOzwGG4j7WzKc5ti8ILIeASjhwSNFcZxYC75p
 2yiGIa5ZDEJ3/PQoJOwIRFcJBEJCuhQnatwug4gJVntTxDXfbDqiKlbrYa1gDGECaPYg
 Tw7g==
X-Gm-Message-State: AOAM531F4liDnc0uOQzVbLTMAjyZbXNtOQQcHv1g66c+cyHEgVPWPg0X
 JirwL1gO8EMy0ZpW5NxPfHlClg==
X-Google-Smtp-Source: ABdhPJxmP1/fh87kksGIF64YeOa63xcO4AZZoPfdVcUnKNeeAX7gyD0GjdDyznBoSgv6nNdqeC5cBA==
X-Received: by 2002:a05:6512:280e:b0:473:a0c9:5bdf with SMTP id
 cf14-20020a056512280e00b00473a0c95bdfmr17199543lfb.337.1652801159066; 
 Tue, 17 May 2022 08:25:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512348200b0047255d21124sm2221lfr.83.2022.05.17.08.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 08:25:57 -0700 (PDT)
Message-ID: <1327ec95-f6b4-838d-f3f2-a115c2ab632b@linaro.org>
Date: Tue, 17 May 2022 17:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
 <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 19 May 2022 09:33:33 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/05/2022 17:21, Neal Liu wrote:
>>>>>
>>>>> +		udc: udc@1e6a2000 {
>>>>
>>>> The same as DTS in bindings - generic node name, please.
>>>>
>>>
>>> Is it possible to use "udc: usb-udc@1e6a2000" to distinguish it between "vhub:
>> usb-vhub@1e6a0000"?
>>
>> Possible yes :), but not recommended and not wanted. Nodes should be generic
>> and prefixes are added only if there is no unit address. You can though use
>> some more descriptive label.
>>
> "udc: usb@1e6a2000" is okay for you?

Yes, it's perfect.


Best regards,
Krzysztof
