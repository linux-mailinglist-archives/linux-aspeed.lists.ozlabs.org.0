Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965BD6B72E2
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsD82yVYz3bjW
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=PdKbbRiU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=PdKbbRiU;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXW890ZF6z2xjR;
	Fri, 10 Mar 2023 01:02:00 +1100 (AEDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A8AA2D5A;
	Thu,  9 Mar 2023 15:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678370517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/l1Q+xJ4MDAQ221QCBefTlDZLE3+EBKQBBYXmE97Lw=;
	b=PdKbbRiUmTck4+p7CvvFaOVkS7y+8eMsok76ySxGXc5sWa21ukPCWDcO9j0/xSsaTpzWmI
	60KgS0y0CnXW175+8hDwXFo1M7LS9jpY1i0jnpt2XEU9sduHAFXQTgKQwAEavBC1AIxcna
	07tdIc6uP/NirknOwetL9uJ9/MsV7vOVGw84K1LszU/lzlcua8qyx8vSYlUUfd6UYCIBuM
	eZmvOWnB9g4Q/MmLm7TUxb7IZ0P/jSFVmz0ZN5Nhsl3CK73NHT998MgzZZx3XQgLbhzbt4
	sWRYKBl/tvYFszgqAtEqRKc0EhMvqvg6kRGfIY/u/41nLo+F/QBlDtCEymt1lQ==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 15:01:57 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
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
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
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

Am 2023-03-09 14:54, schrieb Tudor Ambarus:
> On 09.03.2023 15:33, Michael Walle wrote:
>>>>> The controllers that can talk in dummy ncycles don't need the
>>>>> dummy.{buswidth, dtr} fields.
>>>>> 
>>>>> The controllers that can't talk in dummy cycles, but only on a 
>>>>> "byte"
>>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not 
>>>>> have
>>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>>> nbytes.
>>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>>> bytes.
>>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>> 
>>>> No they don't need it. Lets take your semper flash and assume it 
>>>> needs
>>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the 
>>>> mode
>>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>>> It has
>>>> then to figure out how that can be achieved. E.g. if it can only do 
>>>> the
>>>> "old" byte programming and is in quad mode, good for it. It will 
>>>> send 6
>>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 
>>>> byte
>>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 
>>>> 12
>>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>>> single bit mode, because it cannot send 1.5 bytes..
>>>> 
>>> 
>>> You miss the fact that you can have 1-1-4. What buswidth do you use
>>> for dummy, the address buswidth or the data buswidth?
>> 
>> Doesn't matter, does it? The driver is free to chose, 1, 4, or 
>> anything
>> else. You don't sample any data during the dummy phase.
>> To answer your question: single for instruction, single for address,
>> whatever you choose for dummy as long as there are ncycles space 
>> between
>> address and data, and quad for data.
> 
> Huh? How does the controller chose, based on what?

Based on its own capabilities. It can choose either way. In the end
what matters is how many clock cycles there are between the address
and data phase. And you only need to convey that information to the
SPI controller - your new ncycles.

-michael

>> Depending on the capabilites of the hardware it will likely be 1 or 4.
>> 
>>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>>> and transfer mode are you going to use for dummy?
>> 
>> Also doesn't matter. What matters is how many dummy clock cycles you
>> do. Again, they don't depent on the mode. You just have to count
>> the clock cycles between the address and the data phase (and that is
>> what your ncycle parameter will tell the controller).
>> 
>>> And please don't tell me that "we're going to assume that
>>> dummy.buswidth = address.buswidth because that's what we currently do
>>> in SPI NOR", because I'm not convinced that the assumption is 
>>> correct.
>> 
>> No, it doesn't matter :)
>> 
>> -michael
