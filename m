Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD3D4B672F
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 10:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyb4R3wV2z3cYX
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 20:13:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.58.48; helo=6.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo548.mail-out.ovh.net (6.mo548.mail-out.ovh.net
 [188.165.58.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyb4D2DC6z3cQJ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 20:13:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8335821EFF;
 Tue, 15 Feb 2022 09:07:53 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 10:07:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b27b64c4-57a5-44f9-a47c-4a83fe5690ca,
 2487B4E7026A90D95ED29794538901B35B4D209A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <76c3f352-a0fc-f72f-e66e-594f9249cb8c@kaod.org>
Date: Tue, 15 Feb 2022 10:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-4-clg@kaod.org> <20220215062743.GA12431@wunner.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215062743.GA12431@wunner.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4e02782a-965d-4bc5-8fe7-6f59370c6abd
X-Ovh-Tracer-Id: 7883832626687085383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Lukas,

On 2/15/22 07:27, Lukas Wunner wrote:
> On Mon, Feb 14, 2022 at 10:42:24AM +0100, Cédric Le Goater wrote:
>> +static int aspeed_spi_probe(struct platform_device *pdev)
>> +{
> [...]
>> +	ctlr = spi_alloc_master(dev, sizeof(*aspi));
>> +	if (!ctlr)
>> +		return -ENOMEM;
> 
> Use devm_spi_alloc_master() and remove the "put_controller" error path
> for simplicity.
  
yes.

>> +	ret = devm_spi_register_controller(dev, ctlr);
> [...]
>> +static int aspeed_spi_remove(struct platform_device *pdev)
>> +{
>> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
>> +	struct aspeed_spi *aspi = spi_controller_get_devdata(ctlr);
>> +
>> +	aspeed_spi_enable(aspi, false);
>> +	spi_unregister_controller(ctlr);
>> +	clk_disable_unprepare(aspi->clk);
>> +	return 0;
>> +}
> 
> You need to move the call to spi_unregister_controller() *before*
> the call to aspeed_spi_enable().  The controller must be fully
> operational until spi_unregister_controller() returns.
> 
> You also need to replace the call to devm_spi_register_controller()
> in aspeed_spi_probe() with spi_register_controller().
> Otherwise you'll unregister the controller twice because you're
> calling spi_unregister_controller() in aspeed_spi_remove().

ok. Understood. Done in v2.

Thanks,

C.

