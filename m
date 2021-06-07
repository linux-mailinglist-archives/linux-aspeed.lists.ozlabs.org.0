Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC239DFD4
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 16:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzGhF2H9Sz301v
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 00:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nuviainc-com.20150623.gappssmtp.com header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rggAUTyK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuviainc.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=graeme@nuviainc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nuviainc-com.20150623.gappssmtp.com
 header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rggAUTyK; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzGgf3hThz2yWG
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 00:57:32 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12952318wmh.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Jun 2021 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VlCXU9+MFpUy7SArdgNYI/tiU14CG8Xgo06o1Uxsr38=;
 b=rggAUTyKTufq+dvlwzacJo9pgOVEdDk5fs3Ote0eHa9Ikr22ppYaRz2a4Jb4/ToGE9
 pJkiZO7GFVstggttfUpKJid5MIj7MBT1ehm0kb1rXd+jJXGbHfBu1nJAIo31+xmCh7U/
 qb+/J8pqkPvJ6Ej8kejnhPDprATZqkAHu1JjTInwUK9LZVOHnCjoQltUVh0qxxonZAQc
 Fu0WUKtDF2ECtEiAb9FDHkz7hTvmHveDDsQt3NyItj3IsxEReE4aEjQ5lm5VTo+Zkzbu
 lzBFaZn6VV0tk1fhsqtHtys6OoAI3vchKxv3CWnDoo4Gf3/RInJRII3o9R4/UDEFbizy
 vVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VlCXU9+MFpUy7SArdgNYI/tiU14CG8Xgo06o1Uxsr38=;
 b=CgPeAzPbLjenI7QNBh57oy3Ae+G/bF0SC9o05W44ZBLFdxJpsb9JkwaeH47Vk0g5uh
 C8fK8W64Z2eXUXDxJiLIUX7cMZt3+Ykar9FlomcmWruRUdyOv68K7x21Tgn5KqxWO1LS
 2RVKJcmR2Gbtn05xYZT0w5W+KCLlPgDtz1Hmun98Zn6Uh3LcK357z96dwsIbC4bbbPIg
 PruURThf08WNuGrOSDpnh5sLApvQx075fXaFATraYt0u6uIekwIZbaDMe9dwToTx7fJN
 ztclkz3DcLfHHZObfamrtpg8bF8HCAlh4vr9xTC2yFd9utCnPFLD4EEAxJYJmPEqv/hP
 ag9Q==
X-Gm-Message-State: AOAM532jzrOfckilLeGAo+TqteXQDqTRdoGT6JG0aEZh/QMsBJzdg0hE
 EhKsGDEaZP/qTE2gG9XxKgYp4w==
X-Google-Smtp-Source: ABdhPJx6fGlVL5stxlu2ekuhuN/NXsWIomGXGgkt/9+9iT+k+wju9j4eewvseyJ0aY+TeXuGEd/cuQ==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr16901621wmk.54.1623077844897; 
 Mon, 07 Jun 2021 07:57:24 -0700 (PDT)
Received: from ggregory-linuxws ([2a02:8010:64d6:5343:6309:485e:2524:388a])
 by smtp.gmail.com with ESMTPSA id f14sm15953806wry.40.2021.06.07.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:57:24 -0700 (PDT)
Date: Mon, 7 Jun 2021 15:57:22 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Message-ID: <20210607145722.GA2682@ggregory-linuxws>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-6-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 02:49:32PM +0700, Quan Nguyen wrote:
> Slave i2c device on AST2500 received a lot of slave irq while it is
> busy processing the response. To handle this case, adds and exports
> aspeed_set_slave_busy() for controller to temporary stop slave irq
> while slave is handling the response, and re-enable them again when
> the response is ready.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
> 
>  drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index b2e9c8f0ddf7..9926d04831a2 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy)
> +{
> +	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
> +	unsigned long current_mask, flags;
> +
> +	spin_lock_irqsave(&bus->lock, flags);

This as far as I can see is still a recursive spinlock, and the spinlock
debugger seems to agree with me.

Graeme

> +
> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +	if (busy)
> +		current_mask &= ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH);
> +	else
> +		current_mask |= ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH;
> +	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +
> +	spin_unlock_irqrestore(&bus->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
> +#endif
> +
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>  {
>  	struct platform_device *pdev = to_platform_device(bus->dev);
> -- 
> 2.28.0
> 
