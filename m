Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332945E36B
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 00:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Z4Q1btvz3bd0
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 10:35:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ePD6MPCA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ePD6MPCA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Mz13QcZz2xBP
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Nov 2021 03:00:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 236B66108E;
 Thu, 25 Nov 2021 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637856010;
 bh=ucYoul2wvLTG4PBO56hF4AxJWAGQbC8TJdZcAk422Ks=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ePD6MPCAjCTjr8QWwQYoks4TOCIjpPFBQQvPqPPsb/JcwATS6NHiA8K/5nqsaN5kV
 rjvQy1StCKoCq0IdZG1BeRZ4oy+rQ0exEEwN+HNnEtfPEgeJ+Im7evrQNnx7pyWL1a
 VJ3DmstgvES4ranJaEy9QbqZPozUIOW03yFGEdIbGsDcJ9e97j1r1QuoIxB+9YXXsT
 NaZFWbejIvCREg2Sid3PXBgxHUCXED2DwXmCtWpry3iF5r/kJHxoWa3Jxw/9+E7yZr
 +2dLbQ9dr374v8LDqL6ZKzV3mEhFZx1LEUWizLScI981xQ3dxNZfVY0txTdRneJJ9+
 IcyHja+Gy5+fw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1624160A21;
 Thu, 25 Nov 2021 16:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mdio: aspeed: Fix "Link is Down" issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163785601008.7926.14064362154729889685.git-patchwork-notify@kernel.org>
Date: Thu, 25 Nov 2021 16:00:10 +0000
References: <20211125024432.15809-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20211125024432.15809-1-dylan_hung@aspeedtech.com>
To: Dylan Hung <dylan_hung@aspeedtech.com>
X-Mailman-Approved-At: Fri, 26 Nov 2021 10:35:12 +1100
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
 linux@armlinux.org.uk, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 25 Nov 2021 10:44:32 +0800 you wrote:
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
> [...]

Here is the summary with links:
  - [v2] mdio: aspeed: Fix "Link is Down" issue
    https://git.kernel.org/netdev/net/c/9dbe33cf371b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


