Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D365838A0
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgTH525Sz2xJB
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:18:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Ak0uQ40x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Ak0uQ40x;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgTC0B7Gz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Jul 2022 16:18:54 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 18D4620FE86F;
	Wed, 27 Jul 2022 23:18:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 18D4620FE86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1658989102;
	bh=dOWYO9Tc9My88lpKym2V9t4KyEwrpWAjOIRXvs4C5XQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ak0uQ40xJOJRfAIrFUYHIr9TFMyUDjJbJTZm6CGUkKy+4qOq8U56I8c+XrKWgMQ8B
	 csdkyl9vpQCSv5JuJFTpnLAuSRIlKNFG4wOc1us79zruuwJNmDK1gCUlFhLZtlZyG7
	 wGUvBV/uHTBcB+UTdH5KjjtwmuxD2IG+4K95CEvI=
Message-ID: <450dee2f-63bf-51a7-730e-b780b594c1c5@linux.microsoft.com>
Date: Wed, 27 Jul 2022 23:18:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 5/5] crypto: aspeed: add HACE crypto driver
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220726113448.2964968-1-neal_liu@aspeedtech.com>
 <20220726113448.2964968-6-neal_liu@aspeedtech.com>
 <9d6beefe-9974-22f8-750c-68c9acb707ab@linux.microsoft.com>
 <TY2PR06MB32137A54B483D6D700BDE7EC80979@TY2PR06MB3213.apcprd06.prod.outlook.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <TY2PR06MB32137A54B483D6D700BDE7EC80979@TY2PR06MB3213.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/26/2022 10:31 PM, Neal Liu wrote:
>> Why are separate options required for hash and crypto algorithms, if hace is
>> only hw crypto on the SoCs?
>>
>> Looks like that's requiring unnecessary __weak register / unregister functions
>> [see below].
>>
>> Couldn't just two options CONFIG_CRYPTO_DEV_ASPEED and
>> CONFIG_CRYPTO_DEV_ASPEED_DEBUG be simpler to set for downstream
>> defconfigs?
> I would like to separate different algorithms by different options for more convenient for further use and debug.
> We also have RSA engine named ACRY, and would upstream once hash & crypto being accepted.
> So combined them into one option seems not a good choice for multiple hw crypto, do you agree?

Not sure what's the use case of just enabling crypto or hash separately
out of same HW engine and esp. when there's no alternative accel 
available, but that's fine.

If ARCY is different HW engine (interface) then having separate config
sounds logical.

Multiplying DEBUG configs seems unnecessary though. With dynamic debug
any of the dev_dbg could be turned on. Suggest using single one for
the module, if not drop it altogether. Following code is still not
covered by Kconfig, it in common code.

 > +#ifdef ASPEED_HACE_DEBUG
 > +#define HACE_DBG(d, fmt, ...)	\
 > +	dev_info((d)->dev, "%s() " fmt, __func__, ##__VA_ARGS__)
 > +#else
 > +#define HACE_DBG(d, fmt, ...)	\
 > +	dev_dbg((d)->dev, "%s() " fmt, __func__, ##__VA_ARGS__)
 > +#endif

Regards,
Dhananjay


