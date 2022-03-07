Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB34CF32E
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 09:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBrfy4rVnz3bP0
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 19:07:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=217.182.185.173;
 helo=smtpout4.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 583 seconds by postgrey-1.36 at boromir;
 Mon, 07 Mar 2022 19:07:48 AEDT
Received: from smtpout4.mo529.mail-out.ovh.net
 (smtpout4.mo529.mail-out.ovh.net [217.182.185.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBrfr4YWTz2yK6
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Mar 2022 19:07:46 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B51BFE6E92D4;
 Mon,  7 Mar 2022 08:57:58 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 08:57:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f042ee00-b82a-4618-94e2-453de9e9ac1c,
 2E53EE1553C3E30B03D111E4FD0BE5C715152E82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4d072c43-a766-9ce4-a629-a3ed095663a4@kaod.org>
Date: Mon, 7 Mar 2022 08:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Content-Language: en-US
To: =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>, Joel
 Stanley <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
References: <20220304170757.16924-1-potin.lai@quantatw.com>
 <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
 <6ed257f7-ae87-e2fe-26ed-9db300f5ebcc@kaod.org>
 <efeac1dc-0762-b6d3-e03b-dffc2c76d756@quantatw.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <efeac1dc-0762-b6d3-e03b-dffc2c76d756@quantatw.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 968a4531-9280-4b8d-93af-1ca18552f676
X-Ovh-Tracer-Id: 13476458935689120675
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddufedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


> I tested with spi-mem v3 patch, it looks same issue appeared. (spi-model=mx25l800)
> 
> 
> [    0.541050] spi-nor spi1.0: mx25l8005 (1024 Kbytes)
> aspeed_smc_flash_set_segment CS0 segreg=0x0 [ 0x30000000 - 0x30000000 ]
> aspeed_smc_flash_set_segment CS1 segreg=0x7f00010 [ 0x30100000 - 0x38000000 ]
> [    0.541976] spi-aspeed-smc 1e630000.spi: Calibration area too uniform, using low speed
> [    0.542267] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:1 [0x000b0041]
> 
> I think the model mx25l1606e you tested is 2MB flash.

Indeed. Thanks for the test of v3. We should send a followup patch
for this 2MB restriction on the minimum size of the flash when the
patchset is merged or I will if a v4 is asked for.

This patch can be applied to the current driver.

Thanks,

C.

