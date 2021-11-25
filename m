Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E558845D38D
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 04:19:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J034q5RN0z304R
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 14:19:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxwqzl3e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hxwqzl3e; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J034g3wR6z2xtZ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Nov 2021 14:18:59 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D68EC6108B;
 Thu, 25 Nov 2021 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637810336;
 bh=jH3ib8LOjypJEX+zrK1zQDOwQlhz18MpvZQCJE0nlew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hxwqzl3eq0XVdMj/kvDGs8UQPGygRVgK52dxKecb4jIDJWdnC5PoyFHePgCcLi3sr
 c3zzW6uFbgO+xIb/duC1zZ4FgCioX2Nn6IJFvDnjy1g0tNYqrHH4Wh0MwdPrSwfQ7x
 O+g0ZPCSncF/rCqoktCf4VZpR+WmcADahst1sOJZypraMx88dTzL1NTp+nmuX1USnR
 Z1pHDPOf8v0pQ/zzIBr6d/vlGNKLbFxqzJin8Z9ZnRNp9WmGfuR5fK0pzz9OoI82OA
 t6PXxy0XsKacvWfwasx/EYDwl5tb8A80FAaLxratFUYcxuW7YcHi3pymALSn5QpKBM
 pL2Vj2w33ukCQ==
Date: Wed, 24 Nov 2021 19:18:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH] net:phy: Fix "Link is Down" issue
Message-ID: <20211124191854.4666a185@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <HK0PR06MB283498AF35B397F05CC627A99C629@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
 <CACPK8Xc8aD8nY0M442=BdvrpRhYNS1HW7BNQgAQ+ExTfQMsMyQ@mail.gmail.com>
 <YZ5adFBpaJzPwfvc@lunn.ch>
 <HK0PR06MB283498AF35B397F05CC627A99C629@HK0PR06MB2834.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, "David S .
 Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Nov 2021 03:08:22 +0000 Dylan Hung wrote:
> > > We should cc stable too.  
> > 
> > https://www.kernel.org/doc/html/v5.12/networking/netdev-FAQ.html#how-do-
> > i-indicate-which-tree-net-vs-net-next-my-patch-should-be-in
>
> Sorry, I got this mail after I sent v2 out.  Should I prepare patch
> v3 with --subject-prefix='PATCH net'?

That's leave it be now, but please keep this in mind in the future.
