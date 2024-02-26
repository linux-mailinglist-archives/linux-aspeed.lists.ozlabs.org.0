Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD47866947
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 05:13:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KMZ2d/Wu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjnKX1LGjz3cHC
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:13:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KMZ2d/Wu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjnKS0Nhkz3bq0
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 15:13:16 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 151DB2014E;
	Mon, 26 Feb 2024 12:13:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708920795;
	bh=/q24CJLITfPyErU1UK/fAAmBnBCJ3GQy7PcDHM76kEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KMZ2d/WueqRPEt0x3pmeKLAQzK5soiMd5fgmGcOBAm1UYlsonQs/Uu/6NzlqB/WK/
	 dwrA/YA8nsmxhwjMXYtC49fyF8wH09ORmR3cQJYWLThxNX4qC8jnvaA3oSZ3eGy1E4
	 w2Nmx0FX/nhtpiQQs7GZeWUc5n9S5mA6skQxrAOmC8ZhcU25SnagEi9Qlp4YPMS8AE
	 ekgbjuUYU2UXyC0pgRXXfWv6Ie+0VDrplCN9nvY/uMHt7NsH/ScqBfkNtM+wLEXQmh
	 0TX/8e6jpqq4rogsCTZK16wgSCMOVRPo45toJq2I10pWK8OduJZ/XJ/bkvFYq2xyuj
	 heu6tTyQyTYcA==
Message-ID: <00b5f735bd9c151812445d40348d70f4b4bd474d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 04/14] serial: 8250_aspeed_vuart: Switch to use
 uart_read_port_properties()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Date: Mon, 26 Feb 2024 14:43:13 +1030
In-Reply-To: <20240221183442.4124354-5-andriy.shevchenko@linux.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
	 <20240221183442.4124354-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-02-21 at 20:31 +0200, Andy Shevchenko wrote:
> Since we have now a common helper to read port properties
> use it instead of sparse home grown solution.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
