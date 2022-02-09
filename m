Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707204B622E
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 05:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySxf6jpkz3bT0
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 15:37:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S9GgMbVD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S9GgMbVD; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtzV440Lgz30Mf
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 23:20:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1ADA617EB;
 Wed,  9 Feb 2022 12:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EB9FC340EB;
 Wed,  9 Feb 2022 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644409209;
 bh=8KBLJhIZR4akoo0mHv8cKFpRdN0RPoLkFd/gVVTr/u0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S9GgMbVD8dWdF8waLh23wcpIrOP2oWSwhhAHhjsd4Z5H9Gs4ctC3Ep1UelumJHL0u
 OTblZGtM7KhtnPEJGhB6oKF1AKx1DT8nysM3LcnWhjaqQiCB/ndSGuaXPx6Q01aa4y
 U1zqhQ2aIGJSJOaRG1XaLqVsaA3I2BzbcMbZAtFoG9p9E6nPcrM86+rwdXEB+hRSpd
 w+HYjc8LkqKhrfIMirumhOJ0jT0TzFx3YK0jDnnLBZEaI3HQ41xERF2J4vVapjkUGP
 5kANOofBzxvgZjlETFIRXAG3Oh3ay/FjeLfdHjJUP+GIWvLphLcAph7KB6w87qTGqw
 53135soDt0hDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 28D65E5D084; Wed,  9 Feb 2022 12:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164440920916.21838.3965616722762050917.git-patchwork-notify@kernel.org>
Date: Wed, 09 Feb 2022 12:20:09 +0000
References: <20220209000359.372978-1-joel@jms.id.au>
In-Reply-To: <20220209000359.372978-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:29 +1100
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed,  9 Feb 2022 10:33:59 +1030 you wrote:
> Fix loading of the driver when built as a module.
> 
> Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/net/mdio/mdio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net] net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/netdev/net/c/bc1c3c3b10db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


