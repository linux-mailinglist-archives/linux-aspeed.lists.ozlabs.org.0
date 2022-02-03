Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E663D4A864A
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 15:33:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqLkh4dZPz3bYs
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 01:33:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 619 seconds by postgrey-1.36 at boromir;
 Fri, 04 Feb 2022 01:33:28 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JqLkc1NZ6z2xt0
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Feb 2022 01:33:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A5A1FB;
 Thu,  3 Feb 2022 06:23:04 -0800 (PST)
Received: from [10.57.68.47] (unknown [10.57.68.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915293F774;
 Thu,  3 Feb 2022 06:23:03 -0800 (PST)
Message-ID: <f44d2e01-b6cb-5f22-f651-f4dd7ced166f@arm.com>
Date: Thu, 3 Feb 2022 14:22:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/3] firmware: Add boot information to sysfs
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
References: <20220203115344.267159-1-joel@jms.id.au>
 <20220203115344.267159-2-joel@jms.id.au>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220203115344.267159-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2022-02-03 11:53, Joel Stanley wrote:
> Machines often have firmware that perform some action before Linux is
> loaded. It's useful to know how this firmware is configured, so create a
> sysfs directory and some properties that a system can choose to expose
> to describe how the system was started.
> 
> Currently the intended use describes five files, relating to hardware
> root of trust configuration.
> 
> These properties are populated by platform code at startup. Using fixed
> values is suitable as the state that the system booted in will not
> change after firmware has handed over.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>   - Rewrite so properties are present in common code and are exposed based
>     on the is_visible callback.
>   - Use sysfs_emit
> ---
>   .../ABI/testing/sysfs-firmware-bootinfo       | 43 +++++++++
>   drivers/base/firmware.c                       | 90 +++++++++++++++++++
>   include/linux/firmware_bootinfo.h             | 22 +++++
>   3 files changed, 155 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-bootinfo
>   create mode 100644 include/linux/firmware_bootinfo.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-bootinfo b/Documentation/ABI/testing/sysfs-firmware-bootinfo
> new file mode 100644
> index 000000000000..cd6c42316345
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-bootinfo
> @@ -0,0 +1,43 @@
> +What:		/sys/firmware/bootinfo/*
> +Date:		Jan 2022
> +Description:
> +		A system can expose information about how it was started in
> +		this directory.
> +
> +		This information is agnostic as to the firmware implementation.
> +
> +		A system may expose a subset of these properties as applicable.
> +
> +
> +What:		/sys/firmware/bootinfo/secure_boot
> +Date:		Jan 2022
> +Description:
> +		Indicates the system was started with secure boot enabled in
> +		the firmware.
> +
> +
> +What:		/sys/firmware/bootinfo/abr_image
> +Date:		Jan 2022
> +Description:
> +		Indicates the system was started from the alternate image
> +		loaded from an Alternate Boot Region. Often this is a result of
> +		the primary firmware image failing to start the system.
> +
> +
> +What:		/sys/firmware/bootinfo/low_security_key
> +Date:		Jan 2022
> +Description:
> +		Indicates the system's secure boot was verified with a low
> +		security or development key.
> +
> +What:		/sys/firmware/bootinfo/otp_protected
> +Date:		Jan 2022
> +Description:
> +		Indicates the system's boot configuration region is write
> +		protected and cannot be modified.
> +
> +What:		/sys/firmware/bootinfo/uart_boot
> +Date:		Jan 2022
> +Description:
> +		Indicates the system firmware was loaded from a UART instead of
> +		an internal boot device.

I'd be concerned about how well details like "uart_boot" and "abr_image" 
scale beyond one SoC family from one vendor. The combinatorial explosion 
of possible boot configurations across Linux-capable SoCs and firmware 
in general is larger than I'd care to imagine, even before considering 
that the nuances don't necessarily stop there - e.g. whether a given 
storage interface is hard-wired or user-accessible is not a fixed 
property on many SoCs, and even a socketed SD card might be "trusted" if 
a board is deployed in a product with a sealed enclosure.

Cheers,
Robin.

> diff --git a/drivers/base/firmware.c b/drivers/base/firmware.c
> index 8dff940e0db9..24b931232eb2 100644
> --- a/drivers/base/firmware.c
> +++ b/drivers/base/firmware.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/init.h>
>   #include <linux/device.h>
> +#include <linux/firmware_bootinfo.h>
>   
>   #include "base.h"
>   
> @@ -24,3 +25,92 @@ int __init firmware_init(void)
>   		return -ENOMEM;
>   	return 0;
>   }
> +
> +/*
> + * Exposes attributes documented in Documentation/ABI/testing/sysfs-firmware-bootinfo
> + */
> +static struct bootinfo bootinfo;
> +
> +static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bootinfo.abr_image.val);
> +}
> +static DEVICE_ATTR_RO(abr_image);
> +
> +static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bootinfo.low_security_key.val);
> +}
> +static DEVICE_ATTR_RO(low_security_key);
> +
> +static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bootinfo.otp_protected.val);
> +}
> +static DEVICE_ATTR_RO(otp_protected);
> +
> +static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bootinfo.secure_boot.val);
> +}
> +static DEVICE_ATTR_RO(secure_boot);
> +
> +static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bootinfo.uart_boot.val);
> +}
> +static DEVICE_ATTR_RO(uart_boot);
> +
> +#define ATTR_ENABLED(a) ((attr == &dev_attr_##a.attr) && bootinfo.a.en)
> +
> +static umode_t bootinfo_attr_mode(struct kobject *kobj, struct attribute *attr, int index)
> +{
> +	if (ATTR_ENABLED(abr_image))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(otp_protected))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(low_security_key))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(otp_protected))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(low_security_key))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(secure_boot))
> +		return 0444;
> +
> +	if (ATTR_ENABLED(uart_boot))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static struct attribute *bootinfo_attrs[] = {
> +	&dev_attr_abr_image.attr,
> +	&dev_attr_low_security_key.attr,
> +	&dev_attr_otp_protected.attr,
> +	&dev_attr_secure_boot.attr,
> +	&dev_attr_uart_boot.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group bootinfo_attr_group = {
> +	.attrs = bootinfo_attrs,
> +	.is_visible = bootinfo_attr_mode,
> +};
> +
> +int __init firmware_bootinfo_init(struct bootinfo *bootinfo_init)
> +{
> +	struct kobject *kobj = kobject_create_and_add("bootinfo", firmware_kobj);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	memcpy(&bootinfo, bootinfo_init, sizeof(bootinfo));
> +
> +	return sysfs_create_group(kobj, &bootinfo_attr_group);
> +}
> +EXPORT_SYMBOL_GPL(firmware_bootinfo_init);
> diff --git a/include/linux/firmware_bootinfo.h b/include/linux/firmware_bootinfo.h
> new file mode 100644
> index 000000000000..3fe630b061b9
> --- /dev/null
> +++ b/include/linux/firmware_bootinfo.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright 2022 IBM Corp. */
> +
> +#include <linux/sysfs.h>
> +#include <linux/init.h>
> +
> +#define BOOTINFO_SET(b, n, v) b.n.en = true; b.n.val = v
> +
> +struct bootinfo_entry {
> +	bool en;
> +	bool val;
> +};
> +
> +struct bootinfo {
> +	struct bootinfo_entry abr_image;
> +	struct bootinfo_entry low_security_key;
> +	struct bootinfo_entry otp_protected;
> +	struct bootinfo_entry secure_boot;
> +	struct bootinfo_entry uart_boot;
> +};
> +
> +int __init firmware_bootinfo_init(struct bootinfo *bootinfo_init);
