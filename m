Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02DA4504
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2019 17:28:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LKxV3gl6zDr3D
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Sep 2019 01:28:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VWRgtwud"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LKxG75QjzDr2k
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 Sep 2019 01:28:18 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 196so6450841pfz.8
 for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2019 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zzIDZ/Y3p8mE/YfP5L16dMWmiE8dYK2diKs+M4D4Cgc=;
 b=VWRgtwud29/jLxkWyt35yqG74YJ+cyqUHSWJ++dKjBJ96NRE15Gr7MU207xXof2hXl
 ZvYZ+qN3FJ+vmMWGGrJLOMCAHCynfJ0wV7wlk93DAk/nu5RaZUUs7p9mMbrtLLNm4slA
 2ZpF3n7qVqbcaBhD4MXwWax7PuXtIjdrGV6UKGcH3t48O0rmw1YMVW0qRUgOFcKKvhao
 helFewJdV/zHLrC6a+tFh4/O2hwXJe7VVgYsBEzvtl6dVCuFHHE3FD5JaqWBwGaBKEVr
 U+qmh9GVlmzdRFC5U5brqFFsSbXSUPFidcSVZlqEwbAme4m7x0LnVpOzLlEiOGcz5m5E
 yPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zzIDZ/Y3p8mE/YfP5L16dMWmiE8dYK2diKs+M4D4Cgc=;
 b=QyExNlnibEFFpwXnhP+Qj1sMRLVv+IM/yCbmwxsSz7FepCT3eudAaQl113kVL7fsBS
 lELh9PlvGuEK3qGVNaFHohtZSJV60qPcnhYhJHBOweqoIpiyfxC59Q4P2yW4tynu/Ko2
 6zCauP34RWVYOI4nvv/O99dyIPUaPrRjhohl5QsSsKVCxPkDZo+yhXoY/prDaXkhy6Cd
 lGsYBsyOE//e35KUoxfKSDuAXMtmLSYWCWVR4ygJwoZy9Rvdu6R99Ej081AEMdwEQCzO
 kvLsFWXa/4KvCBO16hs6RQ0a/7+Agq94j8g+lo3F1B1zbJ87/vyCzomUuhTnqXrUAq8Y
 wX3A==
X-Gm-Message-State: APjAAAWACrh9LZ1OM/KibJv4q9GABB6V/L2p9hZFfpk9NC9xe6WfhD5W
 IxiX3arMi1brESLOrmSY6AQ=
X-Google-Smtp-Source: APXvYqyAedlEYt09FSt6C+s32rSCfqEidrAj77ncA9rZ6m+ZCPnRSVQ2/hg/rkmSv4DjTtbdzRdk7Q==
X-Received: by 2002:a17:90a:1916:: with SMTP id
 22mr4476855pjg.62.1567265295363; 
 Sat, 31 Aug 2019 08:28:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a1sm7212452pgh.61.2019.08.31.08.28.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:28:14 -0700 (PDT)
Date: Sat, 31 Aug 2019 08:28:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] pmbus: ibm-cffps: Add support for version 2 of
 the PSU
Message-ID: <20190831152814.GA9950@roeck-us.net>
References: <1567192263-15065-1-git-send-email-eajames@linux.ibm.com>
 <1567192263-15065-4-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567192263-15065-4-git-send-email-eajames@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2019 at 02:11:03PM -0500, Eddie James wrote:
