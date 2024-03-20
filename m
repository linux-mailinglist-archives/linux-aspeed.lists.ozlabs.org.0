Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F80880E3E
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Mar 2024 10:05:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bL2CfnK6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V02kH0FCtz3d8y
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Mar 2024 20:05:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bL2CfnK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V02k94G1tz3bWn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Mar 2024 20:05:36 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e034607879so22088215ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Mar 2024 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710925534; x=1711530334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9AnhsV1I63p1VhmH5I/CTh8F8noEyIobCtBN/qPBug=;
        b=bL2CfnK6v+5GmkPsMsEHOO6RnE5xWw1WTMfL6LdIcIxLHQcHFH1bVyyTSPub2f3FFm
         Xs6hiPhWRq/5W3IXTgiOR9hIprS4as1gp0GTLX18WooDOdtkzlFddrUfU2i2iw3tG2Lh
         ewdFHV8ZIWYbsUsXpxQiH1ujwGgFdO/6nAVcvut40SrbfD2ggkkXzJr1UfGyz3pd9FbA
         QB3kBuoT0mRmZj8Z8kd/jNDNMjhl1nlCldaGKcRuXTgU90DGNG9bbfgjAtywsU2LBS5O
         m44oPPNQmrdE8j/vwzdd5sJvGdLGil61dclYTjmkei7tL7Ey1cTkXfAQv/kc5fpKAUKC
         4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710925534; x=1711530334;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9AnhsV1I63p1VhmH5I/CTh8F8noEyIobCtBN/qPBug=;
        b=ZBKdzKcDGZ6dinAe7NkaQg0skaADVkFXoJs03GME9lNBrj6lTc7KqrWbgbBSHk35q3
         jkUoziqy4lUi65IDnIMyU4N+6iqj/Fb46m3NKxvBKOgZW38RbVHQWuX5I3Er4149WWeh
         vWTEd2SVGKRjg9IXhiwQUWv9nbFR7wq0RoyJodRVqJOH5oczVg/yTZB10ZWMeJpWxzoB
         yGNOuQnjNxV0R2IDaGb95nOxYUNMXFWKruv1z7teItDntflT1OV5ADjKkFTXnMtqhw7I
         X1M2Yv3beuVY1z8Zhqx8rYqneItPkOWzfnlslKQ3qurVFVlqtM0u7up5waR2y8KMi+Hy
         3Zzg==
X-Forwarded-Encrypted: i=1; AJvYcCX3BWBO4/Z415wZoiY/0gslCb33EJ6Rvsn0+Ti5h12VkQl8KFxMFTfL2Z8hLVSiK6usFSbgOkvyLI+bm864tZGL5dZfJAvaH5P64mJRMw==
X-Gm-Message-State: AOJu0YxlaDd+mvlgqvKLvmZN1BDZbX/lJ3uJv8kINDkid7nPCV+oOOaI
	ngGLSuDOJh+wJpveQnrE9nsL6wY25B8x2FlkaRnVLhE6aK8Ft8fKz5K3Fmpp
X-Google-Smtp-Source: AGHT+IGQN51HBV2eG4je+v7GXoz9GezzFu7dyWQoCjgBxUNs4bPN7xeScFwS6s6WwuunnB3tWKBKpA==
X-Received: by 2002:a17:902:ea10:b0:1e0:1496:91ec with SMTP id s16-20020a170902ea1000b001e0149691ecmr6421247plg.20.1710925533894;
        Wed, 20 Mar 2024 02:05:33 -0700 (PDT)
Received: from ?IPV6:2001:b400:e38c:634d:c9ce:74d1:b790:4f66? (2001-b400-e38c-634d-c9ce-74d1-b790-4f66.emome-ip6.hinet.net. [2001:b400:e38c:634d:c9ce:74d1:b790:4f66])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090276cb00b001dd88a5dc47sm3261282plt.290.2024.03.20.02.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 02:05:33 -0700 (PDT)
Message-ID: <924c4402-af14-4b7a-9a4e-4317c50482cd@gmail.com>
Date: Wed, 20 Mar 2024 17:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: watchdog: ast2600 support bootstatus
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240318055219.3460121-1-peteryin.openbmc@gmail.com>
 <13640a07-7395-4521-9c5d-748599202361@roeck-us.net>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <13640a07-7395-4521-9c5d-748599202361@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Guenter Roeck 於 3/19/24 08:46 寫道:
