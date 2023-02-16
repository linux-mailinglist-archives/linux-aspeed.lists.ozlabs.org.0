Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8A69BF0D
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:48:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHjD5HfSz2xrD
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:48:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SNz8dv5z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=ben.dooks@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SNz8dv5z;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHdWd4N35z3cT4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 02:04:11 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id r28so1679947wra.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ4D1e7OsydChicX50RhYW35hCzCmSAMZsBfa+Xta+0=;
        b=SNz8dv5zMWNJuuPbgHGxQDPr/JPYIjY+/Yn3i8jbcWefLvGrtBBslS4YbYeD18sYar
         3vHRciM2MR8NfSDR+NgRzxZ9elZcLE6bzJlPl0pVou0ce9bxWjQjBVTHf58S3N7KTAwf
         ci1Vzxpr3ceLWo7TBeqCnA+x6t/qW1MCN5RekRKn3XbHrZSiayRrVvZt3D0DVxEqOjyd
         zGWRRbL0UrxYQNcLBbJJhwmqlbCGfvtRQfsboU+PI+4Gdmfx9Ny5WQY4kWoSYUZE1r+E
         DELL42Q4JzyosvMCQZnmlXDmyRg0/GpntLP/kDYSynSi6H/9Ftbhp0LStArH8XAwloez
         81nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ4D1e7OsydChicX50RhYW35hCzCmSAMZsBfa+Xta+0=;
        b=lgczsJ9QVFuBeG4Wq3xuafNWgJ3js7jPK0QeKhMvK7fv2E4wV2Uz1gMJyXz8XqrTgz
         qu0XsrBFkr5UwTUc9NdvmAMu5FxIbDDm0mrGKpLhRBASogsu2xmsPXYC5sewBV+mXgG5
         +2xzqaS22E+Y5VZoSI7MXzxT70GiJodXly+o0m2Ii/HedcK9J/zznxuRn9hfvehb9NT9
         mlMyqv9+O6dlGe6ZQcqDxGgNlqdMT1aWC1S7ewJ3DfkfavUesMsWOZtzajptQhOqyob4
         /U4X0Wf9mZRG734QVWOBydJrh+1l5DovrCmEGh9BIgBY4wXD2+zxb3g49Gc6I5DD1VXN
         pgrQ==
X-Gm-Message-State: AO0yUKW1behn17Txiunu5Z+3Hb6wbAzkpVnzR7ROa0yWEuaEk6gcyM3B
	qKNTjWb6EuWbS9fPb5K7HWuoGA==
X-Google-Smtp-Source: AK7set8vMvgLkfVuOhbBQcIoMKcYBI3CyptMMUKw+8/IdahJJGKA/oBlPMJi1NauBsBuPE9BP4H+ig==
X-Received: by 2002:adf:f888:0:b0:2c3:e993:9d7d with SMTP id u8-20020adff888000000b002c3e9939d7dmr4733394wrp.30.1676559847439;
        Thu, 16 Feb 2023 07:04:07 -0800 (PST)
Received: from [10.35.4.184] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b002c5534db60bsm1714097wrm.71.2023.02.16.07.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:04:07 -0800 (PST)
Message-ID: <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
Date: Thu, 16 Feb 2023 15:04:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] i3c: dw: Add platform operations
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/02/2023 07:41, Jeremy Kerr wrote:
> The dw i3c core can be integrated into various SoC devices. Platforms
> that use this core may need a little configuration that is specific to
> that platform.
> 
> Add a little infrastructure to allow platform-specific behaviour: a bit
> of data on struct dw_i3c_master, and two hooks to the probe and init
> calls to enable this.
> 
> A future change will add new platform support that uses these hooks.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 42 +++++++++++++++++++++++++-----
>   1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d73d57362b3b..49b891449222 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -241,6 +241,17 @@ struct dw_i3c_master {
>   	char version[5];
>   	char type[5];
>   	u8 addrs[MAX_DEVS];
> +
> +	/* platform-specific data */
> +	const struct dw_i3c_platform_ops *platform_ops;
> +	union {
> +	} pdata;
> +
> +};
> +
> +struct dw_i3c_platform_ops {
> +	int (*probe)(struct dw_i3c_master *i3c, struct platform_device *pdev);
> +	int (*init)(struct dw_i3c_master *i3c);
>   };

Given the comment below having this and the main probe defined in a 
header so users can just call in and we don't have to change the
main code here every time someone comes up with their own
special way of handing this?

>   struct dw_i3c_i2c_dev_data {
> @@ -612,6 +623,12 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>   	u32 thld_ctrl;
>   	int ret;
>   
> +	if (master->platform_ops && master->platform_ops->init) {
> +		ret = master->platform_ops->init(master);
> +		if (ret)
> +			return ret;
> +	}

I'd rather have a "default" set of ops than have all this checking for
NULL pointers all over the place.

> +
>   	switch (bus->mode) {
>   	case I3C_BUS_MODE_MIXED_FAST:
>   	case I3C_BUS_MODE_MIXED_LIMITED:
> @@ -1128,8 +1145,15 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>   	.i2c_xfers = dw_i3c_master_i2c_xfers,
>   };
>   
> +static const struct of_device_id dw_i3c_master_of_match[] = {
> +	{ .compatible = "snps,dw-i3c-master-1.00a", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> +
>   static int dw_i3c_probe(struct platform_device *pdev)
>   {
> +	const struct of_device_id *match;
>   	struct dw_i3c_master *master;
>   	int ret, irq;
>   
> @@ -1181,6 +1205,18 @@ static int dw_i3c_probe(struct platform_device *pdev)
>   	master->maxdevs = ret >> 16;
>   	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>   
> +	/* match any platform-specific ops */
> +	match = of_match_node(dw_i3c_master_of_match, pdev->dev.of_node);
> +	if (match && match->data)
> +		master->platform_ops = match->data;

I'm sure there's a of_device_get_match_data() which would have
both removed hte need to move the match table around and the
call to of_match_node().

> +
> +	/* platform-specific probe */
> +	if (master->platform_ops && master->platform_ops->probe) {
> +		ret = master->platform_ops->probe(master, pdev);
> +		if (ret)
> +			goto err_assert_rst;
> +	}
> +
>   	ret = i3c_master_register(&master->base, &pdev->dev,
>   				  &dw_mipi_i3c_ops, false);
>   	if (ret)
> @@ -1213,12 +1249,6 @@ static int dw_i3c_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static const struct of_device_id dw_i3c_master_of_match[] = {
> -	{ .compatible = "snps,dw-i3c-master-1.00a", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> -
>   static struct platform_driver dw_i3c_driver = {
>   	.probe = dw_i3c_probe,
>   	.remove = dw_i3c_remove,

