Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636C53EDC3
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 20:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH1yx0l3Nz3bkR
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 04:21:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.123; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH1yp3LHzz300K
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 04:21:19 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id yHENnESwl3JPEyHENnixWC; Mon, 06 Jun 2022 20:13:45 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 06 Jun 2022 20:13:45 +0200
X-ME-IP: 90.11.190.129
Message-ID: <349c0714-5ec8-4233-0f0d-669e4ad3bf59@wanadoo.fr>
Date: Mon, 6 Jun 2022 20:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/5] crypto: aspeed: Add HACE hash driver
Content-Language: fr
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-2-neal_liu@aspeedtech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220606064935.1458903-2-neal_liu@aspeedtech.com>
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
Reply-To: Neal Liu <neal_liu@aspeedtech.com>
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le 06/06/2022 à 08:49, Neal Liu a écrit :
> Hash and Crypto Engine (HACE) is designed to accelerate the
> throughput of hash data digest, encryption, and decryption.
> 
> Basically, HACE can be divided into two independently engines
> - Hash Engine and Crypto Engine. This patch aims to add HACE
> hash engine driver for hash accelerator.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> ---

[...]

> +static int aspeed_ahash_dma_prepare(struct aspeed_hace_dev *hace_dev)
> +{
> +	struct aspeed_engine_hash *hash_engine = &hace_dev->hash_engine;
> +	struct ahash_request *req = hash_engine->ahash_req;
> +	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
> +	struct device *dev = hace_dev->dev;
> +	int length, remain;
> +	int rc = 0;
> +
> +	length = rctx->total + rctx->bufcnt;
> +	remain = length % rctx->block_size;
> +
> +	AHASH_DBG(hace_dev, "length:0x%x, remain:0x%x\n", length, remain);
> +
> +	if (rctx->bufcnt)
> +		memcpy(hash_engine->ahash_src_addr, rctx->buffer, rctx->bufcnt);
> +
> +	if (rctx->total + rctx->bufcnt < ASPEED_CRYPTO_SRC_DMA_BUF_LEN) {
> +		scatterwalk_map_and_copy(hash_engine->ahash_src_addr +
> +					 rctx->bufcnt, rctx->src_sg,
> +					 rctx->offset, rctx->total - remain, 0);
> +		rctx->offset += rctx->total - remain;
> +
> +	} else {
> +		dev_warn(dev, "Hash data length is too large\n");
> +		return -EINVAL;
> +	}
> +
> +	scatterwalk_map_and_copy(rctx->buffer, rctx->src_sg,
> +				 rctx->offset, remain, 0);
> +
> +	rctx->bufcnt = remain;
> +	rctx->digest_dma_addr = dma_map_single(hace_dev->dev, rctx->digest,
> +					       SHA512_DIGEST_SIZE,
> +					       DMA_BIDIRECTIONAL);
> +	if (dma_mapping_error(hace_dev->dev, rctx->digest_dma_addr)) {
> +		dev_warn(hace_dev->dev, "dma_map() rctx digest error\n");
> +		rc = -ENOMEM;
> +		goto free;
> +	}
> +
> +	hash_engine->src_length = length - remain;
> +	hash_engine->src_dma = hash_engine->ahash_src_dma_addr;
> +	hash_engine->digest_dma = rctx->digest_dma_addr;
> +
> +	return 0;
> +
> +free:
> +	dma_unmap_single(hace_dev->dev, rctx->digest_dma_addr,
> +			 SHA512_DIGEST_SIZE, DMA_BIDIRECTIONAL);

Here, dma_map_single() has failed. Do we need to unmap? (other calls 
below don't)

> +	return rc;
> +}
> +
> +/*
> + * Prepare DMA buffer as SG list buffer before
> + * hardware engine processing.
> + */
> +static int aspeed_ahash_dma_prepare_sg(struct aspeed_hace_dev *hace_dev)
> +{
> +	struct aspeed_engine_hash *hash_engine = &hace_dev->hash_engine;
> +	struct ahash_request *req = hash_engine->ahash_req;
> +	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
> +	struct aspeed_sg_list *src_list;
> +	struct scatterlist *s;
> +	int length, remain, sg_len, i;
> +	int rc = 0;
> +
> +	remain = (rctx->total + rctx->bufcnt) % rctx->block_size;
> +	length = rctx->total + rctx->bufcnt - remain;
> +
> +	AHASH_DBG(hace_dev, "%s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
> +		  "rctx total", rctx->total, "bufcnt", rctx->bufcnt,
> +		  "length", length, "remain", remain);
> +
> +	sg_len = dma_map_sg(hace_dev->dev, rctx->src_sg, rctx->src_nents,
> +			    DMA_TO_DEVICE);
> +	if (!sg_len) {
> +		dev_warn(hace_dev->dev, "dma_map_sg() src error\n");
> +		rc = -ENOMEM;

Direct return, as done in v1, looks fine to me. But it is mostly a 
matter of test, I guess.

> +		goto end;
> +	}
> +
> +	src_list = (struct aspeed_sg_list *)hash_engine->ahash_src_addr;
> +	rctx->digest_dma_addr = dma_map_single(hace_dev->dev, rctx->digest,
> +					       SHA512_DIGEST_SIZE,
> +					       DMA_BIDIRECTIONAL);
> +	if (dma_mapping_error(hace_dev->dev, rctx->digest_dma_addr)) {
> +		dev_warn(hace_dev->dev, "dma_map() rctx digest error\n");
> +		rc = -ENOMEM;
> +		goto free_src_sg;
> +	}
> +
> +	if (rctx->bufcnt != 0) {
> +		rctx->buffer_dma_addr = dma_map_single(hace_dev->dev,
> +						       rctx->buffer,
> +						       rctx->block_size * 2,
> +						       DMA_TO_DEVICE);
> +		if (dma_mapping_error(hace_dev->dev, rctx->buffer_dma_addr)) {
> +			dev_warn(hace_dev->dev, "dma_map() rctx buffer error\n");
> +			rc = -ENOMEM;
> +			goto free_rctx_digest;
> +		}
> +
> +		src_list[0].phy_addr = rctx->buffer_dma_addr;
> +		src_list[0].len = rctx->bufcnt;
> +		length -= src_list[0].len;
> +
> +		/* Last sg list */
> +		if (length == 0)
> +			src_list[0].len |= HASH_SG_LAST_LIST;
> +		src_list++;
> +	}
> +
> +	if (length != 0) {
> +		for_each_sg(rctx->src_sg, s, sg_len, i) {
> +			src_list[i].phy_addr = sg_dma_address(s);
> +
> +			if (length > sg_dma_len(s)) {
> +				src_list[i].len = sg_dma_len(s);
> +				length -= sg_dma_len(s);
> +
> +			} else {
> +				/* Last sg list */
> +				src_list[i].len = length;
> +				src_list[i].len |= HASH_SG_LAST_LIST;
> +				length = 0;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (length != 0) {
> +		rc = -EINVAL;
> +		goto free_rctx_buffer;
> +	}
> +
> +	rctx->offset = rctx->total - remain;
> +	hash_engine->src_length = rctx->total + rctx->bufcnt - remain;
> +	hash_engine->src_dma = hash_engine->ahash_src_dma_addr;
> +	hash_engine->digest_dma = rctx->digest_dma_addr;
> +
> +	goto end;
> +
> +free_rctx_buffer:
> +	dma_unmap_single(hace_dev->dev, rctx->buffer_dma_addr,
> +			 rctx->block_size * 2, DMA_TO_DEVICE);

If "rctx->bufcnt == 0" the correspondning dma_map_single() has not been 
called. Is it an issue? (the test exists in 
aspeed_ahash_update_resume_sg(), so I guess it is needed)

> +free_rctx_digest:
> +	dma_unmap_single(hace_dev->dev, rctx->digest_dma_addr,
> +			 SHA512_DIGEST_SIZE, DMA_BIDIRECTIONAL);
> +free_src_sg:
> +	dma_unmap_sg(hace_dev->dev, rctx->src_sg, rctx->src_nents,
> +		     DMA_TO_DEVICE);
> +end:
> +	return rc;
> +}
> +

[...]

> +
> +#define HASH_SG_LAST_LIST               BIT(31)

Tab as done in the other #define?

[...]
