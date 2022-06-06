Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD02F53EECE
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 21:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH3nw2VWGz3bkH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 05:43:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nG50Y+kZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=clabbe.montjoie@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nG50Y+kZ;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH3nm2gkRz2yn3
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 05:43:38 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id z9so1402807wmf.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jun 2022 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5A0Tk1TtWUpBiRRuio2LxMIdLJAOAXj5CmUrpNuf59M=;
        b=nG50Y+kZ0OsrnMz4iw7KEi8zqJIpYAYQKD0xA8K2beHGzBBOBQWPIK8tdvR8a5N8TW
         WjsL1tm2Z+ERfMEMSNpnhRPS8qKLdOUbWIx0AQ2qh7p+jjBrQGJmPD2zW1Zo6JVU3QHq
         /4jCD656ZpkozBnuY1ZJ0/xesYY2d6QSxlURLCqxfk7AxAqjdAi4aQfKK5KsQWotUfPh
         sq413oCLmVlIGjBEApMp98q96rxIqttDaa4Ta22uYSSMgZJ+eSSQz8ckhOwJvEgi4+2m
         Ur4taGenPP669FVSyrlTw/e6Ae9zqVF/95HH4ZuaIK74avrSGyMV89RtXG5rR5OS2vnJ
         /yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5A0Tk1TtWUpBiRRuio2LxMIdLJAOAXj5CmUrpNuf59M=;
        b=0ihZ/O6Egv55UNpe4dsWQq/pO7bVZUIqIUB9NFdo1MbgUH0X3PODNsN54PK2T2kwir
         5WJUd1fGA87qHZWM9ZJBO4i5gS8KETtNo1E9YR+oPQaPa1yWKz/MKF/PyPlHs5Ho4iNW
         n1cF7/VrgBSPlJenRZIbi0Fm0WXKQJ1LnjeF+Xn6liC35YMZ15vnsymcgh8PrB/Wx8ZB
         KfSDpgTsvGcwY/2ESKRzqR/iMazuJZVLTYYCk5qIPveRR/Gb3xZ1sB5CuaDzHsK6yQFG
         3VFEDHA4gKCJWMyzxVg6kfjt8KbvSOmiUU+lud4MFweMGNPjIeqpWQC+6ZGyGHsrHb7Q
         qMFQ==
X-Gm-Message-State: AOAM533imP99Nj2YvqlXpSPs0c1hPJRiFKbf8wDXw3GhhHMT63uvakb0
	xGDPaIVL8e6mbQg/8+SnGgA=
X-Google-Smtp-Source: ABdhPJwaGLLzWURo5J4qJcPtntGNMvWmblFxfMvb3jlJ8k4IMCCsZCC6GyTpWDgzVnTMo40K2EGHKQ==
X-Received: by 2002:a05:600c:2105:b0:39c:37d0:6f5e with SMTP id u5-20020a05600c210500b0039c37d06f5emr21147503wml.44.1654544610604;
        Mon, 06 Jun 2022 12:43:30 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id h13-20020a05600c2cad00b00397623ff335sm19982775wmc.10.2022.06.06.12.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:43:30 -0700 (PDT)
Date: Mon, 6 Jun 2022 21:43:25 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 1/5] crypto: aspeed: Add HACE hash driver
Message-ID: <Yp5Y3WKhGklwgMTp@Red>
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606064935.1458903-2-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le Mon, Jun 06, 2022 at 02:49:31PM +0800, Neal Liu a écrit :
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
>  MAINTAINERS                              |    7 +
>  drivers/crypto/Kconfig                   |    1 +
>  drivers/crypto/Makefile                  |    1 +
>  drivers/crypto/aspeed/Kconfig            |   22 +
>  drivers/crypto/aspeed/Makefile           |    6 +
>  drivers/crypto/aspeed/aspeed-hace-hash.c | 1409 ++++++++++++++++++++++
>  drivers/crypto/aspeed/aspeed-hace.c      |  221 ++++
>  drivers/crypto/aspeed/aspeed-hace.h      |  182 +++
>  8 files changed, 1849 insertions(+)
>  create mode 100644 drivers/crypto/aspeed/Kconfig
>  create mode 100644 drivers/crypto/aspeed/Makefile
>  create mode 100644 drivers/crypto/aspeed/aspeed-hace-hash.c
>  create mode 100644 drivers/crypto/aspeed/aspeed-hace.c
>  create mode 100644 drivers/crypto/aspeed/aspeed-hace.h

Hello please see my comments below.

[...]

> diff --git a/drivers/crypto/aspeed/aspeed-hace-hash.c b/drivers/crypto/aspeed/aspeed-hace-hash.c
> new file mode 100644
> index 000000000000..9b003e12b2c8
> --- /dev/null
> +++ b/drivers/crypto/aspeed/aspeed-hace-hash.c
> @@ -0,0 +1,1409 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Aspeed Technology Inc.
> + */
> +
> +#include "aspeed-hace.h"
> +
> +//#define ASPEED_AHASH_DEBUG

Please remove this

[...]

