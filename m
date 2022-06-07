Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B727153FB46
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 12:33:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRX33vSDz3bmH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 20:33:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2280 seconds by postgrey-1.36 at boromir; Tue, 07 Jun 2022 20:33:00 AEST
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net [46.105.37.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRWw0dxWz3bdy
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 20:32:56 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BE73D25B28;
	Tue,  7 Jun 2022 09:54:53 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 11:54:52 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-98R002e5252f13-1f90-45fc-b1c5-4aa178b34a63,
                    91B62C5DF406EA78EA4BF407C6AC564E114A3E29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3a62cd13-6937-8824-d503-3525ce7c30d8@kaod.org>
Date: Tue, 7 Jun 2022 11:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make
 aspeed_smc_unregister() return void
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
 <20220607092856.jh7jj4snlobx2kae@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220607092856.jh7jj4snlobx2kae@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e551fdba-14fc-4bd3-815a-e963f85f6d46
X-Ovh-Tracer-Id: 2336523782348901307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

On 6/7/22 11:28, Pratyush Yadav wrote:
> Hi Uwe,
> 
> On 03/06/22 11:07PM, Uwe Kleine-König wrote:
>> The function returns zero unconditionally, so simplify to make it
>> obvious there is no error to handle in the callers.
>>
>> This is a preparation for making platform remove callbacks return void.
> 
> Cedric recently ported the driver to SPI MEM and it has now hit the
> linux-next tree [0]. This driver is planned to be removed. Can you
> please check if the new driver has this issue, and fix it there?
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=9c63b846e6df43e5b3d31263f7db545f32deeda3

It is merged in -rc1 now :

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/spi/spi-aspeed-smc.c

I think aspeed_spi_remove() does what you want there.

Thanks,

C.


>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>   drivers/mtd/spi-nor/controllers/aspeed-smc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> index acfe010f9dd7..bd149104533a 100644
>> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> @@ -399,7 +399,7 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
>>   	return len;
>>   }
>>   
>> -static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>> +static void aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>>   {
>>   	struct aspeed_smc_chip *chip;
>>   	int n;
>> @@ -409,13 +409,13 @@ static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>>   		if (chip)
>>   			mtd_device_unregister(&chip->nor.mtd);
>>   	}
>> -
>> -	return 0;
>>   }
>>   
>>   static int aspeed_smc_remove(struct platform_device *dev)
>>   {
>> -	return aspeed_smc_unregister(platform_get_drvdata(dev));
>> +	aspeed_smc_unregister(platform_get_drvdata(dev));
>> +
>> +	return 0;
>>   }
>>   
>>   static const struct of_device_id aspeed_smc_matches[] = {
>> -- 
>> 2.36.1
>>
> 

