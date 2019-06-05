Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7E365E7
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:47:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K17N5YSczDqXY
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2019 06:47:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c5zJZ28h"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K17D3d00zDqX2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2019 06:47:04 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 20so13063691pgr.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pf7vPUzXpmgu5ei4EbOnej2WlhVpMVJ8oO94zCYVA9Y=;
 b=c5zJZ28hntFAhYITAkzJjEVb/JbeG1+VN1xcgeFdtlNZwxPdicl0NzqXYqwEu4SFD7
 mjC/oROFVvkT/sIgcvkF2QtDjy5JwHcsFuJrsIz3p/Hz6lrelpQLrI2Rn3iwFbIVDYYv
 lOeX63ILGjtYPu4janob7FQyJjcm7RVyOPfAd2pWrCHRlzZS7GWUinrWpFL+vF1BBZ2O
 4imux6ak5VkGp6p8WMBi65H3ty1UqOnC8ffScgg3JyXs07DfesS0XXxTkKDFILNB/2/A
 rX71Tx/howsUFlshYoKl9xWRUHoC4iizLDaOu46A9ymWXfpHKbf1+OdiU4rvZlowg7fz
 cK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pf7vPUzXpmgu5ei4EbOnej2WlhVpMVJ8oO94zCYVA9Y=;
 b=LhKcDXQ5pXoitVT2qQhAutNEj/5HnxmRr/xX08sNB65bFzzPYvWpyzdPj2ISBgFsT9
 +z2C2O/wYHX/IZWXG3jKPpK8dhzrrTQmnqdU1yr0+8TjHvtzCi6vd0wYWxWfAHFA9PNr
 fAH6q67iqveafszmvo1EZ6YDsNVvHKk2cJS/jkY3QZDlAlMmBdFsf9BJcmHLm1S5+08t
 oJoENUJQlbTjIgq6f0e7ZvKjSVmWKRLtU8jf4kPjcmmLQrFYmh5yVPHXs57HLdZvfOJx
 hOlq+9U6b73APPCgTr21mnwnq6vl5R/1IImK+e3p++14a/oCkRN6QaoIOyDDGBK5/x7a
 rbzQ==
X-Gm-Message-State: APjAAAXZrMf2K1Pay8XlxFS9R6Tf/1dmF37TmkI+iWbpDLCm375vTYaO
 hSBNKAhRslmQQJGjyYFL7vo=
X-Google-Smtp-Source: APXvYqwKpoprMbfDbxnxKrHvF6PC2uoXfdniniHVdUn8GZPManC7NmfAiGrJRFJD+7K3w3fw2afeDg==
X-Received: by 2002:a65:5684:: with SMTP id v4mr934114pgs.160.1559767621254;
 Wed, 05 Jun 2019 13:47:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n1sm22150021pgv.15.2019.06.05.13.47.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 13:47:00 -0700 (PDT)
Date: Wed, 5 Jun 2019 13:46:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2 1/2] hwmon: pmbus: Add Infineon PXE1610 VR driver
Message-ID: <20190605204659.GA32329@roeck-us.net>
References: <20190530231159.222188-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530231159.222188-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 sdasari@fb.com, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 04:11:56PM -0700, Vijay Khemka wrote:
> Added pmbus driver for the new device Infineon pxe1610
> voltage regulator. It also supports similar family device
> PXE1110 and PXM1310.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> incorporated all the feedback from Guenter Roeck <linux@roeck-us.net>
> 
>  drivers/hwmon/pmbus/Kconfig   |   9 +++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/pxe1610.c | 139 ++++++++++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/pxe1610.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 30751eb9550a..338ef9b5a395 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -154,6 +154,15 @@ config SENSORS_MAX8688
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max8688.
>  
> +config SENSORS_PXE1610
> +	tristate "Infineon PXE1610"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  PXE1610.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called pxe1610.
> +
>  config SENSORS_TPS40422
>  	tristate "TI TPS40422"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 2219b9300316..b0fbd017a91a 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
> diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
> new file mode 100644
> index 000000000000..ebe3f023f840
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/pxe1610.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon PXE1610
> + *
> + * Copyright (c) 2019 Facebook Inc
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define PXE1610_NUM_PAGES 3
> +
> +/* Identify chip parameters. */
> +static int pxe1610_identify(struct i2c_client *client,
> +			     struct pmbus_driver_info *info)
> +{
> +	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
> +		u8 vout_mode;
> +		int ret;
> +
> +		/* Read the register with VOUT scaling value.*/
> +		ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +		if (ret < 0)
> +			return ret;
> +
> +		vout_mode = ret & GENMASK(4, 0);
> +
> +		switch (vout_mode) {
> +		case 1:
> +			info->vrm_version = vr12;
> +			break;
> +		case 2:
> +			info->vrm_version = vr13;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info pxe1610_info = {
> +	.pages = PXE1610_NUM_PAGES,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN
> +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.func[1] = PMBUS_HAVE_VIN
> +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.func[2] = PMBUS_HAVE_VIN
> +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.identify = pxe1610_identify,
> +};
> +
> +static int pxe1610_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	if (!i2c_check_functionality(
> +			client->adapter,
> +			I2C_FUNC_SMBUS_READ_BYTE_DATA
> +			| I2C_FUNC_SMBUS_READ_WORD_DATA
> +			| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	/*
> +	 * By default this device doesn't boot to page 0, so set page 0
> +	 * to access all pmbus registers.
> +	 */
> +	i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +
> +	/* Read Manufacturer id */
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> +		return ret;
> +	}
> +	if (ret != 2 || strncmp(buf, "XP", 2)) {
> +		dev_err(&client->dev, "MFR_ID unrecognized\n");
> +		return -ENODEV;
> +	}
> +
> +	info = devm_kmemdup(&client->dev, &pxe1610_info,
> +			    sizeof(struct pmbus_driver_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id pxe1610_id[] = {
> +	{"pxe1610", 0},
> +	{"pxe1110", 0},
> +	{"pxm1310", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, pxe1610_id);
> +
> +static struct i2c_driver pxe1610_driver = {
> +	.driver = {
> +			.name = "pxe1610",
> +			},
> +	.probe = pxe1610_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = pxe1610_id,
> +};
> +
> +module_i2c_driver(pxe1610_driver);
> +
> +MODULE_AUTHOR("Vijay Khemka <vijaykhemka@fb.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon PXE1610, PXE1110 and PXM1310");
> +MODULE_LICENSE("GPL");
