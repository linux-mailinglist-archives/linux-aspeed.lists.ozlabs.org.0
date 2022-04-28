Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC1512D9A
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Apr 2022 10:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpp2M4P8hz3bbl
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Apr 2022 18:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oWYnxOyh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oWYnxOyh; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpp2C6z4cz2x9M
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Apr 2022 18:00:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44918B82B46;
 Thu, 28 Apr 2022 08:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8E82C385AF;
 Thu, 28 Apr 2022 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651132814;
 bh=NhzxeaiPtX29P/RQ1EZRDWoQ85Ud+xmKkVGCgk4axRo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oWYnxOyhqwu9+DDI3nBKx2MYv9VAjqFHY9gZOLYQ7YbVsFEJJ2BlN+VLth0CqxAyY
 D0RIbVuZISIqam72WMojOrEbtuuJdeLTxWIr43XBLUrTSMM2wU/0RzZackNVo+znSv
 R6xYwOZN1ILqAXOmQIokF4HdL9m9mlh+R8axr5NmhzBn9QeibT6HhjaCGKK1akD++I
 NBTcWhpdT+1XK/N7PyiRmtUfZa7W7KdR4uGcZqGvrhrpcSrRk59ctb4UQJCVcsumFV
 19vY9gHiNU+PyLvznLounOc8CRMJIXkVSL5tZc5i52KP24cLttIjQg4U8PR/1U/Rq6
 L4srSq1YfbLYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CC6A6F03848; Thu, 28 Apr 2022 08:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/3] Add reset deassertion for Aspeed MDIO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165113281383.18320.4392733597031620759.git-patchwork-notify@kernel.org>
Date: Thu, 28 Apr 2022 08:00:13 +0000
References: <20220427035501.17500-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20220427035501.17500-1-dylan_hung@aspeedtech.com>
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
 netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 27 Apr 2022 11:54:58 +0800 you wrote:
> Add missing reset deassertion for Aspeed MDIO bus controller. The reset
> is asserted by the hardware when power-on so the driver only needs to
> deassert it. To be able to work with the old DT blobs, the reset is
> optional since it may be deasserted by the bootloader or the previous
> kernel.
> 
> V6:
> - fix merge conflict for net-next
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] dt-bindings: net: add reset property for aspeed, ast2600-mdio binding
    https://git.kernel.org/netdev/net-next/c/65e42ad98e22
  - [net-next,v6,2/3] net: mdio: add reset control for Aspeed MDIO
    https://git.kernel.org/netdev/net-next/c/1585362250fe
  - [net-next,v6,3/3] ARM: dts: aspeed: add reset properties into MDIO nodes
    https://git.kernel.org/netdev/net-next/c/a8db203db05c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


