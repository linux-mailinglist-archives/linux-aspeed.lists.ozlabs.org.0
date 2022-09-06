Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F65ADCBE
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 03:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM6ZJ03y9z3042
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 11:03:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LaY2GSFe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LaY2GSFe;
	dkim-atps=neutral
X-Greylist: delayed 2359 seconds by postgrey-1.36 at boromir; Tue, 06 Sep 2022 11:02:59 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM6ZC0sdWz2xTb
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 11:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d9OXgRNebu5UPVkhM/ybQh6k0eihy+EGudxgU/QSYdI=; b=LaY2GSFeaQvgTZ/4J74fhAgY23
	krIGialM91/ySLoO1qK0qWDfDzlsY7PcVXmFvDXFiY2ZEvRtb2f1ZIrjwRO/ySkqdNsQNrhi29efN
	dEaJi6stegK0+Xcaa3kkU1f+C0KfqyIrcNipRMXfv3Gx+AfufaKCibiF9Rvuw1FP6rek=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oVMMc-00FhWk-LL; Tue, 06 Sep 2022 02:22:50 +0200
Date: Tue, 6 Sep 2022 02:22:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Message-ID: <YxaS2mS5vwW4HuqL@lunn.ch>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
 <20220905235634.20957-3-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905235634.20957-3-rentao.bupt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guangbin Huang <huangguangbin2@huawei.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Hao Chen <chenhao288@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 05, 2022 at 04:56:34PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
> onboard switch directly (fixed link).

What is the switch? Could you also add a DT node for it?

> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> index 27b43fe099f1..52cb617783ac 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> @@ -183,3 +183,14 @@ imux31: i2c@7 {
>  &i2c11 {
>  	status = "okay";
>  };
> +
> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

'rgmii' is suspicious, though not necessarily wrong. This value is
normally passed to the PHY, so the PHY inserts the RGMII delay. You
however don't have a PHY. So i assume the switch is inserting the
delay? Again, being able to see the DT properties for the switch would
be useful.

   Andrew
