Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFA4EB2D7
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KScKY2MLKz2yPd
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:40:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=GxpSvzxg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=GxpSvzxg; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KScKD0sdGz2xs8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 04:40:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=xVfXSyLgNQ7HxDS7GTCCer3mw54IDrDgWbh9XTFmtpg=; b=GxpSvzxgz6WHHuRdNOnejUwp3h
 YReNP7xUePy8MA1QwfR0swNzB+KPAm4Q2jL95hcyE6LM410HYOvkJ0tze1claptkZ0/Jvi+AVkvnk
 tqZR4olal9xD4Oc4jjakUwCbiV+I1RcKslxYAVSvSDyPjFq4acFUvJ9oLeQwIxwoq5+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nZFor-00DCL2-G2; Tue, 29 Mar 2022 19:39:49 +0200
Date: Tue, 29 Mar 2022 19:39:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH 1/1] net: mdio: aspeed: Add Clause 45 support
Message-ID: <YkNEZRDw1bZuc/PP@lunn.ch>
References: <20220329161949.19762-1-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329161949.19762-1-potin.lai@quantatw.com>
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

On Wed, Mar 30, 2022 at 12:19:49AM +0800, Potin Lai wrote:
> Add Clause 45 support for Aspeed mdio driver.

This looks O.K, but please set bus->probe_capabilities to indicate
both C22 and C45.

net-next is closed at the moment, so please wait until next week
before sending the next version.

     Andrew

