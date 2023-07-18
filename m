Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E5757495
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 08:45:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwDTdBvU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4qGV4jrhz30MJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 16:45:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwDTdBvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4qGM4bMzz2yt6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 16:45:45 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-579de633419so48902737b3.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689662740; x=1692254740;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYEnSjRbogv2a232Wt5RDLOlCRVr+Svj4aNxG7iOabY=;
        b=IwDTdBvUotAJ6wdv/OTm3JQdIY4yNNG35zChngIg4ZCkWq3ozLCPEKIqlFaTDkZbr1
         edULVY3jQJBOdNogAVNd42ziCBu2FBs7guV7ybZCBRmNAZnCJNWGyj9wLn8iGpjb6jGd
         jSoskA24vJCXlOcQaLKeEnfFcRJA4kOEJOU9phJ76DbVHq05wPszB6XpT7Bsc8HfB7yf
         LMl3bFu8B2PrqGL/AX1Fcm9Se39pv4pGqcGqAeEYzMeXtz2dbf6Ac/TF0BouVw7qF/YA
         T8h6XcZLy5OYYoj4Xwd3xTxtnxFFdwzS7f4TPFl+ibSxfkM68iFl+O9/SdsfBLG8a+F/
         Womg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662740; x=1692254740;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYEnSjRbogv2a232Wt5RDLOlCRVr+Svj4aNxG7iOabY=;
        b=H8txM5StCKCAG/tcwFBPBd4F7+7usiVMAO5Vv0f+QS3o4sSCroCcbg9bLucYx8DNnL
         uYASdb+PWIQOcAlOKpwdp3/3wcDoOKz5oWFpjblbhC6qpDRS7UEsGvwAI98ZyPVyIMca
         1HKUDsODFa8XrydbdKZSwcWzGGw32xKJH6odvp1sUaCiT87dRLHqXFhhVkiWWGoRn/LO
         6i74LnE5W3W23lZVIuvbFsoSTcav+ZMBcFSWsat+z1wHkxpW5eQpKX+DbMgjWuWWJUKG
         q71ykSen0E8oNrz+OjSmrqjaLVNCNzbx8dubykkU0gbcaPY87mH8I9UMNeHYHEyJGZX2
         kVZw==
X-Gm-Message-State: ABy/qLbL5hyV00tJzRnaCwZWYUVELWhLdROxLdnmQQUN7wj7lipwGB/Z
	6LFeApEaSTQRi9wL0Z6g9Dg=
X-Google-Smtp-Source: APBJJlEVFHpC4q1Ty43rQaP0AAaXKieldjAQFSqMe0k3ca6qKhRfDgD7Hdc09UiTORQI8lPRk4A5gg==
X-Received: by 2002:a81:8343:0:b0:573:9e0a:b8bf with SMTP id t64-20020a818343000000b005739e0ab8bfmr12214681ywf.9.1689662740452;
        Mon, 17 Jul 2023 23:45:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u187-20020a8184c4000000b00577357201e2sm306905ywf.14.2023.07.17.23.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:45:39 -0700 (PDT)
Message-ID: <28de46d5-bf6a-da0c-ad24-5404ad416b3a@roeck-us.net>
Date: Mon, 17 Jul 2023 23:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
 <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
 <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
 <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
 <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
 <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
 <CAGUgbhDmXnyxYCL9h9C0P4ByDSTstWnGqW=uFoDVVHeK3BerHA@mail.gmail.com>
 <3756dffd-1407-d656-485a-9cf1eefd9ae1@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
In-Reply-To: <3756dffd-1407-d656-485a-9cf1eefd9ae1@linaro.org>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/17/23 23:04, Krzysztof Kozlowski wrote:

[ ... ]

>> The first method involves passing the memory region from an MFD
>> driver, which was the
> 
> I have no clue how can you pass memory region
> (Documentation/devicetree/bindings/reserved-memory/) from MFD and why
> does it make sense here.
> 

It is quite common for mfd drivers to pass regmap information to
child drivers. Child drivers typically call dev_get_regmap() with
the parent device as parameter. Granted, that is typically used
for spi or i2c devices, but I don't see why it would not work
here as well.

Then there s syscon, but I don't know if that works with overlapping
memory regions.

Guenter

