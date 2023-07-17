Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9B756ABD
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 19:34:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dnzydAvE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4TjR0Sqwz2yVs
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 03:34:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dnzydAvE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4TjJ31vCz2yGT
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 03:34:27 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666eef03ebdso3099462b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689615262; x=1692207262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dUoi1Mmr8IMK534APH+CWG7qY8Kuyh2p4qso744suGo=;
        b=dnzydAvEN9YKARwMthDayszanj76dr67zlOjek2z19bKs+DhWqcD0TxQOdtYPy0yLC
         jtunZLbbV7avrJrx8DE05sppNwgr4k1WbozR5pICNcFaF4ohwYqi68Wwg0z3D2Z2tCJK
         BCwuyzaNwrLn9S55IX/Qm5+k67U47Baow+iVxhAKTocY/EhYr7FAsWQozYbSHYGJ+V7h
         hPy09nr4O6X38+slC+30vzZFCf1SxTpXsbbSiJUj4ChUA3t+jjmCS46i/pPKkCT75uBG
         zN4Lwy8Q/UPax6vRK7ApcFMuiypogMlfS2qKE1CQMxnyOQXMYHRoqUiNskeR69OmBtmp
         soqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689615262; x=1692207262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUoi1Mmr8IMK534APH+CWG7qY8Kuyh2p4qso744suGo=;
        b=ljxm/gJ4Yi1MejxHVVAOxw9AGPdgUzuGAbBujlknwMtOTBVtdDxEZZ2+/sHj+Xr+6I
         MrGj3kChtEoJ8YmhNolRy4OSZo3q9pUWWE5OttJ6uWnIhfZ5rfBmp4UWdvOtT2OxOEM8
         eIaP84fQZd8/suslhCEPhlp2oFhtjcfVyL20wuZafcpBNHqSBYmgdBBojr/p0wsOSY7u
         kGz4EJ2pbBC9q8FO2O6I8OjlHbA8karCYQKM7oBGUsVlgCs/MMPQYL5UPXh4kgPm9dvb
         pB3j7Ngno5CZWe5GFY2vwjJtbmFzX9ljG7bhc31v0JW/qZ8dDn8jmZ/3HiMtsFDVmglx
         Mehg==
X-Gm-Message-State: ABy/qLaxU2Wyna/7dEuavCTyAjqUfX9+U/XH8IWy8yxxYUX9RntQB4uk
	p23TqXGgfNfaCvCdlXiDsYI=
X-Google-Smtp-Source: APBJJlHgiE4S+MXfi6uaGWczHajeTCKhbKry4gKne+v0Nr5Vemydgez1HyMd0UNJpeoHBOwwOlVSZA==
X-Received: by 2002:a05:6a00:17a1:b0:682:4ef7:9b17 with SMTP id s33-20020a056a0017a100b006824ef79b17mr16331177pfg.32.1689615262353;
        Mon, 17 Jul 2023 10:34:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t5-20020a62ea05000000b0063b96574b8bsm58971pfh.220.2023.07.17.10.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 10:34:21 -0700 (PDT)
Message-ID: <a4b0115d-7a06-100c-ec77-027493c86206@roeck-us.net>
Date: Mon, 17 Jul 2023 10:34:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230714174607.4057185-1-robh@kernel.org>
 <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
 <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Saravanan Sekar <sravanhome@gmail.com>, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Jean-Marie Verdun <verdun@hpe.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, Nick Hawkins <nick.hawkins@hpe.com>, Sudeep Holla <sudeep.holla@arm.com>, Luka Perkov <luka.perkov@sartura.hr>, Robert Marko <robert.marko@sartura.hr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/17/23 10:24, Rob Herring wrote:
> On Sat, Jul 15, 2023 at 10:55 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Jul 14, 2023 at 11:46:04AM -0600, Rob Herring wrote:
>>> The DT of_device.h and of_platform.h date back to the separate
>>> of_platform_bus_type before it as merged into the regular platform bus.
>>> As part of that merge prepping Arm DT support 13 years ago, they
>>> "temporarily" include each other. They also include platform_device.h
>>> and of.h. As a result, there's a pretty much random mix of those include
>>> files used throughout the tree. In order to detangle these headers and
>>> replace the implicit includes with struct declarations, users need to
>>> explicitly include the correct includes.
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>
>> Applied to hwmon-next.
> 
> I found there's a double include of of.h in lm75.c. Can you fix that
> up or do you want me to send a fix?
> 

I fixed it up. Thanks a lot for noticing.

Guenter


