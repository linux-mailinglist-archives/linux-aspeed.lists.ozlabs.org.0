Return-Path: <linux-aspeed+bounces-529-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A7A192BF
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jan 2025 14:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdQDg4Kndz2xdr;
	Thu, 23 Jan 2025 00:40:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737553203;
	cv=none; b=WVBydKbIFeZokKHg54LNqaw6NBt0+y2VIur7LYesH/DARGom1CtThrv31wEtdW6kU135sjg7074NPvu/2fVpCM36bNRfuboNug8Zpuu+kS2P2iz0YCUaYGcO4fqDc+iJlk74pdghV7UpMmsh53zZ62pPc+vMsiVXP19JT46d0puK4gyN24ZEp0zE3BzJwJ5p4/MoOUw6/j17xz7dTZbbOgICn/w3BrZT+b0XjPMFNqd921jokMFhfrFHBXcJEsdPBI6hZPTDd+h6OEG4Dj5Y8XfBMljCEAX1w3x/yxxq6U3ZzKdlAEmQuWwrYFkyQkmZCeuAmluAu3da+0vW/XIIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737553203; c=relaxed/relaxed;
	bh=iVzK2Qm/HT/xBg28g3YFlndduqy2evTa758qmwYdipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXr1KVbbQdIpoS50HGn6M3TXd51tL3/7MWjtUmkeIpEHuEzegTm7JTk7ZvtStNW+lkJbS/9GRL4ZMeGIJb1gOpEgtYe6TeBRs35ZyDKct7+LMT//hPD+GVYDIklgbHu0gKSD94wWfCqJcZqpXb+98RqVGZv4/gXPtTHdfftDuJyNRVCVQU8+9mhbbEuKYh6FMpBzHUZ7K9syMwYD22hlffX5VVqxH448w+JPD/0BEzETvhbOEhW3qY8Qgpp9JcnteRrJtlAOqs1aGW5L2RvGLoNRV4+MCz5qomSh40ECQ+I8E9ctA/8IGkJWY891XubHiwwlA9FeVFI4BExgvHdReQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VOeBdomb; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VOeBdomb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdQDd2xs4z2xMQ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jan 2025 00:40:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iVzK2Qm/HT/xBg28g3YFlndduqy2evTa758qmwYdipc=; b=VOeBdombTIg0IVUDd6QyPkS51Y
	1lFcg7PCK1YN+DWfPGmzi0G8PlXI/HFTpkFIQFl/2PoWJEF7ugLtWHm+QVRy0ZaT9EDnJNeZEnAFq
	3SxWxAdyTLC76dk2NTIgVpJfUhTKtI2OwrkgR2acVkwG3nB8IwZVCydmCXuvkDhIzkOM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taax8-006xOj-85; Wed, 22 Jan 2025 14:39:30 +0100
Date: Wed, 22 Jan 2025 14:39:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	Jacky Chou <jacky_chou@aspeedtech.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtQQVRD?= =?utf-8?Q?H?= v2 05/10]
 ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <c83f0193-ce24-4a3e-87d1-f52587e13ca4@lunn.ch>
References: <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
 <81567190-a683-4542-a530-0fb419f5f9be@linux.ibm.com>
 <0ee94fd3-d099-4d82-9ba8-eb1939450cc3@lunn.ch>
 <20250122140719.5629ae57@fedora.home>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122140719.5629ae57@fedora.home>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> I myself got it wrong, as the kernel doc explicitely says that the "rgmii"
> phy-mode is the one to use to get MAC-side delay insertion, whereas the way I
> understand it, mac-side delay insertion doesn't really depend on the phy-mode
> passed from DT. Ideally we would even consider that these mac-side delay
> insertion would have to be ignored in basic 'RGMII' mode, but I think that would
> break quite some existing setups ?
> 
> Can we consider an update in the kernel doc along these lines :
> 
> ---
>  Documentation/networking/phy.rst | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/networking/phy.rst b/Documentation/networking/phy.rst
> index f64641417c54..7ab77f9867a0 100644
> --- a/Documentation/networking/phy.rst
> +++ b/Documentation/networking/phy.rst
> @@ -106,14 +106,17 @@ Whenever possible, use the PHY side RGMII delay for these reasons:
>    configure correctly a specified delay enables more designs with similar delay
>    requirements to be operated correctly
>  
> -For cases where the PHY is not capable of providing this delay, but the
> -Ethernet MAC driver is capable of doing so, the correct phy_interface_t value
> -should be PHY_INTERFACE_MODE_RGMII, and the Ethernet MAC driver should be
> -configured correctly in order to provide the required transmit and/or receive
> -side delay from the perspective of the PHY device. Conversely, if the Ethernet
> -MAC driver looks at the phy_interface_t value, for any other mode but
> -PHY_INTERFACE_MODE_RGMII, it should make sure that the MAC-level delays are
> -disabled.
> +The MAC driver may add delays if the PCB doesn't include any. This can be
> +detected based on firmware "rx-internal-delay-ps" and "tx-internal-delay-ps"
> +properties.
> +
> +When the MAC driver can insert the delays, it should always do so when these
> +properties are present and non-zero, regardless of the RGMII mode specified.
> +
> +However, the MAC driver must adjust the PHY_INTERFACE_MODE_RGMII_* mode it passes
> +to the connected PHY device (through phy_attach or phylink_create() for example)
> +to account for MAC-side delay insertion, so that the the PHY device knows
> +if any delays still needs insertion on either TX or RX paths.

You dropped:

   For cases where the PHY is not capable of providing this delay...

This is something i would like to keep, to strengthen that we really
do want the PHY to add the delays. Many MACs are capable of adding
delays, but we don't want them to, the PHY should do it, so we have
consistency.

The language i've tried to use is that "rx-internal-delay-ps" and
"tx-internal-delay-ps" can be used to fine tune the delays, so i'm
expecting their values to be small, because the PHY is adding the 2ns,
and the MAC is just adding/removing 0-200ps etc. I've also used the
same terminology for PHY drivers, the PHY DT properties for delays are
used for fine tuning, but the basic 2ns on/off comes from the phy-mode
passed to phylib.

If it is just fine tuning, and not adding the full 2ns, it should just
pass phy-mode straight through.

So your text becomes something like:

  The MAC driver may fine tune the delays. This can be configured
  based on firmware "rx-internal-delay-ps" and "tx-internal-delay-ps"
  properties. These values are expected to be small, not the full 2ns
  delay.

  A MAC driver inserting these fine tuning delays should always do so
  when these properties are present and non-zero, regardless of the
  RGMII mode specified.

Then we can address when the MAC adds the full 2ns.

  For cases where the PHY is not capable of providing the 2ns delay,
  the MAC must provide it, if the phy-mode indicates the PCB is not
  providing the delays. The MAC driver must adjust the
  PHY_INTERFACE_MODE_RGMII_* mode it passes to the connected PHY
  device (through phy_attach or phylink_create() for example) to
  account for MAC-side delay insertion, so that the the PHY device
  does not add additional delays.

I also think we need something near the beginning like:

  The device tree property phy-mode describes the hardware. When used
  with RGMII, its value indicates if the hardware, i.e. the PCB,
  provides the 2ns delay required for RGMII. A phy-mode of 'rgmii'
  indicates the PCB is adding the 2ns delay. For other values, the
  MAC/PHY pair must insert the needed 2ns delay, with the strong
  preference the PHY adds the delay.

	Andrew


