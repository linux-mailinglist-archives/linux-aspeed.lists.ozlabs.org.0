Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A05F5707
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Oct 2022 17:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjHr934Blz2xrK
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 02:03:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=utnjQ6Ud;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=utnjQ6Ud;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjHr13RHNz30Ky
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 02:02:54 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id o7so18683406lfk.7
        for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Oct 2022 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=94mwMcPTU0fA4GC+JR+9ZWgjXzSQUOmYw33Hhdzn4ZY=;
        b=utnjQ6UduXlYMm84LFM1+C53Zd4+3CYWVgEibonC+mKvHo+QrpQNKpr6nfrkn3pdY+
         7sOsaDoI5FAkzd40PI7MUVWG8C8wk+ON1W4Fygngosg8LU5l5LSA0nSk0jisnnansQgh
         Ov3PcDgglKHzvxqQS+INU8gDqGh1Z1XW/YXM7EtBHQ8e4i43HqL9FxitMtXNyZTNIsV/
         RFhNp/wQwfBveHuDbg3wlzSU+M2tVoFdX4lm9uZtvd+Zj1gSnlT8rBnb6LoNTi2om1Z3
         AWVcHcEnJOoMkFI+n04+VIwVz1cMlasKLKrLjgHv7xf1B2QfnPTTOwTe/q+yLPedGquv
         /F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=94mwMcPTU0fA4GC+JR+9ZWgjXzSQUOmYw33Hhdzn4ZY=;
        b=JqrK+6x2ZqDLVESYy6LQUjEAk9i6Oep0IE14zasMLlH3M2b5YNW28QlgzEg+PrJhNG
         F1IkfsgWIEGJnszhpeX/8gqUeLUIanGShmNRhrR6tBOjabEF6y3HwitCfKNvL6CBSaCv
         NSW/h0A8zKhThPwFCKPGS3BUsRCMkdT/atQbY23Ngu0z7xr3BZvwd8WXW7tpInWX237Z
         7LAXPJ0wVnLcS+WNZQwzyhlvIICv3ipt2KStlBm+Qw8OeFOfGA3woJl8rh82j3bwoQKF
         NszHEmbiiYSVs70OU7+X7jwPBJKl41xmoRySf1mm5k5Sn7gGCfIZ8CX7Ie/JqgSP7PmH
         Agrg==
X-Gm-Message-State: ACrzQf0Go4EG9HUr1K3TAoruxvxBF1B5u/fM4ppuFwm2emTs6dwoziZ3
	EMdr2m8E6ylBi+dj/FaUYv6VkA==
X-Google-Smtp-Source: AMsMyM68CmHG8MAbjGQCkuqDxcQYTAxCVd79Bsg/zhnTRlr1jiMxC2JAlMKCjvGfJEcUGXlkG0MctA==
X-Received: by 2002:ac2:5b10:0:b0:4a2:5c4b:100c with SMTP id v16-20020ac25b10000000b004a25c4b100cmr91556lfn.406.1664982167969;
        Wed, 05 Oct 2022 08:02:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k6-20020a2eb746000000b0026a92616cd2sm887853ljo.35.2022.10.05.08.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 08:02:47 -0700 (PDT)
Message-ID: <6f11e588-c899-8d5d-1ef1-22535d251901@linaro.org>
Date: Wed, 5 Oct 2022 17:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "joel@jms.id.au" <joel@jms.id.au>
References: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
 <10176630-3ff7-54f7-8836-779e5a2bf6d4@linaro.org>
 <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
 <61de4c6c-84e9-345a-495d-4d44d9351d84@linaro.org>
 <HK0PR04MB3105AE7BA97942C160A6939AF85D9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105AE7BA97942C160A6939AF85D9@HK0PR04MB3105.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>, "garnermic@fb.com" <garnermic@fb.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "patrickw3@fb.com" <patrickw3@fb.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 05/10/2022 10:43, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> On 20/09/2022 09:45, Bonnie Lo/WYHQ/Wiwynn wrote:
>>> Hi Krzysztof,
>>>
>>> I revise the device tree as following and resend the mail.
>>> It create a new mail thread " [PATCH] ARM: dts: aspeed: greatlakes: Add
>> Facebook greatlakes (AST2600) BMC".
>>> Kindly to correct me, if there is any problem.
>>>
>>>> Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>>>
>>>>>
>>>>> Add linux device tree entry related to greatlakes specific devices
>>>>> connected to BMC SoC.
>>>>
>>>> Please wrap commit message according to Linux coding style /
>>>> submission
>>>> process:
>>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Feli
>>>>
>> xir.b%2F&amp;data=05%7C01%7CBonnie_Lo%40wiwynn.com%7Ca2eecb3c2d
>> ff4eff
>>>>
>> 361b08da9ae190fd%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%7C6
>> 379925
>>>>
>> 90848633103%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
>> joiV2luM
>>>>
>> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=MJn
>> u2iv19
>>>> dvbcMH7SJSExKOFV18dUtGRFSKO6Au2tFg%3D&amp;reserved=0
>>>>
>> ootlin.com%2Flinux%2Fv5.18-rc4%2Fsource%2FDocumentation%2Fprocess%2
>>>>
>> Fsubmitting-patches.rst%23L586&amp;data=05%7C01%7CBonnie_Lo%40wiw
>>>>
>> ynn.com%7C1dee8dcb540a49522fb608da98cdba6f%7Cda6e0628fc834caf9dd
>>>>
>> 273061cbab167%7C0%7C0%7C637990306620286314%7CUnknown%7CTWFp
>>>>
>> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>>>>
>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mC2E3dJbuYgXklS%2Fw8s2w%2
>>>> BKH%2BZ3CsZSndFTgPBjyvpw%3D&amp;reserved=0
>>>>
>>>
>>> I have add " ARM: dts: aspeed: greatlakes:".
>>>
>>>>>
>>>>> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>>>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 248
>>>> ++++++++++++++++++
>>>>
>>>> Missing documentation of board compatible (bindings) as first patch.
>>
>> Why did you ignore it?
> 
> We need to look at this more. There might be something under the Documentation tree.
> Could you guide us an example for adding the document?

https://lore.kernel.org/all/?q=s%3A%22dt-bindings%3A+arm%3A%22

Fix your email server so it won't add footers making open-source
collaboration not possible. You said that this email "contains
proprietary or confidential information", therefore it is not suitable
for open-source discussions.

Best regards,
Krzysztof

