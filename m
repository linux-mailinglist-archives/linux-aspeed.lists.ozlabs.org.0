Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C16326B1EBD
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 09:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXNGM27WFz3cNM
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 19:51:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H3Tihc36;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H3Tihc36;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXNGB3Ydrz3bby
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 19:51:45 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id ay14so3952201edb.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmFJIRnf7lhyyhe5HRvTIuznCSOkKRhfqAX4FxLgYRA=;
        b=H3Tihc36/HIhfTDJZ3dYkddDKuaeSLksPAwq/9dhmsndrEQs+ViDL3vRtWs1caWfTG
         PqErMfFzfAzUYvmx/R0UG5Xn4IjPuoIXs3VEOuWP9MbWdLEkjADF94GiK3DRWQZaCu3D
         Lu0sINGzMapoXRdCO5cFOP0Drf2O/fs7P1y8LKNl2+TDxULwPq5Sj0IkwM11njHbUNPo
         ES4lcicuDAqfhv2n/6sc9qISxcvvvo3wltjP3QgLIA61MpJtIrKu/TCGgVboU9K/pnKN
         04x+y81RewnWJg4qm8PpahDCqf0ZcdRi4kis+TNYYEGVpguzg/dgwFt7Lo3Sv4i851bL
         FGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmFJIRnf7lhyyhe5HRvTIuznCSOkKRhfqAX4FxLgYRA=;
        b=eLbN9VqMmKn0J+radwvptKbRtrR9NcZPOBNWXWKF4Av9CykY0LvRg9S0ZAmP94l/Sn
         dHUuGbjlDtU/DM18cDe74vDLKrVpptHSTosEBksP5R3ettJwzlS+PpRfIGizi4LIc5LG
         38D/yrouEhuAV/uyXOCQ98qq8llULfLdWdVbI2JQjiSGVoz9Q4umGI+GdmDt8Pg9OmeE
         yci3gKPqL/fG5/IrNbc2wJi/Vkxqq7sYyl6xxG4O/awD0DEfdNs2QHdTCsnmudPn/fO0
         O8vRn/VcFajf9HjYGU8oHwcu8XqgTSYfBy7QbbK2oSmP40UX87rLLHMJTF05YSAZmppi
         fG6Q==
X-Gm-Message-State: AO0yUKXYJo6TGDDs1YluJ+qFuf5+zY2YVh9BWed/VgBK2Q1DtudqQ9nM
	8z53OGmA3NEn7MyGawZzC6J8Kg==
X-Google-Smtp-Source: AK7set8P4LuLBe8BuDzP+8njsAdPqwic2GGX9ilJLhejchDRC2j40nO4EAjmm9ae6ixFJz/7FI/hKw==
X-Received: by 2002:a17:906:551:b0:8b1:7f87:8174 with SMTP id k17-20020a170906055100b008b17f878174mr20050787eja.65.1678351901284;
        Thu, 09 Mar 2023 00:51:41 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906504200b008f767c69421sm8573953ejk.44.2023.03.09.00.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:51:40 -0800 (PST)
Message-ID: <f17f09f9-ffd0-bd2b-7343-e468f83dd6e7@linaro.org>
Date: Thu, 9 Mar 2023 09:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
 <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
 <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
 <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 07/03/2023 11:09, Ryan Chen wrote:
>>>> 2. Why we do not have it for all controllers with SMBus v3? Why this
>>>> one is special?
>>>
>>> Not all bus is connected with smbus. Most are i2c device connected in board.
>>> That will be specific statement for each bus.
>>
>> That's not the answer to my question. Why other controllers which can be
>> connected to I2C or SMBus devices do not need this property?
> 
> For example following is the board specific connection.
> 
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> Bus#1 is mctp transfer for each BoardA/B. (Not smbus connected)
> Bus#2 is i2c device connected.
> Bus#3 is i2c device connected.

You are repeating the same stuff for my question. Where do you see on
this diagram here other I2C controller? How does it answer my question?
You keep repeating same and same, so it won't work.



Best regards,
Krzysztof

