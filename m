Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4FB416C17
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Sep 2021 08:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG2jh3J5Vz2yPj
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Sep 2021 16:50:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 553 seconds by postgrey-1.36 at boromir;
 Fri, 24 Sep 2021 16:50:44 AEST
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG2jc6QkBz2xMF
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Sep 2021 16:50:44 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BB859BFCF9CC;
 Fri, 24 Sep 2021 08:41:22 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 08:41:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d7915da4-9c98-4e79-a222-ead5d310e334,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d2b85ad7-aef7-6088-03f5-cbd6e0bcab5d@kaod.org>
Date: Fri, 24 Sep 2021 08:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, <linux-leds@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
References: <20210921043936.468001-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2df45750-0022-4012-8083-0eedcb496355
X-Ovh-Tracer-Id: 8291689864739392504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgtdehvdejkefhudevkeekffekleetfeeftdekudeliedujeeftdeikeffvefgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhm
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, pavel@ucw.cz,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 9/21/21 06:39, Andrew Jeffery wrote:
> Hello,
> 
> This is a rework of a Rube Goldberg-inspired RFC I posted previously:
> 
> https://lore.kernel.org/lkml/20210723075858.376378-1-andrew@aj.id.au/
> 
> This time around there's a lot less Rube - the series:
> 
> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins
> 
> Without these patches the driver limits the number of pins exposed on
> the gpiochip to the number of pins specified as GPIO in the devicetree,
> but doesn't map between the GPIO and pin number spaces. The result is
> that specifying offset or interleaved GPIOs in the devicetree gives
> unexpected behaviour in userspace.
> 
> By always exposing all pins as GPIOs the patches resolve the lack of
> mapping between GPIO offsets and pins on the package in the driver by
> ensuring we always have a 1-to-1 mapping.
> 
> The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> possible to not expose any pins as LEDs (and therefore make them all
> accessible as GPIOs). This has a follow-on effect of allowing the driver
> to bind to a device instantiated at runtime without requiring a
> description in the devicetree.
> 
> I've tested the series under qemu to inspect the various interactions
> between LEDs vs GPIOs as well as conflicting GPIO requests.

I was wondering what kind of tests you did.

Did you cold plug 'pca995x' devices in a QEMU Aspeed EVB* machine running
with a custom DTB adding different layouts of the pca955x ?

> Please review!

This is simpler than the 'ngpio' business we had before.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> Andrew
> 
> Andrew Jeffery (2):
>    leds: pca955x: Make the gpiochip always expose all pins
>    leds: pca955x: Allow zero LEDs to be specified
> 
>   drivers/leds/leds-pca955x.c | 65 +++++++++++++++++++------------------
>   1 file changed, 34 insertions(+), 31 deletions(-)
> 
> 
> base-commit: 239f32b4f161c1584cd4b386d6ab8766432a6ede
> 

