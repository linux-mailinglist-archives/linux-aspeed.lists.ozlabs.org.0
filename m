Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F945DDCE
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 16:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0MdZ06Jzz3c6R
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 02:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=fBMUWHnU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linux-aspeed=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=fBMUWHnU; 
 dkim-atps=neutral
X-Greylist: delayed 508 seconds by postgrey-1.36 at boromir;
 Fri, 26 Nov 2021 02:44:32 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Mcw0dwwz3c4c
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Nov 2021 02:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ZeojgPqWWrsMI5BHeJYX983PNTgh8dQN9F2ioLGkIs=; b=fBMUWHnUBpQs3qU9Nq4aPHReY7
 19sN6LtcvO+1tO01gi432dy2Hr+LDGv9p/F5YxpbSsTLAZzUd+q6A6Ng5b1x4nTEyM9SWKJKHBKSh
 poCFCNfK5RS40voK6YrugKO6S6MJkzOORq2mOMfXI/ZiFJd8BrE1185BQuV6caPzxIKAK9I5WwUow
 ilQzkFMVKVpt+JcV0WJOlgBoi+5gzyLIlKwC0k7Sxpyn9/h+v57wOJYaKvSGxswIpI6/8OIncVi6K
 H2JI9zCtBYIEqdR9uSEGdxW+UQRSfYnweSMLMqXFSUcLoXviemf8ml7FRMhxSu+UtU2Aae14IkhEM
 MDvlN7oA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55896)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mqGmi-000240-E6; Thu, 25 Nov 2021 15:35:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mqGme-0002Oo-7d; Thu, 25 Nov 2021 15:35:36 +0000
Date: Thu, 25 Nov 2021 15:35:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v2] mdio: aspeed: Fix "Link is Down" issue
Message-ID: <YZ+tSMT4Z6CpOgJ3@shell.armlinux.org.uk>
References: <20211125024432.15809-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125024432.15809-1-dylan_hung@aspeedtech.com>
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 25, 2021 at 10:44:32AM +0800, Dylan Hung wrote:
> The issue happened randomly in runtime.  The message "Link is Down" is
> popped but soon it recovered to "Link is Up".
> 
> The "Link is Down" results from the incorrect read data for reading the
> PHY register via MDIO bus.  The correct sequence for reading the data
> shall be:
> 1. fire the command
> 2. wait for command done (this step was missing)
> 3. wait for data idle
> 4. read data from data register
> 
> Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
> Cc: stable@vger.kernel.org
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
