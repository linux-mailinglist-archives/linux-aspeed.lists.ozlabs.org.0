Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C077AE33E
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 03:17:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LapCsNJv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvhfk2DMSz3c8r
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 11:17:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LapCsNJv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvhfd3nnNz3bhk;
	Tue, 26 Sep 2023 11:16:57 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-175-231.adl-adc-lon-bras34.tpg.internode.on.net [118.210.175.231])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1045A20174;
	Tue, 26 Sep 2023 09:16:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695691016;
	bh=pI7CpauyPvWTw3RXV9voYlIonvIp7u1XGUeBxrYew7g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LapCsNJvU8+qScB5n4biG3vEM+WDKp0NrKLUDi3zSteIjhq43dKWIg650C95eErt1
	 gAjj1edkYNy9IHoaKcqsVOC0jJGkoCSdPKWNBiTqyL36niTsbGGdX+UjeioZcwlCGj
	 K0IMXNtOZeWtdPN3rTh2yGWRWa4Bv0podRoG79SPlGOicsxsCWTIq84U9en+HZk/wB
	 kUNSSo4k0rAwMXbbyPx/YQovhQLMcslmAz4YOzIVKryzPp3b5FB3trUZI0etkTchXo
	 mt9pfCJNdn/P7a+oFKICIqzUcwg6dVvchxyMqYeFuR5ICN38DeW0bU1itBG0hQCWsS
	 WfS/UYg9t3/EQ==
Message-ID: <e3c4013eca1b7cb6edd6724be37e2ec86fc408dd.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: pinctrl-aspeed-g6: Add more settings for
 USB2AHP function
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, Joe Wang
 <joe_wang@aspeedtech.com>
Date: Tue, 26 Sep 2023 10:46:54 +0930
In-Reply-To: <CACRpkdaZb+V-Zx_Uw9MCqRqE+N-0gd__xEFV3BTpkG7icU9W+A@mail.gmail.com>
References: <20230920103332.274151-1-joe_wang@aspeedtech.com>
	 <CACRpkdaZb+V-Zx_Uw9MCqRqE+N-0gd__xEFV3BTpkG7icU9W+A@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2023-09-25 at 15:15 +0200, Linus Walleij wrote:
> On Wed, Sep 20, 2023 at 12:33=E2=80=AFPM Joe Wang <joe_wang@aspeedtech.co=
m> wrote:
>=20
> > AST2600 USB2AHP (USB PortA: PCIe EHCI to PHY) function needs to set the
> > register SCUC20[16]. Set it to enable the PCIe EHCI device on PCIe bus.
> > Besides, also add USB2AHP signal expressions into pin declarations.
> >=20
> > Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
>=20
> Patch applied!

Thanks. I hope to improve my review responsiveness for Aspeed patches
over recent times.

Andrew
