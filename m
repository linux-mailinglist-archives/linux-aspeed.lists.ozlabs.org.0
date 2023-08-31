Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7578E6B7
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 08:45:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C/tPe8Fe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbs9W08Jqz3bYc
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Aug 2023 16:45:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C/tPe8Fe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbs9M27yLz303d
	for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 16:45:08 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bcc0adab4so45967266b.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693464302; x=1694069102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dWDS9dtVikyI/W6YgtSMrS78Am1qgdN+VctPtJJV0I=;
        b=C/tPe8Fe1lIjOFJPJPduJZ0t7kzq8w0v1XHCuN3Um8XFHpQpb2EVnyT02witgcZ8sM
         JFN8lfG/aX9sG6mrcgxdbbKQp4TDQoFHE0Tmk1VG8MvWkqEzZnC9Mst27PvNm6uulOBd
         yaHoVIXYmVtiw8yxDqnmegazyJVpuONKR/zwdQSFF9Z8HutGqtFbURBgi/QZoWaRkuWo
         Ce0riY0J4rGHJz5s1ANc6S7c93Icj3ulyJUCMpbUhYOQQ0/737w402W8IyRMcAF5rzde
         hTimoCy+MDHVm59vCU0ShXOM8yHRJbQroLcHsv0vLdS31AZKEFIrOZk2KKdmRHyIkeML
         mu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693464302; x=1694069102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dWDS9dtVikyI/W6YgtSMrS78Am1qgdN+VctPtJJV0I=;
        b=DqSJmbmmggqlWQRgiF5V3G9GHTVmt1dG8kiTWQpWF7JOG1TrHJLdvKyPsgxjWMqKlb
         3JXqekdeecrMD7NhTQ0geu7I1HOxaeufwy08pmMjSbNYn8/zwUMih38av/62MUKrcaD1
         Xe6Yj76sAQ41Bc+uBPnGvevCE/qJzZVd8dR3w5Q9qQebbWz+pM933UtrsbzkKTzFgJn9
         gG2+0vXRvqfcC6yLQGCBTRvZayQsXa3UytAGm49m8UOFB+b8lEk/epqx6K61D41Bs79f
         qjMmTCsf/MpJ8Wo3w9XnuO+6aATtDjZ3z7WWBsFN1t1FGTT/F+f02JeZvztowakMJbBG
         PBiQ==
X-Gm-Message-State: AOJu0Yzy3abJjHjjsxE/LzFRfcAVKCt9xZ57XybYjkd5Eyx5+HZRkdb6
	HnrsF3QeefI+qAKc4EWkscbhyA==
X-Google-Smtp-Source: AGHT+IG8ER1DZkwLkS8ltwacGdYzwYVFueweMXPTg7CdldbbujGszPJH8OBoJS3YdZo+OIGoPR3GsQ==
X-Received: by 2002:a17:906:318a:b0:9a5:8afe:8c5d with SMTP id 10-20020a170906318a00b009a58afe8c5dmr2942537ejy.16.1693464301690;
        Wed, 30 Aug 2023 23:45:01 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a3-20020a17090680c300b009a19fa8d2e9sm383452ejx.206.2023.08.30.23.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:45:01 -0700 (PDT)
Message-ID: <9c23d906-bba3-533e-ac31-3bad4fa46d64@linaro.org>
Date: Thu, 31 Aug 2023 08:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
To: PeterYin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
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
 <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 31/08/2023 08:34, PeterYin wrote:
> 
> On 8/31/23 14:20, Krzysztof Kozlowski wrote:
>> On 31/08/2023 07:50, Peter Yin wrote:
>>> Add linux device tree entry related to
>>> Minerva specific devices connected to BMC SoC.
>>>
>>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>>>   2 files changed, 378 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 9e1d7bf3cff6..edb0b2105333 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>   	aspeed-bmc-facebook-wedge400.dtb \
>>>   	aspeed-bmc-facebook-yamp.dtb \
>>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>>> +	aspeed-bmc-facebook-minerva.dtb \
>> Third or fourth time: that's not a correct order. This is a nit, but
>> since you keep ignoring it, I don't believe any other feedback was
>> applied. Why you did not respond to my comments but just ignored them?
> Sorry, I don't notice this is different file.

You just skipped that comment and did not respond to it in your last
private reply... Just like in previous versions. Go through all the
comments from previous versions, not few.

Best regards,
Krzysztof

