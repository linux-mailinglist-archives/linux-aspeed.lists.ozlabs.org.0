Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67995AA9C
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 03:40:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq5Vn1KkQz2yNR
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 11:40:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ja6jB0O2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq5Vk617tz2xcw
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 11:40:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724290814;
	bh=0jpArWCYnQmFmqTNGxh5siqbEOIWInHJT4VyT0QJLDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ja6jB0O2QLOuAABXTmnQYX69qJ/KZCKkgm1JhaCsUdPQAIvGXLS8po2ggQyPQ0H8Z
	 R80fD7MSrsEUs7cYcdsj0VPoEjeN3RjDMOzI1AuA3Wmxd3KYOUalGcQPsnQtFKInel
	 JA0feAUU1yZS+gJps+ZzgBkg51PVe+TDYzGaDe39JdTWJdPLZNFVe25ovcCKpDX3Qe
	 27u1pkF2veJ2E2Kzigy10dm+SWOHwFDMLfbXL6pDg1DUuu5z6WUjpSp5AfNcJ0WpHL
	 J6hrURu/OUxOGpU9835BNX/U+knk/GsbAqDrJ7FXriQI2KXwiUP5BLjJ03zcklJjiJ
	 fMK4XiL2v5jpw==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B20A264FDD;
	Thu, 22 Aug 2024 09:40:11 +0800 (AWST)
Message-ID: <98e7dd9ec454c1a8156ae74fe17ded7384dbe799.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/5] usb: aspeed_udc: Use devm_clk_get_enabled() helpers
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Lei Liu <liulei.rjpt@vivo.com>, Neal Liu <neal_liu@aspeedtech.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>,
 Daniel Mack <daniel@zonque.org>,  Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>,  Bin Liu <b-liu@ti.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Thu, 22 Aug 2024 11:10:11 +0930
In-Reply-To: <20240821121048.31566-2-liulei.rjpt@vivo.com>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
	 <20240821121048.31566-2-liulei.rjpt@vivo.com>
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
Cc: opensource.kernel@vivo.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-08-21 at 20:10 +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids calls to clk_disable_unprepare().
>=20
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

