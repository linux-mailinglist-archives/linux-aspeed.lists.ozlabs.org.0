Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B6AA3D11
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2019 19:36:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KmqQ35zBzDr1j
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2019 03:36:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/XzB+Se"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KmqJ36cKzDr10
 for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2019 03:36:09 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id y1so3646208plp.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2019 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pafo73I1UbBRX8XwIZQylqQ4gK9txbwYzG4pKvHI3F8=;
 b=f/XzB+SeEsVRxFEknXHKYgibFNLpjaG/LE0MjGm3VLZ/Zx4lss9JzcDr/2nlg03iq2
 xpFRuoFL+ArKTHR2Ic3szIPLegOknO4mWolM+GdCzrVU4OBEsGiqW4rFjkIXH4cqyGDL
 ieLiEgR0SqVHWNkpusRL/q6UdVr5P8WNpNH0eVDZZyHnCdk1u9X/9GuPzEvkieTf4yzs
 AHtSS8HpN+o5mADp30NlUtg0hxe39Cin6Lyou6n4LWNAAHXNcpsSo61E+yLN2NQO6G21
 S3GIG4u2zdTtA9BZ8BWj3nWx1F1wvP5WXoWl5xWMVcFtLRwexcy+0ecGQVY91OXPZjof
 c93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pafo73I1UbBRX8XwIZQylqQ4gK9txbwYzG4pKvHI3F8=;
 b=Bqcug+S+8fFipMg1Dv1AbbJwRjYt38UcPLb3EyZl6vQZgwsS2ti5wvnwluOYT3FMVJ
 E3O8hZ/ltKSz3v886OxIZ+UJSaOXsq1bA8Z/5I7z0C/VFxBX3WYuvNHAWhjzuW5QQOCM
 s8CRSIVOvIEVEAdnefEUvkp1k+um678Sq0I+pxUwUlymaVIVYOOEuGFbyk/bshLf32xg
 VyAdpFe8HZDSCrjQa+gF4Lz97ApOj6iJUoh/K6JSYKhWCFt1z7NJ7cUnaMhbFJGw4+1N
 y2yI9cOWEn2ClggXjRE2gHfK09vgRKM6dFXBff2ZfyK/A45ePA6kJMPLHaRqxqsiMO/9
 1f5g==
X-Gm-Message-State: APjAAAVPI7pqUeKs+1vZ9srPvmSMU7U0T8FoWS6zvgS+5VvvtsyHFhwH
 aarj4+Ti30BKqQUMyatSlYs=
X-Google-Smtp-Source: APXvYqxpGugk/VQ+2edUg60V5g3B6e7BsglHIs5QrhYmn1FKo4djBUFftIpEWoFU+ny6R7+GZQawzg==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr16870589plb.23.1567186566135; 
 Fri, 30 Aug 2019 10:36:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r23sm8887772pfg.10.2019.08.30.10.36.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 10:36:04 -0700 (PDT)
Date: Fri, 30 Aug 2019 10:36:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 3/3] pmbus: ibm-cffps: Add support for version 2 of the PSU
Message-ID: <20190830173603.GA10472@roeck-us.net>
References: <1567181385-22129-1-git-send-email-eajames@linux.ibm.com>
 <1567181385-22129-4-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567181385-22129-4-git-send-email-eajames@linux.ibm.com>
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

On Fri, Aug 30, 2019 at 11:09:45AM -0500, Eddie James wrote:
> Version 2 of the PSU supports a second page of data and changes the
> format of the FW version. Use the devicetree binding to differentiate
> between the version the driver should use.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 109 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 87 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index ee2ee9e..ca26fbd 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -12,16 +12,20 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/pmbus.h>
>  
>  #include "pmbus.h"
>  
> +#define CFFPS_VERSIONS				2
> +

Any chance you can use an enum for the versions ? Using version
numbers 1/2 combined with array indices 0/1 is confusing, error
prone, and seems unnecessary.

Thanks,
Guenter

>  #define CFFPS_FRU_CMD				0x9A
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
> @@ -61,6 +65,7 @@ struct ibm_cffps_input_history {
>  };
>  
>  struct ibm_cffps {
> +	int version;
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
> +		case 1:
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
> +		case 2:
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
> +static struct pmbus_driver_info ibm_cffps_info[CFFPS_VERSIONS] = {
> +	[0] = {
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
> +	[1] = {
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
> @@ -346,13 +394,21 @@ static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
>  static int ibm_cffps_probe(struct i2c_client *client,
>  			   const struct i2c_device_id *id)
>  {
> -	int i, rc;
> +	int i, rc, vs;
>  	struct dentry *debugfs;
>  	struct dentry *ibm_cffps_dir;
>  	struct ibm_cffps *psu;
> +	const void *md = of_device_get_match_data(&client->dev);
> +
> +	if (md)
> +		vs = (int)md;
> +	else if (id)
> +		vs = (int)id->driver_data;
> +	else
> +		vs = 1;
>  
>  	client->dev.platform_data = &ibm_cffps_pdata;
> -	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
> +	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs - 1]);
>  	if (rc)
>  		return rc;
>  
> @@ -364,6 +420,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  	if (!psu)
>  		return 0;
>  
> +	psu->version = vs;
>  	psu->client = client;
>  	mutex_init(&psu->input_history.update_lock);
>  	psu->input_history.last_update = jiffies - HZ;
> @@ -406,12 +463,20 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  
>  static const struct i2c_device_id ibm_cffps_id[] = {
>  	{ "ibm_cffps1", 1 },
> +	{ "ibm_cffps2", 2 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
>  
>  static const struct of_device_id ibm_cffps_of_match[] = {
> -	{ .compatible = "ibm,cffps1" },
> +	{
> +		.compatible = "ibm,cffps1",
> +		.data = (void *)1
> +	},
> +	{
> +		.compatible = "ibm,cffps2",
> +		.data = (void *)2
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
> -- 
> 1.8.3.1
> 
