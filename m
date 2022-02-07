Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A74ACA3B
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 21:18:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsyBZ750wz3bTP
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Feb 2022 07:18:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.96.117; helo=1.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4199 seconds by postgrey-1.36 at boromir;
 Tue, 08 Feb 2022 07:18:10 AEDT
Received: from 1.mo552.mail-out.ovh.net (1.mo552.mail-out.ovh.net
 [178.32.96.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsyBV4tSBz2yLT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Feb 2022 07:18:08 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C7C002175D;
 Mon,  7 Feb 2022 17:13:02 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Feb
 2022 18:13:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0044853b68b-cd97-4ce1-aeb7-00b726bfd98e,
 E2445A8A547341F0C4F33C36BF67DED8627CB71E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <53d53523-7174-89fd-8661-550346d53141@kaod.org>
Date: Mon, 7 Feb 2022 18:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com> <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com> <20220103171721.46c8e697@xps13>
 <YdSP6tKyQ2ZRUC+2@heinlein> <20220105063244.lno3xur64uepa7i5@ti.com>
 <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
 <20220124153644.m3iwlvq5ld5cpbyz@ti.com>
 <b222361a-288a-55b2-fc02-04c0b93b4220@kaod.org>
 <20220124203708.lm23sgsub234wlhq@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124203708.lm23sgsub234wlhq@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0889bc72-794a-48f3-bc90-e1c137db6e97
X-Ovh-Tracer-Id: 5989224557367692280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgvdefheejgfelvefhudfghffgvdeuffeifefhheefvdeliedtleehuddvuefftdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Potin Lai <potin.lai@quantatw.com>,
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

On 1/24/22 21:37, Pratyush Yadav wrote:
> On 24/01/22 07:34PM, Cédric Le Goater wrote:
>>>> spimem needs an extension I think. Sorry I have not been able to
>>>> push that forward. Lack of time and other tasks to address on the
>>>> host side of the machine. This is really a software problem, we
>>>> have the HW procedures ready. If a spimem expert could get involved
>>>> to make a few proposals, I would be happy to help and do some testing.
>>>> QEMU models are good enough for the software part. We can do the
>>>> training validation on real HW when ready.
>>>
>>> What information about the flash do you need for this training?
>>
>> Last time I looked, we lacked some post_init handler to setup a slave:
>> configure the registers defining the AHB windows for each flash
>> slave and perform the read timing calibration. calibration should
>> only be done once.
>>
>> See how the aspeed_spi_flash_init() routine doing the calibration
>> is hooked up under aspeed_spi_claim_bus() in the u-boot driver :
> 
> My patch series should provide a hook for doing the calibration _after_
> the flash is initialized.

You can also use the .dirmap_create handler. The flash device has
been scanned when called and the size is available in the spi-mem
dirmap descriptor.

I reworked the current Aspeed driver with this approach and it
seems sufficient for read calibration.

Thanks,

C.


> 
>>
>>    https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/spi/aspeed_spi.c
>>
>> Not good enough for upstream, Linux would be the same :/
>>
>>> I proposed a patch series [0] some time ago trying to implement training
>>> for TI SoCs. It did not get merged but I do intend to respin it and get
>>> it through. Would this API work for your tuning as well?
>>
>> I will take a look.
>>> Also, I am curious how your training works. What data do you read for
>>> training delays? Where is it stored?
>>
>> The driver reads the first 16K at slow speed (that's why we need a
>> basic minimal setup of the slave) and checks if the buffer is valid
>> enough for the calibration :
>>
>>    https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c#L998
>>
>> it then performs reads by changing the frequency and delays and
>> compares results with the initial default buffer.
> 
> This seems similar to the tuning I implemented, except mine uses a
> pre-defined pattern at a pre-defined location.
> 
>>
>> if not, then the driver stays in a safe mode (slow).
> 
> Same for my patches.
> 
>>
>>> In our case we need to flash a
>>> known pattern at some location (which is passed in via DT). Do you need
>>> to run it for every read transaction or just once after the flash is
>>> initialized?
>>
>> Just once because it is a heavy process. See the debug outputs below.
>> Once we have good read timings and frequency, there is no need to do
>> it each time.
> 
> It looks very similar to the tuning I implemented in my patch series.
> You should be able to use those APIs for your tuning as well. But it
> should not block the SPI MEM port. The current upstream driver does not
> seem to implement this tuning anyway.
> 
>>
>>> [0] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=233504&state=%2A&archive=both
>> Thanks,
>>
>> C.
> 

