Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBD7245C3
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 16:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbCQc5Tpgz3chl
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Jun 2023 00:24:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fjsh3FJu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fjsh3FJu;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbCQS6bYnz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Jun 2023 00:23:58 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-97668583210so612727966b.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686061435; x=1688653435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrVZ+SOBI/x4uatGRzhwg8fwXrewUsr2gOgY5H5Ft9g=;
        b=fjsh3FJuBj9U15nWQpVdEMJbpDHN4ljEkK9i2Vw7zwBuDx4W8rMjbHbsp9EmQtjyMn
         eJF3j78A6GgKT5UmL33X70+Hn7Vza2duvJhoTuMmw2WP9K0uDsTiDNGs9f79C6arQHPg
         9jVHZeruC6m8xpteMR0Dla+l2bhyabByCOIwilQYD4nT33q7Pbu31UeXpHuYVaaVGTBZ
         CC4NtSF+mfmdaB3EUVgPZWPkbVVb8i81qGDd4Gj//FwS3EtZ7pyGd9yqlQkcYI1T4rVB
         nGmGUBb9O5E9PZSf45Qkw5rPLiKqEavRcfFfNH7iu9n14Y5qV4u03o9Dy3NyKApuUmvb
         vduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061435; x=1688653435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrVZ+SOBI/x4uatGRzhwg8fwXrewUsr2gOgY5H5Ft9g=;
        b=lL1NgF4lfnesUT+uMNty/RLV+sIiXmC/AEd9Yostc5q9yIObekMnEuaCtvvnpg99Zv
         HePRpQos+Pi5Grq5Af1GgAWVbYc4FBMj+KiUyHABvynL3Ef1o06IOf8o/eMgrNGftpRN
         dklF5rL9DgrlIZXPIRIslJFqNPkjgs3RJGwR2HCPTE7Jzzx+u2dQTSe6xVe9K3D9w6jQ
         SxH8kWV6Ysj8g6Gdl08GeMf3mP3c1M3nNqkEbB7tW+y21c2NjQDVfBahNxGNzqs2RTGo
         /21GZSB5wxg5YKhceCcH1bo00UPK2174YcJ8Tp3UTvZ+Da7e2UokqK5Ky8vc2FxMqnni
         6hVw==
X-Gm-Message-State: AC+VfDxj0P8I2B0fSFR/EXk6xqlI/txghcmvZI8U+2dzm09O1Mzctlz0
	IqA4Ot1LLs7fFwKAAMD7AcPvzg==
X-Google-Smtp-Source: ACHHUZ4tNfkNmafis8UY8kYNaoiMX1MZKlLqdyE0bOdqVbjV255h69EPHklsSAMRYGIU1YtOe+jhjQ==
X-Received: by 2002:a17:907:2da9:b0:966:5730:c3fe with SMTP id gt41-20020a1709072da900b009665730c3femr2925794ejc.52.1686061435313;
        Tue, 06 Jun 2023 07:23:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qc16-20020a170906d8b000b00965d294e633sm5624319ejb.58.2023.06.06.07.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:23:54 -0700 (PDT)
Message-ID: <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
Date: Tue, 6 Jun 2023 16:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/06/2023 16:06, Patrick Williams wrote:
> On Tue, Jun 06, 2023 at 12:49:04PM +0200, Krzysztof Kozlowski wrote:
> 
> Hi Krzysztof,
> 
> Thank you for reviewing this from Billy.
> 
> The Aspeed chip is heavily used by the OpenBMC community and the 2600
> has been used in production systems for almost 2 years now.  Many
> companies are having to carry previous versions of these as patches, and
> some of the APIs changed since the last revision from Billy.  So, I had
> asked him to submit the latest patch set with as many revisions as he
> understood what to change, since the conversation seemed to have died
> since last time he submitted.  
> 
> I don't believe Billy is intentionally ignoring your feedback and he is
> motivated to get this patch set wrapped up into an acceptable state.
> 
>> On 06/06/2023 11:45, Billy Tsai wrote:
>  
>> NAK. You got here clear comment. You cannot have simple MFD with
>> resources. It is not simple anymore.
>>
> 
> In fairness, Billy asked for clarification from you on this point and didn't
> receive it.
> 
> https://lore.kernel.org/lkml/24DD1FEB-95F3-47BE-BE61-8B0E6FBDE20F@aspeedtech.com/

I gave the instruction what Billy should do:

https://lore.kernel.org/lkml/41500a04-b004-0e2c-20a1-3a3092b90e6d@linaro.org/

What about other ignored comments? About subject, quotes and more? Even
if this one was unclear, then why ignoring all the rest?

> 
> He felt what he was trying to accomplish met the documented
> expectations.  Are there some changes that need to be done in mfd.txt to
> further clarify when to use it and when not to?

I think mfd.txt clearly states:
"For more complex devices, when the nexus driver has to
probe registers to figure out what child devices exist etc, this should
not be used. In the latter case the child devices will be determined by
the operating system."

Also, repeated many times:
https://lore.kernel.org/all/YXhINE00HG6hbQI4@robh.at.kernel.org/
https://lore.kernel.org/all/20220701000959.GA3588170-robh@kernel.org/
https://osseu2022.sched.com/event/15z0W

Best regards,
Krzysztof

