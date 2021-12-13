Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BAA47384A
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Dec 2021 00:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCckk1brHz305B
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Dec 2021 10:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HChXMZ7f;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HChXMZ7f; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCckb0DQXz2yZh
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Dec 2021 10:13:24 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id j17so16898898qtx.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Dec 2021 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rm6fU+94SIYDw6kiSkSUR3+pZk6SD9v2+b8qifrz4VY=;
 b=HChXMZ7fDgzOvcMZE9CYbc9QGKjbFcI+EQSDArbVK8+F4AdqrFnu5T/2Td3irKLYpY
 rAsAstLj9kfKNTMZOii3HWVsAq59dV+2FRoGt4HMuhuL9SKgYxPfCPebSVztZrb49LYF
 MI+JFcm+rpVyPejGnw3GDhXW4cMAWjRHKDLFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rm6fU+94SIYDw6kiSkSUR3+pZk6SD9v2+b8qifrz4VY=;
 b=ioTyIq6Jb6p9EizQhX0p3xXKMRIMqFmYiaWxRUMQM4iH3TpBH2DwSpwISSgLSmk0cb
 eefZZ7m31CX43Wji85flmwAg+2IuhLqASuX0y2XwHjbU0mYvh3XkYHYXCu7R0zqlzusD
 4z50CemlI0DhaXpy4oghzT/0C4ZiHgb4Zd1NPfSvQAaOPlua3InQEuQ/J5/+1q9rF5n7
 ldwphQUzIRByHZrLorqicw6aCN0HA1m2BYV2IJYLJ+XbMsd0n3HRSbtVVU3h/fDz2Ida
 BdgfihimiDjnQWMb0Ai52BYPUJk6nppNDmLDYH6obVuxlxPKg3at+LWGfxFMu0ggQ2HC
 iSUg==
X-Gm-Message-State: AOAM531mmYXRBO3UB4KooGuflaPOFr5MZd8xGJfhU13fpYVicMPoRgeF
 KJYwJsDzEzUQZ0IqiNkw/nfBgpvKD1B/IAyPAHc=
X-Google-Smtp-Source: ABdhPJzKq8yZS7tDH5YvbyxM31CVgZLw5a1+CNXadyx+L9RU8i15HPjQY7CXAf1XHc0iz5gm4/AlyAAf7d28lnLxqm8=
X-Received: by 2002:a05:622a:588:: with SMTP id
 c8mr1786532qtb.108.1639437201372; 
 Mon, 13 Dec 2021 15:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20211207141722.440213-1-thierry.reding@gmail.com>
In-Reply-To: <20211207141722.440213-1-thierry.reding@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Dec 2021 23:12:55 +0000
Message-ID: <CACPK8XfKp1fDLjVPHb0bO-fi2JryOP5H6Jh1bmovt68Qne+D9Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Remove unused includes
To: Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 13 Dec 2021 at 22:22, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
> headers are used in the driver, so they can be removed.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Agreed, it looks like these were added in the initial commit and never used.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 67e8b97c0c95..771e53d3d197 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -16,8 +16,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> -#include <linux/irqchip/chained_irq.h>
> -#include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> --
> 2.33.1
>
