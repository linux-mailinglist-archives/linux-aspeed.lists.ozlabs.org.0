Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98141793390
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 04:10:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DwTUpQZN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgQnQ6cPqz3c1P
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 12:10:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DwTUpQZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgQnF5DLFz2ygX
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 12:10:08 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68a56401c12so2178398b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Sep 2023 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693966204; x=1694571004; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGpPqAvRxHlO49Def4EkEw3YsTe5pPmN/itzaU5IvZg=;
        b=DwTUpQZN0gNBfv8f5JBsOgPWI9or1Hu/3ipdpTWIddi11MICNFNO/ZgsnOnmWo6km+
         jB+w71b0TLQsvGZSAsIXXydQzAjWttnunO0drFHkMoLaORT50nrDm56z18kug2l3Fc8q
         7MlVgndBqrIDFJMIf2GDtaG6t5IoqMGNCrGrgH6Hau9ixU/i8AQci2TWvF1XpsDLAQQ9
         IeEUE6wACXbh+//I9EOhEboxfZFjPkyk93nv8sDvEL/i0enJLcA3gxIP7mJod/m6WC5S
         E/E8sYXLNJGohVAH6ju43b4e1rbBHlmXihd3qCzlN/8R07qtnQOKJqhLwsvDd5wzKoig
         hNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693966204; x=1694571004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGpPqAvRxHlO49Def4EkEw3YsTe5pPmN/itzaU5IvZg=;
        b=Ryu0vuja8O5tGnhjHKgiArqqrsNMm5kn+uzCcRvXjxvma5T1cTAHqprpWSe5eJqUfs
         4BnqW9oHOutxNU5qnxDxnibjCAO6fT+de0HwIyXyr8uu+UBnYXqhiliv/lLIKEw/1C+I
         wmYmcl8sht3xEdGyAMLeVqDa00mN5eBhRfvT4WsEqk8hTODSowzMxlcmsAEOdGszIvuC
         lH0bJ4+IAmIhxW6UHywS7iSn/topSryQ9UIdcIEdOQcvnZxVU4pUZw2vrK2OM5hMLQQi
         PyYkgHGCk4e5MKfSGapnR+Xd7nqj85hPztX3HuoZgAaE8fhQAYQNZ5+3HNkkJhC4ijDQ
         amrA==
X-Gm-Message-State: AOJu0Yx6DIJIPFmDdSP+nsxxauJI6TxUJV1viZlnSIG/sJ3uTMB/5Fg9
	W738sOoeddv/0NcFfygwtkM=
X-Google-Smtp-Source: AGHT+IFHi8yS62mJScVTCGYXqkYmPO0vzOrPlYOFM6ccgBgCL/6i5bn5+f46O0/s+HcPNHrWgPjdeA==
X-Received: by 2002:a05:6a21:81a7:b0:14c:ee61:139a with SMTP id pd39-20020a056a2181a700b0014cee61139amr12186302pzb.27.1693966203870;
        Tue, 05 Sep 2023 19:10:03 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902748900b001c3267ae314sm6532575pll.156.2023.09.05.19.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 19:10:03 -0700 (PDT)
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
