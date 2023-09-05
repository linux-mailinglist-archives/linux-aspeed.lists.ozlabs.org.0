Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48D7921B7
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 11:57:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UGK3eSL/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg1CN1k57z301V
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 19:57:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UGK3eSL/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg1CD4JDRz2yPG
	for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Sep 2023 19:57:42 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a42d06d02so1394753b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Sep 2023 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693907859; x=1694512659; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MXWXFgX5aFPhZ6qllDXEBQgIeC6Jxy5NEVmVqVP4Hs=;
        b=UGK3eSL/QIrz4gwQtQMgDAUyMc1bHLvWODbbrz2owUYoj0LpEahREfVCtDZRcW1Xru
         q7gMN4qeqOqEZL1pjvWMBYffHBjGzF9OYADv/2tu6eKt9iu0R4LDx4kQtrmZKdaTqxkj
         goeQip2ZCeHdwSker4VitOGExEjItF7jXkrqHhpK+MNF9owd/ECZGX0NBOkO0Bl0ukkw
         7aZg5A/zUqyfcEScSmsgI1n7TWH9h8y9RwSNwN7jV/ohTxieYMrO2Dg7fGByv4LodQKz
         +ju+rjdHEacGmxTYsMDibS1kOp6NCPwJi910Yfk0A1zre9aWrz2XteweIXKNbw63+lM9
         AWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693907859; x=1694512659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MXWXFgX5aFPhZ6qllDXEBQgIeC6Jxy5NEVmVqVP4Hs=;
        b=O6NVg3uVPvGwclQshwLC9as13D7sN0MHqOaAFF9yU2aawG90j5UPCE8LhL1xcsHIlJ
         30mFQWO+kGzYlBW4X3IeR7HUqw4/WZVCeaSS0AsLyyUPgnZt7pPj2zZZFD+C7tZJmP3L
         Cnk1tPGP8HslqMXmbfxbF+N6vYo0A0gdZoCQ+kDtwMuSnECJCmnuR/YcrJzCc4HdWHmy
         WsWmNktkHWaYk/Oc03v4i3evG8lgiCrnIfvtST3mqXhKf9pktpTwSb3/ZKYjAHRCBnM1
         OmD/IKX7ixRf1iHIot2++rCl0BK2vNnTjbjxT5qEdKuabs64uDMFlG+CAJ4DeuLZJZgx
         vnyg==
X-Gm-Message-State: AOJu0Yw7xn3N0pXyE+DHENKEIgLwMCNMhptGs238wHEjZB961+REVr6J
	3hXfFf0Dag20UH7+u+eAEyY=
X-Google-Smtp-Source: AGHT+IG9oGAsnYDLZhL+LakWC4U811CoL+trnqHsY45OMKtbt/MUxwWcgiOmJozHaNgB60WIAUpsRQ==
X-Received: by 2002:a05:6a20:748d:b0:13b:9e04:5466 with SMTP id p13-20020a056a20748d00b0013b9e045466mr12415184pzd.49.1693907859389;
        Tue, 05 Sep 2023 02:57:39 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0064d57ecaa1dsm8710981pfn.28.2023.09.05.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 02:57:39 -0700 (PDT)
Message-ID: <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
Date: Tue, 5 Sep 2023 17:55:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
 <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 8/30/23 17:44, Krzysztof Kozlowski wrote:
> On 30/08/2023 11:02, peteryin wrote:
>> Add linux device tree entry related to
>> Minerva specific devices connected to BMC SoC.
>>
>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> To clarify: your full name or known identity is "peteryin"?
>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>   2 files changed, 386 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 9e1d7bf3cff6..edb0b2105333 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-facebook-wedge400.dtb \
>>   	aspeed-bmc-facebook-yamp.dtb \
>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>> +	aspeed-bmc-facebook-minerva.dtb \
> Nothing improved here.
>
>>   	aspeed-bmc-ibm-bonnell.dtb \
>>   	aspeed-bmc-ibm-everest.dtb \
>>   	aspeed-bmc-ibm-rainier.dtb \
>
>> +	"","","","","","","","",
>> +	/*O0-O3 line 224-231*/
>> +	"","","","","","","","",
>> +	/*O4-O7 line 232-239*/
>> +	"","","","","","","","",
>> +	/*P0-P3 line 240-247*/
>> +	"","","","","","","","",
>> +	/*P4-P7 line 248-255*/
>> +	"","","","","","","","";
>> +};
>> +
> Nor here.
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
Could you please clarify for me?

Are you asking if the last line should not have a blank line, or I can't 
set a comment for the sgpio line like this:

/*P4-P7 line 248-255*/

> Thank you.
>
> Best regards,
> Krzysztof
>
