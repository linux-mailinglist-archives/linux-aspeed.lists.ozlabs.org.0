Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F7B318DCD
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Feb 2021 16:04:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc0KJ1LgszDwqD
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Feb 2021 02:04:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oFrz9l/D; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc0K84bsMzDwlx
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Feb 2021 02:04:28 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 673FD64EEB;
 Thu, 11 Feb 2021 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055865;
 bh=+jRoaD3iDwRW6TssAdozKbV2lWhdbP0kdSOL+xK/aNc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oFrz9l/D80OFyMamSVIO6KHbjBK+rSIk4//bXhMB1KEGOYbX1wu+fw2GB2ISOxxHD
 ilJ4mgWKra18d6S237jEOOv8LvjN2piFN5f36W3ZNVysdgXqPpcM5Wk8F6W7TO2e8H
 xykg7hbvS0/p9v4gGv61YOB9SOfBpqxcXS27vy55A0a8zCq56nGPfYXdbVqXcNDPJm
 HtKTXkufcz/u6mWV//pKws1jI+qmU1Igm3AVM/HqkSOoEXFli+WPurMgqAehemdp/i
 TzI8SuoUAFf55eaQoJBUW8Q9A9mrsPbgHXTZBGvCuXhOxUEUr6RbOO1izoJJcrJIJ+
 CigTtHobl4XRw==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
Date: Thu, 11 Feb 2021 16:04:20 +0100
Message-Id: <161305573907.259289.4679154731626442010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
References: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
MIME-Version: 1.0
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
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:28:23 +0000, Joel Stanley wrote:
> Here's my late pull request. I've deferred some LPC device tree
> bindings rework that need a closer review, so the contents of this
> pull request should be straightforward.
> 
> The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:
> 
>   ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
> 21:21:36 +1030)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 52ded9eaa25a203e59142db252d0bc2aae80a2c2

       Arnd
