Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF97923E1
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 17:21:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=C7EVR/ml;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg8Ns08zjz3c1L
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 01:21:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=C7EVR/ml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg8Nj3sYWz30Bg
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 01:21:23 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-56f84de64b9so1665456a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 05 Sep 2023 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693927278; x=1694532078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl1B7J0NnXr4SILiYpt6+iuxshEs/q2lTGYJqQ90wVE=;
        b=C7EVR/mlwNQSkNK9f67xfYK2MnbJ82OiRraSkIEdanPTiRJ0rpAQs4sphBAVoImTK/
         hHBJPj+1lYFgrhAHDtlcQ6ACcpjNmzw1F69FJsg/hSVM+F1tyBk6U4jW5KzkGNqGWgMP
         Kv5CFO866jUwsPrbSpqb2BsQYzfjHTp7vIs6o0BKYfktd8WrI30S8bn4mC9koTr0wtnp
         cDWKXAHkILkz1uAUramxpIEFgFf5OHMq1+E7EAXQ3AQI/4o88Jrh4vDunzpmYaz84fdH
         YTHj5APuxiW01ZYBrt40tMp7LB8fGyKrZ5UTxcTN8Feqt7P/2yMvE3BgImTSTxnMoGfa
         5j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693927278; x=1694532078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl1B7J0NnXr4SILiYpt6+iuxshEs/q2lTGYJqQ90wVE=;
        b=In2CAnRNqC61thyAwoMfEjuodK3WPSXIbmwklnDYN7hUOUBWx8ptGD6u0RD3btrudp
         l/iQKowQSPMxJHI8Pb0ScHSmGkUcTaQmJA69ufcacEdSt+VR7UevcDcsEiRv8qSFd/L/
         ZTCCFER2Oo9kUDbQle1e0bhThqviAtOxf8Z4lenCrCguLerX/+CBSIOi6l9srqhL1eMh
         3fM/yvOVbU2lQ/o2s/Njy3mX913SofxZ1UuqvshMvs0Bz8IlcX8baVjqxkk1FkRrHVk1
         yz/x5tOmzX6bLYhqmn6/ChdCTweuINb2lC41u5HgQ78GKfrwoRBZHhTeCspFphsJqfMu
         07kA==
X-Gm-Message-State: AOJu0Yy4b/5wY8qiQNqVAAFoXKW02M1280/U1/LP5OBdf6QUfktxmNU1
	xErkCv31GNZKhD0GnIEdRq8=
X-Google-Smtp-Source: AGHT+IHX/TdJ+yKBQpB3iWV5gCGpHJhkVqqjhuGJUNPhKasBAK7ZbJ2f9CazW+5woOqUfHNU7tih/w==
X-Received: by 2002:a17:90a:ff05:b0:26f:6f2a:a11 with SMTP id ce5-20020a17090aff0500b0026f6f2a0a11mr17587394pjb.12.1693927278451;
        Tue, 05 Sep 2023 08:21:18 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902788e00b001bc930d4517sm9506745pll.42.2023.09.05.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 08:21:18 -0700 (PDT)
Message-ID: <0a7755e4-1d6a-1f35-6826-cd54b46f0fea@gmail.com>
Date: Tue, 5 Sep 2023 23:19:04 +0800
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
 <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
 <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 9/5/23 18:38, Krzysztof Kozlowski wrote:
> On 05/09/2023 11:55, PeterYin wrote:
>> On 8/30/23 17:44, Krzysztof Kozlowski wrote:
>>> On 30/08/2023 11:02, peteryin wrote:
>>>> Add linux device tree entry related to
>>>> Minerva specific devices connected to BMC SoC.
>>>>
>>>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
>>> To clarify: your full name or known identity is "peteryin"?
>>>
>>>> ---
>>>>    arch/arm/boot/dts/Makefile                    |   1 +
>>>>    .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>>>    2 files changed, 386 insertions(+)
>>>>    create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>>>
>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>> index 9e1d7bf3cff6..edb0b2105333 100644
>>>> --- a/arch/arm/boot/dts/Makefile
>>>> +++ b/arch/arm/boot/dts/Makefile
>>>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>>    	aspeed-bmc-facebook-wedge400.dtb \
>>>>    	aspeed-bmc-facebook-yamp.dtb \
>>>>    	aspeed-bmc-facebook-yosemitev2.dtb \
>>>> +	aspeed-bmc-facebook-minerva.dtb \
>>> Nothing improved here.
>>>
>>>>    	aspeed-bmc-ibm-bonnell.dtb \
>>>>    	aspeed-bmc-ibm-everest.dtb \
>>>>    	aspeed-bmc-ibm-rainier.dtb \
>>>> +	"","","","","","","","",
>>>> +	/*O0-O3 line 224-231*/
>>>> +	"","","","","","","","",
>>>> +	/*O4-O7 line 232-239*/
>>>> +	"","","","","","","","",
>>>> +	/*P0-P3 line 240-247*/
>>>> +	"","","","","","","","",
>>>> +	/*P4-P7 line 248-255*/
>>>> +	"","","","","","","","";
>>>> +};
>>>> +
>>> Nor here.
>>>
>>> This is a friendly reminder during the review process.
>>>
>>> It seems my previous comments were not fully addressed. Maybe my
>>> feedback got lost between the quotes, maybe you just forgot to apply it.
>>> Please go back to the previous discussion and either implement all
>>> requested changes or keep discussing them.
>>>
>> Could you please clarify for me?
>>
>> Are you asking if the last line should not have a blank line, or I can't
>> set a comment for the sgpio line like this:
> 6 or 7 versions ago I said:
> "Still redundant blank line."
> so it is about stray blank line.
>
> https://lore.kernel.org/all/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/

Thanks for your reply.

Do you mean that I should make corrections starting from this point in my 7?

from

&i2c15 {
 >-------status = "okay";
--blank line
 >-------// SCM FRU

to

&i2c15 {
 >-------status = "okay";
 >-------// SCM FRU


or I can't  add blank line before comment

from

+    "","","","","","","","",
+    /*O0-O3 line 224-231*/
+    "","","","","","","","",
+    /*O4-O7 line 232-239*/
+    "","","","","","","","",
+    /*P0-P3 line 240-247*/
+    "","","","","","","","",
+    /*P4-P7 line 248-255*/
+    "","","","","","","","";
+};

to

+    "","","","","","","","",
/*O0-O3 line 224-231*/
+    "","","","","","","","",
/*O4-O7 line 232-239*/
+    "","","","","","","","",
/*P0-P3 line 240-247*/
+    "","","","","","","","",
/*P4-P7 line 248-255*/
+    "","","","","","","","";
+};

If not, could you please provide guidance on the expected format?

Thanks.

> Best regards,
> Krzysztof
>
