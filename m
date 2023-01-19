Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB4673D81
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 16:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyRQq65Sjz3fFH
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 02:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bFB7tr99;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bFB7tr99;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyRQk4wX4z3cfK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Jan 2023 02:30:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CFBD8B8252B;
	Thu, 19 Jan 2023 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62A2EC433EF;
	Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674142218;
	bh=FP4ru6E8Oo1JNr9DNk54UNNPsvn5fuH6fMcjfdBl9lY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bFB7tr99GI5Hq9EBVHmPrjqEzs9dqNrQDOhNaSTZhid/ub9KtLtAbp6OrBy+XmNZd
	 Ys9K9qWgQGZpyCFNH5lCqncShoKEdtrNFA266NAB6zpE/qD6ZzYuobsVgof6W0XFC3
	 smDWAszIxvhLusZnZm+S1wiJcv/xWWC4lmGNyooLA6sEPZtCMcTIueGF/qexVHMRL0
	 GSqDqp59ittarba+p35/hEqdy+bVRKTY6oyU5blSnT90PMfmI5yNaNsMw1XGzUl31k
	 gDr0yNHZtLCad1rWNA2lx7AZFozMamdVIkRPdHcdbqG9lVoP8sQvqoLVo+ySOAT4NR
	 Eh/O2sbpfBD4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E094E54D27;
	Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/6] net: phy: Remove probe_capabilities
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167414221817.31934.14400606803161415762.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jan 2023 15:30:18 +0000
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
To: Michael Walle <michael@walle.cc>
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, jesse.brandeburg@intel.com, edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, bryan.whitehead@microchip.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com, davem@davemloft.net, nbd@nbd.name
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Jan 2023 11:01:35 +0100 you wrote:
> With all the drivers which used .probe_capabilities converted to the
> new c45 MDIO access methods, we can now decide based upon these whether
> a bus driver supports c45 and we can get rid of the not widely used
> probe_capabilites.
> 
> Unfortunately, due to a now broader support of c45 scans, this will
> trigger a bug on some boards with a (c22-only) Micrel PHY. These PHYs
> don't ignore c45 accesses correctly, thinking they are addressed
> themselves and distrupt the MDIO access. To avoid this, a blacklist
> for c45 scans is introduced.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: mdio: Move mdiobus_scan() within file
    https://git.kernel.org/netdev/net-next/c/81d874e7c84e
  - [net-next,v2,2/6] net: mdio: Rework scanning of bus ready for quirks
    https://git.kernel.org/netdev/net-next/c/d41e127757f3
  - [net-next,v2,3/6] net: mdio: Add workaround for Micrel PHYs which are not C45 compatible
    https://git.kernel.org/netdev/net-next/c/348659337485
  - [net-next,v2,4/6] net: mdio: scan bus based on bus capabilities for C22 and C45
    https://git.kernel.org/netdev/net-next/c/1a136ca2e089
  - [net-next,v2,5/6] net: phy: Decide on C45 capabilities based on presence of method
    https://git.kernel.org/netdev/net-next/c/fbfe97597c77
  - [net-next,v2,6/6] net: phy: Remove probe_capabilities
    https://git.kernel.org/netdev/net-next/c/da099a7fb13d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