> On 3/17/24 22:52, Peter Yin wrote:
>> Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600
>>
>> Regarding the AST2600 specification, the WDTn Timeout Status Register
>> (WDT10) has bit 1 reserved. To verify the second boot source,
>> we need to check SEC14 bit 12 and bit 13.
>> The bits 8-23 in the WDTn Timeout Status Register are the Watchdog
>> Event Count, which we can use to verify WDIOF_EXTERN1.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> 
> You'll have to separate dts and yaml file changes from driver changes.
> 
>> ---
>> Change log:
>>
>> v1 -> v2
>>    - Add comment and support WDIOF_CARDRESET in ast2600
>>
>> v1
>>    - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
>> ---
>>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  8 ++---
>>   drivers/watchdog/aspeed_wdt.c           | 45 ++++++++++++++++++++++---
>>   2 files changed, 44 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi 
>> b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
>> index e0b44498269f..23ae7f0430e9 100644
>> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
>> @@ -556,24 +556,24 @@ uart5: serial@1e784000 {
>>               wdt1: watchdog@1e785000 {
>>                   compatible = "aspeed,ast2600-wdt";
>> -                reg = <0x1e785000 0x40>;
>> +                reg = <0x1e785000 0x40>, <0x1e6f2000 0x20>;
>>               };
>>               wdt2: watchdog@1e785040 {
>>                   compatible = "aspeed,ast2600-wdt";
>> -                reg = <0x1e785040 0x40>;
>> +                reg = <0x1e785040 0x40>, <0x1e6f2000 0x020>;
>>                   status = "disabled";
>>               };
>>               wdt3: watchdog@1e785080 {
>>                   compatible = "aspeed,ast2600-wdt";
>> -                reg = <0x1e785080 0x40>;
>> +                reg = <0x1e785080 0x40>, <0x1e6f2000 0x020>;
>>                   status = "disabled";
>>               };
>>               wdt4: watchdog@1e7850c0 {
>>                   compatible = "aspeed,ast2600-wdt";
>> -                reg = <0x1e7850C0 0x40>;
>> +                reg = <0x1e7850C0 0x40>, <0x1e6f2000 0x020>;
>>                   status = "disabled";
>>               };
>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>> b/drivers/watchdog/aspeed_wdt.c
>> index b4773a6aaf8c..65118e461130 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -33,6 +33,7 @@ struct aspeed_wdt {
>>       void __iomem        *base;
>>       u32            ctrl;
>>       const struct aspeed_wdt_config *cfg;
>> +    void __iomem        *sec_base;
>>   };
>>   static const struct aspeed_wdt_config ast2400_config = {
>> @@ -82,6 +83,15 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>>   #define WDT_RESET_MASK1        0x1c
>>   #define WDT_RESET_MASK2        0x20
>> +/*
>> + * Only Ast2600 support
>> + */
>> +#define   WDT_EVENT_COUNTER_MASK    (0xFFF << 8)
>> +#define   WDT_SECURE_ENGINE_STATUS    (0x14)
>> +#define   ABR_IMAGE_SOURCE        BIT(12)
>> +#define   ABR_IMAGE_SOURCE_SPI        BIT(13)
>> +#define   SECOND_BOOT_ENABLE        BIT(14)
>> +
>>   /*
>>    * WDT_RESET_WIDTH controls the characteristics of the external 
>> pulse (if
>>    * enabled), specifically:
>> @@ -313,6 +323,7 @@ static int aspeed_wdt_probe(struct platform_device 
>> *pdev)
>>       const char *reset_type;
>>       u32 duration;
>>       u32 status;
>> +    u32 sec_st;
>>       int ret;
>>       wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>> @@ -330,6 +341,12 @@ static int aspeed_wdt_probe(struct 
>> platform_device *pdev)
>>       if (IS_ERR(wdt->base))
>>           return PTR_ERR(wdt->base);
>> +    if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
>> +        wdt->sec_base = devm_platform_ioremap_resource(pdev, 1);
>> +        if (IS_ERR(wdt->sec_base))
>> +            return PTR_ERR(wdt->sec_base);
>> +    }
>> +
>>       wdt->wdd.info = &aspeed_wdt_info;
>>       if (wdt->cfg->irq_mask) {
>> @@ -459,12 +476,30 @@ static int aspeed_wdt_probe(struct 
>> platform_device *pdev)
>>       }
>>       status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>> -    if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> -        if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>> -            of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>> -            wdt->wdd.groups = bswitch_groups;
>> +    if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
>> +        /*
>> +         * The WDTn Timeout Status Register bit 1 is reserved.
>> +         * To verify the second boot source,
>> +         * we need to check SEC14 bit 12 and bit 13.
>> +         */
>> +        sec_st = readl(wdt->sec_base + WDT_SECURE_ENGINE_STATUS);
>> +        if( sec_st & SECOND_BOOT_ENABLE)
>> +            if (sec_st & ABR_IMAGE_SOURCE ||
>> +                sec_st & ABR_IMAGE_SOURCE_SPI)
> 
> I am sure that checkpatch as something to say here. Either case, I would 
> very
> much prefer a single if() statement such as
> 
>          if (sec_st & SECOND_BOOT_ENABLE &&
>              sec_st & (ABR_IMAGE_SOURCE | ABR_IMAGE_SOURCE_SPI))
> 
>> +                wdt->wdd.bootstatus |= WDIOF_CARDRESET;
>> +
>> +        /*
>> +         * To check Watchdog Event Count for WDIOF_EXTERN1
>> +         */
>> +        if (status & WDT_EVENT_COUNTER_MASK) {
>> +            wdt->wdd.bootstatus |= WDIOF_EXTERN1;
>> +        }
> 
> Unnecessary { }
> 
> ... but does this really indicate that there was a reset due to some 
> event ?
> This reads three 8-bit counters. Wouldn't it make more sense to check bit 0
> instead ?
> 
> I am also not sure if reading the watchdog status from 
> WDT_SECURE_ENGINE_STATUS
> adds any value over the status reported in the watchdog status register.
> You'll have to explain why the added complexity is necessary or even adds
> value.
> 
> Never mind, though ...
> 
> Looking into the datasheets, the current code is quite completely wrong 
> anyway.
> Bit 1 of the status register indicates on ast2500 if the boot was from 
> the second
> boot source. It does not indicate that the most recent reset was 
> triggered by
> the watchdog. The code should just be changed to set WDIOF_CARDRESET if 
> bit 0
> of the status register is set. The boot source is out of scope for the 
> watchdog
> status bits.
> 
> Thanks,
> Guenter
> 
Ast2600 has external reset flag on scu74 bit 1
Can I modify the code like this?

To set WDIOF_EXTERN1 if EXTERN_RESET_FLAG is set,
To set WDIOF_CARDRESET if WDT_TIMEOUT_STATUS_EVENT(bit0) is set


#define   WDT_TIMEOUT_STATUS_EVENT	BIT(0)
#define   EXTERN_RESET_FLAG		BIT(1)
#define   ASPEED_SYSTEM_RESET_EVENT	(0x74)

	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
	if (status & WDT_TIMEOUT_STATUS_EVENT)
		wdt->wdd.bootstatus = WDIOF_CARDRESET;

	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
		status = readl(wdt->scu_base + ASPEED_SYSTEM_RESET_EVENT);
		if (status & EXTERN_RESET_FLAG)
			/*
			 * Reset cause by Extern Reset
			 */
			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
	} else {
			wdt->wdd.groups = bswitch_groups;
	}
Thanks,
Peter.
