Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2853200E
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 02:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6bSW2ScRz3bkB
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 10:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NuHvSXxY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=NuHvSXxY; dkim-atps=neutral
X-Greylist: delayed 1797 seconds by postgrey-1.36 at boromir;
 Tue, 24 May 2022 10:59:17 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6bSP3bN4z2ybB
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 10:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+Geb9PYtwxT5Z+UrYs52VykQbohwi4PGJG7zLFfk65Y=; b=NuHvSXxYz2eqJljXK4JV5yU6AL
 pctHgrf23jcL6eL3Xv1F44oF6+xEZzr+LdBDgPl0hPOrc3aYsvJ9KNQZEw7zTN43iq/xJsIViO9DW
 U0am+9aY+2OWOY9MbFglpAe8E7O8QjHaH69KCOXyYtqWBYPi3aFSDkaiJ7T6m/9bUqcA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ntHj3-0042L5-4R; Tue, 24 May 2022 01:44:37 +0200
Date: Tue, 24 May 2022 01:44:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH net v3] net: ftgmac100: Disable hardware checksum on
 AST2600
Message-ID: <YowcZUX3lwAA6c5k@lunn.ch>
References: <20220517092217.323060-1-joel@jms.id.au>
 <5630dd68ca5f31dafce3f92489761294ea589b16.camel@kernel.crashing.org>
 <CACPK8Xd5BLiz1ePwzirtxLvSL8V8EGmJuxB0GmxyyqBRK9mSdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xd5BLiz1ePwzirtxLvSL8V8EGmJuxB0GmxyyqBRK9mSdQ@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Wilder <wilder@us.ibm.com>, Networking <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > > The observed results:
> > >
> > >  1500 - good
> > >  1434 - bad
> > >  1400 - good
> > >  1410 - bad
> > >  1420 - good

Looking at these numbers, all the good cases a divisible by 4. All the
bad cases are not.

Could you extend the test to automatically test 64 through 1500?  Or
manually try 1499, 1498, 1497, 1496. Maybe the workaround is if the
packet length is divisible by 4 let the hardware do the checksum,
otherwise do it in software.

      Andrew
