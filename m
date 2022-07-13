Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37EE572F29
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Jul 2022 09:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjTfs6RdWz3c3p
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Jul 2022 17:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=XcZ097Xe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=XcZ097Xe;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjTfk01xgz2ywJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Jul 2022 17:25:17 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0F8E2204DE8D;
	Wed, 13 Jul 2022 00:24:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0F8E2204DE8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657697086;
	bh=xyfcr3sQR84Ly/nvTJHG4HPfK1atahpyAidjxl2yWkE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XcZ097XeO7xeC7v5XUwwOFRNJp/3SfBdVsO4i5/EqL5rXYOykkBQcQFZrH5eUk+fH
	 GdHfinkZgeYf9WzJKRJWvBSVXhqwf+/+rj3ay/Dezbp07FtUsA2j0v1iYW0PJpX9OH
	 A6X9pNBzG17b2c4tBFt454w2F+v173E39Qb6miLI=
Message-ID: <7041bf01-d91f-3149-e8ba-5db4ba59f9bb@linux.microsoft.com>
Date: Wed, 13 Jul 2022 00:24:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 1/5] crypto: aspeed: Add HACE hash driver
Content-Language: en-US
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Dhananjay Phadke <dhphadke@microsoft.com>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220705020936.1751771-1-neal_liu@aspeedtech.com>
 <20220705020936.1751771-2-neal_liu@aspeedtech.com>
 <45058512-0661-5d34-7faf-ddf3eb6142ec@linux.microsoft.com>
In-Reply-To: <45058512-0661-5d34-7faf-ddf3eb6142ec@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/12/2022 10:32 PM, Dhananjay Phadke wrote:
>> +static void aspeed_ahash_iV(struct aspeed_sham_reqctx *rctx)
>> +{
>> +    if (rctx->flags & SHA_FLAGS_SHA1)
>> +        memcpy(rctx->digest, sha1_iv, 32);
>> +    else if (rctx->flags & SHA_FLAGS_SHA224)
>> +        memcpy(rctx->digest, sha224_iv, 32);
>> +    else if (rctx->flags & SHA_FLAGS_SHA256)
>> +        memcpy(rctx->digest, sha256_iv, 32);
>> +    else if (rctx->flags & SHA_FLAGS_SHA384)
>> +        memcpy(rctx->digest, sha384_iv, 64);
>> +    else if (rctx->flags & SHA_FLAGS_SHA512)
>> +        memcpy(rctx->digest, sha512_iv, 64);
>> +    else if (rctx->flags & SHA_FLAGS_SHA512_224)
>> +        memcpy(rctx->digest, sha512_224_iv, 64);
>> +    else if (rctx->flags & SHA_FLAGS_SHA512_256)
>> +        memcpy(rctx->digest, sha512_256_iv, 64);
>> +}
> 
> Can use the "digsize" from reqctx to memcpy() instead lots of if..else
> conditionals for every request?

Sorry, meant pre-initialized ivsize not digsize, which could be
in alg wrapper structure (aspeed_hace_alg).

Thanks,
Dhananjay
