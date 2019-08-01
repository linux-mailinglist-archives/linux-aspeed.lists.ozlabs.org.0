Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24617D41A
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 05:56:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zc0T0flXzDqhF
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 13:56:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="yNJoXUHi"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zc0K6Yb9zDqXw
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2019 13:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y1QlX2yE7yvhO9Y6IQdrLu7V2tiqtVgXwBkJSh4jYHg=; b=yNJoXUHia1doAfiLkZ7DnjfnK2
 DlsR52pVLSHbKp0s/pjmV6L1gaWDbQ6nlSfwl47jeGtYrwsMa5QfRALq7DLdZpyzf4zab2Fw/KOPb
 Lo0lyATAVgDSUowhIZ9zC7yAt0IT7zszT23ki4epttXDyxDLlDZQaJAl9ouyLcDfL5BE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1ht2Bx-0001OG-16; Thu, 01 Aug 2019 05:55:49 +0200
Date: Thu, 1 Aug 2019 05:55:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH net-next v2 3/4] net: ftgmac100: Add support for DT
 phy-handle property
Message-ID: <20190801035549.GH2713@lunn.ch>
References: <20190731053959.16293-1-andrew@aj.id.au>
 <20190731053959.16293-4-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731053959.16293-4-andrew@aj.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, f.fainelli@gmail.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2019 at 03:09:58PM +0930, Andrew Jeffery wrote:
> phy-handle is necessary for the AST2600 which separates the MDIO
> controllers from the MAC.
> 
> I've tried to minimise the intrusion of supporting the AST2600 to the
> FTGMAC100 by leaving in place the existing MDIO support for the embedded
> MDIO interface. The AST2400 and AST2500 continue to be supported this
> way, as it avoids breaking/reworking existing devicetrees.
> 
> The AST2600 support by contrast requires the presence of the phy-handle
> property in the MAC devicetree node to specify the appropriate PHY to
> associate with the MAC. In the event that someone wants to specify the
> MDIO bus topology under the MAC node on an AST2400 or AST2500, the
> current auto-probe approach is done conditional on the absence of an
> "mdio" child node of the MAC.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
