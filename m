Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33BE4B82AF
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 09:13:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz9gp0DxZz3bcC
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 19:13:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.96.117; helo=1.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo552.mail-out.ovh.net (1.mo552.mail-out.ovh.net
 [178.32.96.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz9gj67Dqz2x9P
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 19:13:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3D56D24B44;
 Wed, 16 Feb 2022 08:12:56 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 09:12:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010590fb10-4626-4deb-8236-9a8be91dbf44,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d517d453-ddd5-8c9e-7b1f-56f5f83d2f1e@kaod.org>
Date: Wed, 16 Feb 2022 09:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/10] spi: aspeed: Activate new spi-mem driver
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-11-clg@kaod.org>
 <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 365dd3b7-2a44-4f14-8514-26cf6445fd31
X-Ovh-Tracer-Id: 12828503540660800388
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeehgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2/16/22 08:02, Joel Stanley wrote:
> On Mon, 14 Feb 2022 at 09:43, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The previous driver using the MTD SPI NOR interface is kept in case we
>> find some issues but we should remove it quickly once the new driver
>> using the spi-mem interface has been sufficiently exposed.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> I suggest we drop the defconfig changes from both this patch and the
> first. This way we'll always have the new driver being built, with
> less churn.
> 
> If you strongly prefer the way you've done it then that's fine too.

I am fine with that, but, with only patch 1, the defconfig files would
be referencing an non-existing CONFIG. Is that ok ?

Thanks,

C.



> 
>> ---
>>   arch/arm/configs/aspeed_g4_defconfig | 2 +-
>>   arch/arm/configs/aspeed_g5_defconfig | 2 +-
>>   arch/arm/configs/multi_v5_defconfig  | 2 +-
>>   arch/arm/configs/multi_v7_defconfig  | 2 +-
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
>> index 964536444cd7..b4a1b2ed1a17 100644
>> --- a/arch/arm/configs/aspeed_g4_defconfig
>> +++ b/arch/arm/configs/aspeed_g4_defconfig
>> @@ -64,7 +64,7 @@ CONFIG_MTD_BLOCK=y
>>   CONFIG_MTD_PARTITIONED_MASTER=y
>>   CONFIG_MTD_SPI_NOR=y
>>   # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=y
>> +CONFIG_SPI_ASPEED_SMC=y
>>   CONFIG_MTD_UBI=y
>>   CONFIG_MTD_UBI_FASTMAP=y
>>   CONFIG_MTD_UBI_BLOCK=y
>> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
>> index e809236ca88b..ccc4240ee4b5 100644
>> --- a/arch/arm/configs/aspeed_g5_defconfig
>> +++ b/arch/arm/configs/aspeed_g5_defconfig
>> @@ -103,7 +103,7 @@ CONFIG_MTD_BLOCK=y
>>   CONFIG_MTD_PARTITIONED_MASTER=y
>>   CONFIG_MTD_SPI_NOR=y
>>   # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=y
>> +CONFIG_SPI_ASPEED_SMC=y
>>   CONFIG_MTD_UBI=y
>>   CONFIG_MTD_UBI_FASTMAP=y
>>   CONFIG_MTD_UBI_BLOCK=y
>> diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
>> index 49083ef05fb0..80a3ae02d759 100644
>> --- a/arch/arm/configs/multi_v5_defconfig
>> +++ b/arch/arm/configs/multi_v5_defconfig
>> @@ -103,7 +103,7 @@ CONFIG_MTD_RAW_NAND=y
>>   CONFIG_MTD_NAND_ATMEL=y
>>   CONFIG_MTD_NAND_ORION=y
>>   CONFIG_MTD_SPI_NOR=y
>> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=y
>> +CONFIG_SPI_ASPEED_SMC=y
>>   CONFIG_MTD_UBI=y
>>   CONFIG_BLK_DEV_LOOP=y
>>   CONFIG_ATMEL_SSC=m
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index fc1b69256b64..33572998dbbe 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -217,7 +217,7 @@ CONFIG_MTD_NAND_DAVINCI=y
>>   CONFIG_MTD_NAND_STM32_FMC2=y
>>   CONFIG_MTD_NAND_PL35X=y
>>   CONFIG_MTD_SPI_NOR=y
>> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=m
>> +CONFIG_SPI_ASPEED_SMC=m
>>   CONFIG_MTD_UBI=y
>>   CONFIG_BLK_DEV_LOOP=y
>>   CONFIG_BLK_DEV_RAM=y
>> --
>> 2.34.1
>>

