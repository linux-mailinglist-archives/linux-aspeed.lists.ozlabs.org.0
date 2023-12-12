Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561780F731
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 20:50:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aKNRl8/b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqTjk496dz3c1w
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 06:50:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aKNRl8/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqTjb4gDkz2yQL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 06:50:10 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d9dc789f23so4135459a34.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 11:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702410605; x=1703015405; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+WmuBvNsZRD+aUZxutpdK+Wc4at557PwkYqBm9ImnNo=;
        b=aKNRl8/bs94mXzb37faNIp5iKP7EStZDZsqg5N36yKNHw+G/5yboltT3mG4v3/SJEd
         RL6ZQQk7UEYJWaH0L0QdFmiBkc5RBHh36lElOCmYlIiNtPftwKGusq2HgAqWPwFH8592
         rt6w8X4Z9a3RPkJIe6n1CPJpfvdVfM7lwk15S4H6VSpB80D0+FPK+gIOMUnVwY/W9BaQ
         YHNTWeUW8Ha1HYlgStX40mnUQy5IWMXUipskuOJHwZQRL2rI3AJvmxiRhoCi7eNlp+Fr
         m4vvu6y8vlhCoWWC0/L+TQzkaEWC+6RfCOzZzFmEn3ZJGXnGuHN3RBokXSaZMNpN7NRU
         PPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410605; x=1703015405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WmuBvNsZRD+aUZxutpdK+Wc4at557PwkYqBm9ImnNo=;
        b=h72ld/fqTM73nLmMZYtrhIJpCjjH6VNVUIy+/Z0QoWpctPrGXV/7TB2Jn88k3sUArs
         +pkeMf0BTDdsr7urkd27JmpPZ6ED4Zp5lR8kio/gYagvkTumHFaQFyl4ot7Smm3vPhNw
         fZ/3tpInDmKEwU0LAsJmmqTatXYirpj8eTqyWRmxFMq7EnZ64Fs5kNnKOO3jLYPhEWgL
         jU2+3d4yARt4EoFgjpP1X5dtFZSOFTeip5jJ7qsxDnlPfekRuTehP3p/TmcYtw3opvdf
         z/tUom5nSUalXANaVy1wqQ7+Kr6MRC2Vfwe33aJhBvm+XfIkAiE8NCxlOMI2AuB+j6Xh
         pR0g==
X-Gm-Message-State: AOJu0YzA4CcwKr4pONRan6TKvwxJnuTaY27c6P2eKDWUy+GLlDvi2loH
	XBf+pLf2foBLS5bgsKWSiOg=
X-Google-Smtp-Source: AGHT+IHxvw0Vut2QyDJrUC2ZE3myAntSoCtrfAiJtnB2NbnqgyxdEdjc1V2fTJZEufc66yWs6pg4mw==
X-Received: by 2002:a9d:6841:0:b0:6d9:f69a:392c with SMTP id c1-20020a9d6841000000b006d9f69a392cmr5894594oto.31.1702410605018;
        Tue, 12 Dec 2023 11:50:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m19-20020a0568301e7300b006b9cc67386fsm2367658otr.66.2023.12.12.11.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 11:50:03 -0800 (PST)
Message-ID: <2946fbb1-2a47-4d21-83dc-8e45bf6ba5a9@roeck-us.net>
Date: Tue, 12 Dec 2023 11:50:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
 <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
 <20231212-mouth-choice-40a83caa34ec@spud>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231212-mouth-choice-40a83caa34ec@spud>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/12/23 10:51, Conor Dooley wrote:
> On Tue, Dec 12, 2023 at 10:00:39AM -0800, Guenter Roeck wrote:
>> On Tue, Dec 12, 2023 at 05:15:51PM +0000, Conor Dooley wrote:
>>> On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
>>>> From: Joel Stanley <joel@jms.id.au>
>>>>
>>>> The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.
>>>>
>>>> https://www.nuvoton.com/products/cloud-computing/security/trusted-platform-module-tpm/
>>>>
>>>> Add a compatible string for it, and the generic compatible.
>>>>
>>>> OpenBMC-Staging-Count: 3
>>>
>>> Delete this from every patch that it appears from.
>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
>>>> Link: https://lore.kernel.org/r/20220928043957.2636877-4-joel@jms.id.au
>>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>>> ---
>>>>   drivers/char/tpm/tpm_tis_i2c.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
>>>> index a897402cc36a..9511c0d50185 100644
>>>> --- a/drivers/char/tpm/tpm_tis_i2c.c
>>>> +++ b/drivers/char/tpm/tpm_tis_i2c.c
>>>> @@ -383,6 +383,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
>>>>   #ifdef CONFIG_OF
>>>>   static const struct of_device_id of_tis_i2c_match[] = {
>>>>   	{ .compatible = "infineon,slb9673", },
>>>> +	{ .compatible = "nuvoton,npct75x", },
>>>> +	{ .compatible = "tcg,tpm-tis-i2c", },
>>>
>>> What's the point of the generic compatible if you are adding the device
>>> specific ones to the driver anyway?
>>>
>>
>> $ git grep infineon,slb9673
>> Documentation/devicetree/bindings/trivial-devices.yaml:          - infineon,slb9673
> 
> Hmm, this would then need to be moved into the new schema, out of
> trivial devices.
> 
>> drivers/char/tpm/tpm_tis_i2c.c: { .compatible = "infineon,slb9673", },
>> $ git grep nuvoton,npct75x
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>> $ git grep tcg,tpm-tis-i2c
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:             compatible = "tcg,tpm-tis-i2c";
> 
> pog, undocumented compatibles.
> 

Yes, I know, quite annoying. Though, to be fair, a generic "tcg,tpm-tis-i2c"
would make a lot of sense.

Note that Rob had rejected the original addition (into trivial devices)
with the argument that it is not a trivial device
(https://lore.kernel.org/lkml/20220605225610.GA3682221-robh@kernel.org/).

>> It looks like at least the generic entry is needed, given that it is quite
>> likely that there is hardware out there using it. Other than that, this
>> makes me wonder: Is there some official guideline describing if and when
>> to use (only) generic devicetree compatible entries and when specific ones
>> may / should / have to be used ? I suspect the answer to your question might
>> simply be "because we did not know better", and it might be helpful to be
>> able to say "please see XXX for details".
> 
> To me using generic compatibles is okay when there is another mechanism
> to identify the device. This patch would make more sense if the addition
> of nuvoton,npct75x was omitted and the dt-binding had
> 
> properties:
>    compatible:
>      items:
>        - enum:
>            - infineon,slb9673
>            - nuvoton,npct75x
>        - const: tcg,tpm-tis-i2c
> 
> And whenever new i2c tpms showed up the device specific compatible was
> added to the bindings and the driver had only* the generic compatible
> static const struct of_device_id of_tis_i2c_match[] = {
> 	{ .compatible = "infineon,slb9673", },
> 	{ .compatible = "tcg,tpm-tis-i2c", },
> };
> 
> * well, and the existing one since that cannot be removed.

That would be perfectly fine with me. All I personally care about is to get
"tcg,tpm-tis-i2c" added to the kernel source so I can start testing the
code in qemu.

Thanks,
Guenter

