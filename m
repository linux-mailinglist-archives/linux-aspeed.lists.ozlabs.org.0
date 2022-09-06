Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6D5AE703
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 13:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMP4L1h81z3bSX
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 21:56:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pzalvoe7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pzalvoe7;
	dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMP4G2SQ1z2yT0
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 21:56:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=db2zFCi0TeQzDV6buhxTlSnCtcmC9EJ7noOsn8H2ACY=; b=Pzalvoe77Xa573KE1sFZdEuKcW
	cYoiLm9pv0/XqCBC/fXytMwSwpy7NXE9BvmPZngQpgcc8ghxw255u+3CNV/oKey4ooOYx9f/RcrXM
	myEdLioa3ZOfkE3voCytFRnVGUQLszycTluZY99FwSYoT+44TwTMURxHFo9Hmtz7PvCM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oVXB1-00FkGI-Vf; Tue, 06 Sep 2022 13:55:35 +0200
Date: Tue, 6 Sep 2022 13:55:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Message-ID: <Yxc1N1auY5jk3yJI@lunn.ch>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
 <20220905235634.20957-3-rentao.bupt@gmail.com>
 <YxaS2mS5vwW4HuqL@lunn.ch>
 <YxalTToannPyLQpI@taoren-fedora-PC23YAB4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxalTToannPyLQpI@taoren-fedora-PC23YAB4>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guangbin Huang <huangguangbin2@huawei.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Hao Chen <chenhao288@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 05, 2022 at 06:41:33PM -0700, Tao Ren wrote:
> Hi Andrew,
> 
> On Tue, Sep 06, 2022 at 02:22:50AM +0200, Andrew Lunn wrote:
> > On Mon, Sep 05, 2022 at 04:56:34PM -0700, rentao.bupt@gmail.com wrote:
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > 
> > > Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
> > > onboard switch directly (fixed link).
> > 
> > What is the switch? Could you also add a DT node for it?
> > 
> > > 
> > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > > index 27b43fe099f1..52cb617783ac 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > > @@ -183,3 +183,14 @@ imux31: i2c@7 {
> > >  &i2c11 {
> > >  	status = "okay";
> > >  };
> > > +
> > > +&mac3 {
> > > +	status = "okay";
> > > +	phy-mode = "rgmii";
> > 
> > 'rgmii' is suspicious, though not necessarily wrong. This value is
> > normally passed to the PHY, so the PHY inserts the RGMII delay. You
> > however don't have a PHY. So i assume the switch is inserting the
> > delay? Again, being able to see the DT properties for the switch would
> > be useful.
> > 
> >    Andrew
> 
> Thank you for the quick review!
> 
> The BMC mac3 is connected to BCM53134P's IMP_RGMII port, and there is no
> PHY between BMC MAC and BCM53134P. BCM53134P loads configurations from
> its EEPROM when the chip is powered.

So i assume you have the switch RGMII port doing the delays. That is
fine.

> Could you please point me an example showing how to describe the switch in
> dts? Anyhow I will need to improve the patch description and comments in
> v2.

It looks like drivers/net/dsa/b53 does not support this particular
switch. You could consider extending the driver. See

Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml

for documentation of the binding.

    Andrew
