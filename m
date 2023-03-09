Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31676B72DE
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsCv4L5fz3c6C
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eWWTMALy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eWWTMALy;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXVJ20cddz3cK6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 00:23:44 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id v16so1899543wrn.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=942wM/IK6k2Dwoory8Emo2hV8DfdYZAPSidgTQCm4wE=;
        b=eWWTMALy4suZwwDa3CiPTxX7jS/owgLuoKidvA9g84R007ZHPpLoeelFVkKnUXEzIY
         M6ivS8IEM6uWqlaJutzY/qUpGFe82x2hS1PdsPyZUY4Kl4nP3Eu+XJrGyE9Dd3x5rCpH
         tRZmy5QphrtFmIp3ptFVTP0L7YK3aV2JoOTltx+WNkyUvjuSuJoAnPo7dx3YklYklx/M
         vGsit44Dck8nGkC7Hodvy5sCsWto77EIfqWVRIYoouoC409jI9RaVJ+Xf+d//zz/0xQ8
         kaIzZG2TdU77sqyoYMfvy0bENAN/Khv+F51VeVFQ/5dDUh0XC7LhyIL4IBuEHfyIIlkS
         xFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=942wM/IK6k2Dwoory8Emo2hV8DfdYZAPSidgTQCm4wE=;
        b=BPN037S2ig2bQaT0TI+KJ07QKW7wq/X6Q5T78Dyo5IJ7g2XYb9ZZC0Uwa9SDWU79/e
         U0JUmmCyH6aVZ82BKKz8hA2RUNpfl7DMqf0I+3U6zlcB2JTZKQWQfpKJh87wamlSJmoI
         u1Mrcf6p/izLolrwQGSMK+tSL1TP4j0NGrxYRPkcZA1qxZNJ7FaAXiyB0vv4LMCGHKmW
         wwqjUCFYtwtUDHHuOyyfwXJEyFTgHwC27FisFqpuaaiu5Gv2jAmPNlwUHNI5EOh9so4M
         ngt9Tmms7OHrdQmf7SZvGANZzmtz4uWjz4t1u3LDzQXP7LDlZWImvAlK1zf8qt0y+OJ/
         sUDA==
X-Gm-Message-State: AO0yUKUrMVg1vW99lYoRmKqchrHhNeGsDEBAUCnSzkdUUNzHGX+H2dmt
	OqPs/YFOiQzHdt2eobnLZrY4kg==
X-Google-Smtp-Source: AK7set8xbxd+8x3ZEeltB8xt0Oebfe4Cq+8VixRnocCt+sKbry4JqRFsPtCl27Prilh6ChdbwMDTYA==
X-Received: by 2002:adf:df8b:0:b0:2c7:bfe:4f60 with SMTP id z11-20020adfdf8b000000b002c70bfe4f60mr15866271wrl.15.1678368218505;
        Thu, 09 Mar 2023 05:23:38 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002c55ec7f661sm18036958wrx.5.2023.03.09.05.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 05:23:38 -0800 (PST)
Message-ID: <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
Date: Thu, 9 Mar 2023 15:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <03a9f117316ab81f1b5a18100f771e65@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 20:42:54 +1100
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, Sergiu.Moga@microchip.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, avifishman70@gmail.com, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com, Pratyush Yadav 
 <pratyush@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 09.03.2023 14:35, Michael Walle wrote:
