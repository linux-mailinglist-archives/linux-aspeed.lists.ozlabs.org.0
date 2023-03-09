Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 992416B72D8
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsCZ3d05z3c3W
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nBr8nAd3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nBr8nAd3;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXQkF6TS5z3bYW
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 21:42:45 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id l25so1388142wrb.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678358559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
        b=nBr8nAd36m9PAaXhfYM/4OLaddFdsGqVE33IkJXe836CVY1mwrMaJ0z6xZBf96qoOI
         wHtu0PFtoKoyIzX+VPr+/fuzdwvpjf7WHn48t+f9zcU6YwYZWztwBuqGj7l0dwdbArgj
         9BdJxnMMnENBMqvEWmtN9PjHCRl7l2YExcQXYKyBbziRvao/CePqrt7EvP4HpVtto5VH
         QXi3YjTFTii/7goIfJr/GTdt68ovUVdmBOWoUiiz0gXw5VAu3RMa5w0b1gBU8OSuUqb4
         AEtkZbqFYD4W0WJ0d3IiA/1XF2s9Fl82n7X/PtjFCiLZRgjUzj9Q13c24vjHb1a/yAmF
         vQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
        b=ER3iJVqzCS51YNkuhG0qoDFscxFaQnvsw85AZg+0YTwgqgnS57J8a4bjd1WwZtJbBw
         kz4pBFyBBVWiPaLVaFWXRJKzlxoHqPBo+VpjUjU972Gf4OU025t/p0koPDLF+q7+zd8D
         88UXmB3tl1CaOP8f0iZbbABy3x366uR9AXAYSPz0LJOtI/OVq9vLE1vUg7GR03Qj2SqT
         kdRe/nvxI4ZFvz51HP1W3zT84uLdSOsj8Zx3GZhJeSS7sxw+m1g245Q4GT+M5qsW+tCU
         yyR+neEc7TTGQxmSKH2u+KtEAYzlPMXRrOEtZAqXrh8nEr6Vgeiow+eCVXqAXKeD+yfU
         Z/ZA==
X-Gm-Message-State: AO0yUKWQMitc4EtS+3uwRAHw3DhtkezgCcv5/YSv4mERzrOWL556vOow
	iulxP27zqm3hG0TA04HIPDDOWA==
X-Google-Smtp-Source: AK7set9TX+g8GQa3ZvYm7K5IyQckLiVBKmzBF9eqRJS1rvlystpDX78yR8o1b1wUu4lOee+V+S+WMQ==
X-Received: by 2002:a05:6000:507:b0:2c5:4f2d:d9b4 with SMTP id a7-20020a056000050700b002c54f2dd9b4mr12687108wrf.58.1678358559301;
        Thu, 09 Mar 2023 02:42:39 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b002c71b4d476asm17579951wrd.106.2023.03.09.02.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:42:38 -0800 (PST)
Message-ID: <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
Date: Thu, 9 Mar 2023 12:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, Sergiu.Moga@microchip.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, avifishman70@gmail.com, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com, Pratyush Yadav 
 <pratyush@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 09.03.2023 10:38, Michael Walle wrote:
>> In an ideal world, where both the controller and the device talk about
>> dummy number of cycles, I would agree with you, buswidth and dtr should
>> not be relevant for the number of dummy cycles. But it seems that there
>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, spi-mxic.c)
>> that support buswidths > 1 and work only with dummy nbytes, they are not
>> capable of specifying a smaller granularity (ncycles). Thus the older
>> controllers would have to convert the dummy ncycles to dummy nbytes.
>> Since mixed transfer modes are a thing (see jesd251, it talks about
>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>> transfer mode (D) for a command, the controller would have to guess the
>> buswidth and dtr of the dummy. Shall they replicate the buswidth and dtr
>> of the address or of the data? There's no rule for that.
> 
> But in the end that doesn't matter because they are just dummy clock
> cycles and the mode will only affect the data/address/command. Therefore,
> the controller is free to choose the mode that suits it best.
>  > But that begs the question, is ncycles in regard to DTR or SDR? That is,
> are you counting just one type of edges or both the falling and rising
> edges. The smallest granularity would be ncycles in regard of DTR. To me,
> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we choose
> the smallest granularty in spi-mem to be future proof and maybe provide
> some spi-mem helper to help setting the cycles for SDR/DTR. As an example,
> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
> 

No, we can't invent our own measuring units. We have cycles and half 
cycles (regardless of the transfer mode used (STR, DTR)).

> So you won't need the mode nor the dtr property.
> 
> -michael
> 
> [1] 
> https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