> Version 2 of the PSU supports a second page of data and changes the
> format of the FW version. Use the devicetree binding to differentiate
> between the version the driver should use.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Changes since v1:
>  - use an enum for the version instead of integers 1, 2, etc
> 
>  drivers/hwmon/pmbus/ibm-cffps.c | 110 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 88 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index ee2ee9e..d44745e 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -12,6 +12,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/pmbus.h>
>  
>  #include "pmbus.h"
> @@ -20,8 +21,9 @@
>  #define CFFPS_PN_CMD				0x9B
>  #define CFFPS_SN_CMD				0x9E
>  #define CFFPS_CCIN_CMD				0xBD
> -#define CFFPS_FW_CMD_START			0xFA
> -#define CFFPS_FW_NUM_BYTES			4
> +#define CFFPS_FW_CMD				0xFA
> +#define CFFPS1_FW_NUM_BYTES			4
> +#define CFFPS2_FW_NUM_WORDS			3
>  #define CFFPS_SYS_CONFIG_CMD			0xDA
>  
>  #define CFFPS_INPUT_HISTORY_CMD			0xD6
> @@ -52,6 +54,8 @@ enum {
>  	CFFPS_DEBUGFS_NUM_ENTRIES
>  };
>  
> +enum versions { cffps1, cffps2 };
> +
>  struct ibm_cffps_input_history {
>  	struct mutex update_lock;
>  	unsigned long last_update;
> @@ -61,6 +65,7 @@ struct ibm_cffps_input_history {
>  };
>  
>  struct ibm_cffps {
> +	enum versions version;
>  	struct i2c_client *client;
>  
>  	struct ibm_cffps_input_history input_history;
> @@ -132,6 +137,8 @@ static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
>  	struct ibm_cffps *psu = to_psu(idxp, idx);
>  	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
>  
> +	pmbus_set_page(psu->client, 0);
> +
>  	switch (idx) {
>  	case CFFPS_DEBUGFS_INPUT_HISTORY:
>  		return ibm_cffps_read_input_history(psu, buf, count, ppos);
> @@ -152,16 +159,36 @@ static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
>  		rc = snprintf(data, 5, "%04X", rc);
>  		goto done;
>  	case CFFPS_DEBUGFS_FW:
> -		for (i = 0; i < CFFPS_FW_NUM_BYTES; ++i) {
> -			rc = i2c_smbus_read_byte_data(psu->client,
> -						      CFFPS_FW_CMD_START + i);
> -			if (rc < 0)
> -				return rc;
> +		switch (psu->version) {
> +		case cffps1:
> +			for (i = 0; i < CFFPS1_FW_NUM_BYTES; ++i) {
> +				rc = i2c_smbus_read_byte_data(psu->client,
> +							      CFFPS_FW_CMD +
> +								i);
> +				if (rc < 0)
> +					return rc;
> +
> +				snprintf(&data[i * 2], 3, "%02X", rc);
> +			}
>  
> -			snprintf(&data[i * 2], 3, "%02X", rc);
> -		}
> +			rc = i * 2;
> +			break;
> +		case cffps2:
> +			for (i = 0; i < CFFPS2_FW_NUM_WORDS; ++i) {
> +				rc = i2c_smbus_read_word_data(psu->client,
> +							      CFFPS_FW_CMD +
> +								i);
> +				if (rc < 0)
> +					return rc;
> +
> +				snprintf(&data[i * 4], 5, "%04X", rc);
> +			}
>  
> -		rc = i * 2;
> +			rc = i * 4;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
>  		goto done;
>  	default:
>  		return -EINVAL;
> @@ -279,6 +306,8 @@ static void ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
>  			psu->led_state = CFFPS_LED_ON;
>  	}
>  
> +	pmbus_set_page(psu->client, 0);
> +
>  	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
>  				       psu->led_state);
>  	if (rc < 0)
> @@ -299,6 +328,8 @@ static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
>  	if (led_cdev->brightness == LED_OFF)
>  		return 0;
>  
> +	pmbus_set_page(psu->client, 0);
> +
>  	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
>  				       CFFPS_LED_BLINK);
>  	if (rc < 0)
> @@ -328,15 +359,32 @@ static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
>  		dev_warn(dev, "failed to register led class: %d\n", rc);
>  }
>  
> -static struct pmbus_driver_info ibm_cffps_info = {
> -	.pages = 1,
> -	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> -		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> -		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> -		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> -		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> -	.read_byte_data = ibm_cffps_read_byte_data,
> -	.read_word_data = ibm_cffps_read_word_data,
> +static struct pmbus_driver_info ibm_cffps_info[] = {
> +	[cffps1] = {
> +		.pages = 1,
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +			PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> +			PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +			PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
> +			PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_FAN12,
> +		.read_byte_data = ibm_cffps_read_byte_data,
> +		.read_word_data = ibm_cffps_read_word_data,
> +	},
> +	[cffps2] = {
> +		.pages = 2,
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +			PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> +			PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +			PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
> +			PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_STATUS_FAN12,
> +		.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +			PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT,
> +		.read_byte_data = ibm_cffps_read_byte_data,
> +		.read_word_data = ibm_cffps_read_word_data,
> +	},
>  };
>  
>  static struct pmbus_platform_data ibm_cffps_pdata = {
> @@ -347,12 +395,21 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  			   const struct i2c_device_id *id)
>  {
>  	int i, rc;
> +	enum versions vs;
>  	struct dentry *debugfs;
>  	struct dentry *ibm_cffps_dir;
>  	struct ibm_cffps *psu;
> +	const void *md = of_device_get_match_data(&client->dev);
> +
> +	if (md)
> +		vs = (enum versions)md;
> +	else if (id)
> +		vs = (enum versions)id->driver_data;
> +	else
> +		vs = cffps1;
>  
>  	client->dev.platform_data = &ibm_cffps_pdata;
> -	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
> +	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs]);
>  	if (rc)
>  		return rc;
>  
> @@ -364,6 +421,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  	if (!psu)
>  		return 0;
>  
> +	psu->version = vs;
>  	psu->client = client;
>  	mutex_init(&psu->input_history.update_lock);
>  	psu->input_history.last_update = jiffies - HZ;
> @@ -405,13 +463,21 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  }
>  
>  static const struct i2c_device_id ibm_cffps_id[] = {
> -	{ "ibm_cffps1", 1 },
> +	{ "ibm_cffps1", cffps1 },
> +	{ "ibm_cffps2", cffps2 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
>  
>  static const struct of_device_id ibm_cffps_of_match[] = {
> -	{ .compatible = "ibm,cffps1" },
> +	{
> +		.compatible = "ibm,cffps1",
> +		.data = (void *)cffps1
> +	},
> +	{
> +		.compatible = "ibm,cffps2",
> +		.data = (void *)cffps2
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
