Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD684802E46
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 10:15:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jfLVihmI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkJ0M1Vb3z3bZM
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 20:14:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jfLVihmI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkJ0D711zz3cBH
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 20:14:51 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cde4aeea29so2715123b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Dec 2023 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701681288; x=1702286088; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td7arQQdUq802c/iq8WzPBS2L5rlsrypnKsRbx7YZ7Q=;
        b=jfLVihmIBZI6HZzsCsqgNkFfLN55aBE4xon+ZxJToUPFC40Apj/io95lJKxC04i49E
         KL+FGo0P68qip/TuDoXisO9XSqD05NLGojD36AmFeYSkEslcCpkk0/iKF1ls3K9AXvNR
         pDwTPeE/0ECuCO/LNQM7jWIZ7DA0yJlNH7L5ro3f8eWHRdJ3gQsxTAhhdJWOeYHhbO71
         +7NoVzepRuya0DQNHzJnZdRvxTAYb2ZDgFonXjUJGNAM84exjBVWdKd69Wcds1agPfkl
         Hqdad1bQHoOAqFCLD53h8cxWLTpzfm0Zzkyn0Dq4hDkGsKl3AoZKvxyMxneKIG0VB0rw
         /MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701681288; x=1702286088;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=td7arQQdUq802c/iq8WzPBS2L5rlsrypnKsRbx7YZ7Q=;
        b=js5O4qfAMV9bXJu86vV7oKmyK+hawqcN6gKV3JWsOJaOUMhLF4DGGA7UWLYoP//UO6
         kSIzHvpdLQd5aU/UdpYx8mJ3ULOgDfNW4mf8TY/51z2aZtZYDlvqIQUv4P4KsL2QYfpA
         DOHaLxLS1/ijJgfRYRiY5UZUJtg1q2LlK2qhi0JD62Xti0sM5GgeQzAHNqjCt+rPjh0U
         BRB1hgHjNn8aSy4QR0ZzwwI/zInGwjhVj9230i4B4hank07hkGvwYa1C0c+QFTCWJHUs
         s3ZA89pSVe1seziftNPh52Pr2DTJcrhhbvZ18cVaW1NfywRAPxdcymjWOhbEcWAP/xvN
         7sOw==
X-Gm-Message-State: AOJu0YyeTMn+e9voVcDYt/KzK0KVZOvHdSG/lUzNQpkXC7eIFTsqpNIg
	ApV1M3+6tTqdD9lAjZftXfg=
X-Google-Smtp-Source: AGHT+IFXKxEEFX8vP4aBeoqt1BTZEmVpqXJif6onxC1JfujMmktO4OxKGd9+qeCqhfM51JReO+Rvfg==
X-Received: by 2002:a05:6a00:3495:b0:6ce:5312:c413 with SMTP id cp21-20020a056a00349500b006ce5312c413mr660791pfb.15.1701681288078;
        Mon, 04 Dec 2023 01:14:48 -0800 (PST)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id m17-20020aa78a11000000b006be4bb0d2dcsm7349362pfa.149.2023.12.04.01.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 01:14:47 -0800 (PST)
Message-ID: <ad6fb2a1-c376-4e03-8b18-12b228799bcc@gmail.com>
Date: Mon, 4 Dec 2023 17:14:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Facebook Minerva Harma (AST2600) BMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20231204081029.2272626-1-peteryin.openbmc@gmail.com>
 <fddcbad4-5368-4c2a-ba87-f4c4326a8385@linaro.org>
 <3ff5dcd7-69a3-4098-92c6-ed1e8f0bd8f9@gmail.com>
 <f2519d16-1b34-4d77-be69-cf80fa3415a1@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <f2519d16-1b34-4d77-be69-cf80fa3415a1@linaro.org>
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



Krzysztof Kozlowski 於 12/4/23 17:06 寫道:
> On 04/12/2023 09:46, PeterYin wrote:
>>
>> Krzysztof Kozlowski 於 12/4/23 16:20 寫道:
>>> On 04/12/2023 09:10, Peter Yin wrote:
>>>> Summary:
>>>> Add linux device tree entry related to Minerva Harma
>>>> specific devices connected to BMC SoC.
>>>>
>>>> v4:https://lore.kernel.org/all/20231204054131.1845775-3-peter.yin@quantatw.com/
>>>> v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
>>>> v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
>>>> v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/
>>>>
>>>> Change log
>>>> v4 -> v5
>>>>     - Rename document and file from minerva-harma to harma.
>>>
>>> You must explain that you dropped people's review for some reason.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Due to changes in the project name and content, please assist in
>> reviewing it.
> 
> When dropping people's tag, the patch changelog (---) should say that
> you dropped people's tag.
> 
> Best regards,
> Krzysztof
> 
Thank you for your explanation. I will pay attention to it next time.

Thanks,
Peter.
