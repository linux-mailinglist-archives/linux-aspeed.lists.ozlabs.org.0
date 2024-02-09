Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BA84F54E
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Feb 2024 13:39:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gzYU1TYN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWYLw2h0Hz3cRR
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Feb 2024 23:39:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gzYU1TYN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWYLk1WJKz3cJ0
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Feb 2024 23:38:52 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-410585542b3so7050335e9.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Feb 2024 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707482325; x=1708087125; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MCv2kQLqTwyLEu6yumZzrrTFSEY37Nydh42fHPDeBe0=;
        b=gzYU1TYNUm8XvIqscVYtt8V4Y1wCpGI22DzhIttf/rACkv6nQ5Nm6t+m+dOq0aB6HA
         t0YNRkTBQM3qXIpN/SwusnGPSCn3WHRIx8b6i7cAX+8Rey4FH0mZ29FVAdbMg1UT0lFI
         jR1N00TAr1OUZAUaedy1ftDruskdILrz7sE5EHyY4sgO8Br24SQ1h1ZYh7NpL9xDeN12
         FzMuPtNgbIE+U5ITk4Dvwpuu0YlltAE7wnqsSkC0oTw+dIrccdT40uLuA+8l68dLmhtn
         yYsnb72VaCFU1lC77ymS2LrpHJyf0Is7yLC3/Yy3BuYt9Lqlh/oZCMCSeBtQFEQNmkxU
         LK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707482325; x=1708087125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCv2kQLqTwyLEu6yumZzrrTFSEY37Nydh42fHPDeBe0=;
        b=YI9lMRX+mCDt/2WLbr2735EA0GCI8GUGGnNPq2q6chKcys2j0mIrVBNRCtMitpqVUi
         qunpjANuWhfv2H1aX53xV25DZBVTcEESD7vgZLcanUmqksk/1PQleaWjdeh42Rn9GPyT
         ZB7kiw+w/AFjnTbT6fHAJUxShDeigQve1fS304bpwvOv1ENigB2DrAy0Wg9Tczj01BPC
         2s/64/4Iobbrfpr9/9Xs7ENC49ka31//qsweYAd8W4A/8wu4J/B1JedPq4QOGBHn5NSw
         ZBAL20/x/H+fhdquLQUUWdqPHzTLHWiwuNRdMfgeGcBazEklAshRPXmI8AeOWjtc2Flm
         kn4w==
X-Gm-Message-State: AOJu0YxpXeMfW5ylwfO+pPQ3cv4EGErkmlzjMeAQtFLKvoBFCCVCsifn
	QQk+lhkY/Vl5ftGQRyoSkWr2bKWmUAcWOwMYq5kuXrPbEWoCsBnhqxPd4XXqDUk=
X-Google-Smtp-Source: AGHT+IFaynWaB4IOtcO4cVsPTOTuo8vTmoP1T8geeHJOYORcTko7JoBDxt1ruNCLKTCEVwR7Q91Z3w==
X-Received: by 2002:a05:600c:1c81:b0:40f:4e0a:4ead with SMTP id k1-20020a05600c1c8100b0040f4e0a4eadmr920192wms.26.1707482325455;
        Fri, 09 Feb 2024 04:38:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH45pCXG3ZTSbLNCdN35lJIE4pV+eRqZI62/Iwo68mO96KiIvKzmeNe+pCIZ4B2dNaMEHFNgUyiNbxdbcXiDjsDcruf86HCRB0SvXE2Kai4ruPzYNukRLcBDDXddathsMaiMVr10zX9IX8vDGUDSF+LvYW9Ya9c2ojj6XF+iTTrp3V5g97dAqsiEzp1bg/jbi2tU4vgQPqGAIZMUN5o0af4M28s74q7lQT2ninCSPTrLPsEg7tIxNspR9QlXf/U6kHqXV+872UXqV4rzfHbKk2I/g9RKy2gwcYTk7RtmbBsp88eH59Ct25XEXU1WwA83Wqjlr+W5JrVQiujSytvxfTw7dDyZL1qo+160DnaDSzzQ+dJfANoRZR
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ay3-20020a05600c1e0300b004107ab8158bsm569370wmb.2.2024.02.09.04.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 04:38:45 -0800 (PST)
Message-ID: <dda6c22e-8f35-4c18-9fea-6a6295dee3a1@linaro.org>
Date: Fri, 9 Feb 2024 13:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
To: Supreeth Venkatesh <supvenka@amd.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, joel@jms.id.au,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
 <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/02/2024 15:57, Supreeth Venkatesh wrote:
> This patch is pending for a month now.
> 
> Can DT maintainers please help review this and provide feedback?

I don't have the original patch in my inbox anymore, so probably you
should resend. Anyway quick look points to obvious issues (comments below).

> 
> On 1/9/24 21:35, Supreeth Venkatesh wrote:
>> This patch adds initial device tree and makefile updates for
>> AMD Onyx platform.
>>
>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>> ast2600 BMC manufactured by AMD.
>> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
>> present on AMD Onyx platform.
>>
>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |  1 +
>>   .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index fb9cc95f1b60..2b27d377aae2 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-ast2600-evb.dtb \
>>   	aspeed-bmc-amd-daytonax.dtb \
>>   	aspeed-bmc-amd-ethanolx.dtb \
>> +	aspeed-bmc-amd-onyx.dtb \
>>   	aspeed-bmc-ampere-mtjade.dtb \
>>   	aspeed-bmc-ampere-mtmitchell.dtb \
>>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> new file mode 100644
>> index 000000000000..a7056cd29553
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +// Copyright (c) 2021 - 2024 AMD Inc.
>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model = "AMD Onyx BMC";
>> +       compatible = "amd,onyx-bmc", "aspeed,ast2600";

Undocumented compatibles.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

>> +
>> +       aliases {
>> +               serial0 = &uart1;
>> +               serial4 = &uart5;
>> +      };
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200 earlyprintk vmalloc=512MB";

earlyprintk is debugging, not for mainline, so drop.

Console should be encoded in stdout-path.

vmalloc looks like OS tuning, so also not suitable for mainline DTS.


>> +       };
>> +
>> +       memory@80000000 {
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x80000000>;
>> +       };
>> +

Drop redundant blank lines.

>> +};
>> +
>> +&mdio0 {
>> +       status = "okay";
>> +
>> +       ethphy0: ethernet-phy@0 {
>> +               compatible = "ethernet-phy-ieee802.3-c22";
>> +               reg = <0>;
>> +       };
>> +};
>> +
>> +&mac3 {
>> +       status = "okay";
>> +       phy-mode = "rgmii";
>> +       phy-handle = <&ethphy0>;
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rgmii4_default>;
>> +};
>> +
>> +>> +

Drop redundant blank lines. You can open existing, recent DTS from
maintained platforms like Qcom or TI and look there at coding style.



Best regards,
Krzysztof

