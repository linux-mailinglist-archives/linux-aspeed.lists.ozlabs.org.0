Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E988A753743
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 12:00:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K4QzBf7A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2RmF05w6z30Ps
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 19:59:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K4QzBf7A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Rm5088Kz30Pr
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 19:59:48 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8a8154f9cso10924165ad.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689328783; x=1691920783;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vShZQMcarPkzUmWVXK6Ziq55LsnSbqaxjxY6sf8cpZQ=;
        b=K4QzBf7A6YFEWHUA6ixpR5W1HoUYkbJ4J1W17P4+oIwAt4hv00eR5M3A3DYwAiyYjl
         Cjhii1S2FLEqAefU1CBl2X9rFNItYL/fGQlJMxPXKPyUGG4FDXri1Ih33KHD/9hn/lMN
         NQ0G9M7ye3B4cQl1ZvnapuP2jXPAHTKFlVrBt23TKLyNNc7zAp1PHl7yViwtSvzO0bqV
         liXLvZ3vVOMKUviDUwGEALJnSnSmTuxXNrUATYeEnDbMAiHwPUvuzG43gGffELywmCcf
         jM7gPAux+Gc5dhxfbdaHdPyoX6/L4dCz+Kxd4eSHxIoem3MZU0hK60IE1u6b6YMy7vw2
         L/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328783; x=1691920783;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vShZQMcarPkzUmWVXK6Ziq55LsnSbqaxjxY6sf8cpZQ=;
        b=YH3NrDkVDS4ZQv+rmZ9x86lGfHEBsKsWbmaLT02rVRxnoFcE08IS6ZdWiVFSu8E4rY
         MQDpUy0OSdu6eW8ah+Pgx9ecG1JTbK16ENS4llx3ebKQKMgX3SKsTk6d+GM4muvqIXWN
         GLjwxMCrtQRLNnDUZ+gKvsklbB5SeATrHAfbI7/vxeZdzIuqEvwBK1kqxQKFf/jNTJWC
         pusWHd/ubBEBgRx1aMoSuXiGNXLYglTmGBQVkWNt/Y6UlFAnbNmpfNfXVtqmkL6I93ov
         fShpUHFwKDVWVMq6Ygq1/YA1A6bwdf46fINxoOs9WJ7kimchpBM75TAvYcvKhDUXtAtV
         h+Hw==
X-Gm-Message-State: ABy/qLaOsSU7G6fG/gNVb+Atxy47/dTA2bv8hRZ+sHMSon46y2vkzRaq
	gfI8KPr2bjLAEAUq433sZoc=
X-Google-Smtp-Source: APBJJlHHDmGNSykHBKxMZGwxSLLnEVvuoPUPo9OdWpoStDfN/OVYQwEXP4FINTJblZuIsfG93KAeHQ==
X-Received: by 2002:a17:902:f2d4:b0:1b8:a39e:ff4b with SMTP id h20-20020a170902f2d400b001b8a39eff4bmr1847417plc.32.1689328782949;
        Fri, 14 Jul 2023 02:59:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902848100b001b801044466sm7400745plo.114.2023.07.14.02.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:59:42 -0700 (PDT)
Message-ID: <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
Date: Fri, 14 Jul 2023 02:59:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 Billy Tsai <billy_tsai@aspeedtech.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
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

On 7/14/23 00:13, Krzysztof Kozlowski wrote:
> On 14/07/2023 09:04, 蔡承達 wrote:
> 
>>          > This is because our register layout for PWM and Tach is not
>> continuous.
>>
>>          > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
>>
>>          > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
>>
>>          > ...
>>
>>          > Each PWM/Tach instance has its own controller register and is not
>> dependent on others.
> 
> Your email reply quoting style is very difficult to read.
> 
>>
>>
>>
>> Hi Guenter,
>>
>>
>>
>> Did you receive a response to my previous email?
>>
>> I would like to inquire if you have any further concerns regarding the PWM
>> and Tach with 16 instances.
> 
> But isn't like this in all PWMs in all SoCs?
> 

Correct, pretty much every fan controller is implemented that way.
I don't understand the logic.

Guenter


