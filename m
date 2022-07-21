Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81657C511
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 09:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpNzV0ZYXz3c64
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 17:11:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UY8lpCxm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UY8lpCxm;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpNzM37fRz302W
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 17:11:40 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id k19so747692lji.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VBDe4gorRUprlTmBClJI/DlecJjKNCX0yBbr1Si/Kq4=;
        b=UY8lpCxmvbtL/toGtsqltQnAwxXPAPj/BCPbeGrIolwMwllrvM9dWaWjlPyDIKSFQR
         N8A4f2HAiYO7ETqOVF6xYsfX8YcjEL2Ts5VkzkYYcT6bbgiSF/5xTTJcb48nsn1wYTtC
         3tT1PfchNwMIwVobbX17i2WWsNDAe+okLqFBmvAM5WT1vZMy5siVrVW/I02HtMI4zaFd
         SpeZPF9BpsR1vPBEwDoJVjQleSxqTT+xjGj113pcLEyxUfRFq4xFnS0bm/GboRE10dI0
         I/x5/rrcTMDs/IT7G0+IUi7cSCbkXZR6BiIfInjMFX/BGD8oKFmWlHMGNLCL+u5EKu+c
         SRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VBDe4gorRUprlTmBClJI/DlecJjKNCX0yBbr1Si/Kq4=;
        b=yiOY6MyME2Ks3dZipsntH4pS3oEvllFyrsway16P6pDp3oSPJXTEIhC/pdqvq7UT2r
         RHY3KZLz+e0BzjwYZ8nB/663JgDEQcGmbftE2brMP51JqUeJwnSyypM1iJm6oMcHfDMp
         FSG7QZCPrGNSEAixvf5LHc//Yc6hsJXOf1uRvEqHo/yLcPTzXaMhs+s36GvFBq+d2aOu
         K2wg8CJoTyOh9c4jmZxOs3jWP0Hpq+41hnDRVXujhM9a14T/hVtW8RV3gHPrXPvUJ5vZ
         ZEXjz+SyX40DPkolafsaAw+kx4vAfRetVt3abO+21hMVK+lp4ZmMxMALprhoug9IfKJB
         hYtw==
X-Gm-Message-State: AJIora9yjUb543tNHV+rnNolk/ZnQlbE5LUa88YxnWKajwNK4e5IBgpv
	TL1yC53tBwwcI9tW3rExAkSWHA==
X-Google-Smtp-Source: AGRyM1sP/W0gXXiVd0E1gcpliLF83/mwjurfkbq28/xa3UPvrWoPr9+eLGizH6pNBoPYCugtoCbZfQ==
X-Received: by 2002:a2e:a287:0:b0:25d:b515:430c with SMTP id k7-20020a2ea287000000b0025db515430cmr9235376lja.358.1658387496614;
        Thu, 21 Jul 2022 00:11:36 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 23-20020ac25f57000000b0048159b43083sm255519lfz.201.2022.07.21.00.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 00:11:36 -0700 (PDT)
Message-ID: <174eaacb-27e6-0ce3-3a27-07137a4d1a0d@linaro.org>
Date: Thu, 21 Jul 2022 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-2-quan@os.amperecomputing.com>
 <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
 <4516d7a6-f493-aa51-2700-bbab8ea8533a@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4516d7a6-f493-aa51-2700-bbab8ea8533a@os.amperecomputing.com>
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 04:46, Quan Nguyen wrote:
> 
> 
> On 20/07/2022 17:34, Krzysztof Kozlowski wrote:
>> On 20/07/2022 10:52, Quan Nguyen wrote:
>>> Document Ampere Mt.Mitchell BMC board compatible.
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> ---
>>> v2:
>>>    + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]
>>>
>>>   Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> index d61408194998..b8146d5c4431 100644
>>> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> @@ -71,6 +71,7 @@ properties:
>>>             - enum:
>>>                 - aspeed,ast2600-evb
>>>                 - aspeed,ast2600-evb-a1
>>> +              - ampere,mtmitchell-bmc
>>
>> Put the entry ordered alphabetically.
>>
> 
> Thanks Krzysztof for the review.
> 
> Will change to :
>               - enum:
>   +              - ampere,mtmitchell-bmc
>                  - aspeed,ast2600-evb
>                  - aspeed,ast2600-evb-a1
> 
> But, should we correct the below as well? ie: to move 
> "ampere,mtjade-bmc" to before "aspeed,ast2500-evb" ?
> 
Oops, indeed, I added aspeed in wrong place. I'll correct it in my tree.

Best regards,
Krzysztof
