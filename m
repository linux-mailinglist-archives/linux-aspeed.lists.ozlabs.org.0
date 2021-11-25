Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82C45D2FA
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 03:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J01Z34hpyz301j
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 13:10:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPpWwUTQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WPpWwUTQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J01Yz3YTyz2xtj
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Nov 2021 13:10:47 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68E68610D1;
 Thu, 25 Nov 2021 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637806244;
 bh=5Cz4WBQyK2l2Gn43EDvcYp9nnTFT0mm4s2eOGARH3XM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WPpWwUTQi99FIQIIILXjCNR/Rw/0igUIi3SbLzKB2KSEGHk1u0vANAzZ8rLdkZVBD
 ObxDJS1qIZMtoJcz//TuEfi8yR4cQJoSi7a83p1XfuR3qxCzKOoz1/1npQRg/lAGqo
 pi+YhypbzJXj/CTDD8ufKS8TD4NLG4ds3lN39l9ooKQwNiq9lDSvmEqx1peq91MbV7
 +KxxoTWt1yIZI4aVmSO8LGGgaRX5zQK7TJa0/Lx3YQE50rwhHJVPBjhovyBHZvP86H
 YCxHOfC6NHvOQIiCcCYsT5N0U9B6lAhl4aTVbnOMskqABQAk6xBperUCfP7maQkdn7
 03GbNVgNpaVPw==
Date: Wed, 24 Nov 2021 18:10:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH] net:phy: Fix "Link is Down" issue
Message-ID: <20211124181043.26c9a8a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <HK0PR06MB2834A8D8845F53F6CE228F019C629@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
 <20211124153042.54d164dd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <HK0PR06MB2834A8D8845F53F6CE228F019C629@HK0PR06MB2834.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: " <davem@davemloft.net>, "@lists.ozlabs.org,
	linux@armlinux.org.uk,
	"  <netdev@vger.kernel.org>, "@lists.ozlabs.org, andrew@aj.id.au,
	"linux-arm-kernel@lists.infradead.org\"          <linux-arm-kernel@lists.infradead.org>, "@lists.ozlabs.org,
	netdev@vger.kernel.org,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	<andrew@lunn.ch>, BMC-SW <BMC-SW@aspeedtech.com>,
	" <linux@armlinux.org.uk>,  "@lists.ozlabs.org, hkallweit1@gmail.com,
	" <andrew@aj.id.au>,  "@lists.ozlabs.org, joel@jms.id.au,
	" <joel@jms.id.au>, "@lists.ozlabs.org, davem@davemloft.net,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	" <hkallweit1@gmail.com>, "@lists.ozlabs.org, andrew@lunn.ch
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Nov 2021 01:42:08 +0000 Dylan Hung wrote:
> > -----Original Message-----
> > From: Jakub Kicinski [mailto:kuba@kernel.org]
> > Sent: 2021=E5=B9=B411=E6=9C=8825=E6=97=A5 7:31 AM
> > To: Dylan Hung <dylan_hung@aspeedtech.com>
> > Cc: linux-kernel@vger.kernel.org; linux-aspeed@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org;
> > andrew@aj.id.au; joel@jms.id.au; davem@davemloft.net;
> > linux@armlinux.org.uk; hkallweit1@gmail.com; andrew@lunn.ch; BMC-SW
> > <BMC-SW@aspeedtech.com>
> > Subject: Re: [PATCH] net:phy: Fix "Link is Down" issue
> >=20
> > On Wed, 24 Nov 2021 14:10:57 +0800 Dylan Hung wrote: =20
> > > Subject: [PATCH] net:phy: Fix "Link is Down" issue =20
> >=20
> > Since there will be v2, please also add a space between net: and phy:. =
=20
>=20
> Should I use "net: mdio: " instead of "net: phy: "? Since this file was m=
oved from net/phy to net/mdio by commit a9770eac511a.

Since you asked, I'd go for mdio: aspeed:, without the net part.
