Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E1613B5D
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Oct 2022 17:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Jc74zMyz2yHL
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Nov 2022 03:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SVnTcl1l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SVnTcl1l;
	dkim-atps=neutral
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Jc15qnnz2xBF
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Nov 2022 03:33:04 +1100 (AEDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-13be3ef361dso13985862fac.12
        for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Oct 2022 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRI+o3ilNy6BRglFYtPBCSjFHSotex4sZhj80mY7+B0=;
        b=SVnTcl1lpn+/Zo4KZExQ/xtmB3FX28WGvVRwEEmM6Y3UXVdM0216wEGIrQDVlrE3i6
         GkUUpddq2+YYaoFMAhlNlOi/+cJAeDbKWhWUaswhq6ToTVgg1iI+EtlZryDuiLzfW7Ex
         4JOZYW4yggUC3BKOfTGwrR0iP2Qk5z4fXwZ3UM1xGZD+LMT65s8Q7yxehkxMVHYrNrtz
         boaIBC4c7PUqZjGrnJjVtxrVIfeLmB0t0qcCAWFWQDiZT6f982KRMe/Bg2nMWOGwOuV/
         0lUKhMCp/NrLIAbpN1alBTuXkQzSydemuGwMRi3lgRSrCWBYOnU0Uuq3OdTKYX5+JP4N
         5HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRI+o3ilNy6BRglFYtPBCSjFHSotex4sZhj80mY7+B0=;
        b=EZC0TQTSyDSMJ0F4mECcWpsjtfOxE6N0GA+d2m2lWpHhuMCHaNeXlyAaZp0XQZ/jZt
         +2yK+LMD21u+YsqKjwWCXKgscFtBV96FXNLxJeUx+3ybY14ataIdXBRmbjliQqgplKGc
         pLGzBIjGO2FW5+F4v5kCta/W1/to1bestiTP52AnRwx+cITk367XfQr4aDlGsJPSGIAm
         G8IH8fL6jXa/ptt4r359D6DhSwuVmCqKdXITkmN8pOShc/ZmNBylbWR7Y8CbQKig5QFH
         tuRuC5cZitsBUDjNmhs0Tn4cjw5/L+hiV9BI2SmzIcNOLCUmDtNRsRJqBVnv5HpSLSqD
         b4jw==
X-Gm-Message-State: ACrzQf2UEWuyKcWbMxVqzSp5ha9kqfu5aP07785fsvcJ0hQYSk9DIs9d
	7LhLVtf4Ez+pxAIhd4ciRB0=
X-Google-Smtp-Source: AMsMyM6kBoxiwO1Uv/nlw9plsMsl+O0fwtUzFqGcwTVvhEfCG4duaw0GKD/w5pVjpjUH0wYosdkUVA==
X-Received: by 2002:a05:6870:8883:b0:13b:61ac:a5d4 with SMTP id m3-20020a056870888300b0013b61aca5d4mr7754751oam.75.1667233981127;
        Mon, 31 Oct 2022 09:33:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d17-20020a4aa591000000b004762a830156sm2491672oom.32.2022.10.31.09.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:33:00 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:32:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 3/3] hwmon: Add Aspeed ast2600 TACH support
Message-ID: <20221031163258.GC2462187@roeck-us.net>
References: <20221031103809.20225-1-billy_tsai@aspeedtech.com>
 <20221031103809.20225-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031103809.20225-4-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, garnermic@meta.com, jdelvare@suse.com, linux-aspeed@lists.ozlabs.org, linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 06:38:08PM +0800, Billy Tsai wrote:
> This patch add the support of Tachometer which can use to monitor the
> frequency of the input. The tach supports up to 16 channels and it's part
> function of multi-function device "pwm-tach controller".
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/hwmon/Kconfig               |   9 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/tach-aspeed-ast2600.c | 692 ++++++++++++++++++++++++++++

Please also provide Documentation/hwmon/tach-aspeed-ast2600.rst.

[ ... ]

> +	hwmon = devm_hwmon_device_register_with_groups(dev, "aspeed_tach", priv,
> +						       priv->groups);

Please use the new hwmon api (devm_hwmon_device_register_with_info).

> +	ret = PTR_ERR_OR_ZERO(hwmon);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register hwmon device\n");
> +		goto err_assert_reset;
> +	}
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +err_assert_reset:
> +	reset_control_assert(priv->reset);
> +err_disable_clk:
> +	clk_disable_unprepare(priv->clk);

You should be able to use devm_clk_get_enabled() to handle
the clock. If reset handling has to come first, you could use
devm_add_action_or_reset() for it. This way you would
not need the remove function, and error cleanup would
be much simplified.

Thanks,
Guenter

> +	return ret;
> +}
> +
> +static int aspeed_tach_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_tach_data *priv = platform_get_drvdata(pdev);
> +
> +	reset_control_assert(priv->reset);
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_stach_match_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-tach",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_stach_match_table);
> +
> +static struct platform_driver aspeed_tach_driver = {
> +	.probe		= aspeed_tach_probe,
> +	.remove		= aspeed_tach_remove,
> +	.driver		= {
> +		.name	= "aspeed_tach",
> +		.of_match_table = of_stach_match_table,
> +	},
> +};
> +
> +module_platform_driver(aspeed_tach_driver);
> +
> +MODULE_AUTHOR("Billy Tsai <billy_tsai@aspeedtech.com>");
> +MODULE_DESCRIPTION("Aspeed ast2600 TACH device driver");
> +MODULE_LICENSE("GPL v2");
> +
> -- 
> 2.25.1
> 
