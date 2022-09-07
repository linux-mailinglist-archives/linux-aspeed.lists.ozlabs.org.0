Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEBC5AFA59
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 05:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMn9k1G12z3bZ2
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 13:02:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ol9g3wUg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ol9g3wUg;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMn9X3v0fz2yX3
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 13:02:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3Tp5ZhNYXm0i/DPFn+aAH7H47byqpVrpKeYl5Ch2pN8=; b=Ol9g3wUgd4tK8mxRwHC7DTcVYt
	4yvOSlYjNIz5eBiHUWvBpB1GTWf+sBAo63Ye9T7gTcOmHvcYovJDkMfglnw4sf3+UYJ1UE3cN8qvk
	3t91Wfb6zAD3V+eKmN5ygcXwzu9gHQU+jHiP/nzkgLsjHR4qI/3Gok7bq5Z3OuGxUyiPEKTMykCup
	PsonLRiEAUqqJrtyAsYHNoCqxC7QhbZo8szZXQyqrG3zgD36q8g5mI6UpcjpfPDRHxjX+Z6/MFz7C
	MpD/M/wHpbHseyBXSxeT50nxeuesW4+6JOWNhRactFNIsS2f8gZUfYD+RSJZ3Rex4L2VRucxQVUlN
	12/4FRwg==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVlKN-001pdO-MJ; Wed, 07 Sep 2022 03:02:11 +0000
Message-ID: <712da429-6d0d-325f-1c53-39326faa2d41@infradead.org>
Date: Tue, 6 Sep 2022 20:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] crypto: aspeed: fix format unexpected build warning
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Neal Liu <neal_liu@aspeedtech.com>
References: <20220905052449.1830669-1-neal_liu@aspeedtech.com>
 <Yxf+W/mJvnSKzQgM@gondor.apana.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Yxf+W/mJvnSKzQgM@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 9/6/22 19:13, Herbert Xu wrote:
> On Mon, Sep 05, 2022 at 01:24:49PM +0800, Neal Liu wrote:
>>
>> @@ -324,7 +324,7 @@ static int aspeed_hace_ahash_trigger(struct aspeed_hace_dev *hace_dev,
>>  	struct ahash_request *req = hash_engine->req;
>>  	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
>>  
>> -	AHASH_DBG(hace_dev, "src_dma:0x%x, digest_dma:0x%x, length:0x%x\n",
>> +	AHASH_DBG(hace_dev, "src_dma:%zu, digest_dma:%zu, length:%zu\n",
>>  		  hash_engine->src_dma, hash_engine->digest_dma,
>>  		  hash_engine->src_length);
> 
> Shouldn't we use %pad instead of %zu for dma_addr_t (you'll also
> need to pass in a dma_addr_t pointer instead of the value)?

That sounds correct.
I only looked at the size_t parts...

-- 
~Randy
