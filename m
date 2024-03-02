Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACFD86F274
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Mar 2024 21:59:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UgMqkU+n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TnHPq3Jq8z3cLj
	for <lists+linux-aspeed@lfdr.de>; Sun,  3 Mar 2024 07:59:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UgMqkU+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TnHPj4CMfz3bfS
	for <linux-aspeed@lists.ozlabs.org>; Sun,  3 Mar 2024 07:59:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9470BCE0224;
	Sat,  2 Mar 2024 20:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485ABC433C7;
	Sat,  2 Mar 2024 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709413135;
	bh=o+tr4CCbud8uzLtDh5MolTBCwG3kPTB0Bhx8jY/shKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgMqkU+niNfrrsJKR325G2D+2tAy9twT34HdNKjDPPnzNigNMvu3vA2hb62A57nq0
	 PEMsKrj7r3EL2UOTajmaknqRQV/d2JCtFJ9pWYRVcF/57lRl/p8lzob7OmHi5mEfNC
	 4qrR2eTAghx7wO456Nvia8+/Eo8/UCKAhz4WW+Ok=
Date: Sat, 2 Mar 2024 21:58:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 03/14] serial: port: Introduce a common helper to read
 properties
Message-ID: <2024030259-playback-starlit-a472@gregkh>
References: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
 <20240226142514.1485246-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226142514.1485246-4-andriy.shevchenko@linux.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 04:19:19PM +0200, Andy Shevchenko wrote:
> Several serial drivers want to read the same or similar set of
> the port properties. Make a common helper for them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/serial_port.c | 134 +++++++++++++++++++++++++++++++
>  include/linux/serial_core.h      |   1 +
>  2 files changed, 135 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
> index 88975a4df306..ecc980e9dba6 100644
> --- a/drivers/tty/serial/serial_port.c
> +++ b/drivers/tty/serial/serial_port.c
> @@ -8,7 +8,10 @@
>  
>  #include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/serial_core.h>
>  #include <linux/spinlock.h>
>  
> @@ -82,6 +85,137 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
>  }
>  EXPORT_SYMBOL(uart_remove_one_port);
>  
> +/**
> + * uart_read_port_properties - read firmware properties of the given UART port

I like, but:

> + * @port: corresponding port
> + * @use_defaults: apply defaults (when %true) or validate the values (when %false)

Using random booleans in a function is horrid.  Every time you see the
function call, or want to call it, you need to go and look up what the
boolean is and means.

Make 2 public functions here, one that does it with use_defaults=true
and one =false and then have them both call this one static function,
that way the function names themselves are easy to read and understand
and maintain over time.

thanks,

greg k-h


> + *
> + * The following device properties are supported:
> + *   - clock-frequency (optional)
> + *   - fifo-size (optional)
> + *   - no-loopback-test (optional)
> + *   - reg-shift (defaults may apply)
> + *   - reg-offset (value may be validated)
> + *   - reg-io-width (defaults may apply or value may be validated)
> + *   - interrupts (OF only)
> + *   - serial [alias ID] (OF only)
> + *
> + * If the port->dev is of struct platform_device type the interrupt line
> + * will be retrieved via platform_get_irq() call against that device.
> + * Otherwise it will be assigned by fwnode_irq_get() call. In both cases
> + * the index 0 of the resource is used.
> + *
> + * The caller is responsible to initialize the following fields of the @port
> + *   ->dev (must be valid)
> + *   ->flags
> + *   ->mapbase
> + *   ->mapsize
> + *   ->regshift (if @use_defaults is false)
> + * before calling this function. Alternatively the above mentioned fields
> + * may be zeroed, in such case the only ones, that have associated properties
> + * found, will be set to the respective values.
> + *
> + * If no error happened, the ->irq, ->mapbase, ->mapsize will be altered.
> + * The ->iotype is always altered.
> + *
> + * When @use_defaults is true and the respective property is not found
> + * the following values will be applied:
> + *   ->regshift = 0
> + * In this case IRQ must be provided, otherwise an error will be returned.
> + *
> + * When @use_defaults is false and the respective property is found
> + * the following values will be validated:
> + *   - reg-io-width (->iotype)
> + *   - reg-offset (->mapsize against ->mapbase)
> + *
> + * Returns: 0 on success or negative errno on failure
> + */
> +int uart_read_port_properties(struct uart_port *port, bool use_defaults)
> +{
> +	struct device *dev = port->dev;
> +	u32 value;
> +	int ret;
> +
> +	/* Read optional UART functional clock frequency */
> +	device_property_read_u32(dev, "clock-frequency", &port->uartclk);
> +
> +	/* Read the registers alignment (default: 8-bit) */
> +	ret = device_property_read_u32(dev, "reg-shift", &value);
> +	if (ret)
> +		port->regshift = use_defaults ? 0 : port->regshift;
> +	else
> +		port->regshift = value;
> +
> +	/* Read the registers I/O access type (default: MMIO 8-bit) */
> +	ret = device_property_read_u32(dev, "reg-io-width", &value);
> +	if (ret) {
> +		port->iotype = UPIO_MEM;
> +	} else {
> +		switch (value) {
> +		case 1:
> +			port->iotype = UPIO_MEM;
> +			break;
> +		case 2:
> +			port->iotype = UPIO_MEM16;
> +			break;
> +		case 4:
> +			port->iotype = device_is_big_endian(dev) ? UPIO_MEM32BE : UPIO_MEM32;
> +			break;
> +		default:
> +			if (!use_defaults) {
> +				dev_err(dev, "Unsupported reg-io-width (%u)\n", value);
> +				return -EINVAL;
> +			}
> +			port->iotype = UPIO_UNKNOWN;
> +			break;
> +		}
> +	}
> +
> +	/* Read the address mapping base offset (default: no offset) */
> +	ret = device_property_read_u32(dev, "reg-offset", &value);
> +	if (ret)
> +		value = 0;
> +
> +	/* Check for shifted address mapping overflow */
> +	if (!use_defaults && port->mapsize < value) {
> +		dev_err(dev, "reg-offset %u exceeds region size %pa\n", value, &port->mapsize);
> +		return -EINVAL;
> +	}
> +
> +	port->mapbase += value;
> +	port->mapsize -= value;
> +
> +	/* Read optional FIFO size */
> +	device_property_read_u32(dev, "fifo-size", &port->fifosize);
> +
> +	if (device_property_read_bool(dev, "no-loopback-test"))
> +		port->flags |= UPF_SKIP_TEST;
> +
> +	/* Get index of serial line, if found in DT aliases */
> +	ret = of_alias_get_id(dev_of_node(dev), "serial");
> +	if (ret >= 0)
> +		port->line = ret;
> +
> +	if (dev_is_platform(dev))
> +		ret = platform_get_irq(to_platform_device(dev), 0);
> +	else
> +		ret = fwnode_irq_get(dev_fwnode(dev), 0);
> +	if (ret == -EPROBE_DEFER)
> +		return ret;
> +	if (ret > 0)
> +		port->irq = ret;
> +	else if (use_defaults)
> +		/* By default IRQ support is mandatory */
> +		return ret;
> +	else
> +		port->irq = 0;
> +
> +	port->flags |= UPF_SHARE_IRQ;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(uart_read_port_properties);

EXPORT_SYMBOL_GPL()?  I have to ask :)

thanks,

greg k-h
