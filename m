Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3896B72D6
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:42:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsCP4ybtz3cML
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:42:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q89OEdbd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q89OEdbd;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWmc13nYgz2ygG
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 20:05:03 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so742435wms.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 01:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678266299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kA8QaXHaQv2zTvTrF1F5tUB/9uaPE/un/rBzeew06Qk=;
        b=q89OEdbdQ8/5wEe6qFgIWzh3vd6s4xaRgf89QS/3X4cOBtJctnoIMQxxEkA1D1BiHI
         0rPMGxYv1A8HM3xCu5rwnUu1Ej1pGr2yhOovW1vpKhfjmrhnTXnSrnkTPEb2jQaLNjCu
         gjPvDpbonBmkmrER6l1D5vxT9FfWi6H61jHjcQqvRP49uhXANQfBL/nTJmVo9mW1K9+n
         yBrlg1+msaFsX+hZi1yQGq1ALarkY7lxAgSKSy51rXIuUTDYzdRIQ4Td+1aCJOW/HPYu
         E7T1Lo6gbBZA2NMhBQNGnjngG9/h7JB3LioUT5eLeFK7zU7ue/RKGy/ITsQAn5o7NDuO
         SNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678266299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA8QaXHaQv2zTvTrF1F5tUB/9uaPE/un/rBzeew06Qk=;
        b=N7itU62CJ1t2muktIss0jpDkarsESPBOFf8sTF4VxGr6Y/h1no5iU079tUHt7vBDAW
         M+EJarIhqYiiq0nXAgkjsKpH8XjyM94I3UhxNGTVqA7QV6f/ofOV63218bWV9QiXPmNL
         qh2Yltbqrj55D48fCrf2EIHVnMicoSvobAnziKRpfunxV/RuUgFCdSTEXd7PsQtVt6Dm
         mqtY6S7Kuu0Ulvzwjwgft4LlUagnho5XwqpSdw+xPukny9PkOTL2KqVDdnEisCD+tm1+
         RtHiNmIKNF4/Unl8hiulXmfXlO+IIkl6QaYcsi9En9Ksr7B8ZXuG1dj/K98bZlJAcrmk
         XFSg==
X-Gm-Message-State: AO0yUKVri6wkIhKA8THEjq4QF8YesUTtHLj8VvGOhqpKmFaTyfmHi6us
	6GTjNIGljX5aS6UVbWHhgEzVmA==
X-Google-Smtp-Source: AK7set/L9zFk+/3muQ4XCE6qXO8h4slPi9HcknR81cfBA77IySEK46FikrIsHFywPlVNMXfACef86g==
X-Received: by 2002:a05:600c:1907:b0:3eb:29fe:7b9e with SMTP id j7-20020a05600c190700b003eb29fe7b9emr14295268wmq.17.1678266299463;
        Wed, 08 Mar 2023 01:04:59 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id v38-20020a05600c4da600b003eb68bb61c8sm14645299wmp.3.2023.03.08.01.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 01:04:58 -0800 (PST)
Message-ID: <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
Date: Wed, 8 Mar 2023 09:04:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20220926172454.kbpzck7med5bopre@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, michal.simek@xilinx.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, linux-rockchip@lists.infradead.org, avifishman70@gmail.com, john.garry@huawei.com, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, yogeshgaur.83@gmail.com, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi, Sarge,

On 9/26/22 18:24, Serge Semin wrote:
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index f2c64006f8d7..cc8ca824f912 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>        if (op->addr.nbytes)
>>>>                op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>
>>>
>>>> -     if (op->dummy.nbytes)
>>>> +     if (op->dummy.ncycles)
>>>>                op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>>        if (op->data.nbytes)
>>>> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>                op->dummy.dtr = true;
>>>>                op->data.dtr = true;
>>>>
>>>> -             /* 2 bytes per clock cycle in DTR mode. */
>>>> -             op->dummy.nbytes *= 2;
>>>> -
>>>>                ext = spi_nor_get_cmd_ext(nor, op);
>>>>                op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>>>>                op->cmd.nbytes = 2;
>>>> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>>>>
>>>>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>>>>
>>>> -     /* convert the dummy cycles to the number of bytes */
>>>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>>>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>>>> -             op.dummy.nbytes *= 2;
>>>> +     op.dummy.ncycles = nor->read_dummy;
>>> So according to this modification and what is done in the rest of the
>>> patch, the dummy part of the SPI-mem operations now contains the number
>>> of cycles only. Am I right to think that it means a number of dummy
>>> clock oscillations? (Judging from what I've seen in the HW-manuals of
>>> the SPI NOR memory devices most likely I am...)
>>
>>
>> Yes, you are correct.
>>

I confirm.

>>
>>> If so the "ncycles" field
>>> is now free from the "data" semantic. Then what is the meaning of the
>>> "buswidth and "dtr" fields in the spi_mem_op.dummy field?
>>>
>>
>> It is still meaningful as it is used for the conversion by some drivers 
>> to nbytes and I do not see how it goes out of the specification in any 
>> way. So, at least for now, I do not see any reason to remove these fields.
> I do see the way these fields are used in the SPI-mem drivers. I was
> wondering what do these bits mean in the framework of the SPI-mem
> core? AFAICS from the specification the dummy cycles are irrelevant to
> the data bus state. It says "the master tri-states the bus during
> 'dummy' cycles." If so I don't see a reason to have the DTR and
> buswidth fields in the spi_mem_op structure anymore. The number of
> cycles could be calculated right on the initialization stage based on
> the SPI NOR/NAND requirements.
> 
> @Mark, @Tudor, @Pratyush, what do you think?
> 

In an ideal world, where both the controller and the device talk about
dummy number of cycles, I would agree with you, buswidth and dtr should
not be relevant for the number of dummy cycles. But it seems that there
are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, spi-mxic.c)
that support buswidths > 1 and work only with dummy nbytes, they are not
capable of specifying a smaller granularity (ncycles). Thus the older
controllers would have to convert the dummy ncycles to dummy nbytes.
Since mixed transfer modes are a thing (see jesd251, it talks about
4S-4D-4D), where single transfer mode (S) can be mixed with double
transfer mode (D) for a command, the controller would have to guess the
buswidth and dtr of the dummy. Shall they replicate the buswidth and dtr
of the address or of the data? There's no rule for that. So we're forced
to keep the dummy.{dtr, buswidth} fields by the old controllers that
don't understand dummy ncycles.

I'm going to send a v2 of this patch, I'll add you in To. Thanks for
taking the time to review this patch!

Cheers,
ta
