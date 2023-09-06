Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF05793393
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 04:10:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XlI+vgvk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgQp52bwHz2ydR
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 12:10:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XlI+vgvk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgQnx3G27z2ydR
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 12:10:45 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso16949325ad.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Sep 2023 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693966242; x=1694571042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGpPqAvRxHlO49Def4EkEw3YsTe5pPmN/itzaU5IvZg=;
        b=XlI+vgvkdHX75ZaXpajOm5LJ4QM5oRSnapVccAFzxY7QSZJUuzGcOb7pEtfGmYQki1
         d5ngdOP4ceuqF2RiGBdVKP3ymvZZPoa0QTxP+ZAGHq/jfkJPR7gT+6O6mqXhbtugwo0R
         Iffz06lXQButJgiLc+tmzz5c5Jwc5TWcgtdmBTBPQeSEL8IY9c23ovXQhLRpfxjsQQaj
         lxcKb8xSs5EwFMOStMdZzo4mDTgMagApHsvfpYUoxhSmkV5YA+53lCqXV9T1GcHpNSZp
         qLkMh/7Bwuy4j2X1N12fevnOnf7XaoN5QAMe9MVv7ldCpFMr2VR6AfKKZAXJ5CSHY8LC
         pYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693966242; x=1694571042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGpPqAvRxHlO49Def4EkEw3YsTe5pPmN/itzaU5IvZg=;
        b=LAB4WeQmBb4vVCBJ8qRw5aao3X05jB4DPo1k9SbYbTNlQrPx5RKZQmaCXdsknXDdW4
         DEoswJv5zTCOocOeugwc7S/iKqM+GE2Xrt1j/VMzBsQz05NiKt11H81x6YCtqdTULJv+
         GOd6IJU6zuid7NY9FqcX5zb4k+cIaFgwpnT88MLgDhVUaOXAL7OcmSHrplND2kx49s4n
         ovgnisgFUVhhzxoLKAvfD8knTqijDkiNR5IvsrlWPJc+tSr9B0em+hGHDEZEAH/SUtuK
         i3RU3mwpEQaN1irtxvbLoEgPROjg9y/+mwmpxQ+hh5ktKmO7cVtFLfA5eGBsWtVeecoX
         n6uA==
X-Gm-Message-State: AOJu0Yxq/Z3B57IuTMTZl0ReBM+w5yVBUDiNj+H05sbRXM3v9QpKyRr7
	6OG5O1i30Ro1QtUdf27Xzgg=
X-Google-Smtp-Source: AGHT+IEgV8v1lML7K5Idv9fbc1OQl1SVxmSAvxGgeshwDMiW/8Y6q23nw0dvdS8QB052XzI/K5+dhA==
X-Received: by 2002:a17:902:6a86:b0:1bf:3c10:1d72 with SMTP id n6-20020a1709026a8600b001bf3c101d72mr10633510plk.66.1693966242433;
        Tue, 05 Sep 2023 19:10:42 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902eb0500b001bf846dd2ebsm9902527plb.303.2023.09.05.19.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 19:10:42 -0700 (PDT)
Message-ID: <136c0434-a588-877e-54e5-dd1078ff94a3@gmail.com>
Date: Wed, 6 Sep 2023 10:08:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230905062223.774871-1-peteryin.openbmc@gmail.com>
 <20230905062223.774871-3-peteryin.openbmc@gmail.com>
 <20230905181637.GA3742088-robh@kernel.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <20230905181637.GA3742088-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, peter.yin@quantatw.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 9/6/23 02:16, Rob Herring wrote:
> On Tue, Sep 05, 2023 at 02:22:22PM +0800, Peter Yin wrote:
>> Document the new compatibles used on Meta Minerva.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>
> You should not have blank lines between tags.
> Thanks your comment, I will fix it in next version.
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> index 68f717670f78..32582ee56264 100644
>> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>> @@ -79,6 +79,7 @@ properties:
>>                 - facebook,elbert-bmc
>>                 - facebook,fuji-bmc
>>                 - facebook,greatlakes-bmc
>> +              - facebook,minerva-bmc
>>                 - facebook,yosemite4-bmc
>>                 - ibm,everest-bmc
>>                 - ibm,rainier-bmc
>> -- 
>> 2.25.1
>>
