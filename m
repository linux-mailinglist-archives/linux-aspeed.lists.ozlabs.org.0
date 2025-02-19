Return-Path: <linux-aspeed+bounces-775-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4EA3B024
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Feb 2025 04:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyMdJ6tH2z2yvn;
	Wed, 19 Feb 2025 14:41:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739936500;
	cv=none; b=NmA1XwQjAkfrLc2PP/jPw7Uas5gZ5BW18bOJgX04MAZg+JKlKki7M6AR4Vy2WrytUMzj+vg3b+svHXJqH6xJ5tdw0F+N1Bi7gRlYW2dZF9wJwjzbiFXcHPMg4u04+2Nx6exnQRVqJcphczUkZUPIZsVv/UgLi4Pt+SO0Zb+n3/f70lO4DjnBKID/uoc2U8MxnYHVDeugWsSYELoUIW3zzp4scBaevZWDqPZHgvrmsL0YPQBofEM8jgN6KBcdBbYlHsw6ppakZTHk/9P5M9Jmq13XxyJzvqq7sE14BtiESGDPM3LNSxFXQZKQApOykODd/I5TztEBwd882Ve1mUT1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739936500; c=relaxed/relaxed;
	bh=hIaBkE8+UmoWwYLNXAVzpAMzNdqrJST2j8vQ4BHyKd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0SO6J5QwZkaXvZU3jQ8o7hiCQb4RWhJ/b7CmM5xGXTYd3nsCMVCNScN0MdKAGZx1ONRa7cTkMo1TzgCpgiGxbrvgJSvkLDc5nGTEyX0RcT+hdX7KH/AW8w/KbpJz0YlfEsZYrGdY5wY0J4wNITBP2A2AMXXWVttTR10YgEHgT2VfNHLnwa8ZSWT26FEJrB3/aVy57WzqalmiOxy0yN8TRSREwKadegUKP8AkMBPOWO8iJwaWuMYn9F3I9HxwGl92vNS9K5S6Dh9Dyz7Yk1EvwCFP7gkx1ZKHw2GVZx7UZBm475D54tvxp/AVA42NSuG+CuEMRdFyP5rmMH3NKLOLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=j3dkGUXo; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=j3dkGUXo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=guoheyi@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyMdH0QVVz2yMh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Feb 2025 14:41:37 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739936486; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hIaBkE8+UmoWwYLNXAVzpAMzNdqrJST2j8vQ4BHyKd0=;
	b=j3dkGUXo7CT6LjGxLhhCRy4Ynzk94hlBOyqH5ZI2mYI9VydV9krV9Rlo0wMOtG0ppujhTvXuLsFBL5BN3mSTUqrGcks115sheG4WoQHGjoz27bvbHX4dALVCKdw0aBD1R5/rgLEJ8hExglEmpzFtBlb5xFB/3O75jQqy9Q/4LtY=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPnjerv_1739936484 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 11:41:24 +0800
Message-ID: <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 11:41:23 +0800
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
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Guenter,

Thanks for your comments.

On 2025/2/18 13:33, Guenter Roeck wrote:
> On 2/17/25 19:16, Heyi Guo wrote:
>> Aspeed watchdog uses counting down logic, so the value set to register
>> should be the value of subtracting pretimeout from total timeout.
>>
>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>
>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>> Cc: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>> b/drivers/watchdog/aspeed_wdt.c
>> index b4773a6aaf8c..520d8aba12a5 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>> watchdog_device *wdd,
>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>       u32 s = wdt->cfg->irq_shift;
>>       u32 m = wdt->cfg->irq_mask;
>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>> +
>
> It is unusual to use a register value here and not the configured timeout
> value. I would have assumed that pretimeout is compared against 
> wdt->timout,
> not against the register value, and that the multiplication with 
> WDT_RATE_1MHZ
> is done after validation. This needs an explanation.
It was supposed to be a straight-forward way to check if the pretimeout 
value is supported by the hardware. I can change to wdt->timeout if it 
is better.

Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
restrict the pretimeout to be larger than wdt->timeout - 
max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
(timeout - pretimeout)).

>
>> +    if (actual >= reload)
>> +        return -EINVAL;
>> +
>
> On top of that, you'll also need to explain why 
> watchdog_pretimeout_invalid()
> and with it the validation in watchdog_set_pretimeout() does not work 
> for this
> watchdog and why this extra validation is necessary.

watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
but we can't determine the hardware pretimeout value if timeout == 0 here.

Thanks,

Heyi

>
> Guenter
>
>> +    /* watchdog timer is counting down */
>> +    actual = reload - actual;
>>         wdd->pretimeout = pretimeout;
>>       wdt->ctrl &= ~m;

