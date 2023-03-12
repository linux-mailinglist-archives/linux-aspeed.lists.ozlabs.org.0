Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4E6B62F7
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 03:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZ4Bd5q05z3cDt
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 13:54:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=JJC1gzH4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=JJC1gzH4;
	dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZ4BQ42T2z3bM7
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 13:54:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xLIgvG34Sc+lDohdVZWPEZo6FgjzStnEHWeCstzLe6k=; b=JJC1gzH4XjKAY1yMwNL6sqcv37
	gSSSB8dGXc3gMl0PdFDUv5w3aSdiDh9830SEmmbma+yikri5UNuOesvefuHisH8/fpv0HNO4ICXC0
	Pr97yR0lgntFbgpaWKDDaTvR4i/nOnW29hKU0w3QeXYDB7DkO1n6s7925UjcRlWlZ4eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pbBq8-0075xU-UV; Sun, 12 Mar 2023 03:53:40 +0100
Date: Sun, 12 Mar 2023 03:53:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
References: <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
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

> Here's the definition of the switch in the Turris Omnia device tree.
> 
> 	/* Switch MV88E6176 at address 0x10 */
> 	switch@10 {
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&swint_pins>;
> 		compatible = "marvell,mv88e6085";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		dsa,member = <0 0>;
> 		reg = <0x10>;
> 
> 		interrupt-parent = <&gpio1>;
> 		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			ports@0 {
> 				reg = <0>;
> 				label = "lan0";
> 			};
> 
> 			ports@1 {
> 				reg = <1>;
> 				label = "lan1";
> 			};
> 
> 			ports@2 {
> 				reg = <2>;
> 				label = "lan2";
> 			};
> 
> 			ports@3 {
> 				reg = <3>;
> 				label = "lan3";
> 			};
> 
> 			ports@4 {
> 				reg = <4>;
> 				label = "lan4";
> 			};
> 
> 			ports@5 {
> 				reg = <5>;
> 				label = "cpu";
> 				ethernet = <&eth1>;
> 				phy-mode = "rgmii-id";
> 
> 				fixed-link {
> 					speed = <1000>;
> 					full-duplex;
> 				};
> 			};
> 
> 			ports@6 {
> 				reg = <6>;
> 				label = "cpu";
> 				ethernet = <&eth0>;
> 				phy-mode = "rgmii-id";
> 
> 				fixed-link {
> 					speed = <1000>;
> 					full-duplex;
> 				};
> 			};
> 		};
> 
> What you are proposing here would not show any improvement on the
> Omnia, as only the 6 ports would be scanned - right? 

Correct. But their also should not of been any noticeable slow down,
because there should not be any additional scanning when everything is
described in DT. And the move of the MDIO bus registration from probe
to setup should actually make it faster than before.

	  Andrew
