Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C08B3CB3
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 18:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLs46Zpf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQyhj537Cz3cY8
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 02:23:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLs46Zpf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQyhW4czwz3cXW
	for <linux-aspeed@lists.ozlabs.org>; Sat, 27 Apr 2024 02:23:37 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5f7fc45fe1bso1829385a12.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714148613; x=1714753413; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EMeUZZZDlIQWmNIrPUN8CtDV/8ZMq8tMUD3l5agRi0E=;
        b=dLs46ZpfTGudRpKxytxJAkCD7WH+8IIqbhheBNJZk/67i/h+feQdVx5z73hakx6tZ0
         hjSayoc31U24mQkc+VlXnFM3KXfxslCg1ARdO8u5nonxXgkzkjf2Z9ZzLepXhxGa5KNV
         cpqIqi5MqUPZBOmhvO4pyBdwaaizyxH7LSBNlN1HtzfKWsR3WTw5C8MtfRVBtBHofulD
         pPYMiPRGxsgIp3MCAWNVjydZpHd03uXUEPoorPTJ8O3BKz9sjsMeg+AFLCXiwEO4VdR1
         CdAhXk18ZsRtWUR7OIjF8Sap0pQYZM5z5FCNGTpAxRWc1sOkV7J+TfuHHGksskLtbAQV
         GrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714148613; x=1714753413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMeUZZZDlIQWmNIrPUN8CtDV/8ZMq8tMUD3l5agRi0E=;
        b=gFvRT6tGSsAkcGzu5y77cSjQumXKvfVNuXkF0Xziac7P0eKA24hhzARWcIdZLXbKWn
         a0Nv5vS8lI4RspcwNbzI3SrNyZcSbUCsYcxmvBlZ2pygt0X41V655CLyJWm+Myv8fqE7
         0jMw5d21iRs2jaZRErV7gff681/95oREEYVf5/2tt5CPj1k9Yaen+SB04Q/yFLUUKm29
         /cBCZhQMRJcIN3j66RYDW9oxtCD9U5BMteW4qdNgWERG6IOxtYns1R3ZswqPoxnLjYXK
         QLCajWE6PnKnWZZVlxOMeQc38qPTH69a+/Cd7LqlDktWIAO1jvqEvLVLAVD4/08dik2k
         5f9A==
X-Forwarded-Encrypted: i=1; AJvYcCV7ENVAoizur8yUhg9X0wUYnmPSQhVqcbQo7/Mfa5jTNLvECGCxlnJqcXrRWddq5ZTTINv1ziPdIlpCMWxhLDBmEdnjDV4Oi8hnibCF0Q==
X-Gm-Message-State: AOJu0YxH+ClwnjaagsdnJJrqctoEz3dipWZfCINCOKFJHN6iq9yEe4KJ
	FsB234DWDjn3fRuB8sLofszXL3T9jfNaa4dW+8wdnXQluXp3OPsz
X-Google-Smtp-Source: AGHT+IGttw1/Ym8lgAQrBRqQL5SAqRbELE2358Ab1/ryDW9+Vo1fnYJWcfD3Waq47xByyEnSyCotBw==
X-Received: by 2002:a17:90a:bb84:b0:2a7:4e38:70e9 with SMTP id v4-20020a17090abb8400b002a74e3870e9mr3043278pjr.13.1714148613562;
        Fri, 26 Apr 2024 09:23:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm14695585pjp.1.2024.04.26.09.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 09:23:32 -0700 (PDT)
Message-ID: <cb473967-5cd7-44fd-99ea-fd5572e5963d@roeck-us.net>
Date: Fri, 26 Apr 2024 09:23:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drivers: watchdog: revise watchdog bootstatus
To: Chia Hsing Yin <peteryin.openbmc@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
 <20240425090727.3787160-2-peteryin.openbmc@gmail.com>
 <5ed8bfd6ce559a7d00ec89f1bd7ae1aea90e3ae7.camel@codeconstruct.com.au>
 <CAPSyxFTa6k3FzUmDoZ6HMpAfwZGK_yPrQKGSvSdtj_JqsnMVrA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAPSyxFTa6k3FzUmDoZ6HMpAfwZGK_yPrQKGSvSdtj_JqsnMVrA@mail.gmail.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/26/24 07:45, Chia Hsing Yin wrote:
> I can include reset condition in struct maybe like this
> 
> static const struct aspeed_wdt_config ast2600_config = {
> .ext_pulse_width_mask = 0xfffff,
> .irq_shift = 0,
> .irq_mask = GENMASK(31, 10),
> .compatible = "aspeed,ast2600-scu",
> .reset_event = AST2600_SYSTEM_RESET_EVENT,
> .watchdog_reset_flag = AST2600_WATCHDOG_RESET_FLAG,
> .extern_reset_flag = EXTERN_RESET_FLAG,
> .reset_flag_clear = AST2600_RESET_FLAG_CLEAR,
> };
> 
> in probe( ) we  just call
> 
> scu_base = syscon_regmap_lookup_by_compatible(wdt->cfg->compatible);
> if (IS_ERR(scu_base))
>      return PTR_ERR(scu_base);
> 
> ret = regmap_read(scu_base, wdt->cfg->reset_event, &status);
> if (ret)
>      return ret;
> 
> if ((status & POWERON_RESET_FLAG) == 0 &&

If you do that, please use
	if (!(status & POWERON_RESET_FLAG) && ...

>       status & wdt->cfg->watchdog_reset_flag)
>      wdt->wdd.bootstatus = (status & wdt->cfg->extern_reset_flag) ?
>      WDIOF_EXTERN1 : WDIOF_CARDRESET;
> 
> status = wdt->cfg->watchdog_reset_flag | POWERON_RESET_FLAG |
> wdt->cfg->extern_reset_flag;
> 
> ret = regmap_write(scu_base, wdt->cfg->reset_event, status);
> 
> Does this meet your expectations?
> 
> On Fri, Apr 26, 2024 at 8:42 AM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>>
>> On Thu, 2024-04-25 at 17:07 +0800, Peter Yin wrote:
>>> Regarding the AST2600 specification, the WDTn Timeout Status Register
>>> (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
>>> on ast2500 if the boot was from the second boot source.
>>> It does not indicate that the most recent reset was triggered by
>>> the watchdog. The code should just be changed to set WDIOF_CARDRESET
>>> if bit 0 of the status register is set. However, this bit can be clear when
>>> watchdog register 0x0c bit1(Reset System after timeout) is enabled.
>>> Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRESET
>>> in ast2600 SCU74 or ast2400/ast2500 SCU3C.
>>>
>>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>> ---
>>>   drivers/watchdog/aspeed_wdt.c | 109 ++++++++++++++++++++++++++++++++--
>>>   1 file changed, 103 insertions(+), 6 deletions(-)
>>
>> After this patch the probe() implementation is ~250loc with a whole
>> bunch of conditional behaviours based on the SoC version. Maybe it's
>> time to break it up into version-specific functions that are called
>> from the probe() implementation?
>>
>> Andrew

