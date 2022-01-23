Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDA497651
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 00:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhq0T6BGYz30Nj
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jan 2022 10:22:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 2309 seconds by postgrey-1.36 at boromir;
 Mon, 24 Jan 2022 10:22:46 AEDT
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhq0Q0jPfz2xY1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jan 2022 10:22:43 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8337FD984D66;
 Sun, 23 Jan 2022 23:44:07 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 23 Jan
 2022 23:44:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b7e6303c-d087-4cdd-8e9a-f381c1422b65,
 90EAC8BD64EA4EE21D802F9E5F0AC1C4B4718499) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
Date: Sun, 23 Jan 2022 23:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, Patrick Williams <patrick@stwcx.xyz>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com> <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com> <20220103171721.46c8e697@xps13>
 <YdSP6tKyQ2ZRUC+2@heinlein> <20220105063244.lno3xur64uepa7i5@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105063244.lno3xur64uepa7i5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62bc6a40-d1d1-4864-991d-9b803c761a1a
X-Ovh-Tracer-Id: 15724036627872713720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdehgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
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
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>> I had an offline discussion with someone who knew more history on this driver.
>> My understanding is that the linux-aspeed team is aware of this being deprecated
>> but that there was some missing support for interface training that nobody has
>> gotten around to write?  If that is the case this really isn't even a "simple"
>> port to a new API at this point.
> 
> Unless the controller needs some unique feature (I don't think it does
> on a quick glance), the conversion should not be too difficult. For any
> experienced developer, even if they are unfamiliar with the SPI MEM API,
> I don't think it should take more than 2-3 days to do the conversion.
> The code to program the registers would stay the same, all that needs to
> change is the API through which it is accessed.

Writing a spimem driver is not a problem, I think people have done
that in house. Aspeed has one for AST2600. We have one for u-boot
I wrote sometime ago. I even have one for Linux but training comes
with ugly hacks to fit in the current stack.

All Aspeed SoCs need training and that has been the problem for the
last 4 years or so because we can not do training without knowing
a minimum about the flash being trained :/ The previous framework
offered a way to do a first scan and tune the delay settings
afterwards. It worked pretty well on AST2400, AST2500 and AST2600
even if more complex.

One alternative was to include the setting in the DT but the flash
modules are not always soldered on the boards, at least on OpenPOWER
systems which have sockets for them. The board are large, the wires
long, the need is real, some chips freak out if not tuned correctly.

spimem needs an extension I think. Sorry I have not been able to
push that forward. Lack of time and other tasks to address on the
host side of the machine. This is really a software problem, we
have the HW procedures ready. If a spimem expert could get involved
to make a few proposals, I would be happy to help and do some testing.
QEMU models are good enough for the software part. We can do the
training validation on real HW when ready.

Thanks,

C.