> +
> +#ifdef ASPEED_AHASH_DEBUG
> +#define AHASH_DBG(h, fmt, ...)	\
> +	dev_info((h)->dev, "%s() " fmt, __func__, ##__VA_ARGS__)
> +#else
> +#define AHASH_DBG(h, fmt, ...)	\
> +	((void)(h))
> +#endif

Why not using dev_dbg() ?

[...]
> +	sg_len = dma_map_sg(hace_dev->dev, rctx->src_sg, rctx->src_nents,
> +			    DMA_TO_DEVICE);
> +	if (!sg_len) {
> +		dev_warn(hace_dev->dev, "dma_map_sg() src error\n");
> +		rc = -ENOMEM;
> +		goto end;
> +	}

This test does handle the possible negative return of dma_map_sg()

[...]
> +	memset(bctx->ipad + keylen, 0, bs - keylen);
> +	memcpy(bctx->opad, bctx->ipad, bs);
> +
> +	for (i = 0; i < bs; i++) {
> +		bctx->ipad[i] ^= 0x36;
> +		bctx->opad[i] ^= 0x5c;

Please use HMAC_OPAD_VALUE and HMAC_IPAD_VALUE from include/crypto/hmac.h

[...]
> +int aspeed_register_hace_hash_algs(struct aspeed_hace_dev *hace_dev)
> +{
> +	int rc, i;
> +
> +	AHASH_DBG(hace_dev, "\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(aspeed_ahash_algs); i++) {
> +		aspeed_ahash_algs[i].hace_dev = hace_dev;
> +		rc = crypto_register_ahash(&aspeed_ahash_algs[i].alg.ahash);
> +		if (rc)
> +			return rc;
> +	}

If any hash fail to register, the function exits but you will still unregister all hashes (even ones not registered) on aspeed_unregister_hace_hash_algs().

[...]
> +static int aspeed_hace_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *hace_dev_id;
> +	struct aspeed_engine_hash *hash_engine;
> +	struct aspeed_hace_dev *hace_dev;
> +	struct resource *res;
> +	int rc;
> +
> +	hace_dev = devm_kzalloc(&pdev->dev, sizeof(struct aspeed_hace_dev),
> +				GFP_KERNEL);
> +	if (!hace_dev)
> +		return -ENOMEM;
> +
> +	hace_dev_id = of_match_device(aspeed_hace_of_matches, &pdev->dev);
> +	if (!hace_dev_id) {
> +		dev_err(&pdev->dev, "Failed to match hace dev id\n");
> +		return -EINVAL;
> +	}
> +
> +	hace_dev->dev = &pdev->dev;
> +	hace_dev->version = (unsigned long)hace_dev_id->data;
> +	hash_engine = &hace_dev->hash_engine;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	platform_set_drvdata(pdev, hace_dev);
> +
> +	spin_lock_init(&hash_engine->lock);
> +	tasklet_init(&hash_engine->done_task, aspeed_hace_hash_done_task,
> +		     (unsigned long)hace_dev);
> +	tasklet_init(&hash_engine->queue_task, aspeed_hace_hash_queue_task,
> +		     (unsigned long)hace_dev);
> +	crypto_init_queue(&hash_engine->queue, ASPEED_HASH_QUEUE_LENGTH);
> +
> +	hace_dev->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (!hace_dev->regs) {
> +		dev_err(&pdev->dev, "Failed to map resources\n");
> +		return -ENOMEM;
> +	}
> +
> +	hace_dev->irq = platform_get_irq(pdev, 0);
> +	if (!hace_dev->irq) {
> +		dev_err(&pdev->dev, "Failed to get interrupt\n");
> +		return -ENXIO;
> +	}
> +
> +	rc = devm_request_irq(&pdev->dev, hace_dev->irq, aspeed_hace_irq, 0,
> +			      dev_name(&pdev->dev), hace_dev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to request interrupt\n");
> +		return rc;
> +	}
> +
> +	hace_dev->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(hace_dev->clk)) {
> +		dev_err(&pdev->dev, "Failed to get clk\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = clk_prepare_enable(hace_dev->clk);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to enable clock 0x%x\n", rc);
> +		return rc;
> +	}
> +
> +	hash_engine->ahash_src_addr =
> +		dma_alloc_coherent(&pdev->dev,
> +				   ASPEED_HASH_SRC_DMA_BUF_LEN,
> +				   &hash_engine->ahash_src_dma_addr,
> +				   GFP_KERNEL);
> +	if (!hash_engine->ahash_src_addr) {
> +		dev_err(&pdev->dev, "Failed to allocate dma buffer\n");
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
> +	rc = aspeed_hace_register(hace_dev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to register algs, rc:0x%x\n", rc);
> +		rc = 0;
> +	}

So you print an error but you keep the driver loaded even if no hashes (or a limited number of them) are registered, for which interest ?

[...]
> +struct aspeed_sham_ctx {
> +	struct aspeed_hace_dev		*hace_dev;
> +	unsigned long			flags;	/* hmac flag */
> +
> +	/* fallback stuff */
> +	struct aspeed_sha_hmac_ctx	base[0];

I am not sure to understand the [0] purpose, and the comment said something about fallback, but your driver dont do any real fallback.

[...]
> +struct aspeed_hace_dev {
> +	void __iomem			*regs;
> +	void __iomem			*sec_regs;

sec_regs is unused.

> +	struct device			*dev;
> +	int				irq;
> +	struct clk			*clk;
> +	unsigned long			version;
> +	struct aspeed_engine_hash	hash_engine;
> +};
> +
> +struct aspeed_hace_alg {
> +	struct aspeed_hace_dev		*hace_dev;
> +	union {
> +		struct skcipher_alg	skcipher;
> +		struct aead_alg		aead;
> +		struct ahash_alg	ahash;
> +		struct kpp_alg		kpp;
> +		struct akcipher_alg	akcipher;

Your patch dont do any kpp or akcipher (and aead/skcipher also).
Please drop this.

Regards
