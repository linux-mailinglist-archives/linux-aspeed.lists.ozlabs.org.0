Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84F2E9F3
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 03:00:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dq550QgyzDqGM
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 11:00:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UhutMmwV"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dq4z2dvlzDqGM
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 11:00:34 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 196so923452pgc.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 18:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vw6ROn6nwvHNofKrf/iVLUbmXE65pyhQ9L1aja1o048=;
 b=UhutMmwVItArx2/GzYypUcXt4iDc6LPvIFfXTMcS2OqrYkyVyeNbY7fFH97L81JqKD
 AdwGy2Kb1U+cnXt7el14YyV4uSE0oMVH3sgGYK03H8bzaQAH+gZjXrZNigu7tfbRqhkR
 XprvNjb8F5S1jMWzYhNQq/HfoQPzDcxCbky5YvN2gaSBy92j9YR+gPw6LWaXXTjfC7nW
 Vm4fzeTlI33Pc9J5IMIVjtKD2E6Pi5DFzaGIAkLHplikaPBfNdNZ7BS/qIjNM+JJa/l0
 jwKXRoZEib7GpYmjrDkm6MutcAoIeZKgQl3jENFLWfbJ6V07ZgnoIyB8gRsS6itjcDpb
 7Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vw6ROn6nwvHNofKrf/iVLUbmXE65pyhQ9L1aja1o048=;
 b=ibUhLT+rDQ98g9g1cXtdGrq/yJ4yJ7qxUEFpq1Z5EG2pQtqyL875k2o2cdU3tSySRv
 c9/SfSliPLkni/3MD6qEm0EhseiTmx3vzeNwkblsUDW47e0ek9CtOURkQdobIJvv5jYY
 dcv2Y/m3aaa7QniSu+V1NT6PfCG/yW41JdUPmO0VFCkgNmv2UD7jTzlB34pvvSX0g2cw
 aD6gH8VpoIMb29gLaUYkjuNugp6bbPuxoPARjmWdXY9aeb0BNJMtx5igHU1O2fJ25ACp
 J23YSSarUA+1w10/do67CzIfu87hgCnPyGW4shRIXGYWBN+wh0lNiuj3G3PEUYLn53Ex
 MwvA==
X-Gm-Message-State: APjAAAXk6aPsgnjoOWG6psiY7CsN+BJ9NTU+bTKbF3xt1biLL9wLSs6c
 hf3YbQURXdf47LjNSYyMzkg=
X-Google-Smtp-Source: APXvYqwfAEpkoaWJ+x7E3jJg0ppuKnN9XJnSt86gxW+B4emkQ2pXb2LYUqUiEGdYvZY2UxSFtg5MqA==
X-Received: by 2002:aa7:8d43:: with SMTP id s3mr671248pfe.5.1559178033031;
 Wed, 29 May 2019 18:00:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g8sm511268pgq.33.2019.05.29.18.00.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 18:00:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] hwmon: pmbus: Add Infineon PXE1610 VR driver
To: Vijay Khemka <vijaykhemka@fb.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190529223511.4059120-1-vijaykhemka@fb.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e72ae680-e8b7-455a-fdde-af79d429dd8c@roeck-us.net>
Date: Wed, 29 May 2019 18:00:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529223511.4059120-1-vijaykhemka@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sdasari@fb.com,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/29/19 3:35 PM, Vijay Khemka wrote:
> Added pmbus driver for the new device Infineon pxe1610
> voltage regulator. It also supports similar family device
> PXE1110 and PXM1310.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>   drivers/hwmon/pmbus/Kconfig   |   9 +++
>   drivers/hwmon/pmbus/Makefile  |   1 +
>   drivers/hwmon/pmbus/pxe1610.c | 119 ++++++++++++++++++++++++++++++++++
>   3 files changed, 129 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/pxe1610.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 30751eb9550a..338ef9b5a395 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -154,6 +154,15 @@ config SENSORS_MAX8688
>   	  This driver can also be built as a module. If so, the module will
>   	  be called max8688.
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
>   config SENSORS_TPS40422
>   	tristate "TI TPS40422"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 2219b9300316..b0fbd017a91a 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>   obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>   obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>   obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
> diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
> new file mode 100644
> index 000000000000..01e267944df5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/pxe1610.c
> @@ -0,0 +1,119 @@
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
> +/*
> + * Identify chip parameters.
> + */
> +static int pxe1610_identify(struct i2c_client *client,
> +			  struct pmbus_driver_info *info)

Please align continuation lines with '('.

> +{
> +	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
> +		int vout_mode;
> +
> +		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);

pmbus_read_byte_data() can return an error. Calling pmbus_check_byte_register()
doesn't really add any value here, since the second call can still fail,
which needs to be checked.

> +		switch (vout_mode & 0x1f) {
> +		case 1:
> +			info->vrm_version = vr12;
> +		break;

Alignment is off.

> +		case 2:
> +			info->vrm_version = vr13;
> +		break;

Same here.

> +		default:
> +			return -ENODEV;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int pxe1610_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> +				| I2C_FUNC_SMBUS_READ_WORD_DATA
> +				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	/* By default this device doesn't boot to page 0, so set page 0
> +	 * to access all pmbus registers.
> +	 */

Please use standard multi-line comments.

> +	i2c_smbus_write_byte_data(client, 0, 0);
> +

Please use the PMBUS_PAGE command definition.

I wonder if it would make sense to initialize currpage in the core to an unreasonable
number for multi-page chips, but I guess that is a different question.

> +	/* Read Manufacturer id */
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> +		return ret;
> +	}
> +	if (ret != 2 || strncmp(buf, "XP", strlen("XP"))) {

The strlen() is really unnecessary here. Just use 2 (and a define
for it if you like).

> +		dev_err(&client->dev, "MFR_ID unrecognised\n");

unrecognized. Oh well, turns out unrecognised is the British spelling and
just as valid, so feel free to keep it if you like.

> +		return -ENODEV;
> +	}
> +
> +	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->format[PSC_VOLTAGE_IN] = linear;
> +	info->format[PSC_VOLTAGE_OUT] = vid;
> +	info->format[PSC_CURRENT_IN] = linear;
> +	info->format[PSC_CURRENT_OUT] = linear;
> +	info->format[PSC_POWER] = linear;
> +	info->format[PSC_TEMPERATURE] = linear;
> +
> +	info->func[0] = PMBUS_HAVE_VIN
> +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
> +	info->func[1] = info->func[0];
> +	info->func[2] = info->func[0];
> +
> +	info->pages = id->driver_data;
> +	info->identify = pxe1610_identify;
> +

It doesn't really add value to initialize all these parameters manually.
I would suggest to use the approach from tps53679.c, ie have a static
structure and use devm_kmemdup() to pass a copy to pmbus_do_probe().

> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id pxe1610_id[] = {
> +	{"pxe1610", 3},
> +	{"pxe1110", 3},
> +	{"pxm1310", 3},

Unless there are chips with different page counts in the queue, using
driver_data to pass the number of pages does not add any value. Just
set num_pages to 3.

If you like, feel free to use a define instead of a constant.

> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, pxe1610_id);
> +
> +/* This is the driver that will be inserted */

This comment does not add any value.

> +static struct i2c_driver pxe1610_driver = {
> +	.driver = {
> +		   .name = "pxe1610",
> +		   },
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
> 

