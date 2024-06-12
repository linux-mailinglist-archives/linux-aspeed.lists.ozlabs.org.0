Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A949049D9
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2024 06:07:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZMdSfVdo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzX6y5wD1z3f0P
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2024 14:07:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZMdSfVdo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzX6q6Kb0z30VL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jun 2024 14:06:59 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6BFC62018F;
	Wed, 12 Jun 2024 12:06:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718165218;
	bh=CC+bF8lNbNgXo0LrTA+eL6Px83RxgIPHQTvQeVNUAxI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZMdSfVdoHqtOjSg/Oo5ZrrxUzRHEfJxyzPNIykWyhwCgvnvKctoBiZZmft+GuBN2b
	 MzhRIrOHD8cY7Yc0nwJmKPb2HWR8Yczezz+kSwvLxtDDA85RZDuB3HiMfqisArdup8
	 5m2kj7xD57FSu+WTQ9eRSCz/zpqgtrnoDDqZNc2shMYNOvuAps8RU389NFUsKw3Aan
	 b+bV8wggxzqh6A1SGDte6M9IC459oa1y4/AUlqr8e6t+qOSGgNckrnf8uCE57B7RcE
	 3qap+VcS3eazeZ9fh8Gti8+kHd9QG+kPaG4zccjOGA+7ozumwC4RW35OKzoN47wnAG
	 VKoWYpWSawAXg==
Message-ID: <de1c329751bfc327901c969eafecb7624aaf6a97.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Neal Liu
 <neal_liu@aspeedtech.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2024 13:36:52 +0930
In-Reply-To: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
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
Cc: linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-12 at 10:07 +0800, Jeremy Kerr wrote:
> In the aspeed UDC setup, we configure the UDC hardware with the assigned
> USB device address.
>=20
> However, we have an off-by-one in the bitmask, so we're only setting the
> lower 6 bits of the address (USB addresses being 7 bits, and the
> hardware bitmask being bits 0:6).
>=20
> This means that device enumeration fails if the assigned address is
> greater than 64:
>=20
> [  344.607255] usb 1-1: new high-speed USB device number 63 using ehci-pl=
atform
> [  344.808459] usb 1-1: New USB device found, idVendor=3Dcc00, idProduct=
=3Dcc00, bcdDevice=3D 6.10
> [  344.817684] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [  344.825671] usb 1-1: Product: Test device
> [  344.831075] usb 1-1: Manufacturer: Test vendor
> [  344.836335] usb 1-1: SerialNumber: 00
> [  349.917181] usb 1-1: USB disconnect, device number 63
> [  352.036775] usb 1-1: new high-speed USB device number 64 using ehci-pl=
atform
> [  352.249432] usb 1-1: device descriptor read/all, error -71
> [  352.696740] usb 1-1: new high-speed USB device number 65 using ehci-pl=
atform
> [  352.909431] usb 1-1: device descriptor read/all, error -71
>=20
> Use the correct mask of 0x7f (rather than 0x3f), and generate this
> through the GENMASK macro, so we have numbers that correspond exactly
> to the hardware register definition.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
