Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF34E3711
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 04:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMx8C0Pnkz2yMj
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 14:01:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UIEEw8H1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=UIEEw8H1; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMx8725zZz2xfT
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 14:01:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=b9U/YwFXv20yTfLFWbuRAqJRHhEpMtnMkWj3xf7Fzmc=; b=UI
 EEw8H1dCe2232LDPhplovW5e6NBNhkEiNVcTx8Gi+C/x/aWmMF0oZf5UfZpX9ycafyR2rIwhvk8lb
 S/63ptPf6TBvFK8o+Ed2oh96jDXeLIDwEiH9B/Kpyln2pE00hYBEMbinj77+zZNRU1jjfimUnpmqq
 vVUHfXSoVMB8oGM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nWUlH-00C3s4-PQ; Tue, 22 Mar 2022 04:00:43 +0100
Date: Tue, 22 Mar 2022 04:00:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
 nodes
Message-ID: <Yjk722CyEW3q1ntm@lunn.ch>
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-4-dylan_hung@aspeedtech.com>
 <eefe6dd8-6542-a5c2-6bdf-2c3ffe06e06b@kernel.org>
 <HK0PR06MB2834CFADF087A439B06F87C29C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR06MB2834CFADF087A439B06F87C29C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Mar 22, 2022 at 02:32:13AM +0000, Dylan Hung wrote:
> > -----Original Message-----
> > From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> > Sent: 2022年3月21日 11:53 PM
> > To: Dylan Hung <dylan_hung@aspeedtech.com>; robh+dt@kernel.org;
> > joel@jms.id.au; andrew@aj.id.au; andrew@lunn.ch; hkallweit1@gmail.com;
> > linux@armlinux.org.uk; davem@davemloft.net; kuba@kernel.org;
> > pabeni@redhat.com; p.zabel@pengutronix.de; devicetree@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> > linux-kernel@vger.kernel.org; netdev@vger.kernel.org
> > Cc: BMC-SW <BMC-SW@aspeedtech.com>; stable@vger.kernel.org
> > Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
> > nodes
> > 
> > On 21/03/2022 10:56, Dylan Hung wrote:
> > > Add reset control properties into MDIO nodes.  The 4 MDIO controllers in
> > > AST2600 SOC share one reset control bit SCU50[3].
> > >
> > > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > > Cc: stable@vger.kernel.org
> > 
> > Please describe the bug being fixed. See stable-kernel-rules.
> 
> Thank you for your comment.
> The reset deassertion of the MDIO device was usually done by the bootloader (u-boot).
> However, one of our clients uses proprietary bootloader and doesn't deassert the MDIO
> reset so failed to access the HW in kernel driver.

So are you saying mainline u-boot releases the reset?

> The reset deassertion is missing in the
> kernel driver since it was created, should I add a BugFix for the first commit of this driver?

Yes, that is normal. Ideally the kernel should not depend on u-boot,
because often people want to use other bootloaders, e.g. barebox. You
should also consider kexec, where one kernel hands over to another
kernel, without the bootloader being involved. In such a situation,
you ideally want to assert and deassert the reset just to clean away
any state the old kernel left around.

But please do note, that the reset is optional, since you need to be
able to work with old DT blobs which don't have the reset property in
them.

	Andrew



