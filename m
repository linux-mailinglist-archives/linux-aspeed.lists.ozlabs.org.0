Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562E4AE64E
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 02:28:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtj2566mJz3bPM
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 12:28:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=afEZDx0A;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=afEZDx0A; dkim-atps=neutral
X-Greylist: delayed 1969 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 12:28:22 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtj1y6sZPz2yHL
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 12:28:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7j8xaiDHKLuYSfbxSytsLDdL2ZEdsyuWOW5B7d955Do=; b=afEZDx0ANsXGYGDdr9/Pa9Ivju
 3/Oai6ykTkEx2NNhliPjMiYBz9/sA5G2NSVwncw4fTOG/vig1W3y9paYklyxS5F3KkqrEYLc2akkZ
 1v+XB4+5r3mwjU7PvSSorVh6pLzl6+4dI/TuRfuqWl3R1pcmWPFj/KN5ZOMq5nfSeGx4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nHbGP-004zSK-Iy; Wed, 09 Feb 2022 01:55:17 +0100
Date: Wed, 9 Feb 2022 01:55:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH net] net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
Message-ID: <YgMQ9e6MZ2h8i73/@lunn.ch>
References: <20220209000359.372978-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209000359.372978-1-joel@jms.id.au>
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
Cc: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 09, 2022 at 10:33:59AM +1030, Joel Stanley wrote:
> Fix loading of the driver when built as a module.
> 
> Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
