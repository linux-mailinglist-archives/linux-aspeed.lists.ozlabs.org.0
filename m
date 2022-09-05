Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1365AC929
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 05:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLZ2P1qDrz300V
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 13:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZG6c0yn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLZ291N65z2xZf
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Sep 2022 13:36:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oRVtV+KDU0L0hxdOqGB4binGje5K4V+L3ZgFTFnPQzs=; b=eZG6c0ynV+ttEFvsEXF4UbyPJS
	dVaStY3ltBUSznp2OIEzeNhHpZoSqOM2PB/E3MCNLJOJC7g0V3/SFZ44/WKgrqpFWKVuozSheQcj6
	bSgNfdxCOusQuBulXUEuVr7xbHzJUJU5KRAk+f0pYFcb0lgA9PISnh/Z/umEt4ZnbIQYbKw93jFCY
	1877jihYp+B41BKw6UTzOE58dVUoigx5PRQaoPzIHaR1TNZLhlDQgpscvYjKxjWzIA3exieJxmDui
	p0nyV/Qbp8Ct+oUdbsI+KYYb4hhb77FfdR70cwbUkxKVn6oUPFvsHQ88LGfwLtumgzKukvHkGMVAd
	gv5cClWg==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV2uQ-007Jzq-E5; Mon, 05 Sep 2022 03:36:32 +0000
Message-ID: <64caed2a-fafe-040d-c967-5eebaf6b144d@infradead.org>
Date: Sun, 4 Sep 2022 20:36:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] crypto: aspeed: fix format unexpected build warning
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20220905032838.1663510-1-neal_liu@aspeedtech.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220905032838.1663510-1-neal_liu@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 9/4/22 20:28, Neal Liu wrote:
> This fixes the following similar build warning when
> enabling compile test:
> 
> aspeed-hace-hash.c:188:9: warning: format '%x' expects argument of type
> 'unsigned int', but argument 7 has type 'size_t' {aka 'long unsigned int'}
> [-Wformat=]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/crypto/aspeed/aspeed-hace-hash.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/aspeed/aspeed-hace-hash.c b/drivers/crypto/aspeed/aspeed-hace-hash.c
> index 0a44ffc0e13b..d0f61149fe24 100644
> --- a/drivers/crypto/aspeed/aspeed-hace-hash.c
> +++ b/drivers/crypto/aspeed/aspeed-hace-hash.c
> @@ -186,7 +186,7 @@ static int aspeed_ahash_dma_prepare_sg(struct aspeed_hace_dev *hace_dev)
>  	length = rctx->total + rctx->bufcnt - remain;
>  
>  	AHASH_DBG(hace_dev, "%s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
> -		  "rctx total", rctx->total, "bufcnt", rctx->bufcnt,
> +		  "rctx total", rctx->total, "bufcnt", (u32)rctx->bufcnt,
>  		  "length", length, "remain", remain);
>  
>  	sg_len = dma_map_sg(hace_dev->dev, rctx->src_sg, rctx->src_nents,
> @@ -325,8 +325,8 @@ static int aspeed_hace_ahash_trigger(struct aspeed_hace_dev *hace_dev,
>  	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
>  
>  	AHASH_DBG(hace_dev, "src_dma:0x%x, digest_dma:0x%x, length:0x%x\n",
> -		  hash_engine->src_dma, hash_engine->digest_dma,
> -		  hash_engine->src_length);
> +		  (u32)hash_engine->src_dma, (u32)hash_engine->digest_dma,
> +		  (u32)hash_engine->src_length);
>  
>  	rctx->cmd |= HASH_CMD_INT_ENABLE;
>  	hash_engine->resume = resume;

No, size_t values should be printed with %zu.
No cast needed.

-- 
~Randy
