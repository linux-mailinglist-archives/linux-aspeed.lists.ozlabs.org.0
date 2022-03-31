Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B64ED4EC
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 09:42:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTZyT6x2Hz2yb7
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 18:42:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.77.235;
 helo=10.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 346 seconds by postgrey-1.36 at boromir;
 Thu, 31 Mar 2022 18:42:19 AEDT
Received: from 10.mo548.mail-out.ovh.net (10.mo548.mail-out.ovh.net
 [46.105.77.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTZyM4vjBz2yJF
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 18:42:17 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EB566222D0;
 Thu, 31 Mar 2022 07:36:25 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 09:36:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063e6c707f-2c73-4ce7-b171-35deabf783d6,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
Date: Thu, 31 Mar 2022 09:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-3-clg@kaod.org>
 <20220330191908.nhg52a5ayzczpzai@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220330191908.nhg52a5ayzczpzai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 42cf838e-2d6c-452a-9ac1-8df5f67bb224
X-Ovh-Tracer-Id: 6483213140691618762
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduuedtgedugeehfedvfefhieetieefhfeiudeutefhffekieduueeuheegudegfeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
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
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Pratyush,

On 3/30/22 21:19, Pratyush Yadav wrote:
> On 25/03/22 11:08AM, Cédric Le Goater wrote:
>> The "interrupt" property is optional because it is only necessary for
>> controllers supporting DMAs (Not implemented yet in the new driver).
>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Tested-by: Joel Stanley <joel@jms.id.au>
>> Tested-by: Tao Ren <rentao.bupt@gmail.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   .../bindings/spi/aspeed,ast2600-fmc.yaml      | 87 +++++++++++++++++++
>>   MAINTAINERS                                   |  9 ++
>>   2 files changed, 96 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>> new file mode 100644
>> index 000000000000..e16bbcd38560
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aspeed SMC controllers bindings
>> +
>> +maintainers:
>> +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> +  - Cédric Le Goater <clg@kaod.org>
>> +
>> +description: |
>> +  This binding describes the Aspeed Static Memory Controllers (FMC and
>> +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
>> +
>> +allOf:
>> +  - $ref: "spi-controller.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - aspeed,ast2600-fmc
>> +      - aspeed,ast2600-spi
>> +      - aspeed,ast2500-fmc
>> +      - aspeed,ast2500-spi
>> +      - aspeed,ast2400-fmc
>> +      - aspeed,ast2400-spi
>> +
>> +  reg:
>> +    items:
>> +      - description: registers
>> +      - description: memory mapping
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "@[0-9a-f]+":
>> +    type: object
>> +
>> +    properties:
>> +      spi-rx-bus-width:
>> +        enum: [1, 2, 4]
> 
> No need for this. It should already be taken care of by
> spi-peripheral-props.yaml

So we could drop the whole 'patternProperties' section ?

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +
>> +    spi@1e620000 {
>> +        reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        compatible = "aspeed,ast2600-fmc";
>> +        clocks = <&syscon ASPEED_CLK_AHB>;
>> +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> 
> Nitpick: Add a blank line here
> 
>> +        flash@0 {
>> +                reg = < 0 >;
>> +                compatible = "jedec,spi-nor";
>> +                spi-max-frequency = <50000000>;
>> +                spi-rx-bus-width = <2>;
>> +        };
> 
> and here
> 
>> +        flash@1 {
>> +                reg = < 1 >;
>> +                compatible = "jedec,spi-nor";
>> +                spi-max-frequency = <50000000>;
>> +                spi-rx-bus-width = <2>;
>> +        };
> 
> and here. Looks a bit nicer.

Thanks for the comments, I will provide the cleanups in v5.

C.



> 
>> +        flash@2 {
>> +                reg = < 2 >;
>> +                compatible = "jedec,spi-nor";
>> +                spi-max-frequency = <50000000>;
>> +                spi-rx-bus-width = <2>;
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ea9d74b6236f..7d5f81dcd837 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3021,6 +3021,15 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>>   F:	drivers/mmc/host/sdhci-of-aspeed*
>>   
>> +ASPEED SMC SPI DRIVER
>> +M:	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> +M:	Cédric Le Goater <clg@kaod.org>
>> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>> +L:	linux-spi@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>> +
>>   ASPEED VIDEO ENGINE DRIVER
>>   M:	Eddie James <eajames@linux.ibm.com>
>>   L:	linux-media@vger.kernel.org
>> -- 
>> 2.34.1
>>
> 

