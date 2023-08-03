Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DE76E685
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Aug 2023 13:14:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OA3p6QPR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGmSw64JCz3c3s
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Aug 2023 21:14:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OA3p6QPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGmSm4fvjz2yVs
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Aug 2023 21:14:15 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bcf2de59cso122398066b.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Aug 2023 04:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691061249; x=1691666049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz7M4w89N1Qj4qzojD7WPQXmewiYpLB/S7kPSHWDd6Y=;
        b=OA3p6QPR3AVsmyV3GzKFNQbrJfTeEWbfYPiQnF2rPd6ol0Y0hHhyO/YSjTaIVFMLOC
         yBpNefN9xyzCCt3FAHOBJoDgtWfO8xWwoDo4TR2gsFddEcT5u78clDNHUwBsTP/dgYML
         4lFsd2EiEkhsr0GfVq5C2h9zWIxVC/oQ9n4Obx4DrMJIxs1z5DdyrcOHhpWtJ8l5S3k5
         DC11fhpkp116wnx63BYuFn4YLxQ8t51XwLOIe+ygHJyg8VsL7emoP2uMD2WrB7oeDjy4
         eQxvHPELEtspGoqPSKmErDZYGr01Wm1Jv2QB9DLynJZw57nhpaHw9Yp0zBrcYAdTEySt
         1RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061249; x=1691666049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz7M4w89N1Qj4qzojD7WPQXmewiYpLB/S7kPSHWDd6Y=;
        b=kVeseoHKKELDVEJFoXUoqaqRUz+DjaxcyHk5VbQNqpKc+Knicv3BPzAncUpPwcxJJi
         yB79LuQpcouOHxQK7ElAoJAhrV+EXSBeOMnpxF2yDbkNDhuviQ97fKUOxftHaj+Tj7/l
         hUAldTbyG6HwOjYCfIQz0gUOXxfZXZZ4RcfZVQQqvBuk5e+w7Y2mnSSEZDgtP1MEcZgv
         ad8l96Rcj9WIZv7LrO4aSEvRbYtmUobv0zzyNIwGBwzrHUkzfs0u8yVD0d8mCUc99A+l
         l1yeo86xnyqErgW3LWQOpTjpT97S36JUly5egOaQTH+BAdCdFF/lA/9GC1Tfhm7fEYMp
         gD9Q==
X-Gm-Message-State: ABy/qLZdjB3aUPX/XQpxjo6OppQY2s7Kc2bJLJQF+VvX40XYwjX0Wmg4
	RkJtttZ17W3OaJ5hIMGdqDD3Rg==
X-Google-Smtp-Source: APBJJlFyawsd/4ViwQElZD43o2SEQ8gXoVUXKCPY0H5qJIEYPnp0tfDY4O+6BXoX4TRJKeyNxGW7Pg==
X-Received: by 2002:a17:906:105e:b0:99b:d977:c00c with SMTP id j30-20020a170906105e00b0099bd977c00cmr6377108ejj.45.1691061249590;
        Thu, 03 Aug 2023 04:14:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090690c800b00997e99a662bsm10256142ejw.20.2023.08.03.04.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 04:14:09 -0700 (PDT)
Message-ID: <9654ac64-11c6-9fae-0e8d-feb6440dd45c@linaro.org>
Date: Thu, 3 Aug 2023 13:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230727033926.1904529-1-Delphine_CC_Chiu@wiwynn.com>
 <c9062d5c-b536-f89c-b380-8a0c9b858526@linaro.org>
 <PS2PR04MB35928B386F03C987061433D2B70BA@PS2PR04MB3592.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PS2PR04MB35928B386F03C987061433D2B70BA@PS2PR04MB3592.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 02/08/2023 04:34, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, July 27, 2023 2:49 PM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
>> patrick@stwcx.xyz; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> Joel Stanley <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
>> board
>>
>>   Security Reminder: Please be aware that this email is sent by an external
>> sender.
>>
>> On 27/07/2023 05:39, Delphine CC Chiu wrote:
>>> Document the new compatibles used on Facebook Yosemite V4.
>>>
>>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> I got the same patch four times...
> It was my oversight to send the same patch multiple times.
> Would you please to tell that should I resend a new version, or these patches has been already under reviewed.
> Thank you.

I don't see versioning, no changelog. Thus if you send the same patches
all the time, then answer is - please version your patches, implement
the feedback and explain in changelog what changed.

Otherwise it will not get reviewed, so I assume this was not reviewed
and it is waiting for proper submission.

Best regards,
Krzysztof

