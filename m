Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62778E69B
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 08:36:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CWTjrNai;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbrzh6HgHz3bYc
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 16:36:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CWTjrNai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbrzb573zz300g
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 16:36:41 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf1935f6c2so2810545ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693463799; x=1694068599; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kyvkupLew9Yd6VCA9XQC4cAMSTlDnrwdbWSR056bSo=;
        b=CWTjrNaiJfAfPKm2//tVCDIaVjOTet/DT1w350pcj2XQ5lWlFWutGCU+OkdTYTDH7T
         ENV2u6SAGu2jrODJ2KC8ixL+84ySrHFccan3FiG5BOWd8oM/jBNneGEJ7SnZPDYGYUUK
         9KQUPVt+RJQCmxAlzUU7Q14L2Pio4G4EgZcw5BTfdjjsZA/SsMz5A4YW1358Osx+nVzX
         D0r7OlzHRWKtSYf21uRRPRaI//5zLcBakcUiJzokg3SwF9nLrPrtxApze6tYb9zVce7e
         iS83eF20OYX1JAZTtmv8U7ulVbza7eHzBxiShoVUKSCPXFgsx35v2m49VbEt0MkAn6Px
         Ra3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693463799; x=1694068599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kyvkupLew9Yd6VCA9XQC4cAMSTlDnrwdbWSR056bSo=;
        b=PhRDoVQrkO7YiBkYXajP4YHMzdcAtK3nis/QIw98Cm5WPTV0U9hc26PYDlq6slMCbM
         nnBuf/ga7nxynxW1xkJ5swrP+WMk93b6BFcB+TxKgau/Mo0t2Obm5EDEAn1lFXEYcz4d
         ZVind+nxIYPh40cci9PgmGarBwB9NIpYdQ/jhw3iZaHgeznm4g48zfN+BjZX/92ckMHp
         9SkU6v+HfPRihhRYpnzuUM2a260n3cGC1UxDfGIPp9wqLbFaiOtrGbqEToUkKe/Sfyw1
         KWL+sfCKnksib7XWcOcZNEbSRcJteAx2ESvufWhecru5jAsS/IOnJsc9jtcZ5KVqZ7QE
         OZSw==
X-Gm-Message-State: AOJu0Yx1bfGtW4TXk50nZRrJ2KOjk8BFiPy6iQ55KKxBQjblWfhQrd9K
	uoDFtBTxRfyvJXt1ZO/rfRg=
X-Google-Smtp-Source: AGHT+IF/QcbvfmvsqDftpHC9Yc9k9k1Flp6pBjturyK95MU7VeorHlVJlOFx/tBxCTurN4IFl3DROQ==
X-Received: by 2002:a17:903:18a:b0:1b7:ca9c:4f5c with SMTP id z10-20020a170903018a00b001b7ca9c4f5cmr2147913plg.28.1693463799233;
        Wed, 30 Aug 2023 23:36:39 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902eb1300b001bf00317a49sm552633plb.104.2023.08.30.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:36:38 -0700 (PDT)
Message-ID: <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
Date: Thu, 31 Aug 2023 14:34:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
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
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
 <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
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


On 8/31/23 14:20, Krzysztof Kozlowski wrote:
> On 31/08/2023 07:50, Peter Yin wrote:
>> Add linux device tree entry related to
>> Minerva specific devices connected to BMC SoC.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>>   2 files changed, 378 insertions(+)
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
> Third or fourth time: that's not a correct order. This is a nit, but
> since you keep ignoring it, I don't believe any other feedback was
> applied. Why you did not respond to my comments but just ignored them?
Sorry, I don't notice this is different file.
>
> Best regards,
> Krzysztof
>
