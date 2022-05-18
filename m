Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F252BB5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 May 2022 15:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Cyl4b11z3c8K
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 May 2022 23:10:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C9MQIFjy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C9MQIFjy; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Cyd0Vkhz3by0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 May 2022 23:10:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9EF661792;
 Wed, 18 May 2022 13:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B615FC34100;
 Wed, 18 May 2022 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652879412;
 bh=EIH9yiKDnL+UTvZPE7qnh67OC6VGMvnpFNOvsGUkcdY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=C9MQIFjyZ0fHKSf7AGceMpzecm9Gr9EVoHqwjMJU5eWo654xBsL4Uy7AKlFcsG1rq
 jJRGXviszOPCrWvayWcqSTGCuM04tCmJJG9s33O/ZO/CLgtTBXypJQNwnQeaYs4GEe
 UZbDCP5zHaIzU0nLzveNZHoMN03j3qC+Fp/rLMni0X3u+0lmuceAvddtctnCeLWFfG
 tyGF6UW/mjrakiLdIVR+QdBqkUereH6WU6rFr3YiGDEHezgyt24PZO3ABua4TBivIs
 2oyjbMBjBbBkuPFbDN3WRsqh5l02vwTtDmf+PSQHk7hHGurdaYgl5Jr6xD/KzXFD4y
 Vd/PPP/jY35Cw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 97140F0393B; Wed, 18 May 2022 13:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: ftgmac100: Disable hardware checksum on
 AST2600
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165287941261.26952.17675675280998772661.git-patchwork-notify@kernel.org>
Date: Wed, 18 May 2022 13:10:12 +0000
References: <20220517092217.323060-1-joel@jms.id.au>
In-Reply-To: <20220517092217.323060-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
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
 wilder@us.ibm.com, kuba@kernel.org, davem@davemloft.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 17 May 2022 18:52:17 +0930 you wrote:
> The AST2600 when using the i210 NIC over NC-SI has been observed to
> produce incorrect checksum results with specific MTU values. This was
> first observed when sending data across a long distance set of networks.
> 
> On a local network, the following test was performed using a 1MB file of
> random data.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ftgmac100: Disable hardware checksum on AST2600
    https://git.kernel.org/netdev/net/c/6fd45e79e8b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


