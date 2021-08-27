Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5E3F9FAF
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Aug 2021 21:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx8T4286gz2ywY
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Aug 2021 05:11:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=LQBqohKi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=LQBqohKi; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx8Sz0yTgz2xZB
 for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Aug 2021 05:11:14 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id j1so5176639pjv.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Aug 2021 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yl8JaGwDYWpLzn1wS9SWOQbcJPOi0ZPRWqv06q6Qt74=;
 b=LQBqohKiZF1hUQMSKbFutNRYNB2ZNBVrhxEGrV1/8QVmiiiwLqYpSys8ZACniFIdH4
 xM7xdYhXcyegGoPyE3+qtuehpOFqNA9gFUXKXAZxnyBlokhrZBx7v8e2Z3A1rAWhrbl7
 R3Ce4Ww+tmlx/5NmV8nIRwz0kvJpH70SjEOHC0z0zsUh5vi4iEK2ZdFwLHc6XCKTosnr
 avjP30EP8hNygZms28yK8TAHbPcuQi3xyn8YVpSapvous8V0ILQ+MCQDC/GgUrWRJ4Ca
 SkB39+e/WmHAULwChUJz/Q05W1pMC7ddj20rj/H7iZmu4pJdHZu9gx6J4FFy/j6yRrId
 WjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yl8JaGwDYWpLzn1wS9SWOQbcJPOi0ZPRWqv06q6Qt74=;
 b=Bnu6YvUv1TPjT5hwZ502ASJnFqRSrS2b8EV3kLuBIf+Hn6xY7fwVHuLpTOmxsw9i8k
 6S94TyKM/sTKPESLJamUFH9V77suN1hJPNlpsu/AMZEDn5mAEjt2Pz4FKWog1wNaW3no
 BMxk+tgFMDrH9PbTDMxUmDJNS0P78al9CnyL3TxCyK6AZQkv83/Zhl0PaBNxFNw84xsE
 ePOjGtLNIrOH+RBwdtqJxzKElC3aMfU5CGKLeGudQNAs97sO2YMKodLEK4KfNeQ77gAq
 tSMk4K9IyWGrHqlLHX2Mn6I3YF1kdW5DrLTTaki36lJj+J09nFqBRSYNtRViQoEw51yx
 OaKg==
X-Gm-Message-State: AOAM533BKmqygPgfxgaXphzLYFDyekD2qCTi2ModGfv5uitG+gYIj3cl
 VYSlAXDDxRdPHWzW0drGFT67fws24DpnyJYlFMN45A==
X-Google-Smtp-Source: ABdhPJxPpy9zsWh8K3XJaMk4z9lCRsqU/ns24+nAno2osjLNoWIhEDfFvosicD/8oRBRu6WenkwxjYSnfuhYhnlHAWs=
X-Received: by 2002:a17:90a:1991:: with SMTP id
 17mr15779481pji.149.1630091471578; 
 Fri, 27 Aug 2021 12:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-10-iwona.winiarska@intel.com>
In-Reply-To: <20210803113134.2262882-10-iwona.winiarska@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 27 Aug 2021 12:11:00 -0700
Message-ID: <CAPcyv4hhtTi+dKspjoamYj53GxT4Ot_1pG5-eavUJdihD8iAEg@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] peci: Add sysfs interface for PECI bus
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Zev Weiss <zweiss@equinix.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 X86 ML <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Device Tree <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>, David Muller <d.mueller@elsoft.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 3, 2021 at 4:35 AM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> PECI devices may not be discoverable at the time when PECI controller is
> being added (e.g. BMC can boot up when the Host system is still in S5).
> Since we currently don't have the capabilities to figure out the Host
> system state inside the PECI subsystem itself, we have to rely on
> userspace to do it for us.
>
> In the future, PECI subsystem may be expanded with mechanisms that allow
> us to avoid depending on userspace interaction (e.g. CPU presence could
> be detected using GPIO, and the information on whether it's discoverable
> could be obtained over IPMI).

Thanks for this detail.