> Am 2023-03-09 13:09, schrieb Tudor Ambarus:
>> On 3/9/23 10:56, Michael Walle wrote:
>>> Am 2023-03-09 11:42, schrieb Tudor Ambarus:
>>>> On 09.03.2023 10:38, Michael Walle wrote:
>>>>>> In an ideal world, where both the controller and the device talk 
>>>>>> about
>>>>>> dummy number of cycles, I would agree with you, buswidth and dtr 
>>>>>> should
>>>>>> not be relevant for the number of dummy cycles. But it seems that 
>>>>>> there
>>>>>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c,
>>>>>> spi-mxic.c)
>>>>>> that support buswidths > 1 and work only with dummy nbytes, they are
>>>>>> not
>>>>>> capable of specifying a smaller granularity (ncycles). Thus the older
>>>>>> controllers would have to convert the dummy ncycles to dummy nbytes.
>>>>>> Since mixed transfer modes are a thing (see jesd251, it talks about
>>>>>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>>>>>> transfer mode (D) for a command, the controller would have to 
>>>>>> guess the
>>>>>> buswidth and dtr of the dummy. Shall they replicate the buswidth and
>>>>>> dtr
>>>>>> of the address or of the data? There's no rule for that.
>>>>>
>>>>> But in the end that doesn't matter because they are just dummy clock
>>>>> cycles and the mode will only affect the data/address/command.
>>>>> Therefore,
>>>>> the controller is free to choose the mode that suits it best.
>>>>>  > But that begs the question, is ncycles in regard to DTR or SDR?
>>>>> That is,
>>>>> are you counting just one type of edges or both the falling and rising
>>>>> edges. The smallest granularity would be ncycles in regard of DTR. To
>>>>> me,
>>>>> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we 
>>>>> choose
>>>>> the smallest granularty in spi-mem to be future proof and maybe 
>>>>> provide
>>>>> some spi-mem helper to help setting the cycles for SDR/DTR. As an
>>>>> example,
>>>>> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
>>>>>
>>>>
>>>> No, we can't invent our own measuring units. We have cycles and half
>>>> cycles (regardless of the transfer mode used (STR, DTR)).
>>>
>>> That is basically what I was saying, just using the correct term.
>>> Ok. So we don't need the dtr property, right? I'm still not sure,
>>
>> We do.
>>
>> As of now you can't specify 20 dummy cycles for READID in 8D-8D-8D mode
>> because all the layers treats dummy as bytes, whereas they should treat
>> it as cycles. One dummy byte in 8D-8D-8D means 16 dummy cycles. 20 dummy
>> cycles in 8D-8D-8D means one byte and a quarter? This is a non-sense.
> 
> Agreed.
> 
>> As the code is now, SPI NAND uses dummy cycles that are multiple of 8.
>> SPI NOR requires a variable number of dummy cycles, there's no
>> restrictions. In SPI NOR we get from SFDP or datasheets the number of
>> dummy cycles, and in the code we convert them to dummy nbytes. Then when
>> we get at the controller side, the majority of the controllers undo the
>> operation, they take the dummy nbytes and convert them to dummy ncycles.
>> Isn't better to use dummy ncycles from the beginning?
> 
> Yes, but now we should define what *one* cycle is. And that it is defined
> regardless of the mode, because the mode only affects the IO lines. But
> a clock cycle refers to the clock line. [coming back to here] And as you
> said one cycle is one full clock cycle, it is also independent of the dtr
> setting.
> 
>> The controllers that can talk in dummy ncycles don't need the
>> dummy.{buswidth, dtr} fields.
>>
>> The controllers that can't talk in dummy cycles, but only on a "byte"
>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not have
>> the buswidth and dtr info, it can't convert the dummy ncycles to nbytes.
>> If he knows only that buswidth is 8, it will convert ncycles to 4 bytes.
>> If dtr is also specified it converts ncycles to 2 bytes.
> 
> No they don't need it. Lets take your semper flash and assume it needs
> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the mode
> or dtr setting*. The controller then knows we need 12 clock cycles. It has
> then to figure out how that can be achieved. E.g. if it can only do the
> "old" byte programming and is in quad mode, good for it. It will send 6
> dummy bytes, which will result in 12 dummy clock cycles, because 1 byte
> takes two clock cycles in quad SDR mode. If its in octal mode, send 12
> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
> single bit mode, because it cannot send 1.5 bytes..
> 

You miss the fact that you can have 1-1-4. What buswidth do you use for 
dummy, the address buswidth or the data buswidth?

What happens if crazy protocols like 1S-1S-8D appear? What buswidth and 
transfer mode are you going to use for dummy?

And please don't tell me that "we're going to assume that dummy.buswidth 
= address.buswidth because that's what we currently do in SPI NOR", 
because I'm not convinced that the assumption is correct.

> If it's freely programmable, it will just tell the hardware to insert
> 12 dummy clock cycles.
> 
>>> what the semper nano flash uses. Half cycles? But according to your
>>
>> there's no spimem flash code that use half cycles for now.
> 
> Ahh, I just saw the semper flash doesn't support DTR at all. Ok then,
> makes things even simpler.
> 
>>> naming you'd specify full cylces?
>>
>> A clock period, yes.
> 
> Ok.
> 
> -michael
