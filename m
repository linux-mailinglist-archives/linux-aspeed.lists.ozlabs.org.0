Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 484846B5D63
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 16:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYnDr3cZcz3cM7
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 02:40:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lDIfeYMp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lDIfeYMp;
	dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYnDj4bFJz3c2j
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 02:40:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L1cjWa/ZkeQ8ynLS3HKj8W+1nV4bPBS6kn+zz6pEL5o=; b=lDIfeYMpfdi1Shz/zgmeAVzusF
	x0OEDGQ7Z6xWJV0WYKAedb45mhigl1d3v7Rp4+oxS6/c7dG4Gtq5h8DXWBlX2hNo1fHCotl1eOB/J
	GWSyM2lJOXImtgRMI7Ct7afh4KEiz7rG2+6+STKjo44VLsu9aDw855+FMSxYMvtefYn8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pb1Jo-0074HD-9X; Sat, 11 Mar 2023 16:39:36 +0100
Date: Sat, 11 Mar 2023 16:39:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
References: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
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

On Sat, Mar 11, 2023 at 07:49:23AM +0100, Klaus Kudielka wrote:
> On Sat, 2023-03-11 at 00:49 +0100, Andrew Lunn wrote:
> > > Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called only once,
> > > and at least some things are done in parallel.
> > 
> > Great. Could you cook up a proper patch and submit it?
> 
> I can give it a try. The commit message will be from my perspective,
> and the change Suggested-By you.

The commit message is fine.

I have one more idea which can speed things up. The scanning of the
MDIO bus works in two different ways depending on if there is a DT
node, describing what should be found on the bus. For mv88e6xxx, using
DT is optional. Some boards do, some don't.

If there is a DT node, only the addresses listed in DT are scanned.

If there is no DT node, by default, all 32 addresses on the bus are
scanned. However, DSA makes another assumption. There is a one to one
mapping between port number and PHY address on the MDIO bus. Port 0
uses MDIO address 0. Port 7 uses MDIO address 7 etc. If you have an 8
port switch, there is no point scanning addresses 8 to 31, they will
never be used.

The mdio bus structure has a member phy_mask. This is a bitmap. If bit
N is set, address N is not scanned. So i suggest you extend
mv88e6xxx_mdio_register() to set phy_mask based on
mv88e6xxx_num_ports(chip).

	Andrew
