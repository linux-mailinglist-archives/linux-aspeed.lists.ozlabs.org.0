Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AE7831B6
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Aug 2023 22:07:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Js9AA4MZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV3Rq0kb7z3bTn
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 06:07:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Js9AA4MZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 2251 seconds by postgrey-1.37 at boromir; Tue, 22 Aug 2023 06:07:25 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV3Rd4xRWz2xrD
	for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Aug 2023 06:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=580Z0I15XQ014kRTgw5NCRR9DpeFoKg96Ka6fGXGnO0=; b=Js9AA4MZQ5/Va6EBvy0h4fzdJc
	xrmcAfZVtdHtEdxFefdy+dtffmc74atdry6uMG1JKY13UaLvsrUzGlOAS7TlzAZsSjxM/kgHGRk02
	Cm/yp+hOtMlsr097Ns6Itxsj5rUQ+2Te2fC+f7q7MRINVLKDgoKgXvDTTub7ROOEt5cw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qYAam-004iY4-2E; Mon, 21 Aug 2023 21:29:36 +0200
Date: Mon, 21 Aug 2023 21:29:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] soc/aspeed: Add host side BMC device driver
Message-ID: <5159abb8-1b4c-4576-b370-4dd9db142beb@lunn.ch>
References: <20230821183525.3427144-1-ninad@linux.ibm.com>
 <20230821183525.3427144-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821183525.3427144-2-ninad@linux.ibm.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Testing:
>   - This is tested on IBM rainier system with BMC. It requires BMC side
>     BMC device driver which is available in the ASPEED's 5.15 SDK
>     kernel.

How relevant is that? To the host side, it just appears to be an
16550A. Is the SDK emulating an 16550A? If you where to use a
different kernel, is it still guaranteed to be an 16550A? I also
notice there is a mainline
drivers/tty/serial/8250/8250_aspeed_vuart.c. Could that be used on the
BMC? That would be a better testing target than the vendor kernel.

> +config ASPEED_HOST_BMC_DEV
> +	bool "ASPEED SoC Host BMC device driver"
> +	default ARCH_ASPEED
> +	select SOC_BUS
> +	default ARCH_ASPEED

same default twice?

> +static int __init aspeed_host_bmc_device_init(void)
> +{
> +	int ret;
> +
> +	/* register pci driver */
> +	ret = pci_register_driver(&aspeed_host_bmc_dev_driver);
> +	if (ret < 0) {
> +		pr_err("pci-driver: can't register pci driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +}
> +
> +static void aspeed_host_bmc_device_exit(void)
> +{
> +	/* unregister pci driver */
> +	pci_unregister_driver(&aspeed_host_bmc_dev_driver);
> +}
> +
> +late_initcall(aspeed_host_bmc_device_init);
> +module_exit(aspeed_host_bmc_device_exit);

It looks like you can use module_pci_driver() ?
