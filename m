Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E828802E55
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 10:17:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nqSEUpsE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkJ2t5bnbz3cPN
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 20:17:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nqSEUpsE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkJ2m399sz3cCS
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 20:17:04 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ce5a0c384fso243668b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Dec 2023 01:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701681421; x=1702286221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9D3kW2Aojjv4RqGRthj2b1rTnXc6ubMuseBwhuWQ0QI=;
        b=nqSEUpsElbjAoYtmXYmumTYMfDZGKInHDAd17naDxfFjG7gjGFSw4GoYv0EOvQoWZR
         czUl7G4jDojxPqYT6UI8NfnLpV0tcJkqXx1CR1iBHavDP0lULmzafkh5uAYgafuWh/d1
         JVmi5n3gOUIXd0Co36eBCuwz8NSEdEU5P9RJalJuhKEFcAftUkXg2dUL9Mvv5ly+GMTI
         K9NmJ242Oxyoy3jmPWcuqdZYvzV4G+hx6HnzUVVkR8IIRnBapKrth6jTChvCllN6cdKB
         x4PP7ALdGYHU3S4w1DZxesTvM5O57dwRZN+scrMVbEleY2Q39DUU80ei8AWP3wkUne8E
         rZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701681421; x=1702286221;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D3kW2Aojjv4RqGRthj2b1rTnXc6ubMuseBwhuWQ0QI=;
        b=uuYcLCI47QdvmPSmoPljwJ0qEz9YHprk6IZTa+P3FXtO1K9DKBoKfaQIKsaQ6qar95
         KY8TJ3IyNPizCVoxHff4zGx/Ch3IbjqY4A6j/EgR2rxS3uYeqV7zHz4u+aseYaGyTZ1a
         nZ6d1AxLw4FPUMS58DFvLQXijbqQoqFMIi4AHiejOJagBU+JfxAsQyb8sPAd942AD0wV
         uh4w3AuzRUY151poETQj8Gn+d4Br7yki8XqxK1cxf78pJ6HWK23dQDbHF4hEoC6rRhfi
         l15dwLu99mx05uPna80RcmMAJOhk7jpDfCLxLwDT2aiFlsDfKc6gJEn00Lxn4yj1f57l
         IVVA==
X-Gm-Message-State: AOJu0Yy/nursnXLHAMMQmJBbIT38H48w1t+2fKKKiME3rV8tyTXiycwk
	0MxDc5Da9U5CXYfBaYTgC7o=
X-Google-Smtp-Source: AGHT+IHyM39DQ3WajW7PhaikQO34qZT7BP0+23uV4Oo4Za/YodiTkb9bgMI4pdUXIRTv0cLmFYUxWQ==
X-Received: by 2002:a05:6a00:2e12:b0:6b5:86c3:ccaf with SMTP id fc18-20020a056a002e1200b006b586c3ccafmr29556613pfb.22.1701681421517;
        Mon, 04 Dec 2023 01:17:01 -0800 (PST)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id t14-20020aa7938e000000b006ce5bb61a5fsm670762pfe.3.2023.12.04.01.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 01:17:01 -0800 (PST)
Message-ID: <bf3f2195-2d26-4817-ac5d-1608722c23f6@gmail.com>
Date: Mon, 4 Dec 2023 17:16:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: PeterYin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v5 0/2] Add Facebook Minerva Harma (AST2600) BMC
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
Content-Language: en-US
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
