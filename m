Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC14543CF2
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jun 2022 21:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJHV24Jj2z3bqW
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jun 2022 05:34:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WhxkAlfE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WhxkAlfE;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJHTx2cz6z3053
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jun 2022 05:34:13 +1000 (AEST)
Received: from [10.16.8.184] (unknown [131.107.147.184])
	by linux.microsoft.com (Postfix) with ESMTPSA id A896E20BE665;
	Wed,  8 Jun 2022 12:33:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A896E20BE665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1654716821;
	bh=9VPqD11Y0U15W613gU8t13a2O2PKBaCp3UdzdYQ4GpQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WhxkAlfE/Arw1RbLOc7GEnlQmI2Ol2oj9XSLISpdfl1thZVJCkxMpYubDUAIfp6gg
	 qzT1HybGTMPU538EVfXltAv3LCVgFXVxdeKXiiAmKKD3USU/q0s8/vVNvxd6sOBC9s
	 6eAoj0OttVQQb2g3fgR8EyvCwRtYvdmQyszSk3gk=
Message-ID: <6f9e1481-db9c-cd5f-c38d-bdcd3040315f@linux.microsoft.com>
Date: Wed, 8 Jun 2022 12:33:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: [PATCH 5/5] crypto: aspeed: add HACE crypto driver
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-6-neal_liu@aspeedtech.com>
Content-Language: en-US
In-Reply-To: <20220601054204.1522976-6-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/6/2022 8:43 PM, Neal Liu wrote:
>>> +struct aspeed_hace_alg {
>>> +	struct aspeed_hace_dev		*hace_dev;
>>> +	union {
>>> +		struct skcipher_alg	skcipher;
>>> +		struct aead_alg		aead;
>>> +		struct ahash_alg	ahash;
>>> +		struct kpp_alg		kpp;
>>> +		struct akcipher_alg	akcipher;
>>
>> Your patch dont do any kpp or akcipher (and aead/skcipher also).
>> Please drop this.
>
> I miss this part, I'll revise it in next patch, thanks.

Hi Neal,

Are you planning to submit aead separately? HW programming interface
for aes-gcm is almost same as other aes modes except extra regs/fields 
for tag etc.


Thanks,
Dhananjay


