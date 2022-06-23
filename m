Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF115573D1
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 09:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTBWb5C7bz3bts
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 17:21:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.128; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr [80.12.242.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTBWT1GF6z3bnn
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 17:21:22 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 4H24ogdVvP8Ap4H24ojZfO; Thu, 23 Jun 2022 09:13:48 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 23 Jun 2022 09:13:48 +0200
X-ME-IP: 90.11.190.129
Message-ID: <21679090-7a89-865b-becf-d5552e8cedea@wanadoo.fr>
Date: Thu, 23 Jun 2022 09:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/5] crypto: aspeed: Add HACE hash driver
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>
References: <20220621063752.1005781-1-neal_liu@aspeedtech.com>
 <20220621063752.1005781-2-neal_liu@aspeedtech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220621063752.1005781-2-neal_liu@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, johnny_huang@aspeedtech.com, herbert@gondor.apana.org.au, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, rdunlap@infradead.org, dhphadke@microsoft.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, krzysztof.kozlowski+dt@linaro.org, christophe.jaillet@wanadoo.fr, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le 21/06/2022 à 08:37, Neal Liu a écrit :
> Hash and Crypto Engine (HACE) is designed to accelerate the
> throughput of hash data digest, encryption, and decryption.
> 
> Basically, HACE can be divided into two independently engines
> - Hash Engine and Crypto Engine. This patch aims to add HACE
> hash engine driver for hash accelerator.
> 
> Signed-off-by: Neal Liu <neal_liu-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>
> Signed-off-by: Johnny Huang <johnny_huang-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>
> ---

[...]

> +++ b/drivers/crypto/aspeed/Kconfig
> @@ -0,0 +1,23 @@
> +config CRYPTO_DEV_ASPEED
> +	tristate "Support for Aspeed cryptographic engine driver"
> +	depends on ARCH_ASPEED
> +	help
> +	  Hash and Crypto Engine (HACE) is designed to accelerate the
> +	  throughput of hash data digest, encryption and decryption.
> +
> +	  Select y here to have support for the cryptographic driver
> +	  available on Aspeed SoC.
> +
> +config CRYPTO_DEV_ASPEED_HACE_HASH
> +	bool "Enable ASPEED Hash & Crypto Engine (HACE) hash"

Nit: Sometimes you have ASPEED, sometimes you have Aspeed. (see a few 
lines above)

[...]

> +static int aspeed_ahash_req_update(struct aspeed_hace_dev *hace_dev)
> +{
> +	struct aspeed_engine_hash *hash_engine = &hace_dev->hash_engine;
> +	struct ahash_request *req = hash_engine->req;
> +	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
> +	aspeed_hace_fn_t resume;
> +
> +	AHASH_DBG(hace_dev, "\n");
> +
> +	if (hace_dev->version == AST2600_VERSION) {
> +		rctx->cmd |= HASH_CMD_HASH_SRC_SG_CTRL;
> +		resume = aspeed_ahash_update_resume_sg;
> +
> +	} else {
> +		resume = aspeed_ahash_update_resume;
> +	}
> +
> +	hash_engine->dma_prepare(hace_dev);

Apparently dma_prepare() can fail. Should there be some error handling here?

> +
> +	return aspeed_hace_ahash_trigger(hace_dev, resume);
> +}
> +

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
> +	/* Initialize crypto hardware engine structure for hash */
> +	hace_dev->crypt_engine_hash = crypto_engine_alloc_init(hace_dev->dev,
> +							       true);

This returns NULL on error and crypto_engine_start() will crash in such 
a case.

> +
> +	rc = crypto_engine_start(hace_dev->crypt_engine_hash);
> +	if (rc)
> +		goto err_engine_hash_start;
> +
> +	tasklet_init(&hash_engine->done_task, aspeed_hace_hash_done_task,
> +		     (unsigned long)hace_dev);
> +
> +	hace_dev->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (!hace_dev->regs) {
> +		dev_err(&pdev->dev, "Failed to map resources\n");
> +		return -ENOMEM;

I think that all direct returns from here to the end of the function 
should be "goto err_engine_hash_start;".

> +	}
> +
> +	/* Get irq number and register it */
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
> +	/* Get clk and enable it */
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
> +	/* Allocate DMA buffer for hash engine input used */
> +	hash_engine->ahash_src_addr =
> +		dma_alloc_coherent(&pdev->dev,
> +				   ASPEED_HASH_SRC_DMA_BUF_LEN,
> +				   &hash_engine->ahash_src_dma_addr,
> +				   GFP_KERNEL);

Most of the resources are devm_'ed. Does it make sense to use 
dmam_alloc_coherent() here to simplify the .remove function?

> +	if (!hash_engine->ahash_src_addr) {
> +		dev_err(&pdev->dev, "Failed to allocate dma buffer\n");
> +		rc = -ENOMEM;
> +		goto clk_exit;
> +	}
> +
> +	aspeed_hace_register(hace_dev);
> +
> +	dev_info(&pdev->dev, "ASPEED Crypto Accelerator successfully registered\n");
> +
Nit: Sometimes you have ASPEED, sometimes you have Aspeed.

> +	return rc;
> +
> +clk_exit:
> +	clk_disable_unprepare(hace_dev->clk);
> +err_engine_hash_start:
> +	crypto_engine_exit(hace_dev->crypt_engine_hash);
> +
> +	return rc;
> +}
> +

[...]

> +MODULE_AUTHOR("Neal Liu <neal_liu-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>");
> +MODULE_DESCRIPTION("ASPEED HACE driver Crypto Accelerator");

Nit: Sometimes you have ASPEED, sometimes you have Aspeed.

