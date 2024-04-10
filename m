Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEE957912
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHt03rzz3g2L
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ak0f7HuY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFFVv2Vf5z2xFt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 06:56:38 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-516d0c004b1so8519635e87.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712782592; x=1713387392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=velTxyDyUhfVt0WKozw2xszoAn3uVnpWZ/SVMLGjm+c=;
        b=Ak0f7HuYG71LaZ1cxb3jgZu64D02Cyzf+C5naELzeCEZAsz6yB32BvZ36SIRfTTiuY
         uHN0LkD3BcZQec1q7oDV5fA06X0jSksOcrxtejbM8jyLZ0cCi0RveaqDfVQA0keMAlkz
         FjX2SJMi7KkDqgKGdPfp4heW/lqB3Lm4CgZdXU/O0GoDkfzEQw3ywSRDxqYmyk8ooy5S
         U7W94PwRsrc4GS/1EuSqJ2S9fq7mlMReog5jYIPPHXr+IO4+xfEz2TBQuqc2vD2UJen3
         z6Uj6NBUru3KmNJLbsh5bw27yQvJycJZ0hT0AqNVkC5aG9cawvVqqvP41qtPUpHxeejr
         bIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712782592; x=1713387392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=velTxyDyUhfVt0WKozw2xszoAn3uVnpWZ/SVMLGjm+c=;
        b=t+90vo/nXvNKsQVKcKiGhtspNyhLmY5w0SfahJ/ZbrOWMeI91TP23a37ENtJ3sF5Rn
         6TdpSZ1Edl2JNO3okr4dsYz7jaFe4mN6px2hI/ysuUSzT8Wan3vXBz1CsoWu56sYn5yS
         2TcBf1mYDwBXrFh+ESxfj7rljyb4xbQ5Y6Aq7suU3V6OgNqsvR79BrewFZUzsuXaYdKr
         7S209/UL8cqLOwtNOiSHkVRLwWs5Tg20Qn3bqPLASSxG7pKIiAikZAmgbJV4ndqmsjam
         SXLpoxX9r0uFe3UfN7RqxEsU2swy6pnHNt5fKAEP80FVdXm2/dorwA9c+YpdhUQQgSyZ
         Wong==
X-Forwarded-Encrypted: i=1; AJvYcCXqd8vDGAF5NGlLwGFBpvPTWbchpfx2fwI9OPMSEJ8G9YZzJSZmKuB+eh4dD/Z7YscdmTJ6fInW5NUjTHX9ApHhf0W1+k/7+l997sNCCA==
X-Gm-Message-State: AOJu0YzlhNdSIzqeI2d3xWRemIsrNlZXOz8/3GHPXBZc1KRy2FeUiUcq
	NgkEvON1EvYwnfaNjaMcp/a9Up/AOYe3vpjgFabyMNOEZWyj1oPU
X-Google-Smtp-Source: AGHT+IHU+2lp+CqY9Y0dbETJpEetgTV/6YxYcG7h5rkJpRV4Z3ndf35dDAQDagEP9Qz4ZQNHrtFv9w==
X-Received: by 2002:a19:f50b:0:b0:513:aef9:7159 with SMTP id j11-20020a19f50b000000b00513aef97159mr2555020lfb.39.1712782592156;
        Wed, 10 Apr 2024 13:56:32 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id gv15-20020a170906f10f00b00a517995c070sm51166ejb.33.2024.04.10.13.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 13:56:31 -0700 (PDT)
Message-ID: <6d1f0fbf-ea53-47e2-92e5-131da010be0b@gmail.com>
Date: Wed, 10 Apr 2024 22:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
 <202404102043571b7450b5@mail.local>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202404102043571b7450b5@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 4/10/24 22:43, Alexandre Belloni wrote:
> On 10/04/2024 17:55:34+0200, Javier Carrasco wrote:
>> Convert existing binding to dtschema to support validation.
>>
>> Add the undocumented 'clocks' property.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>>  .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
>>  2 files changed, 41 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
>> deleted file mode 100644
>> index a87a1e9bc060..000000000000
>> --- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -* NXP LPC32xx SoC Real Time Clock controller
>> -
>> -Required properties:
>> -- compatible: must be "nxp,lpc3220-rtc"
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -- interrupts: The RTC interrupt
>> -
>> -Example:
>> -
>> -	rtc@40024000 {
>> -		compatible = "nxp,lpc3220-rtc";
>> -		reg = <0x40024000 0x1000>;
>> -		interrupts = <52 0>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
>> new file mode 100644
>> index 000000000000..62ddeef961e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP LPC32xx SoC Real Time Clock
>> +
>> +maintainers:
>> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> +
>> +allOf:
>> +  - $ref: rtc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,lpc3220-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> As I explained the clock doesn't really exist, there is no control over
> it, it is a fixed 32768 Hz crystal, there is no point in describing it
> as this is already the input clock of the SoC.
> 
> 

In that case the first approach was right, and it should be moved to
trivial-rtc.
I made the mistake of mentioning the driver and what it does not
support, but strictly talking about the device description, the 'clocks'
property was pointless in the dts where it was added.

If we leave it undocumented, the error I discussed with Krzysztof will
have to stay unless the 'clocks' property gets removed from the dts.

Best regards,
Javier Carrasco


