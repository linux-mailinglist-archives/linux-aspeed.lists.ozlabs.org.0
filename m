Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07EC5F7801
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 14:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkSTm1Cgtz3cfN
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Oct 2022 23:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J/L2XrvR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J/L2XrvR;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkSTc69dhz304J
	for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Oct 2022 23:36:01 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id d6so7068283lfs.10
        for <linux-aspeed@lists.ozlabs.org>; Fri, 07 Oct 2022 05:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kw1mlKfiYXBJ9mmRKbWY2DRmP8o8zRpFSKtNK4NGUuk=;
        b=J/L2XrvRp32JFzkNCyWAtuEfTHeV6kM5NVRlUHMz8dXoxWurEDRPKBdAJT3qR1iVdi
         O4LcuBGecOIdXWrgVoQmS50Metkhrwjb/8332hmqC5taYrQfuyeN/jpm565MJT0O7Jwz
         LC+4CA40nRRT/zOOMyLapIQVuQrYmbzsJPM5otjUL36cyDk6rJiZ4ub93d8IsQtssoZ0
         r9X9doIF1on4JGETJi/eRD2nI0C7TC8ggVzoYrN8LQUaa4ib3j5EhCnwcn0wF3lmyE4u
         Lww4u8dxnsM0SG1eovk/LVQF0hMc5fWitcfow0KWVbUhH54mMg0N5bCcBT2mw8uQMo+Q
         4Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kw1mlKfiYXBJ9mmRKbWY2DRmP8o8zRpFSKtNK4NGUuk=;
        b=O8/7CfpnLo55N9Wx0mGIOFINqrlrPkQ0GObzUQWQiVnxPpBSrBqwceZS65McRW9WKT
         PoTZ+zH3kR4p4RpKuvhD/LnYnSHE6ILQ1G+QycPdTqbimNH+cQw7q3KU3TncIFJuVqWR
         BywUIKlaG3pWrpSsOTs7JxSWxfjBI7ixX3o3x7tvjJDqkrvQSK6VKdnDdynlGDvqxmP2
         fz4mBsAq5CE+DdYLTVDQPzdr85HoMGnWJKcF6ApUPnqbMa14wQ3dh1FvAG9zUxmjtibU
         K7+JbNXKhV1cHorP/h5Pw0LNcqoKqsjGsNMu9rCJ6WfFXCequKKgqgOWcTd3tulraiZ4
         KGnA==
X-Gm-Message-State: ACrzQf3vP59/wBSpsU3PKcveM3l9bfRVL5r6uF43QVKVNrHgSPqr1PTH
	Bi7s0X+9uJXplaAFGFFXxBjg6A==
X-Google-Smtp-Source: AMsMyM56XK8sOb6T02cjy+yqjmC6ShdnQbLa8DY5Ld0odljIMDa/SdwrHLFsbEDyjxBvbK7eoy4R5w==
X-Received: by 2002:ac2:4465:0:b0:4a2:7c09:15de with SMTP id y5-20020ac24465000000b004a27c0915demr1945274lfl.117.1665146155734;
        Fri, 07 Oct 2022 05:35:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c7-20020a056512324700b0048a9e899693sm290979lfr.16.2022.10.07.05.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:35:54 -0700 (PDT)
Message-ID: <6ac254ba-2eb2-550e-0e02-1e4c1a09bc81@linaro.org>
Date: Fri, 7 Oct 2022 14:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "krzysztof.kozlowski@linaro.or" <krzysztof.kozlowski@linaro.or>
References: <20221007055008.3468691-1-Delphine_CC_Chiu@Wiwynn.com>
 <398470cd-7f2c-28eb-fc13-54ae5d5bc256@linaro.org>
 <HKAPR04MB40186502618E77D9B43FD740835F9@HKAPR04MB4018.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HKAPR04MB40186502618E77D9B43FD740835F9@HKAPR04MB4018.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>, "garnermic@fb.com" <garnermic@fb.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/10/2022 11:31, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> Subject: Re: [PATCH v2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
>>
>>   Security Reminder: Please be aware that this email is sent by an external
>> sender.
>>
>> On 07/10/2022 07:50, Delphine CC Chiu wrote:
>>> Document the new compatibles used on Facebook Greatlakes
>>>
>>> ---
>>> --- v2 - Add binding document
>>> ---
>>> --- v1 - Initial draft
>>
>> ????
>>
>> That's not how patches are sent... About this I commented and you ignored.
>>
>> This patch was a part of a patchset, so don't send it separately.
>>
>> The subject is now corrupted - entirely wrong.
> 
> Could you please guide us to contribute?
> [PATCH v4 1/2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
> --> This is for binding document.
> [PATCH v4 2/2] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
> --> This is for greatlakes DTS.

The entire guide is already there:

https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/submitting-patches.rst

https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/4.Coding.rst
https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/5.Posting.rst
https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/6.Followthrough.rst
https://elixir.bootlin.com/linux/v5.19.14/source/Documentation/process/7.AdvancedTopics.rst

The patches are grouped together correctly, but still have wrong subjects.

Changelog is done like this:

https://lore.kernel.org/all/20220519073330.7187-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

