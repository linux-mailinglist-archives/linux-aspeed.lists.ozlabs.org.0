Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C03866940
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 05:12:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mrK4AxRc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjnJj5LZWz3cHN
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:12:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mrK4AxRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjnJd0H1Jz3bq0
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 15:12:33 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 85F5A2014E;
	Mon, 26 Feb 2024 12:12:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708920752;
	bh=XXRWq9LzaWJldDlLUORe5CRUYm2s2hhDXWkS7OTa4Lg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mrK4AxRcBQAiIKCOPTCJmIVgne/8nIuXIhpXuCDvYKC2xvr/0qonrkIXrDVMHnkfV
	 SJpQ4glDbG8r8ZjSpRe+DY6Ey7JhHXhfcfOaTTqNev7gE4fsswYgJPcRwqQuMxQUhh
	 BRsglrzdRY+rIyDxyE3sHLuSt/KMh5558ntUPdudvw3DoZIN56Eblru48iBTPsNITc
	 /m0B0b/q1uA3uO0RcplIh/4kxIWbI6pxJ4/lCg3g7iwcqHbLU8D7m5H3O8ChcCltuz
	 o55K+LzKWT+TD7MkYpfONNShG2JzgYB31QHJBUSVedDncb82YdRV5cKQoSRMIq7zBB
	 //zPm9ZLM1GHg==
Message-ID: <ab237d0e08b6919d29f25d89ec34d149341f4c57.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 10/14] serial: 8250_of: Switch to use
 uart_read_port_properties()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 26 Feb 2024 14:42:27 +1030
In-Reply-To: <Zdd6lnXwvpPPUhRR@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
	 <20240221183442.4124354-11-andriy.shevchenko@linux.intel.com>
	 <0a828f2c50de712940fb9a881702ac1678a35b7c.camel@codeconstruct.com.au>
	 <ZddKzHplwOX7naLv@smile.fi.intel.com> <Zdd5m2xIPlGI0_Qv@smile.fi.intel.com>
	 <Zdd6lnXwvpPPUhRR@smile.fi.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-22 at 18:47 +0200, Andy Shevchenko wrote:
> On Thu, Feb 22, 2024 at 06:43:08PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 22, 2024 at 03:23:24PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 22, 2024 at 11:07:05AM +1030, Andrew Jeffery wrote:
> > > > On Wed, 2024-02-21 at 20:31 +0200, Andy Shevchenko wrote:
> > > > > Since we have now a common helper to read port properties
> > > > > use it instead of sparse home grown solution.
> > > >=20
> > > > I did some brief testing of the series for the Aspeed machines unde=
r
> > > > qemu, building them on top of v6.8-rc5:
> > > >=20
> > > > export ARCH=3Darm
> > > > export CROSS_COMPILE=3Darm-linux-gnueabihf-
> > > > make aspeed_g5_defconfig
> > > > make -j$(nproc)
> > > > qemu-system-arm -M rainier-bmc -nographic -no-reboot -kernel arch/a=
rm/boot/zImage -dtb arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb -in=
itrd ...
> > > >=20
> > > > I got an oops during boot, which bisected to this change:
> > >=20
> > > Thank you for prompt testing! I will look at it.
> >=20
> > I found the issue, will be fixed in next version.
>=20
> Whoever is going to test this series, the
>=20
> -		port->iotype =3D use_defaults ? UPIO_MEM : port->iotype;
> +		port->iotype =3D UPIO_MEM;
>=20
> should be applied to uart_read_port_properties() implementation.
>=20

Thanks, with that fix applied it works fine for me also.

Andrew
