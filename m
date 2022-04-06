Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F54F5D0D
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Apr 2022 14:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYNny6Cmsz2ynj
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Apr 2022 22:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aDF2DGov;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=aDF2DGov; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYNnm6Zfmz2yMD
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Apr 2022 22:18:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=HY9AyFTTSvyl0mlHOq1Vq0LKi+bYjw8bBCj2u/ZVLyk=; b=aDF2DGovnriLp72Za6zAVUGbsL
 fhWT/9D+P1OKvm4m5O31hA6qWT6uPkpoRITU9hBGXBldGdHMmstMualOautB7X5SsmTO6CUuCExpc
 30dA0WI/95RtqLgmheb/LNqrUaSikCWIlvAWMXi6uQUqIkNt/+PbqimmDrrzeV8ZJn6E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nc4bN-00ERSk-HN; Wed, 06 Apr 2022 14:17:33 +0200
Date: Wed, 6 Apr 2022 14:17:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v2 2/3] net: mdio: aspeed: Introduce read write function
 for c22 and c45
Message-ID: <Yk2E3X7MaJhWi32O@lunn.ch>
References: <20220406012002.15128-1-potin.lai@quantatw.com>
 <20220406012002.15128-3-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406012002.15128-3-potin.lai@quantatw.com>
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
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> +static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
> +{
> +	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d\n", __func__, addr,
> +		regnum);
> +
> +	if (regnum & MII_ADDR_C45)
> +		return aspeed_mdio_read_c45(bus, addr, regnum);
> +
> +	return aspeed_mdio_read_c22(bus, addr, regnum);
> +}
> +
>  static int aspeed_mdio_write(struct mii_bus *bus, int addr, int regnum, u16 val)
>  {
>  	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d, val: 0x%x\n",
>  		__func__, addr, regnum, val);
>  
> -	/* Just clause 22 for the moment */
>  	if (regnum & MII_ADDR_C45)
> -		return -EOPNOTSUPP;
> +		return aspeed_mdio_write_c45(bus, addr, regnum, val);
>  
> -	return aspeed_mdio_op(bus, ASPEED_MDIO_CTRL_ST_C22, MDIO_C22_OP_WRITE,
> -			      addr, regnum, val);
> +	return aspeed_mdio_write_c22(bus, addr, regnum, val);
>  }

Hi Portin

Nice structure. This will helper with future cleanup where C22 and C45
will be completely separated, and the c45 variants will be directly
passed dev_ad and reg, rather than have to extract them from regnum.

A few process issues.

Please read the netdev FAQ. The subject list should indicate the tree,
and there should be an patch 0/3 which explains the big picture of
what the patchset does. 0/3 will then be used for the merge commit.

     Andrew
