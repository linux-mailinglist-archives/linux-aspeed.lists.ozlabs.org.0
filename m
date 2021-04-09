Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E828359637
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqHB2g0Kz30Fc
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 17:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AbKSnn28;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AbKSnn28; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqH86vdcz2xb8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 17:18:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F88661107;
 Fri,  9 Apr 2021 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617952706;
 bh=2mWb3+F3h0vGmR85tMfMYETiFUZhbud9i7NI+IMO9pE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbKSnn28w5EJo1scRp166/oa/7BV2oqBWO66yVtmAx/tWC28KtWWFKzvlkOjn2AU0
 9jzbxKN8nj7sfyEvjhunUmzGj/Fb9l7QX72FfvNi//DcWuwKr41+ikR8oqviPBwoVb
 h37E59y8nb/ZlJpQiFTo6nIvKs2H3t6QjPhmt/jlwmWtxepSSXJSIRK6nO/F/2op2N
 xAIo7owvReEF57qJaGteeJSBkd1REnQF3UaQw0D3epNm2IHLF1L0ru7saqMT5O0OOM
 HrG5ozgjsw06TP522ZwKDS4psU1K8j9eeDu2dwhYqXgn9J99VhaLOdL/e04+GGstkN
 ycvivTGQZmw8Q==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: lpc changes for 5.13
Date: Fri,  9 Apr 2021 09:18:20 +0200
Message-Id: <161795267844.1750068.14862109207368145425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
References: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:29:52 +0000, Joel Stanley wrote:
> This is a pull request containing a slightly messy device tree and
> associated driver changes for the ASPEED systems. It corrects some
> design decisions made when first mainlining support for the BMC
> devices on the LPC bus that have stopped us from being able to write
> drivers for eg. KCS.
> 
> Andrew has worked with Chai-Wei from ASPEED on this process. These set
> of changes have acks from the maintainers, and allow Andrew to go
> ahead with fixing the KCS drivers in the future. The branch should
> apply with no conflicts no matter which order it is merged.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d60f314b93b637e9721c406f5a61cf2157e59b48

       Arnd
