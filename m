Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230B898143
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 08:13:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=srmxXeQ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9BBX4kCBz3dXZ
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 17:13:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=srmxXeQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9BBN3jtcz3d44
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 17:13:14 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a518a516bf7so27702966b.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Apr 2024 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712211187; x=1712815987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1DVSsv7THCi6XQHrrg2cA1+xOVbZs1gNs2CPHL9fNGE=;
        b=srmxXeQ9Co8Zs6biw1fv4ZjkBJPf0NJm6Wn+iCXtd+dufhNko2cdUiGKuDk4CN94MN
         XLsJXXTW6cxMIkCusOePYglob+nkmE7C+DmZ/qXJQHWCgLOKvRkLhvTwlqIOnDzfU9zm
         YPweIq1IaQ0KiYn/zqmgYFVOEJlc7GB/03v4UX7iudnd2ToqeWhtjukhBBylmvJLCYQy
         rLLLiT3ginUD2jW3Z6ToP6BE3+jJ/nwRWHRIymVE92YoEe2+UQllK6UjbBitmx0/4qe2
         vjDtC6dbNMlquaNuiqs7/u1O5iIlQVKe0VDKBbGehn89PLs5L1dhoMVh2u7Pv/ybIKRc
         vsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712211187; x=1712815987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DVSsv7THCi6XQHrrg2cA1+xOVbZs1gNs2CPHL9fNGE=;
        b=Wq8sk9D8IYYR/QZK3m7S95bCr2urTrER7kqK8knX4f+mC8ijz0BFQN4gWMgN/up5Co
         C6L3/ZkPXic3Nk/l6EZMBGoq9BPxxOTfWqqB1NA6GAVj5/CkrNYmMTlIa/xU87SdYFyw
         y3AIYqtkj4zIQ5HmAIs1suQzVnyPKv0mjUH9fCBakSAgyjWCbHhNeyBD+risiyPFaam6
         JXG/NYuZJORs7FuI6UOqmmoVEWzg+s5lZ3a3ZzwC570WZJyC3i4MbuYdtKzIBxgSehDl
         XaezlRoqGNPPTis04418iXnPVjvDWWGNd+eG8Cd1xd/RzanGuhuJ19dOvcBCVvkZ7XL5
         teFA==
X-Forwarded-Encrypted: i=1; AJvYcCXf5qzDhDTWU68F8fnktgD5JG4SJKiOu1QCBoewKNWMCa1PirCgy5wM08FG06VM5kgvrftl7PKBwkLHVAXvMv+MJEcPEcV3GCRU9YXlww==
X-Gm-Message-State: AOJu0Yw6+h+wIXRJJv2VzwKXfc8x+192URXFtopc1i6mZ0XUmhC9xJ+N
	ikldVi9LUnTuciOo4FI4oZ7U4rYHNrySy9/yKKYA3wNVsotCqEb5oys5GTp+nXw=
X-Google-Smtp-Source: AGHT+IEnMWo3Ix2WIjHU21kRXOIGK/LiNiLJ3XFQIu2+0T7hCs0JKp5egQL4YfTWd2wmbONdZMLNbg==
X-Received: by 2002:a17:906:4ad5:b0:a4e:2532:ae9 with SMTP id u21-20020a1709064ad500b00a4e25320ae9mr1019030ejt.27.1712211187582;
        Wed, 03 Apr 2024 23:13:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m16-20020a170906581000b00a4a3807929esm8554214ejq.119.2024.04.03.23.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:13:06 -0700 (PDT)
Message-ID: <c3902c6e-c38e-4604-b79e-2b5406274d8f@linaro.org>
Date: Thu, 4 Apr 2024 08:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231209104412.12916-1-krzysztof.kozlowski@linaro.org>
 <171213860535.16780.4635499105199545058.b4-ty@linaro.org>
 <8610e0a8aa5c2916fa04292a10e8a843862ff0ee.camel@codeconstruct.com.au>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8610e0a8aa5c2916fa04292a10e8a843862ff0ee.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
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

On 04/04/2024 03:41, Andrew Jeffery wrote:
> On Wed, 2024-04-03 at 12:04 +0200, Krzysztof Kozlowski wrote:
>> On Sat, 09 Dec 2023 11:44:09 +0100, Krzysztof Kozlowski wrote:
>>> "mlx,multi-host" is using incorrect vendor prefix and is not documented.
>>>
>>>
>>
>> These wait for ~4 months and they were not picked up. Let me know if anyone
>> else wants to take these.
>>
>> Applied, thanks!
>>
>> [1/4] ARM: dts: aspeed: greatlakes: correct Mellanox multi-host property
>>       https://git.kernel.org/krzk/linux-dt/c/7da85354c4fa35b862294dbbb450baeb405b5a92
>> [2/4] ARM: dts: aspeed: minerva-cmc: correct Mellanox multi-host property
>>       https://git.kernel.org/krzk/linux-dt/c/e515719c17beb9625a90039f6c45fa36d58bdda2
>> [3/4] ARM: dts: aspeed: yosemite4: correct Mellanox multi-host property
>>       https://git.kernel.org/krzk/linux-dt/c/af3deaf9bcb4571feb89a4050c7ad75de9aa8e1e
>> [4/4] ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host property
>>       https://git.kernel.org/krzk/linux-dt/c/cac1c1dda6130771e06ace030b1b0ed62096a912
>>
>> Best regards,
> 
> Ah, my apologies. Joel's on leave and I'm accumulating patches in a
> tree for him in the mean time. I've had some things going on
> professionally (changed jobs) and personally, and these fell into a bit
> of a hole.
> 
> I'm okay for these patches to be integrated through your tree, given
> you've already applied them. Feel free to add acks if your branch
> allows:
> 
> Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> I'm working to stay on top of things a bit more now than I have in the
> recent past, so hopefully I won't miss patches again in the future.

Stephen reported conflict, although trivial, but maybe better if you
take them? I can rebase and resend.

Best regards,
Krzysztof

