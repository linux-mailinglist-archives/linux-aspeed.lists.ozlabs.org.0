Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EB99A465
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 15:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ6ML3Bg4z3c47
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2024 00:06:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728651980;
	cv=none; b=VEBgHv0NpOcPgh0gf6A53Z5sv0VLJP8rlO8D2VyS3IjOaAOZ8Cvrds+0953s7X6rLEU7FR3Q4cfnjeIh4wUHDwTJnT5jl0s2iPNp1i2o6BWKYN50iqHetWlW2Xm4dNZkKlj8EKrRT9DEhtZ8AU97j6jdTY4ODpGJneU8/ht2IvenB4QTvGcDX1kfkkO4CGFB+sU6bsoqKkmtk6v/roz1SSpu2Cu2h79Jj8Diio2mlbfxvjDAXTj9F9dMNwGMISZPAh/L2uYHU8DWwqScNWtIgEeNH+sZqe1JKhfTaAQtJXjlAJz/4zaSf6tRT3eIwnG99e8OCOH8R7yDMz2u/MtTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728651980; c=relaxed/relaxed;
	bh=zCr37LXC8U2CQB6S8iXUVH+w4SrNi18E4HtRCwJJuJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN2YKXLY+6E6zG7Wz6HcOymA/ikj2IAodINPDlgxlYT5XMODU2PcsGAY2oIbhBdG7WtvlhQXNvpZrZqJK3pLlzkppvggBlkEvo+OGUoB8Ch0zSg0RKOXH1lTqBCDLZl20e6SneWyicjBS9rhbmFGjBzp3f2UHEw32cJAi31vFBmUJfSM9mFBa3rhZOLdTRZ6mxnwFIJymwFHeInVK7/XXeS7W6jzIlPKjeldcb5rWubaQIL6mz+K+QqQdNtYMab8LQoGsO1F+loojrwXIE2cSFjzSWcxlUEfg2wjHlNtc80IEqAGLD98CchdMs2eGe7YMqVBOpqvDaXJ7KJxgWut9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LevogPTv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LevogPTv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ6MG4GFCz3bxl
	for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2024 00:06:18 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43123368ea9so1667115e9.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2024 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728651970; x=1729256770; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCr37LXC8U2CQB6S8iXUVH+w4SrNi18E4HtRCwJJuJ8=;
        b=LevogPTvTA8a0iU5y60A64nXeu0p5ovw8oFYeOKyAsrBIZ8lQPw0jGQ++qXuwe2vLX
         S6IYUOo5Zc9MoBCuY9XfZbjHSxrD9D7t7qGER7oFF8vaxVq7Ej1j5uKCHGiH2C5d2sRQ
         P7jEVVq25Ujh5jSb3ed46XG3WgpUlAuy2yplcTv0Fk+an6UtVA8dP1yqv2HgIEFrcIae
         MfLJqfI/CygFJ7EN30bbgnpb8HHA/k3DmcQtaHnQR0nn1p8ZGBco79CSJsLULu1N8FKS
         I+Yo19mLTYjhP8R9QQeTZuIL7+MtkOqsEgaOdZ/IRk/DlMF3ehwUpW88HrAvdFSujiWO
         WgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651970; x=1729256770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCr37LXC8U2CQB6S8iXUVH+w4SrNi18E4HtRCwJJuJ8=;
        b=cUywdGjTpKkhnY4XLRFg5up+p+00YP9/6cKq6eZqPWj7ZAAaaJb8zSRCSZ4leSt6pE
         rHPyTnRnxY+X0O/95j36gk+vj4zC3YNi/60y9gICCKaOLNJwlBJT3Yma1aarnSWDBzYF
         Vyt+kGa6wG9mquoughMVgDfxbZwCozO0EVO8a4vMJDvnkQ9//InAshJZAkVhWLBcML9H
         6g0fwwSbTODDDYuQ1hYiFm5qRkyoh4WjryNyJZRHchBT74TQfTsAeAd9FtL9E4SnJVoQ
         DLsqPaZZndy97Za0yiDQlk/XfKZcOmvOG8gaITDaYJX7BIGJXYif9gfAaesCTvfj33cH
         4VaA==
X-Forwarded-Encrypted: i=1; AJvYcCVDFNiAlknGYzvVGAYjIOhIALmL3okQ6Ro22iwIyeJCyIO6ggK/oJqWSpREwuJd99UKPck0B426+74N0jM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEhofH6sBeMwx8xtp47C6iVfxRPxJ7/zHW+csmmzJ8NzEP9o5u
	rF4xD7QHrICTMxOPUZxtTzUMYhCvyG409k/VANWoIA8qOvRs/FQaRYYO8tH3uy0=
X-Google-Smtp-Source: AGHT+IGAa0EQAJZF+Lh7FUx2jhBZmgYnqQLqg9c45XbgMirrVdFpJCh5ZEZCWOekRRCzVbWbfunFNQ==
X-Received: by 2002:adf:ef11:0:b0:37d:3dfc:949c with SMTP id ffacd0b85a97d-37d552957eemr1640400f8f.41.1728651970538;
        Fri, 11 Oct 2024 06:06:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fdc2sm3910675f8f.88.2024.10.11.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:06:10 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:06:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Message-ID: <37525238-c9f8-4f0e-b4e5-4e2f05fab775@stanley.mountain>
References: <20241009115813.2908803-1-kevin_chen@aspeedtech.com>
 <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 09, 2024 at 07:58:13PM +0800, Kevin Chen wrote:
> +static int __init aspeed_intc_ic_of_init(struct device_node *node,
> +					 struct device_node *parent)
> +{
> +	struct aspeed_intc_ic *intc_ic;
> +	int ret = 0;
> +	int irq, i;
> +
> +	intc_ic = kzalloc(sizeof(*intc_ic), GFP_KERNEL);
> +	if (!intc_ic)
> +		return -ENOMEM;
> +
> +	intc_ic->base = of_iomap(node, 0);
> +	if (!intc_ic->base) {
> +		pr_err("Failed to iomap intc_ic base\n");
> +		ret = -ENOMEM;
> +		goto err_free_ic;
> +	}
> +	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
> +	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
> +
> +	intc_ic->irq_domain = irq_domain_add_linear(node, 32,
> +						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
> +	if (!intc_ic->irq_domain) {
> +		ret = -ENOMEM;
> +		goto err_iounmap;
> +	}
> +
> +	raw_spin_lock_init(&intc_ic->gic_lock);
> +	raw_spin_lock_init(&intc_ic->intc_lock);
> +
> +	/* Check all the irq numbers valid. If not, unmaps all the base and frees the data. */
> +	for (i = 0; i < of_irq_count(node); i++) {
> +		irq = irq_of_parse_and_map(node, i);
> +		if (!irq) {
> +			pr_err("Failed to get irq number\n");
> +			ret = -EINVAL;
> +			goto err_iounmap;
> +		}
> +	}
> +
> +	for (i = 0; i < of_irq_count(node); i++) {
> +		irq = irq_of_parse_and_map(node, i);
> +			irq_set_chained_handler_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);

There is an extra tab on this line.

regards,
dan carpenter

> +	}
> +
> +	return 0;


