Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546082A0CC
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jan 2024 20:06:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X4uKGoYq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9HMn4w7Rz3cM2
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jan 2024 06:06:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X4uKGoYq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9HMg0Bjzz3bbt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jan 2024 06:06:21 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dbdbfaab70eso3610431276.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jan 2024 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704913573; x=1705518373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xVN9oiM6VEQ//kwDrMOVZ7KrFazEJSBllmc6mREn5Co=;
        b=X4uKGoYq0rRzgIBmtFexOBMQOi52VNcxx8GveQwgUss1ThldEO9EYrj89fhtar3l8w
         dKAe3aoELiW41MXrYkLChWdsVEz7XNe44XBYZczmK6bi2op0rxhOgfza7PZapxXega2h
         Tk3NEyUjnierrIlMN7jB813Th7FsRknrCsH6jQq08XiVRCjQEiH4j3mHphV5q4UVui/o
         i7c+tCOXzbe6/lb7f6UOZJ0Bs+Vi2VFqhXzUgOHIY7pp+6URAUurgCx4UEc4IN04ZMm4
         yO+xie/qySMVjv8tpywfl2vPZWU+7xLAsbCyXL5Ltv1B2ctql0jm04wAcka9SbUGjE27
         RTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704913573; x=1705518373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVN9oiM6VEQ//kwDrMOVZ7KrFazEJSBllmc6mREn5Co=;
        b=GUVw9OBYGcuMzSZvZaaYPHw3FpJ7wIm24/II5f1IRf3Uu418vgnTowXkUcuGGlWFre
         7R9iuLCQNts1iQBfBQKd+DtGHiEwRZoHvh076ybP/4D2y90H7ShfhBgu4JcCMEqylCWf
         2rjqudU0kbe8AYXFOgHLpsfoypbA2qYnPNotgt+gJfP0V/LeI06082PEeMx6nzS3FvUj
         aJl6kI71buEdDtXNm5fzLMQxaK7dFMOViYbA3OskegBvPzgRrTQ+5hW0uLNT8p2VwMup
         tbE15tFF0IsxjI3Zqv1CDuxAtMxA776+zHU8d+mBmPgvB7z6OSDe13Df9Ct86A0OCyGe
         x9eg==
X-Gm-Message-State: AOJu0Yz4NM5Z/7etBwKChiZ6ryY52da66rYkW8ATA2MjOPWKu1JxpXl3
	kvst0WXzVbQuBTJW1VI2DiA=
X-Google-Smtp-Source: AGHT+IER38DlupBasxWsv4iP94cUsp3YE9tnDeVhsaCUwpeE9sq7hyvlVZ41NBmDx3UaPsW12/Ntkg==
X-Received: by 2002:a25:948:0:b0:db7:dacf:3fb2 with SMTP id u8-20020a250948000000b00db7dacf3fb2mr48676ybm.95.1704913573019;
        Wed, 10 Jan 2024 11:06:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l3-20020a056902000300b00dbf0d4b2239sm1375376ybh.18.2024.01.10.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 11:06:12 -0800 (PST)
Message-ID: <3830c26d-96be-4084-a04d-8edb9ccbab5e@roeck-us.net>
Date: Wed, 10 Jan 2024 11:06:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Conor Dooley <conor@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
 <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
 <20231212-mouth-choice-40a83caa34ec@spud>
 <2946fbb1-2a47-4d21-83dc-8e45bf6ba5a9@roeck-us.net>
 <60c8bbdb-4e08-44f0-88d4-ab164d4843b5@linux.ibm.com>
 <20240109-pep-coerce-2a86ae88753d@spud>
 <01974929-dfbf-4989-ba39-369e521827d0@linux.ibm.com>
 <3d194e84-bf1a-48e4-a376-e5c327c6508d@linaro.org>
 <2dd37d2b-28da-4e73-9047-61ec5d64bdb5@linux.ibm.com>
 <edbefdfd-eb59-4d86-ad07-feb066a21082@linaro.org>
 <385b06e9-1daa-408a-a0ed-7b09d7d539df@linux.ibm.com>
 <d56b1e3e-72c4-427f-937d-8c8146bf5b28@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d56b1e3e-72c4-427f-937d-8c8146bf5b28@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/10/24 09:54, Krzysztof Kozlowski wrote:
> On 10/01/2024 16:54, Ninad Palsule wrote:
>> Hello Krzysztof,
>>
>>
>> On 1/10/24 09:37, Krzysztof Kozlowski wrote:
>>> On 10/01/2024 15:31, Ninad Palsule wrote:
>>>> Hello Krzysztof,
>>>>
>>>>
>>>>
>>>>>>>> I have send it as a separate commit. https://lore.kernel.org/linux-kernel/20231214144954.3833998-1-ninad@linux.ibm.com/
>>>>>>> Why did you do that? It now just adds undocumented compatibles to the
>>>>>>> driver. Please, as Rob requested, work with Lukas on his series to make
>>>>>>> sure that these devices are documented.
>>>>>> I think krzysztof kozlowski suggested to send these patches separately:
>>>>>> https://lore.kernel.org/linux-kernel/1c5ace65-2fd8-4503-b22f-e0f564d1c83f@linaro.org/
>>>>>>
>>>>>> Did I misunderstood it? Do you guys want me to include that commit again?
>>>>> My comment was in DTS thread under specific DTS patch. How did you
>>>>> figure out it applies to driver and bindings? This does not make sense.
>>>> Sorry for the misunderstanding. Where do you want me to add driver
>>>> patch? Before all DTS patches or after all DTS patches?
>>> Does not matter, why do you insist on combining them with DTS? Drivers
>>> and bindings are going together. DTS better separate, although depending
>>> on the case can be together.
>>>
>> I have combined DTS and Driver because DTS was using compatibility
>> string which is not upstream yet hence I thought it is logical to send
>> it under same patchset.
> 
> Sometimes yes, sometimes not. DTS must not go via driver subsystem, so
> sending it in the same patchset has implications on maintainers applying
> it. Some like it, some don't and you will be nagged for combining them.
> 

"DTS must not go via driver subsystem"

I always thought the guideline was to submit separate _patches_ for dts
and driver changes, but as part of a single series. I didn't know that
there is a rule to submit separate patch _series_. I also didn't know
(and as far as I know no one called me on it) that I am not supposed
to _apply_ dts changes. So far, I typically applied dts changes together
with driver patches after receiving an Acked-by: or Reviewed-by:
from a devicetree maintainer.

This exchange suggests that I did it all wrong. Should I reject devicetree
patches submitted as part of a driver patch series going forward ?
Should I not apply dts patches submitted as part of a patch series ?
If so, it would help to have some documentation I can point to to explain
the rationale to submitters (and myself). Also, in that case, how is the
synchronization between device tree patches and driver patches supposed
to happen ?

FWIW, if dts changes are sent as separate series, I don't know how I would
be able to review driver changes/submissions without being copied on the
associated dts changes.

Guess I am more than a bit confused.

Thanks,
Guenter

