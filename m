Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F300853AD9E
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 22:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD0tP30dsz3bmQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Jun 2022 06:22:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.125; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD0tH6WVWz3035
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Jun 2022 06:21:57 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id wUjOnikly26JCwUjOn5OWJ; Wed, 01 Jun 2022 22:14:22 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 01 Jun 2022 22:14:22 +0200
X-ME-IP: 90.11.190.129
Message-ID: <dd525d8b-3cb3-e843-4a79-64f50c0fe8a7@wanadoo.fr>
Date: Wed, 1 Jun 2022 22:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] crypto: aspeed: Add HACE hash driver
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-2-neal_liu@aspeedtech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220601054204.1522976-2-neal_liu@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

Le 01/06/2022 à 07:42, Neal Liu a écrit :
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
>   MAINTAINERS                              |    7 +
>   drivers/crypto/Kconfig                   |    1 +
>   drivers/crypto/Makefile                  |    1 +
>   drivers/crypto/aspeed/Kconfig            |   22 +
>   drivers/crypto/aspeed/Makefile           |    6 +
>   drivers/crypto/aspeed/aspeed-hace-hash.c | 1335 ++++++++++++++++++++++
>   drivers/crypto/aspeed/aspeed-hace.c      |  210 ++++
>   drivers/crypto/aspeed/aspeed-hace.h      |  179 +++
>   8 files changed, 1761 insertions(+)
>   create mode 100644 drivers/crypto/aspeed/Kconfig
>   create mode 100644 drivers/crypto/aspeed/Makefile
>   create mode 100644 drivers/crypto/aspeed/aspeed-hace-hash.c
>   create mode 100644 drivers/crypto/aspeed/aspeed-hace.c
>   create mode 100644 drivers/crypto/aspeed/aspeed-hace.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8c52d0192a6..c020e0893eed 100644

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
> +
> +	if (hace_dev->version != AST2600_VERSION)
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(aspeed_ahash_algs_g6); i++) {
> +		aspeed_ahash_algs_g6[i].hace_dev = hace_dev;
> +		rc = crypto_register_ahash(&aspeed_ahash_algs_g6[i].alg.ahash);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;

Should there be some kind of error handling here, in order to undo 
things already done if an error occures?


> +}
> diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
> new file mode 100644
> index 000000000000..f25b13d120e8
> --- /dev/null
> +++ b/drivers/crypto/aspeed/aspeed-hace.c

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
> +	hace_dev->yclk = devm_clk_get(&pdev->dev, "yclk");
> +	if (IS_ERR(hace_dev->yclk)) {
> +		dev_err(&pdev->dev, "Failed to get yclk\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = clk_prepare_enable(hace_dev->yclk);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to enable clock 0x%x\n", rc);
> +		return rc;

This is not undone, neither if an error occures after it, nor in the 
.remove function.

> +	}
> +
> +	hash_engine->ahash_src_addr =
> +		dma_alloc_coherent(&pdev->dev,
> +				   ASPEED_HASH_SRC_DMA_BUF_LEN,
> +				   &hash_engine->ahash_src_dma_addr,
> +				   GFP_KERNEL);
> +	if (!hash_engine->ahash_src_addr) {
> +		dev_err(&pdev->dev, "Failed to allocate dma buffer\n");
> +		return -ENOMEM;
> +	}

Same here, this si not undone in the .remove function.

> +
> +	rc = aspeed_hace_register(hace_dev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Failed to register hash alg, rc:0x%x\n", rc);

Is this really an error if finaly we continue and return 0 (success) at 
the end?

> +		rc = 0;
> +	}
> +
> +	dev_info(&pdev->dev, "ASPEED Crypto Accelerator successfully registered\n");
> +
> +	return rc;
> +}
> +
> +static int aspeed_hace_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_hace_dev *hace_dev = platform_get_drvdata(pdev);
> +	struct aspeed_engine_hash *hash_engine = &hace_dev->hash_engine;
> +
> +	aspeed_hace_unregister(hace_dev);

Should this be done even if aspeed_hace_register() failed in the probe?

Just my 2c,
CJ


> +
> +	tasklet_kill(&hash_engine->done_task);
> +	tasklet_kill(&hash_engine->queue_task);
> +
> +	return 0;
> +}
> +

[...]
