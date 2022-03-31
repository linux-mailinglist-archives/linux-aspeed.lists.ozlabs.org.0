Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2E4ED4BE
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 09:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTZWr4m74z2yb7
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 18:22:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTZWn0KLGz2yNH
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 18:22:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 647A321D6D;
 Thu, 31 Mar 2022 07:15:31 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 09:15:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0017a140443-46ad-4610-9aab-007a7028463b,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d12860e6-cc56-6073-0bf2-bfae02cbbd88@kaod.org>
Date: Thu, 31 Mar 2022 09:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 08/11] spi: aspeed: Calibrate read timings
Content-Language: en-US
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
 <HK0PR06MB2786548534B370AE0C691C32B21F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
 <0ec477b5-e404-536f-ff60-39f43208c3cc@kaod.org>
 <HK0PR06MB27866B5CC29F46436A4F6230B2E19@HK0PR06MB2786.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <HK0PR06MB27866B5CC29F46436A4F6230B2E19@HK0PR06MB2786.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 302d5792-24cf-4c48-bed0-3ba3d01619e2
X-Ovh-Tracer-Id: 6130243521099631422
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Chin-Ting,

>>> - Maybe, if the calibration process is not executed, the frequency setting
>> calculated from max_frequency in the device tree can be filled in FMC10
>> instead of using dumb slow one, 12.5MHz, always.
>>
>> Indeed.
>>
>>>    For example, except for uniform content case, the calibration process will
>> be ignored when SPI clock frequency in the device tree is smaller than 40MHz.
>>> - The function, aspeed_2600_spi_clk_basic_setting, in [2] can be added to
>> support lower SPI clock frequency, e.g., 4MHz.
>>>    For AST2600, SPI clock frequency can be calculated by
>> HCLK/(FMC10[27:24] + FMC10[11:8]).
>>
>> Could you please send patches on top of this series ? Here are the branches :
>>
> 
> Of course. How do I provide you the patch? By private mail or send a PR?

We should discuss first by email on the openbmc@ and linux-aspeed@ lists.
Please send as follow ups on top of v4.

Using the openbmc tree should be easier :

      https://github.com/legoater/linux/commits/openbmc-5.15

> Besides, I may add a new callback function for this part due to difference 
> between AST2500 and AST2600.

ok.

Given all the reviews and tests that were done on AST2400, AST2500, AST2600
platforms, I will be careful not to break the existing proposal.

Thanks,

C.
