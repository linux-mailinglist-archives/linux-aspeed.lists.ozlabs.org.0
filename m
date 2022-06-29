Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCE55FFFE
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 14:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY1DL3LnHz3cgK
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 22:36:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8o1gvCH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=clabbe.montjoie@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8o1gvCH;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY1DG5jqwz3bsB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 22:36:28 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 189so8808262wmz.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DT+Hg4MXkKGN3iF9yrZOwKd7X9E+dCZfidIy8wnPVhs=;
        b=F8o1gvCHUO0AaSUw95FBfODVx1rKjGucblSlLnK9kzaYfE4z45hG7/Q/0KjOurXk7k
         Z70esZYM27OhUOpxpekDkWnIItmpXDhFpQWwzMoeE0IBXwAC9ybEhCSq8q93QYitDjWK
         zgR4KYeevxyii1mwwruDTmr820y2WMFmVm43a6vTqkK1gI+CHQR0yidq+jmyqYIuY7nz
         8cRigmOgNQB5dVOh5+9QQPMh60cfzuHbfmuguEKDD5O8fBQ7MrH/cWNHZsYfGhbh3owv
         bEtgGvWqCJDRDrN2FskGip5MmzN9dyyDEw8ezYCegOSw94JvExbdz76QyIJ+Dbr2kKkA
         jneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DT+Hg4MXkKGN3iF9yrZOwKd7X9E+dCZfidIy8wnPVhs=;
        b=UpRoawKMNoFNwdfDddosTfwBprWBpIjqmpkG8LaaYZyAzQzoZ52R71WEp8lXJSYiPC
         kLDWexol8AZMIx255FL+0sGSM7gHWxJ9W9YXGlbLTbGEgrPhVXCtOXXIkfeFJZZBbEf1
         rpIMiif/2vAF735jTnmd+xpMsLU1iwf4rpd4Os4Spkc19tVOKwl7npptPfJ/p/Y6+nvg
         1E4Ujy/iAgp4XZ9DVO04Lfhu5vl3Er+QTLwWakUdOW6N+12C0MPz7Gm0tcwxVVrFKlE4
         8CWdMPrecdyYO7U/owdQd2ND7ygNirZ//pVsQsyx36L36Oj9ql4SbjdQPToaJqTohxba
         VS0Q==
X-Gm-Message-State: AJIora/FleOC6gjs1k92ArRGggJux/7+/Ct2MXr7Kn3NkgDc87fmDvGo
	WoDlKI75/RxQKZmq95CtJ80=
X-Google-Smtp-Source: AGRyM1tT3S6YJDUvU9N/m4Ujal72KTiL/+4qd507Qh2/vNqbs55SHP32TF7gvAP8aAEBEsqXzAaQ6g==
X-Received: by 2002:a7b:c003:0:b0:39c:5642:e415 with SMTP id c3-20020a7bc003000000b0039c5642e415mr5312894wmb.111.1656506183225;
        Wed, 29 Jun 2022 05:36:23 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm16658872wru.47.2022.06.29.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 05:36:22 -0700 (PDT)
Date: Wed, 29 Jun 2022 14:36:20 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v6 1/5] crypto: aspeed: Add HACE hash driver
Message-ID: <YrxHRMoMYW+QDSnd@Red>
References: <20220629094426.1930589-1-neal_liu@aspeedtech.com>
 <20220629094426.1930589-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629094426.1930589-2-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, Randy Dunlap <rdunlap@infradead.org>, Dhananjay Phadke <dhphadke@microsoft.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le Wed, Jun 29, 2022 at 05:44:22PM +0800, Neal Liu a écrit :
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

Hello

I have some minor comments below.

> +++ b/drivers/crypto/aspeed/aspeed-hace-hash.c
> @@ -0,0 +1,1428 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Aspeed Technology Inc.
> + */
> +
> +#include "aspeed-hace.h"
> +
> +#ifdef ASPEED_AHASH_DEBUG
> +#define AHASH_DBG(h, fmt, ...)	\
> +	dev_dbg((h)->dev, "%s() " fmt, __func__, ##__VA_ARGS__)
> +#else
> +#define AHASH_DBG(h, fmt, ...)	\
> +	((void)(h))
> +#endif

Hello why not direclty use dev_dbg ?
You will still need something to do to enable dev_dbg, so why force to add the need to re-compile it with ASPEED_AHASH_DEBUG ?


[...]

> +	if (dma_mapping_error(hace_dev->dev, rctx->digest_dma_addr)) {
> +		dev_warn(hace_dev->dev, "dma_map() rctx digest error\n");
> +		return -ENOMEM;
> +	}

An error displayed as warning.

[...]
> +	if (!sg_len) {
> +		dev_warn(hace_dev->dev, "dma_map_sg() src error\n");

Same here. In fact you have lot of error displayed as warning in the driver.

[...]
> +/* Weak function for HACE hash */
> +void __weak aspeed_register_hace_hash_algs(struct aspeed_hace_dev *hace_dev)
> +{
> +	pr_warn("%s: Not supported yet\n", __func__);
> +}
> +
> +void __weak aspeed_unregister_hace_hash_algs(struct aspeed_hace_dev *hace_dev)
> +{
> +	pr_warn("%s: Not supported yet\n", __func__);
> +}

Why not use dev_warn ?


[...]

> +struct aspeed_sg_list {
> +	u32 len;
> +	u32 phy_addr;
> +};

Since it is a descriptor where all member are written with cpu_to_le32(), it should be __le32.

Regards
