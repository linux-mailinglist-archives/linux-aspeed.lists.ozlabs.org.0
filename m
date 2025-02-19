Return-Path: <linux-aspeed+bounces-778-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98156A3B1C9
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Feb 2025 07:49:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyRnX22r9z30DL;
	Wed, 19 Feb 2025 17:49:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739947744;
	cv=none; b=TJweVg1dgmA9zSJVe5eDamFhcMUk1S/Z5bLAxygKaW87+QLoEn0RRWLObOPZVL3jkIagT/BjdgEeZUsh+NT6WA/Evm8zroS0AqDbV8B/G621oZbx/jgd31PTLeyL+5XMUby2B1VARC5HdS0PZvxtA9KySV7OcaZiCm4+c1d6kP4CPPJWj5HuD9LkJ3MuGgw6qn8rHvYX/9vGGPecZBW000uCBPZh5+fUy2uQDAqjNU1XQncGMD0tVI0mAxIblX6uv04ukudZjc7qj2ImtWOt5hWbTtZ3BzS6Z5Ccfb6X4Ww2ABaIYHfZZCwL3fTafQ1IP6KbcNKyxcDwqEjidB26JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739947744; c=relaxed/relaxed;
	bh=6/jQax5rnvlh2BbJC5kEw9SnvVj7TrlZC5/fP2OvErs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfC6bVV4vbHUi3aNh0l3hLuqqQ3HNaJuwN78RqnZTyUA0YmeReJK7jgWDrq+EP6QYpRBKFoQK6RPubRE3cPDR/T1ZcY+CDgBsnPME+kYMJjB0MWUFBZfuZ/WYlRTia6m7R6tA6J5F/eWk09iO6g582hAji3qPPZRru89SsnX9qw5zX7w87ntH6qU5AfaiqauS5xydotJDKIPQv6EhrDXdIFuVhzGUsi2eV6zwbk/zY+6b/ZZyYhfHWv6Cvq6TdbH9lHr0FeVfd+6USxpuh9+ZiW2QW1wwOP0zkJ+YsxSpEL/8xTXbN7XqnAFnFTeLvmCyCvaq+cv8k5AhPuLYToBew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tquTWW5z; dkim-atps=neutral; spf=pass (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tquTWW5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyRnV2tQfz2yvn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Feb 2025 17:49:00 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739947736; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6/jQax5rnvlh2BbJC5kEw9SnvVj7TrlZC5/fP2OvErs=;
	b=tquTWW5zM5CvnAsD02xwiTQzb0AermlWICxjaiplMNNSdrkx283k+FbnrIUHKXFve9WQe/vq0R+usYUg5i8mfSrMP5c0qZTT4+/nbj+G3tVXOYrtMuWOZGLiSr5ZMJABC3njS2cFhWnB89rS5ih2KcDOd2vv3sfyi835bvR8We0=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPoEUPx_1739947734 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 14:48:54 +0800
Message-ID: <0c5e1e72-f1c9-4ffc-853f-f094a6d7799c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 14:48:53 +0800
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
 <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2025/2/19 14:07, Guenter Roeck wrote:
> On 2/18/25 19:41, Heyi Guo wrote:
>> Hi Guenter,
>>
>> Thanks for your comments.
>>
>> On 2025/2/18 13:33, Guenter Roeck wrote:
>>> On 2/17/25 19:16, Heyi Guo wrote:
>>>> Aspeed watchdog uses counting down logic, so the value set to register
>>>> should be the value of subtracting pretimeout from total timeout.
>>>>
>>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>>
>>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>>
>>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>>> Cc: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>>>> b/drivers/watchdog/aspeed_wdt.c
>>>> index b4773a6aaf8c..520d8aba12a5 100644
>>>> --- a/drivers/watchdog/aspeed_wdt.c
>>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>>>> watchdog_device *wdd,
>>>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>>       u32 s = wdt->cfg->irq_shift;
>>>>       u32 m = wdt->cfg->irq_mask;
>>>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>>> +
>>>
>>> It is unusual to use a register value here and not the configured 
>>> timeout
>>> value. I would have assumed that pretimeout is compared against 
>>> wdt->timout,
>>> not against the register value, and that the multiplication with 
>>> WDT_RATE_1MHZ
>>> is done after validation. This needs an explanation.
>> It was supposed to be a straight-forward way to check if the 
>> pretimeout value is supported by the hardware. I can change to 
>> wdt->timeout if it is better.
>>
>> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
>> restrict the pretimeout to be larger than wdt->timeout - 
>> max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
>> max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
>> unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
>> (timeout - pretimeout)).
>>
>
> The kernel internal logic should handle that. If not, it needs to be 
> modified/fixed.
Do you mean the watchdog core should also handle the case in which 
pretimeout < wdt->timeout - max_hw_heartbeat_ms  / 2?
>
>>>
>>>> +    if (actual >= reload)
>>>> +        return -EINVAL;
>>>> +
>>>
>>> On top of that, you'll also need to explain why 
>>> watchdog_pretimeout_invalid()
>>> and with it the validation in watchdog_set_pretimeout() does not 
>>> work for this
>>> watchdog and why this extra validation is necessary.
>>
>> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
>> but we can't determine the hardware pretimeout value if timeout == 0 
>> here.
>>
>
> Sorry, I don't understand what you mean. If watchdog_pretimeout_invalid()
> returns false if timeout == 0, aspeed_wdt_set_pretimeout() won't be 
> called.
> Why does that preclude depending on it ?

if timeout == 0, watchdog_pretimeout_invalid() returns false, so the 
code will go on to call wdd->ops->set_pretimeout().

static int watchdog_set_pretimeout(struct watchdog_device *wdd,
                    unsigned int timeout)
{
     int err = 0;

     if (!watchdog_have_pretimeout(wdd))
         return -EOPNOTSUPP;

     if (watchdog_pretimeout_invalid(wdd, timeout))
         return -EINVAL;

     if (wdd->ops->set_pretimeout && (wdd->info->options & 
WDIOF_PRETIMEOUT))
         err = wdd->ops->set_pretimeout(wdd, timeout);

>
> On a side note, I do wonder why the driver accepts a timeout value of 
> 0 seconds.

 From the code, it seems timeout == 0 / pretimeout == 0 will be 
considered as a turn off switch.

Thanks,

Heyi

>
> Guenter

