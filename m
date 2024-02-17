Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A639F858FBD
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Feb 2024 14:42:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eaS3dBHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TcVNf3VSlz3cB1
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Feb 2024 00:42:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eaS3dBHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TcVNX4yqYz3bvJ
	for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Feb 2024 00:42:34 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso16582511fa.2
        for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Feb 2024 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708177347; x=1708782147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiXDfqGts8feqD9VCLlXe5SRdanfsCFR9TmA/hIZPB4=;
        b=eaS3dBHLJlN7qqPkC7fK/GmC6PQxj4rdX4qifwpUEGjOnQLWvqk5kOD2C54fC0kzek
         0Az0hLMqmiTTGY9vu01Be0UdbsHl9z9sK/ZMGf87gVi3hneuSQFQmErwIDIY6+PvNQWQ
         2QmVJNeIB69xRoXbgP9Z0IeTSInzjBHOeEBj7B14MJFyL7XPxGIz6oKwEkeO2yAIxaqg
         aBmn/UkUJ7WHpnlqYUKQJuPMD+VIlG9pKOjF5arc8iHVDVAoecoe159ZlBy1Xj4uYis1
         BLYCwUGauHdHrmewUyUPeSPDdiBrE9mlBEO8drQQH2j7hpkzxk7fV5JxCCxcuhESBNrN
         km7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708177347; x=1708782147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiXDfqGts8feqD9VCLlXe5SRdanfsCFR9TmA/hIZPB4=;
        b=LUK5NyhMSkgNjbrUJG39yU3WEnIAah0oOaGYgo03IFqPb6XtxvT/1O/m0vh6QE6VxK
         rG78fREQBHkEppGO+fUtaMimR1m+G9UHriW/yMOp5TbR8fs95pxQ4ZzLnTbe0u+2oyl5
         3kORn7ku8VWWItRm9hggR1fqdDJ6NeSxMgCNY62W1qvIhh9zNDSnbL3dzJP42eiAxWrw
         Tl0mDKsV4GeNSbydZjgn24HYngDp1mqxAz0pkQ6dfvqKriQjGNUrXvO0yGB6ihpce2M4
         vDdkp72KgWtnbjMdgFYxLnnG7y9xuZXNhx6bUXYAYaaXl2ajvLZmj7ig15vlVsaBs4Ju
         0+DA==
X-Forwarded-Encrypted: i=1; AJvYcCVqcswy7Nn2LqW1NNvGcHKic6SaNbJYFwQorrPi8lx8WyGlPWlIPJ4F3fHB+LNULQIGBerXbdsQOIHBlWWPKdUpSFaA5nGIDQHiiHIuwA==
X-Gm-Message-State: AOJu0YyICctXJgd5nNnbfsKfRx+6yM5qLuXT0zBCg6gVIXjEiIvHtPiB
	/7Y+22PEiFkd2UaOwC4tBrGFXwWvmVw3DLxd04mXLeUrF7hDA2yAx7CpdOaRAto=
X-Google-Smtp-Source: AGHT+IFpK2zVJudUZocVcrh8tGHfvqGG/t49pxVjyXnHWhUB5Ndv1Ojk419TIBq8YEYSkzFVybqGLA==
X-Received: by 2002:a05:6512:2c0e:b0:512:a637:9462 with SMTP id dx14-20020a0565122c0e00b00512a6379462mr792588lfb.16.1708177347296;
        Sat, 17 Feb 2024 05:42:27 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056176e95a88sm893979edb.32.2024.02.17.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 05:42:26 -0800 (PST)
Message-ID: <4b34c495-4aaa-4dd3-b7b0-b9d54baf9338@linaro.org>
Date: Sat, 17 Feb 2024 14:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
 <2024021712422352187ad4@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2024021712422352187ad4@mail.local>
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
Cc: linux-aspeed@lists.ozlabs.org, Nicolas Pitre <npitre@baylibre.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Conor Culhane <conor.culhane@silvaco.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/02/2024 13:42, Alexandre Belloni wrote:
> On 16/02/2024 12:26:12+0100, Krzysztof Kozlowski wrote:
>> On 17/01/2024 08:56, Krzysztof Kozlowski wrote:
>>> Drop the requirement of "-master" suffix in node names because:
>>> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>>>    "Controller".
>>> 2. Some devices can operate in Controller (Master) or Target mode, thus
>>>    the name is not accurate in such cases.
>>> 3. Other buses, like I2C controllers, use simple "i2c".
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>
>> Rob, can you pick this one up? It seems Alexandre did not take it.
>>
> 
> I'll take it but I don't think it is super urgent.

It's not, but it was almost two weeks and we are also getting to end of
applying cycle of some maintainers, so I was going through my pending
stuff. Apologies if this was too pingi-ping.

Best regards,
Krzysztof

