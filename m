Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86D3CBE73
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jul 2021 23:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRPQz1Tp0z3bT4
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Jul 2021 07:25:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C+8BXsjT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C+8BXsjT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRPQt0JsSz2yP3
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Jul 2021 07:25:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 551A5613E3;
 Fri, 16 Jul 2021 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470707;
 bh=qDVWi0rKR8obdtzuoYtx5h0eArB5K+BEGwcPu7gqtko=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+8BXsjTDbG+fK8b1NwZxabM/bUwd9ZditDM7Q6j2bSvsb2kxRXnGhkdFeO5fNWr3
 fOJGuwpAMQbIBDuCpS9YSpkE7vc96C+fTSz0GEYlfUTaZbOsW1BIU3BVjCne5ZF7vT
 tmTSouSVh1k90meASHh5GjPUmbRHXIMMkPMw4qICMLFj2ub/J01APeWIkaXIK7rMZu
 RImKD9+sFoFwO2YMeBwtHBMAWYRuISR1AhheZKrCHy7ri3vKhxNVA9bdJ0wxR11igM
 m+7mgDkEL86zKZzzrFmVeHSLrdV3t/BVzQEvZfjKBGmlwUbGAyd7J4QhJrVOgvKSF2
 7d0SHq5gWv5+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
Date: Fri, 16 Jul 2021 23:24:44 +0200
Message-Id: <162647049998.3478428.1864031111660370458.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
References: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Zev Weiss <zweiss@equinix.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Jul 2021 04:31:59 +0000, Joel Stanley wrote:
> Here are some minor fixes for the aspeed device trees.
> 
> The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:
> 
>   ARM: dts: aspeed: everest: Add pcie cable card indicator leds
> (2021-06-07 13:38:55 +0930)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 8825f2744d944e5666c28bb04a84abdcef27a7e6

       Arnd
