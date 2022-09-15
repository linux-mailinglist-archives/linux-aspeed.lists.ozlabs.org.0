Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1AB5B993A
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Sep 2022 13:00:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSvPS0F4wz3bkl
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Sep 2022 21:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gmgro/xC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gmgro/xC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSvPN0MCgz2yRS
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Sep 2022 21:00:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07BFAB81FAC;
	Thu, 15 Sep 2022 11:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 981FAC433C1;
	Thu, 15 Sep 2022 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663239617;
	bh=acLkAUMk8BizKu7cs/NDP4722gLa3JtenovpxYO3Tr8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gmgro/xCWfp0Ze/EGnC+VKSQMF6UT+HP8vRhQUthN2sRBWRbOqsBoQpALOJGiJ/10
	 cUwOVAMciz0g0KcBweDX2hfDVvb+hIGPGdJgXG3P0rcXtkpRPyodGlXfN9iefDrCpY
	 aNs+hiXkrgySSxOm7bL8H+BQMw8vmcs9u1omb+criFevg9Sm4arCrtBNm9tcu6+slD
	 DvcdT3mzYo8UJpcBLcdFz7HDk2eCI46Ux2Ze/mBS9ZW85U/3Da2X5qxyxhAN3mEagX
	 U+kjBGC0sf47cgTi4PtAbDI4CmsRt1WxBbYue8Vc5Y115JdCxcZyLB2CqYsv0MoxPq
	 sJXDx1FtsgnKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73AF2C73FFC;
	Thu, 15 Sep 2022 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: ftgmac100: support fixed link
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166323961746.5581.16008979446604456337.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 11:00:17 +0000
References: <20220907054453.20016-1-rentao.bupt@gmail.com>
In-Reply-To: <20220907054453.20016-1-rentao.bupt@gmail.com>
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, huangguangbin2@huawei.com, edumazet@google.com, robh+dt@kernel.org, chenhao288@hisilicon.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, windhl@126.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  6 Sep 2022 22:44:51 -0700 you wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series adds fixed link support to ftgmac100 driver.
> 
> Patch #1 adds fixed link logic into ftgmac100 driver.
> 
> Patch #2 enables mac3 controller in Elbert dts: Elbert mac3 is connected
> to the onboard switch BCM53134P's IMP_RGMII port directly (no PHY
> between BMC MAC and BCM53134P).
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: ftgmac100: support fixed link
    https://git.kernel.org/netdev/net-next/c/38561ded50d0
  - [net-next,v3,2/2] ARM: dts: aspeed: elbert: Enable mac3 controller
    https://git.kernel.org/netdev/net-next/c/ce6ce9176975

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


