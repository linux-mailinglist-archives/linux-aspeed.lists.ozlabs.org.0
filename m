Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185E4ED4B5
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 09:20:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTZTG1VrMz2yZw
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 18:20:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=ssEaxSvr;
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
 header.s=pandora-2019 header.b=ssEaxSvr; 
 dkim-atps=neutral
X-Greylist: delayed 441 seconds by postgrey-1.36 at boromir;
 Thu, 31 Mar 2022 18:20:26 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTZT64XCdz2yJQ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 18:20:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cftje8rQgS4kiDHkpH8Em2qt4GFjMGVk4OywwnZsT04=; b=ssEaxSvrpdL50MKhgA/GLcEdZz
 i9m33P4y2/jk8y2I+ZL/elPceIuEkXA45RCJWN2KjxG9mRjZdJEWo5KxtSZKCtqdqr+bJ6cuLQyLx
 CDsD/PeJ316Q+x8leqTfW4Z6s3jwQzC6UXvfTfnA9joUyWfUiRqolCSc1R3nrYXV2GIU6lohQpgzw
 I44ZNFkMqJLHtpEx3bYmUGX08DrMgSsJLL8ZTLU3ZeDVmVIhif+8NkU92cRiSa4uyS5eM2d/3vsSc
 9/bKLjQHacLGo6bsKXPWHznODqpyla/o/Y2B3CaNoCo1QQk7IKfBeO9SD07zpTdNP4pl47EUusC+T
 srf56/xQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58042)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nZoyt-0004LR-Vq; Thu, 31 Mar 2022 08:12:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nZoyn-0007QN-D8; Thu, 31 Mar 2022 08:12:25 +0100
Date: Thu, 31 Mar 2022 08:12:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v3 2/3] net: mdio: add reset control for Aspeed MDIO
Message-ID: <YkVUWV0czTzo6MrJ@shell.armlinux.org.uk>
References: <20220325041451.894-1-dylan_hung@aspeedtech.com>
 <20220325041451.894-3-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325041451.894-3-dylan_hung@aspeedtech.com>
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, BMC-SW@aspeedtech.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Mar 25, 2022 at 12:14:50PM +0800, Dylan Hung wrote:
> Add reset assertion/deassertion for Aspeed MDIO.  There are 4 MDIO
> controllers embedded in Aspeed AST2600 SOC and share one reset control
> register SCU50[3].  To work with old DT blobs which don't have the reset
> property, devm_reset_control_get_optional_shared is used in this change.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Should this really be specific to one driver rather than being handled
in the core mdio code?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
