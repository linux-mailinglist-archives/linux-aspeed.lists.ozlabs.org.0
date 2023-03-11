Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DF6B5F76
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 18:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYrHn3VQXz3cK8
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 04:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=sQgqYODQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=sQgqYODQ;
	dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYrHh13bdz3bcN
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 04:58:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0SuW2teqPrJO0c83NljG0OZlfdMMqc0MljQGQttnRBc=; b=sQgqYODQW6+hMJ349CW0h7g+VR
	3Fe0n53zYw4LUHpulr7v4SlGWofZ+pTierKd0l12AlOJHuQ83eUj4tqvSX2kf3tIqqPt9FIaXRhD0
	wSdBUNnELsujz4wEPv/XasLijg7mlCDwN6Ew8wMg804jluCcCj9BJ8BV77MNfamkkpo8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pb3TD-0074hS-FW; Sat, 11 Mar 2023 18:57:27 +0100
Date: Sat, 11 Mar 2023 18:57:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <f70aa0ea-5d8e-4cc3-bd5e-5b4a79d67281@lunn.ch>
References: <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
 <49a9154ae4e2b3e6bc85e560368f6474f97cea88.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a9154ae4e2b3e6bc85e560368f6474f97cea88.camel@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Well, maybe I misunderstood the argument with DT completely, so I gave it a try:
> 
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -3797,6 +3797,7 @@ static int mv88e6xxx_mdio_register(struct mv88e6xxx_chip *chip,
>         bus->read_c45 = mv88e6xxx_mdio_read_c45;
>         bus->write_c45 = mv88e6xxx_mdio_write_c45;
>         bus->parent = chip->dev;
> +       bus->phy_mask = GENMASK(31, mv88e6xxx_num_ports(chip));
>  
>         if (!external) {
>                 err = mv88e6xxx_g2_irq_mdio_setup(chip, bus);
> 
> > 
> 
> Now THAT one makes a difference! With this on top, I'm back at normal boot time!
> I hope this is what you had in mind?

Yep, that is what i meant. Please could you also submit a patch for this?

     Andrew

