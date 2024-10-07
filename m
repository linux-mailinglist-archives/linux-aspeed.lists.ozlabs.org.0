Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527759937BA
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 21:55:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMqcn4Bthz3bcy
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 06:55:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728330903;
	cv=none; b=D/DsVFfvzCg+Cujp3ZDlBBZoTzN4X+01LMFDG+f73MaycIsuX/HdMYZqq6DCQS24enIGEPgZSpzhy323d2oEkskHPGdNy/ijw/0mcnfURy581xEOl2gVCBk5C+LcaYhH6iqAuLeEBWjJkhd3gkDM8vHN7oelpP3zG6gMzF0sc/7qF1b3GIVTbVCXf61boMT6fTKYucA0gj/ILR2vbMR3qEw1K4+Q9UL/kfuvOygkCgYipGEhmmCUeRR4KzRsvy8BzFKk9TmzjpVwtbh9/LudjLtA4mVvGacZbfo3icVm4pGKMBq+klU892E/abTthAOvZvIHWRmXEBXDkP4IJ54l5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728330903; c=relaxed/relaxed;
	bh=AaBVrQcRg42Tut+8gGqYU0anqbHtTgHx9qwiR+A7fg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AanLBb512I0p06QcpczbNVFqKt1zHptepsyNPcVDyqh1Sk/qi+bLRdHrDOnS7zdWXcNIU62J8bnVOoEusx5etixJEbE6RMttPXDzsbh4SwffXUBxc+cevkFzkNMtRNjBCW3THsZzP3hk2nXch6HxO4Ci6LImd+QVfKFRgJq50Ttda/3sffVQ7i6PO1kfvnTBPmrfZZWd2Wm+V8skF4JsWVlvX96mcBkU2weTlCPJtZc0MHEUTzmnkDZvf8VNgEuNDTtqR/NJWgwNiQMaenFJ282hAbBqDwcCcJrYCy5IXZzghC/6Ygfb8wMMz/0pn4fiCsCo2Iua6MDlgmEsPJjMQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XWH9w2b+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XWH9w2b+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMqcj5by3z3028
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 06:55:00 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so1841152a12.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2024 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728330897; x=1728935697; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AaBVrQcRg42Tut+8gGqYU0anqbHtTgHx9qwiR+A7fg4=;
        b=XWH9w2b+Htz4Og4EAKfbbs5JoZVmwP8iTmpL+6tgIU8aQDhdej6bLTKSQMIOgBr8RN
         lycKWyTDwCdOiQ0F6mkVdoo7wsVN7tqUsgoB3iluGjmihAZIgSE9/tcMJxtk0jvZJSXn
         mLKI5WC0d5WwpfEloZTQ6jpuwbEaYoMfzcrrsDIqcIFfAceHuy1TRhn//N9S49YV+NIn
         YGBdO5o7ocwrKBENV9Xo4YUD287FN4p5IRuQG2c8ppB/47pgAGljN+OLmVPwr4/Rk4wJ
         HcpE/VKHKiiK6vRmon+cl0lHCfMLii6V2dHCA774QLi7mZEVslBRNCAw1UtlYMN989ll
         uLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330897; x=1728935697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaBVrQcRg42Tut+8gGqYU0anqbHtTgHx9qwiR+A7fg4=;
        b=ToOCpn8XAnAMid1Od6KvE4oxlhbiP9MA9SQSnwvvCEPqQoFtI1RlqNEIcEPcdsvIcc
         x5Vj5+MKlTbqTDPFHZwsc0+IRsrHMxU1U8Ukl0h4nTweoAq1oNSFTyBStPLrvEWEngCf
         p9A3HXkTcZd0d+j4TXb15HXhrOcsH9NTQCevPr11ua8uml+TY+GWPrcRUgX/m1COLKHc
         EsTZeUMYELUj6vBAcT+aVDz2zvPbd21HHTfF0AMTrnxNWlv4F+U6TJBGhht8KTA59/Fp
         mvrCkg/6BbpffmQ6BAlSwfHjoNKWhDi70i8lTaZISVh1+FllSwUHQFUgb2OfzG59VFmp
         e0ag==
X-Forwarded-Encrypted: i=1; AJvYcCV4f0ABKRV6GzZvt8RvmaFRmkXjn+fJ/UCJYuahmD2lu27CP2iBqw+Gp0wwuQK4FnCimSa9iw4yYb+igp4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8ADrzorWQ7J0pYaiHc442QiKg1vXS4AmtMbKWDO3nTVzqCF/C
	XaaUP0TwI7BDbblfqQjKL7lNO7V+N4Nmk4m4MTYBvI1wPIo2PDBd
X-Google-Smtp-Source: AGHT+IFWmlUeNm2a1gkEwaFmcSWer2IaG4mXhmY4npLRsbIVe/0z6F5Cfb/puPUuqsr62PL3sC1PMw==
X-Received: by 2002:a05:6a21:1519:b0:1d2:ba7c:c6e7 with SMTP id adf61e73a8af0-1d6dfa5a199mr18852585637.30.1728330897339;
        Mon, 07 Oct 2024 12:54:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d45207sm4791772b3a.111.2024.10.07.12.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 12:54:56 -0700 (PDT)
Message-ID: <3b7e7305-5711-4b4e-abdd-a9a3e11ca33b@roeck-us.net>
Date: Mon, 7 Oct 2024 12:54:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
To: Rob Herring <robh@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <20241007175949.GA1738291-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241007175949.GA1738291-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Patrick_NC_Lin@wiwynn.com, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com, Bonnie_Lo@wiwynn.com, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, patrick@stwcx.xyz, krzk+dt@kernel.org, wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/7/24 10:59, Rob Herring wrote:
> On Mon, Oct 07, 2024 at 02:34:05PM +0800, Chin-Ting Kuo wrote:
>> Add "aspeed,restart-sw" property to distinguish normal WDT
>> reset from system restart triggered by SW consciously.
>>
>> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> ---
>>   .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> index be78a9865584..6cc3604c295a 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> @@ -95,6 +95,17 @@ properties:
>>         array with the first word defined using the AST2600_WDT_RESET1_* macros,
>>         and the second word defined using the AST2600_WDT_RESET2_* macros.
>>   
>> +  aspeed,restart-sw:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: >
>> +      Normally, ASPEED WDT reset may occur when system hangs or reboot
>> +      triggered by SW consciously. However, system doesn't know whether the
>> +      restart is triggered by SW consciously since the reset event flag is
>> +      the same as normal WDT timeout reset. With this property, SW can
>> +      restart the system immediately and directly without wait for WDT
>> +      timeout occurs. The reset event flag is also different from the normal
>> +      WDT reset. This property is only supported since AST2600 platform.
> 
> Why can't this be implicit based on the ast2600 compatible string?
> 

Same question here.

Guenter

