Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 129244F941C
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Apr 2022 13:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZbdw0lTBz3bVd
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Apr 2022 21:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cHewQVj+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cHewQVj+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZbdn3QV2z2xVY
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Apr 2022 21:30:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60842B82A51;
 Fri,  8 Apr 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FB69C385A1;
 Fri,  8 Apr 2022 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417416;
 bh=N++kWg6tmJMduGzzAXaaygWea3gRrf1JYMIm/yTrKXM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cHewQVj+pcC9ybfjCA/W5eCNRvGtR7gDIAIN9zHA/ZtIUmgqQ3UMW4Qg/bJz/F9kW
 Hv4vH7xiF9Fh/R6dnDNB5Y5dIwzTt3lSmT2fYK5QMJ/nV9zfbU5munKLpZ4YPekqiZ
 Z3cRHIDXB8M4hxNnATjlvxu7BeznfidvOzHGVBeOy7sbyzcWrTXhfo6e9W9W809/KJ
 Tbdbcr5jxZ/N6ZN/gzPY1lHUlUzxUdNna6W9KwNTUAnLzM/7kf9Rh4WghBT73p8X27
 3PjqdeqbLlNeStEuXA12OtfSaX1gr1CHbPSqmFYTcNUKKM3r/g83XxbY5IiQZ4cWq/
 Br29I8zlwfRFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 06EB4E8DBDA; Fri,  8 Apr 2022 11:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] Add Clause 45 support for Aspeed MDIO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164941741602.31457.17503589605450894981.git-patchwork-notify@kernel.org>
Date: Fri, 08 Apr 2022 11:30:16 +0000
References: <20220407011738.7189-1-potin.lai@quantatw.com>
In-Reply-To: <20220407011738.7189-1-potin.lai@quantatw.com>
To: Potin Lai <potin.lai@quantatw.com>
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
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, patrick@stwcx.xyz,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Apr 2022 09:17:35 +0800 you wrote:
> This patch series add Clause 45 support for Aspeed MDIO driver, and
> separate c22 and c45 implementation into different functions.
> 
> 
> LINK: [v1] https://lore.kernel.org/all/20220329161949.19762-1-potin.lai@quantatw.com/
> LINK: [v2] https://lore.kernel.org/all/20220406170055.28516-1-potin.lai@quantatw.com/
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: mdio: aspeed: move reg accessing part into separate functions
    https://git.kernel.org/netdev/net-next/c/737ca352569e
  - [net-next,v3,2/3] net: mdio: aspeed: Introduce read write function for c22 and c45
    https://git.kernel.org/netdev/net-next/c/eb0571932314
  - [net-next,v3,3/3] net: mdio: aspeed: Add c45 support
    https://git.kernel.org/netdev/net-next/c/e6df1b4a2759

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


