Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B1960029
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 06:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtDP70q9qz2yWK
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 14:01:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724731273;
	cv=none; b=oRDRYdsMMHyMi9fGM5vNS4EuE7NkFFOjrhzwIkpIpCBWNLiJcOfFGcUFnhq21EaNldLskvbTNFcW4qy2lb9jk/dQZXClewh+lDuKLh6EfXMSHN+bx58Sqrvz8wZGBxW0ySLqMqVfIBc5wfZ+Kqcx5X+Gzbu783XEDclvs76uqwqvDqkLDEiCB8T52J72LzvI6Kbgn/DK5r1BsrjXSsrnnR/td8s1Cb0HXVmzh4jxCUZDASDOogFsgMqdMTDs7tze9MCZ6YWE67EWKEdx/qvpKjeqBPz2TRAvYDSydoGsVNHD36grApZaULcA9SI8vNQlGSpiR7I8hZxDI8BfinBbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724731273; c=relaxed/relaxed;
	bh=uQEXbPSwXfolVaTNF8pFBv4C5nehlvOIEpJyunOBBGg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Sender:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=e0AnseJJWeiA2ZOgDnDGQwmq8qY/Sn6QZgUk9TZKKT7a+cLNvpcJh0PiqVbCs7AgTZ//PjBbSxE6CCDsSOuYv1xFPPrr4+re0tvwGOeZ+GBrB8bbRo3xpgjiwjxFkLrNbWnJBRFT2Wvyapb1ymEhyPiAbLn7Dp/iRmpEhgsNqDcYdVonhJwo1ZobQPXRvq/vZTHATzTHwqNMAlJY+ZOk7WiES90042wml9L1KPb7ze8FS/eTBumcMBw6p3n0U8bruxLTQoOLMzK4qpKpCLp31qGbDQIAzF3r8qxfHQlBykNZ0ivAEHtzdJ52nSWhggwSgbM0znp3I0mEs2IJ+zQPBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6+oOC5Q; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6+oOC5Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtDP45lmqz2xsN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2024 14:01:11 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2702a00aad4so3666423fac.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 21:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724731264; x=1725336064; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uQEXbPSwXfolVaTNF8pFBv4C5nehlvOIEpJyunOBBGg=;
        b=L6+oOC5QvHOTW0n9XzB7WXZ1awNaelwEs4D6PoqgU3VX2tKgbJ3WiCbobD2NFzAOhC
         dF23cVPm/0daHts0j1O6jwcKnDkCRxl4o8cE0oR0/TGDeD/5Esw7pkKTsBc42R5dSysM
         dD3/nBTkfrJO+X9LHWEQtPXnc8U8UN1SXNlhJ/QleoFuI0l2FGvkIIwXDn+O2b20D5i3
         4kIAwQ7vm4ci2NAEi/JnuTp79F2HEAqak9W7sf+AhgZl0EWSXpgoS29Vw3fmpFKVCYOu
         9WhGA3HOzHIM/0RAfWp/h1LgXIT0AfvEPKoLuSeYY2Sih77UamwejQeXJP+bwBORQ6/s
         oldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724731264; x=1725336064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQEXbPSwXfolVaTNF8pFBv4C5nehlvOIEpJyunOBBGg=;
        b=Ok7iix6sqoj+P1lXKCXmxLdXZoRi4qTSItaeqxu1c7EULB0mPbKxnPrjejUp3aeau/
         e8RCUsgaMq96qxqK49KRnSJ3l2tN6AiEOKhg0Mib44UKYB7Fuy0HRdw7e8A6MmzCZenW
         ofi/F9kJN1y5OgYUs3bfCnb6ubIaepuKq2S60PQEGktmDkeBib8lmH06Yjl+SjJU0TCo
         cgPImOG9K7veBaC37pSjPmNgaVxRSWoPmC/vHuusQc2jbRw6rhCgN6TP7zkwTcQYBNes
         xMk4MqP+NiMU8OBSKgqLtQs9Itmb8BTLA3dDuhcaeWxYAYCuUOtrRQZO4RteKP/lwSs/
         DBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVvWJ9GUktVpfioVxc5/Gcv6Seyn2q6yXDB3MuytMs243TLr2f1XmiULBpIqdV9Z6SF7dYAPRwpogVZQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFA7TH45S5s2D27Qh8ZTO6zWuBp5w16T2VUQcUU6LyzdwLYTEw
	c5p1ELbDeCxgFd0Yu4y+tev7w1+k7f44AKYMq5aAE2Xy+1R+/mQ0
X-Google-Smtp-Source: AGHT+IEqntLbysw6zucEJfpwE7mYVJ9LSt7xN6jDox92P2PILznjTYSTR8F5638pKrqD/MAF7Cm9qA==
X-Received: by 2002:a05:6870:638d:b0:260:71c4:f33a with SMTP id 586e51a60fabf-2775a0385bcmr1909078fac.39.1724731263820;
        Mon, 26 Aug 2024 21:01:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434254057sm7708662b3a.77.2024.08.26.21.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:01:03 -0700 (PDT)
Message-ID: <b41a6bd9-dea2-4323-9bc3-e5c48def99d9@roeck-us.net>
Date: Mon, 26 Aug 2024 21:01:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 0/8] hwmon: Simplify with scoped for each OF child
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240822062956.3490387-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/21/24 23:29, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Jinjie Ruan (8):
>    hwmon: (aspeed-g6-pwm-tacho): Simplify with scoped for each OF child
>      loop
>    hwmon: (aspeed-pwm-tacho): Simplify with scoped for each OF child loop
>    hwmon: (ina3221): Simplify with scoped for each OF child loop
>    hwmon: (lm90): Simplify with scoped for each OF child loop
>    hwmon: (nct7802): Simplify with scoped for each OF child loop
>    hwmon: (npcm750-pwm-fan): Simplify with scoped for each OF child loop
>    hwmon: (tmp421): Simplify with scoped for each OF child loop
>    hwmon: (tmp464): Simplify with scoped for each OF child loop
> 
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
>   drivers/hwmon/aspeed-pwm-tacho.c   | 8 +++-----
>   drivers/hwmon/ina3221.c            | 7 ++-----
>   drivers/hwmon/lm90.c               | 7 ++-----
>   drivers/hwmon/nct7802.c            | 7 ++-----
>   drivers/hwmon/npcm750-pwm-fan.c    | 5 ++---
>   drivers/hwmon/tmp421.c             | 7 ++-----
>   drivers/hwmon/tmp464.c             | 7 ++-----
>   8 files changed, 16 insertions(+), 36 deletions(-)
> 

Series applied.

Thanks,
Guenter