> Unfortunately, those methods may ultimately not be available (support
> will vary from platform to platform), which means that we still need
> platform independent method triggered by userspace.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-peci | 16 +++++
>  drivers/peci/Makefile                    |  2 +-
>  drivers/peci/core.c                      |  3 +-
>  drivers/peci/device.c                    |  1 +
>  drivers/peci/internal.h                  |  5 ++
>  drivers/peci/sysfs.c                     | 82 ++++++++++++++++++++++++
>  6 files changed, 107 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
>  create mode 100644 drivers/peci/sysfs.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-peci b/Documentation/ABI/testing/sysfs-bus-peci
> new file mode 100644
> index 000000000000..56c2b2216bbd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-peci
> @@ -0,0 +1,16 @@
> +What:          /sys/bus/peci/rescan
> +Date:          July 2021
> +KernelVersion: 5.15
> +Contact:       Iwona Winiarska <iwona.winiarska@intel.com>
> +Description:
> +               Writing a non-zero value to this attribute will
> +               initiate scan for PECI devices on all PECI controllers
> +               in the system.
> +
> +What:          /sys/bus/peci/devices/<controller_id>-<device_addr>/remove
> +Date:          July 2021
> +KernelVersion: 5.15
> +Contact:       Iwona Winiarska <iwona.winiarska@intel.com>
> +Description:
> +               Writing a non-zero value to this attribute will
> +               remove the PECI device and any of its children.
> diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
> index c5f9d3fe21bb..917f689e147a 100644
> --- a/drivers/peci/Makefile
> +++ b/drivers/peci/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  # Core functionality
> -peci-y := core.o request.o device.o
> +peci-y := core.o request.o device.o sysfs.o
>  obj-$(CONFIG_PECI) += peci.o
>
>  # Hardware specific bus drivers
> diff --git a/drivers/peci/core.c b/drivers/peci/core.c
> index d143f1a7fe98..c473acb3c2a0 100644
> --- a/drivers/peci/core.c
> +++ b/drivers/peci/core.c
> @@ -34,7 +34,7 @@ struct device_type peci_controller_type = {
>         .release        = peci_controller_dev_release,
>  };
>
> -static int peci_controller_scan_devices(struct peci_controller *controller)
> +int peci_controller_scan_devices(struct peci_controller *controller)
>  {
>         int ret;
>         u8 addr;
> @@ -159,6 +159,7 @@ EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, PECI);
>
>  struct bus_type peci_bus_type = {
>         .name           = "peci",
> +       .bus_groups     = peci_bus_groups,
>  };
>
>  static int __init peci_init(void)
> diff --git a/drivers/peci/device.c b/drivers/peci/device.c
> index 32811248997b..d77d9dabd51e 100644
> --- a/drivers/peci/device.c
> +++ b/drivers/peci/device.c
> @@ -110,5 +110,6 @@ static void peci_device_release(struct device *dev)
>  }
>
>  struct device_type peci_device_type = {
> +       .groups         = peci_device_groups,
>         .release        = peci_device_release,
>  };
> diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
> index 57d11a902c5d..978e12c8e1d3 100644
> --- a/drivers/peci/internal.h
> +++ b/drivers/peci/internal.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>
>  struct peci_controller;
> +struct attribute_group;
>  struct peci_device;
>  struct peci_request;
>
> @@ -19,12 +20,16 @@ struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u
>  void peci_request_free(struct peci_request *req);
>
>  extern struct device_type peci_device_type;
> +extern const struct attribute_group *peci_device_groups[];
>
>  int peci_device_create(struct peci_controller *controller, u8 addr);
>  void peci_device_destroy(struct peci_device *device);
>
>  extern struct bus_type peci_bus_type;
> +extern const struct attribute_group *peci_bus_groups[];

To me, sysfs.c is small enough to just fold into core.c, then no need
to declare public attribute arrays like this, but up to you if you
prefer the sysfs.c split.

>
>  extern struct device_type peci_controller_type;
>
> +int peci_controller_scan_devices(struct peci_controller *controller);
> +
>  #endif /* __PECI_INTERNAL_H */
> diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
> new file mode 100644
> index 000000000000..db9ef05776e3
> --- /dev/null
> +++ b/drivers/peci/sysfs.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2021 Intel Corporation
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/peci.h>
> +
> +#include "internal.h"
> +
> +static int rescan_controller(struct device *dev, void *data)
> +{
> +       if (dev->type != &peci_controller_type)
> +               return 0;
> +
> +       return peci_controller_scan_devices(to_peci_controller(dev));
> +}
> +
> +static ssize_t rescan_store(struct bus_type *bus, const char *buf, size_t count)
> +{
> +       bool res;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &res);
> +       if (ret)
> +               return ret;
> +
> +       if (!res)
> +               return count;
> +
> +       ret = bus_for_each_dev(&peci_bus_type, NULL, NULL, rescan_controller);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +static BUS_ATTR_WO(rescan);
> +
> +static struct attribute *peci_bus_attrs[] = {
> +       &bus_attr_rescan.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group peci_bus_group = {
> +       .attrs = peci_bus_attrs,
> +};
> +
> +const struct attribute_group *peci_bus_groups[] = {
> +       &peci_bus_group,
> +       NULL
> +};
> +
> +static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> +                           const char *buf, size_t count)
> +{
> +       struct peci_device *device = to_peci_device(dev);
> +       bool res;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &res);
> +       if (ret)
> +               return ret;
> +
> +       if (res && device_remove_file_self(dev, attr))
> +               peci_device_destroy(device);

How do you solve races between sysfs device remove and controller
device remove? Looks like double-free at first glance. Have a look at
the  kill_device() helper as one way to resolve this double-delete
race..

> +
> +       return count;
> +}
> +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0200, NULL, remove_store);
> +
> +static struct attribute *peci_device_attrs[] = {
> +       &dev_attr_remove.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group peci_device_group = {
> +       .attrs = peci_device_attrs,
> +};
> +
> +const struct attribute_group *peci_device_groups[] = {
> +       &peci_device_group,
> +       NULL
> +};
> --
> 2.31.1
>
