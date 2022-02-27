Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E194C5F11
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Feb 2022 22:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Gnt07P9z3bWM
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 08:28:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192;
 helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 9284 seconds by postgrey-1.36 at boromir;
 Mon, 28 Feb 2022 08:27:58 AEDT
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Gnp1mPFz2yfh
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 08:27:55 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E30F222C9F;
 Sun, 27 Feb 2022 21:27:53 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 27 Feb
 2022 22:27:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bd4da659-6e74-42ae-98f4-7b2406606e6c,
 949565DF20DEE76D4A77FF7731A75FE8B07B1F6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <890fce14-8001-74c9-21a9-0de117e743ef@kaod.org>
Date: Sun, 27 Feb 2022 22:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/10] spi: aspeed: Calibrate read timings
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-9-clg@kaod.org>
 <20220225091809.gvup3mcst45szi6x@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220225091809.gvup3mcst45szi6x@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a51f072-26f3-48de-b05f-06cdd16eb070
X-Ovh-Tracer-Id: 17066672266216704900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleekgddugeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudetudefueeffedvjeeiieffleegtefgledthfelueevieetgeekuedvffdtteehnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2/25/22 10:18, Pratyush Yadav wrote:
> On 14/02/22 10:42AM, Cédric Le Goater wrote:
>> To accommodate the different response time of SPI transfers on different
>> boards and different SPI NOR devices, the Aspeed controllers provide a
>> set of Read Timing Compensation registers to tune the timing delays
>> depending on the frequency being used. The AST2600 SoC has one of
>> these registers per device. On the AST2500 and AST2400 SoCs, the
>> timing register is shared by all devices which is a bit problematic to
>> get good results other than for one device.
>>
>> The algorithm first reads a golden buffer at low speed and then performs
>> reads with different clocks and delay cycle settings to find a breaking
>> point. This selects a default good frequency for the CEx control register.
>> The current settings are bit optimistic as we pick the first delay giving
>> good results. A safer approach would be to determine an interval and
>> choose the middle value.
>>
>> Due to the lack of API, calibration is performed when the direct mapping
>> for reads is created.
> 
> The dirmap_create mapping says nothing about _when_ it should be called.
> So there is no guarantee that it will only be called after the flash is
> fully initialized. 

spi_nor_create_read_dirmap() is called after spi_nor_scan() in spi_nor_probe().
Since a spi_mem_dirmap_info descriptor is created using the nor fields :

	struct spi_mem_dirmap_info info = {
		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
		.offset = 0,
		.length = nor->params->size,
	};
	struct spi_mem_op *op = &info.op_tmpl;

the spi-mem framework makes the assumption that the nor object is initialized.

> I suggest you either make this a requirement of the API,

how ?

Thanks,

C.


> or create a new API that guarantees it will only be called after
> the flash is initialized, like [0].
> 
> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210311191216.7363-2-p.yadav@ti.com/
> 
>>
>> Cc: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 

