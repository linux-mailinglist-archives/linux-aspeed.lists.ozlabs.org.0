Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA82529507
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 01:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FVn51gDz3c7H
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 09:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a9IbvRUa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a9IbvRUa; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0xkl4Yq6z30Dp
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 May 2022 06:22:04 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id s27so13978012ljd.2
 for <linux-aspeed@lists.ozlabs.org>; Sat, 14 May 2022 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y5VRY1Vg5U7FZOYxaP3jhw1GgftqMUz+kaXgWZO/zzo=;
 b=a9IbvRUaYC8Wc0vyxgFwHAxgU9mSVnhYPrySypKYv+QMWSeS0lIY4wxVjb/+x54LWq
 Ldc1cXpfGj905mcwbZhrOB2SdRWkkkJTcN8XmsLxZM3o1iVoUToVGPQqNwOLRWQqNkFV
 hvbA4emBw/8q79PftXEPsH+kSyqRfafhujdgE+P8fJGteGOcK7xMkyuufwBAw8bIrRFa
 gJuSbkhJHloXm+OQ9D+IZ7DsfUCXfPkNBD+eHfglA2cDMFd0vT8MnG+Zmj8mMlPJwnb4
 yTLeFaHM+EYpglB82UoRIxyn6Isw1Z9/jYS70nsrx3FRo+XYLmINHoUjvQQkh8OJSE4S
 gzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y5VRY1Vg5U7FZOYxaP3jhw1GgftqMUz+kaXgWZO/zzo=;
 b=11/EFrwG8+VsXPsHW0o7oMI/yS4IqDMTd/gF6dZlxZorhcOm5TOyYIaPJNCMi5YhhA
 VR+oy2FqMW03tzsgM0UEFq5o0qWOqBCIgf+cVT6DPiFwAgoU/NlFnthyQgITHVO4AudV
 0f2LZcoqwMBGphLt0LfyX7R8ZUl1Atk5vwUYaTkIZ9DmLEkPKMM9irM59NdOLtF003f8
 Qff1ErIZutTg/uIjHmpUFTEYwDUIvZ9dP2RBWKkZGVv8Kg7vHLmNoJ5xrIF3/UVuttId
 Pmddq5iLoC3hv5QC0gASRRKEVrQxWvkzdqZQ3PE53VkAO1ismuRnTrielBtDqmRNKV8d
 IBfQ==
X-Gm-Message-State: AOAM533nOjcV4Z+t7MA4GQS5SHFhbOkreex+br6/nzGyKaUKrZ1K6hLS
 pqMKlu3JiMe1cKzkU8Fk6YerBA==
X-Google-Smtp-Source: ABdhPJzLyuqdkaQnJF2ClXg0Jx1DgHwKnG2ziP/ISkfSmc674JtqB4hc3nDy/CLvL1Xr59yD6peNiw==
X-Received: by 2002:a05:651c:98d:b0:250:976b:4a0e with SMTP id
 b13-20020a05651c098d00b00250976b4a0emr6642090ljq.494.1652559718267; 
 Sat, 14 May 2022 13:21:58 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z2-20020a2e9b82000000b0024f3d1daeaesm942625lji.54.2022.05.14.13.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 13:21:57 -0700 (PDT)
Message-ID: <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
Date: Sat, 14 May 2022 22:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
 <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:46 +1000
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
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/05/2022 17:39, Neal Liu wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, May 13, 2022 5:07 PM
>> To: Neal Liu <neal_liu@aspeedtech.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>;
>> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley
>> <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; Felipe Balbi
>> <balbi@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian
>> König <christian.koenig@amd.com>; Geert Uytterhoeven <geert@linux-
>> m68k.org>; Li Yang <leoyang.li@nxp.com>
>> Cc: linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; linux-media@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; BMC-SW <BMC-
>> SW@aspeedtech.com>
>> Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed
>> udc
>>
>> On 13/05/2022 08:57, Neal Liu wrote:
>>> Add device tree binding documentation for the Aspeed USB2.0 Device
>>> Controller.
>>>
>>> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/usb/aspeed,udc.yaml   | 52
>> +++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/usb/aspeed,udc.yaml
>>
>> Please name the file as first compatible, so "aspeed,ast2600-udc.yaml"
> 
> Okay, I could rename it for next patch if you preferred.
> But there are lots of yaml files which are not named as first compatible.

Yes, I know, I quite likely I also produced such bindings, but a
specific name is rather preferred. Otherwise you will have a difficult
naming choice when your next Aspeed UDC requires new bindings file
because of some differences (not yet known now).

> 
>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
>>> b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
>>> new file mode 100644
>>> index 000000000000..d1d2f77d1c54
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
>>> @@ -0,0 +1,52 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
>>> +(c) 2020 Facebook Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/aspeed,udc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ASPEED USB 2.0 Device Controller
>>> +
>>> +maintainers:
>>> +  - Neal Liu <neal_liu@aspeedtech.com>
>>> +
>>> +description: |+
>>> +  The ASPEED USB 2.0 Device Controller implements 1 control endpoint
>>> +and
>>> +  4 generic endpoints for AST260x.
>>> +
>>> +  Supports independent DMA channel for each generic endpoint.
>>> +  Supports 32/256 stages descriptor mode for all generic endpoints.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-udc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>
>> No child properties? No ports or any other devices? No usb-hcd.yaml?
> 
> Aspeed udc only has 1 port, no need extra properties for now.

OK

> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - interrupts
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/aspeed-clock.h>
>>> +    udc: udc@1e6a2000 {
>>
>> Node name: usb
>  
> "udc" is more recognizable than "usb" I think. "usb" is too general, can be various like host or device.

It's still required by schema for most of USB host controllers. Existing
USB device controllers use usb as well (except Atmel mentioning gadget)
Generic name is also expected by Devicetree spec and "udc" is not on a
list of examples of generic names (usb is).


Best regards,
Krzysztof
