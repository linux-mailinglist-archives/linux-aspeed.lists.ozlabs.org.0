Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFD53E1AC
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 10:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGn3H5Pmyz3bks
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 18:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hvc4xds3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hvc4xds3;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGn373f6Tz3000
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Jun 2022 18:39:14 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id h1so11568833plf.11
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jun 2022 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=9jt8S5U1f1kOACj8Cd91MdGJdCEtZCqF+0G+U8Im1w0=;
        b=Hvc4xds3Ld7nAJoFdHYgv6+UFN82CWncpDasinypvWoPemToMat6BoFjtJTCdNtruy
         xpm0n7Ecsr9mqwIrgfF6+2JuLkB3pkqNOk1gdBx7tWSUfOB5WPreDXz1YV6TSZRLoC53
         dkWeL14FRfZQh4I1nArWCy/RtcNe0rKjqYoxPtMhAp33eQF7bjyYyjYnAQOM727//P0X
         28z86ae0g4jemj+bzT0QCHanlHnlKulad53O8aID3XjFS1PKnLAT0Iu/1J6achDaY+3j
         02GXlT31Eykn1GX/23JF98/HAjrkTcbX+pi/6tzzrI28/c6rajgm1qIHBD1B9BvvCBxm
         AU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=9jt8S5U1f1kOACj8Cd91MdGJdCEtZCqF+0G+U8Im1w0=;
        b=Lga+BLusNUaxy8K7HEUrsBhjB2ZoOjWNKLRil08wdsd7Vf1QZYxz17Ic/77Mq0Nax9
         Ab4YE0eX2QAbFOowrB0WK2evwtaR7FGuk1rY9lEe6w20fpW/R3yzaBtDIRS2BeoAFbKN
         WTEopZ6dcWZgEdILeuUkzdgMpKYrlIjEV6PLAKe0cWUMsK60xH42lli5LXFDE1SFy+pG
         g8Ihs2/q4cpxvVQl+ZufqvSXZq4Cj3//h8XUYHq9yukzbY/BW186vbrzjagXZXFGaGpV
         EUlWxtQcUg/ioGOjTte7oENhEhow3wzd8NLZpUj+93Jwsq9YmYPKK+jB8KbZNFuHi8aC
         JBzg==
X-Gm-Message-State: AOAM532uBqtd80yN/zLEBOVjkh3WZDwuw3GzrWLAeVUP0EgtCI/s6Rwl
	hRp/LSra1hCUdNlMq6oZYYM=
X-Google-Smtp-Source: ABdhPJx2O4PvrW1/HZhvHE0AP+0R76eiX3FJho3sOmcdSrrlkGiC8gY1b7TUVBkwObCt32ewEIRH0w==
X-Received: by 2002:a17:903:186:b0:167:62b0:a556 with SMTP id z6-20020a170903018600b0016762b0a556mr10753955plg.122.1654504750423;
        Mon, 06 Jun 2022 01:39:10 -0700 (PDT)
Received: from [10.10.12.193] (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a1a4300b001e2f53e1042sm11948045pjl.7.2022.06.06.01.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 01:39:10 -0700 (PDT)
Message-ID: <f0a8c3fd-8013-0f7f-b7f8-5e9e85395543@gmail.com>
Date: Mon, 6 Jun 2022 16:39:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for manual
 clock setting
To: Rob Herring <robh@kernel.org>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
 <20220601041512.21484-3-potin.lai.pt@gmail.com>
 <20220605214700.GA3558088-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20220605214700.GA3558088-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


Rob Herring 於 2022/6/6 上午 05:47 寫道:
> On Wed, Jun 01, 2022 at 12:15:12PM +0800, Potin Lai wrote:
>> Add following properties for manual tuning clock divisor and cycle of
>> hign/low pulse witdh.
>>
>> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
>> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
>> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
>> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)
>>
>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> index ea643e6c3ef5..e2f67fe2aa0c 100644
>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>> @@ -12,6 +12,28 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/i2c/i2c-controller.yaml#
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: st,stm32-uart
> stm32 uart?
Sorry, I will remove it.
>> +
>> +    then:
>> +      properties:
>> +        aspeed,i2c-clk-high-cycle:
>> +          maximum: 8
>> +        aspeed,i2c-clk-low-cycle:
>> +          maximum: 8
>> +
>> +  - if:
>> +      required:
>> +        - aspeed,i2c-manual-clk
>> +
>> +    then:
>> +      required:
>> +        - aspeed,i2c-base-clk-div
>> +        - aspeed,i2c-clk-high-cycle
>> +        - aspeed,i2c-clk-low-cycle
> 'dependencies' can better express this than an if/then.
>
> However, I think this should all be done in a common way.
>
>> +
>>  properties:
>>    compatible:
>>      enum:
>> @@ -49,6 +71,28 @@ properties:
>>      description:
>>        states that there is another master active on this bus
>>  
>> +  aspeed,i2c-manual-clk:
>> +    type: boolean
>> +    description: enable manual clock setting
> No need for this as presence of the other properties can determine this.
>
>> +
>> +  aspeed,i2c-base-clk-div:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
>> +           16384, 32768]
>> +    description: base clock divisor
> Specify the i2c bus frequency and calculate the divider.
>
>> +
>> +  aspeed,i2c-clk-high-cycle:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 16
>> +    description: cycles of master clock-high pulse width
>> +
>> +  aspeed,i2c-clk-low-cycle:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 16
>> +    description: cycles of master clock-low pulse width
> These 2 should be common. I think you just need a single property 
> expressing duty cycle.
>
> Rob

Got it, thank you for the suggestion of duty cycle.
I will use duty cycle for next version.

Potin

