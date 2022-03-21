Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F644E26D2
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 13:45:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMZ996dnVz30Nj
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 23:45:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=slgidefF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=slgidefF; dkim-atps=neutral
X-Greylist: delayed 2049 seconds by postgrey-1.36 at boromir;
 Mon, 21 Mar 2022 23:45:42 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMZ924CNyz2xgX
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Mar 2022 23:45:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Kom58yxs7t2K4oUdufJDsnhiLyTppH8H97t+BIi+2pk=; b=slgidefFqclK1P2DulHa23qtke
 XdtDCFXKdxr6o3iNY/j5BBLZnNK0Z+vzk8r7RBzyksdnKoCWYMc7c1EE2cmB1NHA791AuDvM89EP9
 7bL01GhWrQtv0Y3iM0BiLxgv1hf23yB+6VEnT9I1Zya4p+15aU9IZ0qYmpwr69JcIKwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nWHPe-00BweU-Bh; Mon, 21 Mar 2022 13:45:30 +0100
Date: Mon, 21 Mar 2022 13:45:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v2 0/3]  Add reset deassertion for Aspeed MDIO
Message-ID: <YjhzatUg09SoH9DR@lunn.ch>
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, p.zabel@pengutronix.de,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 05:56:45PM +0800, Dylan Hung wrote:
> Add missing reset deassertion for Aspeed MDIO. There are 4 MDIOs embedded
> in Aspeed AST2600 and share one reset control bit SCU50[3].

Hi Dylan

Please wait at least 24 hours between posting versions, to give other
people times to comment.

The danger here is that my comments on the previous version are going
to get ignored, and this version merged containing the issues i
pointed out.

	Andrew
