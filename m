Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 900AD5BDFEC
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 10:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWvjX1bfPz3bXy
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 18:24:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zUvBLpP/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zUvBLpP/;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWvjR23Tcz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 18:24:43 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id a10so2145817ljq.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AlNbthU8WoAO1+07ID0EL9Rhwsa/jvCJk5uxcImshx0=;
        b=zUvBLpP/KOSLV9W1QrqGHccAXW2Fkie3JXiWTkh47lRe9P7pSYfVn9NEcrBz+ihpMv
         7ZwDLv7/10Oqi1BPCCUl9nORKgOl9pDTzu0DMF8LX4u+T1H+CFhwvpb4/4Uafbv0ctCH
         5mL12wc2HARd5uQGkUCdcO+GNnL1h1NCqoDFw0RnLyIlyg/5xKUt/hsAW3wx1ti9Evz2
         eDR6DpnkOlcsmS6HmySTRou2aKJCj5mkY19KVJskUc73rgaZgasMwY52cyPFQp/QeEIJ
         NUdTSi03148aBaiJJj/FKaRBFahJmT8bdH0IhLMuUk7XGfqIe6WqLU/Jo2qWlLVy5OaE
         GuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AlNbthU8WoAO1+07ID0EL9Rhwsa/jvCJk5uxcImshx0=;
        b=FPLMk7a8nOyCfNrsBEPaEMZiGvu7nBmOsuAcbTudJ50vpdk7USaj8KoQRAIN4ZqoiB
         5bHgdsNvtDoxr9596fRlWzwG7cM+zz/oQNAMjPokYBRWz6Qe0zSByP40IBnxZ58dQGFQ
         dodBeoEtIKOw7Zot/SGtv86giHyL6uDTcpgbznn9Cu0g0DAlfWRfMCPEK4UDyJnjNS0I
         bzOvsbrtQLfIVsz+Oadu6ENBARM3fjdYjdFvnTsrsUIZtZjQZBox6llb4Q40hDuVbTQl
         6LmETlOKBSq4UrYIsNA2qMofqr5iURk7MJ6J0coSaYiG8T2Eb2/8LNECwmATXc5w4k1t
         DPNQ==
X-Gm-Message-State: ACrzQf0fuhYHT7qEU3Gab8O95onUddyvsUzSsKLGun/195Nyg6fjzfG5
	WsKWINlU1SwyWr333sbWS8lAgQ==
X-Google-Smtp-Source: AMsMyM4VkvB9MREeRC5k87kRxbeisv4TJp5U5RiuU05AuCSqwzYhIGwyho6RDYiFHh5lo6YlMxifjg==
X-Received: by 2002:a2e:7309:0:b0:26c:3db7:8fe2 with SMTP id o9-20020a2e7309000000b0026c3db78fe2mr5571053ljc.387.1663662278798;
        Tue, 20 Sep 2022 01:24:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a6-20020a05651c010600b0026c079006bcsm145489ljb.118.2022.09.20.01.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:24:38 -0700 (PDT)
Message-ID: <61de4c6c-84e9-345a-495d-4d44d9351d84@linaro.org>
Date: Tue, 20 Sep 2022 10:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>,
 "joel@jms.id.au" <joel@jms.id.au>
References: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
 <10176630-3ff7-54f7-8836-779e5a2bf6d4@linaro.org>
 <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, "garnermic@fb.com" <garnermic@fb.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "patrickw3@fb.com" <patrickw3@fb.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/09/2022 09:45, Bonnie Lo/WYHQ/Wiwynn wrote:
> Hi Krzysztof,
> 
> I revise the device tree as following and resend the mail.
> It create a new mail thread " [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC".
> Kindly to correct me, if there is any problem.
> 
>> Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>
>>>
>>> Add linux device tree entry related to greatlakes specific devices
>>> connected to BMC SoC.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process:
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.b
>> ootlin.com%2Flinux%2Fv5.18-rc4%2Fsource%2FDocumentation%2Fprocess%2
>> Fsubmitting-patches.rst%23L586&amp;data=05%7C01%7CBonnie_Lo%40wiw
>> ynn.com%7C1dee8dcb540a49522fb608da98cdba6f%7Cda6e0628fc834caf9dd
>> 273061cbab167%7C0%7C0%7C637990306620286314%7CUnknown%7CTWFp
>> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mC2E3dJbuYgXklS%2Fw8s2w%2
>> BKH%2BZ3CsZSndFTgPBjyvpw%3D&amp;reserved=0
>>
> 
> I have add " ARM: dts: aspeed: greatlakes:".
> 
>>>
>>> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 248
>> ++++++++++++++++++
>>
>> Missing documentation of board compatible (bindings) as first patch.

Why did you ignore it?

>>
>>>  2 files changed, 249 insertions(+)
>>>  create mode 100644
>>> arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 05d8aef6e5d2..40fa906ab17f 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1580,6 +1580,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>         aspeed-bmc-asrock-e3c246d4i.dtb \
>>>         aspeed-bmc-asrock-romed8hm3.dtb \
>>>         aspeed-bmc-bytedance-g220a.dtb \
>>> +       aspeed-bmc-facebook-greatlakes.dtb \
>>
>> Wrong order.
> 
> I have reordered it.
> 
>>
>>>         aspeed-bmc-facebook-bletchley.dtb \
>>>         aspeed-bmc-facebook-cloudripper.dtb \
>>>         aspeed-bmc-facebook-cmm.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> new file mode 100644
>>> index 000000000000..f011cc4d370f
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> @@ -0,0 +1,248 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later // Copyright 2022
>>> +Facebook Inc.
>>> +
>>> +/dts-v1/;
>>> +#include "aspeed-g6.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h> #include
>>> +<dt-bindings/i2c/i2c.h> #include <dt-bindings/leds/leds-pca955x.h>
>>> +
>>> +/ {
>>> +       model = "AST2600 EVB";
>>
>> Wrong name.
> 
> I have revies the model name " Facebook Greatlakes BMC ".
> 
>>
>>> +       compatible = "aspeed,ast2600";
>>
>> Missing board compatible.
>>
> 
> I add board compatible " facebook,greatlakes-bmc"

And what is the output of the checkpatch?

> 
>>> +
>>> +       aliases {
>>> +               serial4 = &uart5;
>>> +       };
>>> +
>>> +       chosen {
>>> +               stdout-path = &uart5;
>>> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw
>>> + vmalloc=384M";
>>
>> Bootargs usually do not belong to mainline DTS.
> 
> Removed.

I still saw bootargs.

(...)

>>>
>>> WIWYNN PROPRIETARY This email (and any attachments) contains
>> proprietary or confidential information and is for the sole use of its intended
>> recipient. Any unauthorized review, use, copying or distribution of this email
>> or the content of this email is strictly prohibited. If you are not the intended
>> recipient, please notify the sender and delete this email immediately.
>>
>> This means we cannot take this patch. Proprietary and/or confidential
>> patches cannot be merged.
>>
>> Please license the patch as you wrote in SPDX header.
>>
>> Best regards,
>> Krzysztof
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

Your company is still adding proprietary license. Since I am not
intended recipient, I will remove your messages.

Best regards,
Krzysztof
