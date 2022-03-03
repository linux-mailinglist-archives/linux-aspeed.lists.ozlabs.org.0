Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408724CB953
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:39:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PYl1qSzz3btG
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 19:39:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 2129 seconds by postgrey-1.36 at boromir;
 Thu, 03 Mar 2022 19:33:04 AEDT
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PPr59xwz3bvM
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 19:33:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2446DE58E32F;
 Thu,  3 Mar 2022 08:57:30 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 08:57:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0011b51f2f7-e82d-49ee-9801-eb43e836e213,
 A0610A17E77809494FE20D2F959CCE2A9331EACD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <88d86ba1-65ba-0c95-6d46-c064eaa62856@kaod.org>
Date: Thu, 3 Mar 2022 08:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/10] ARM: dts: aspeed: Enable Dual SPI RX transfers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-11-clg@kaod.org>
 <CACPK8XeDBCMCEO4=w7qUQxsYiFUDKPAuBhXW5Sr6=UHM_GRsWA@mail.gmail.com>
 <CACPK8Xd6VJLuWsvSjYrQ-y=yS+yR7vjdWECfsd2W9_J7e09K-A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xd6VJLuWsvSjYrQ-y=yS+yR7vjdWECfsd2W9_J7e09K-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e05de279-3f2e-408a-be31-93ae24799af8
X-Ovh-Tracer-Id: 8424546055071435652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddthedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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

On 3/2/22 23:48, Joel Stanley wrote:
> On Wed, 2 Mar 2022 at 22:45, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, 2 Mar 2022 at 17:31, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> All these controllers support at least Dual SPI. Update the DTs.
>>>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Thanks. I'll apply this to the aspeed tree now.
>>
>> Did you also have a patch to add a second flash chip to the AST2400 FMC?
> 
> That was a reference to the discussion on the openbmc list with Tao. I
> was mistaken; the flash chips are there, but they lack the
> spi-max-frequency property.

Yes.

I will include a patch in v3 for the second flash chip of the AST2400 FMC.

Thanks,

C.

> 
>>
>>> ---
>>>   arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>>>   arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
>>>   arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
>>>   3 files changed, 21 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>>> index 9ae67e83cf60..31e6569db97e 100644
>>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>>> @@ -64,27 +64,32 @@ fmc: spi@1e620000 {
>>>                          flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>> +                               spi-rx-bus-width = <2>;
>>>                                  spi-max-frequency = <50000000>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@2 {
>>>                                  reg = < 2 >;
>>>                                  compatible = "jedec,spi-nor";
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@3 {
>>>                                  reg = < 3 >;
>>>                                  compatible = "jedec,spi-nor";
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@4 {
>>>                                  reg = < 4 >;
>>>                                  compatible = "jedec,spi-nor";
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> @@ -100,6 +105,7 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>>> index c3e0a8e13c8a..29bf017899b6 100644
>>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>>> @@ -66,18 +66,21 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@2 {
>>>                                  reg = < 2 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> @@ -93,12 +96,14 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> @@ -114,12 +119,14 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> index 1ad05dde19d2..ce93c56a21a7 100644
>>> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> @@ -106,18 +106,21 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@2 {
>>>                                  reg = < 2 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> @@ -133,12 +136,14 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> @@ -154,18 +159,21 @@ flash@0 {
>>>                                  reg = < 0 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@1 {
>>>                                  reg = < 1 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                          flash@2 {
>>>                                  reg = < 2 >;
>>>                                  compatible = "jedec,spi-nor";
>>>                                  spi-max-frequency = <50000000>;
>>> +                               spi-rx-bus-width = <2>;
>>>                                  status = "disabled";
>>>                          };
>>>                  };
>>> --
>>> 2.34.1
>>>

