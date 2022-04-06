Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052B4F697C
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Apr 2022 21:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYYjz6q11z3bY8
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Apr 2022 05:00:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=q7DawJNk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=q7DawJNk; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYYjw2RVzz2yMP
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Apr 2022 05:00:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ORv4dJXN80Th/q40FVaI67o8XfB5vIQ9EZXpu4hyhXg=; b=q7DawJNk/HZkkATayfSOPv1TC5
 DoH1XABIMXvnea3Ws49UeUNkAfsud61fPnjlT4mduqcgQI08UXUJkrfsPnQa/RpVNrzvxVt5t7yfE
 HKJVB9CHB8xr2BuaxatOQ8E60ZSj9Lw9UBzZX1z7beFtuSGtPnSJxev0a6K3nQrthW2Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncAsu-00EVVe-Rz; Wed, 06 Apr 2022 21:00:04 +0200
Date: Wed, 6 Apr 2022 21:00:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH net-next RESEND v2 3/3] net: mdio: aspeed: Add c45 support
Message-ID: <Yk3jNJMjMPj7NM8r@lunn.ch>
References: <20220406170055.28516-1-potin.lai@quantatw.com>
 <20220406170055.28516-4-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406170055.28516-4-potin.lai@quantatw.com>
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Patrick Williams <patrick@stwcx.xyz>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 07, 2022 at 01:00:55AM +0800, Potin Lai wrote:
> Add Clause 45 support for Aspeed mdio driver.
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  drivers/net/mdio/mdio-aspeed.c | 35 ++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
> index 5becddb56117..4236ba78aa65 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -21,6 +21,10 @@
>  #define   ASPEED_MDIO_CTRL_OP		GENMASK(27, 26)
>  #define     MDIO_C22_OP_WRITE		0b01
>  #define     MDIO_C22_OP_READ		0b10
> +#define     MDIO_C45_OP_ADDR		0b00
> +#define     MDIO_C45_OP_WRITE		0b01
> +#define     MDIO_C45_OP_PREAD		0b10
> +#define     MDIO_C45_OP_READ		0b11
>  #define   ASPEED_MDIO_CTRL_PHYAD	GENMASK(25, 21)
>  #define   ASPEED_MDIO_CTRL_REGAD	GENMASK(20, 16)
>  #define   ASPEED_MDIO_CTRL_MIIWDATA	GENMASK(15, 0)
> @@ -100,15 +104,37 @@ static int aspeed_mdio_write_c22(struct mii_bus *bus, int addr, int regnum,
>  
>  static int aspeed_mdio_read_c45(struct mii_bus *bus, int addr, int regnum)
>  {
> -	/* TODO: add c45 support */
> -	return -EOPNOTSUPP;
> +	int rc;
> +	u8 c45_dev = (regnum >> 16) & 0x1F;
> +	u16 c45_addr = regnum & 0xFFFF;

Sorry, missed it the first time. You should use reverse christmass
tree here. Just move rc to last.

>  static int aspeed_mdio_write_c45(struct mii_bus *bus, int addr, int regnum,
>  				 u16 val)
>  {
> -	/* TODO: add c45 support */
> -	return -EOPNOTSUPP;
> +	int rc;
> +	u8 c45_dev = (regnum >> 16) & 0x1F;
> +	u16 c45_addr = regnum & 0xFFFF;

Same here.

     Andrew
