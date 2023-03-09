Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC96B72D9
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsCf4rhJz3bfk
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=Q0KB9CqT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=2a01:4f8:c0c:9d57::1; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=Q0KB9CqT;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXR2Z5sKkz30QS;
	Thu,  9 Mar 2023 21:56:54 +1100 (AEDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 02408127D;
	Thu,  9 Mar 2023 11:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678359411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/io0tiHurftvED5sx9LsxUT6zxO/u5fmUM2T3ONQg1w=;
	b=Q0KB9CqTeuqMIUSe2pVjnWRuOwcuUmKy9D5oFkhfi/+moFgjMCQ/lunzoGmezZzlumqVKC
	MrQg1kXbHWxTsyWsmj7NWDC/TENDDKHttjXm4yTCVHYePbZbHZoKkrXHx8CbxPIV34zeHU
	+jfWs5s6CLuPLu8k4bHcBAttFBHFY10zEQWk+lkFlnRP1ytW2BqgvY7WGvS5HgIoxF5D4K
	YNqzc1ck8iGX27ks548/YZDSqdK+1eYjVP2ukcLY5Va037kd8vocBPbRc52qQnq41ErkKV
	4ZcoSCVyIYjrBToOMlILYNHuHLBiYOvk6DiBaFHGE4O0o5TSwpozL9l8guW67g==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 11:56:50 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

Am 2023-03-09 11:42, schrieb Tudor Ambarus:
> On 09.03.2023 10:38, Michael Walle wrote:
>>> In an ideal world, where both the controller and the device talk 
>>> about
>>> dummy number of cycles, I would agree with you, buswidth and dtr 
>>> should
>>> not be relevant for the number of dummy cycles. But it seems that 
>>> there
>>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, 
>>> spi-mxic.c)
>>> that support buswidths > 1 and work only with dummy nbytes, they are 
>>> not
>>> capable of specifying a smaller granularity (ncycles). Thus the older
>>> controllers would have to convert the dummy ncycles to dummy nbytes.
>>> Since mixed transfer modes are a thing (see jesd251, it talks about
>>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>>> transfer mode (D) for a command, the controller would have to guess 
>>> the
>>> buswidth and dtr of the dummy. Shall they replicate the buswidth and 
>>> dtr
>>> of the address or of the data? There's no rule for that.
>> 
>> But in the end that doesn't matter because they are just dummy clock
>> cycles and the mode will only affect the data/address/command. 
>> Therefore,
>> the controller is free to choose the mode that suits it best.
>>  > But that begs the question, is ncycles in regard to DTR or SDR? 
>> That is,
>> are you counting just one type of edges or both the falling and rising
>> edges. The smallest granularity would be ncycles in regard of DTR. To 
>> me,
>> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we 
>> choose
>> the smallest granularty in spi-mem to be future proof and maybe 
>> provide
>> some spi-mem helper to help setting the cycles for SDR/DTR. As an 
>> example,
>> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
>> 
> 
> No, we can't invent our own measuring units. We have cycles and half
> cycles (regardless of the transfer mode used (STR, DTR)).

That is basically what I was saying, just using the correct term.
Ok. So we don't need the dtr property, right? I'm still not sure,
what the semper nano flash uses. Half cycles? But according to your
naming you'd specify full cylces?

-michael
