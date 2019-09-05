Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B288A9B08
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 09:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PBVV63mpzDr1F
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 17:03:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.52.162; helo=2.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PBVH6dHbzDqwD
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 17:03:19 +1000 (AEST)
Received: from player738.ha.ovh.net (unknown [10.108.54.97])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 584DD14218A
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 08:45:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id AF0039946597;
 Thu,  5 Sep 2019 06:45:07 +0000 (UTC)
Subject: Re: [PATCH] ARM: dts: aspeed-g4: Add all flash chips
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20190905000221.31445-1-joel@jms.id.au>
 <d9805fa2-db79-457b-a166-7c84e1608128@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6348d0f1-6e2e-cae6-7f76-996825de0527@kaod.org>
Date: Thu, 5 Sep 2019 08:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d9805fa2-db79-457b-a166-7c84e1608128@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12608108633323375469
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 05/09/2019 02:33, Andrew Jeffery wrote:
> 
> 
> On Thu, 5 Sep 2019, at 09:32, Joel Stanley wrote:
>> The FMC supports five chip selects, so describe the five possible flash
>> chips.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index e465cda40fe7..dffb595d30e4 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -67,6 +67,26 @@
>>  				compatible = "jedec,spi-nor";
>>  				status = "disabled";
>>  			};
>> +			flash@1 {
>> +				reg = < 1 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@2 {
>> +				reg = < 2 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@3 {
>> +				reg = < 3 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
>> +			flash@4 {
>> +				reg = < 4 >;
>> +				compatible = "jedec,spi-nor";
>> +				status = "disabled";
>> +			};
> 
> The FMC supports parallel NOR and NAND interfaces too, but so far no-one has
> cared for these options, so if they ever do we'll fix it then.

New Aspeed SoCs only have SPI support. So I don't think the other interfaces
were ever used.

C. 
 
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 

