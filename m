Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FC3F0416
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Aug 2021 15:00:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqSfm5KBSz3bhk
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Aug 2021 23:00:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jC9lXLxw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jC9lXLxw; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqSfd1xgcz2yX6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Aug 2021 22:59:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B829B6108B;
 Wed, 18 Aug 2021 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291589;
 bh=NQ7YVl0zBOlQKk7YhXLiC9GPIBKFILKn3qHOuBPZ4m0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jC9lXLxwbWi5EnRMx/yNZuNhW4xuRujrLlZbOQUDLSZ6rzBKNWtrrWifM8TLvKKCi
 dvP9gU3JRJKZqzSywxJAwC7PhrV5346LvWtaTMis0+PjMdXOnJx3jm6/q5pV9bj0ye
 81IF7OFgGMpbaXo24zWIt51SEdz4HjduGJUrJBdd27Jvs4GWAVUlKLAbTmS60VXvsj
 uh7ULcIVSXgFicNRXhT8Ym+87/3bKoVZyNI7b3TbCr4ZW/NvS0H9PAnhLLB2KJG4Ee
 D5qYdgpbmV3vSTLDyAb73xjgouwZBBqI4QzoMHFNqYkJJqE2oqNJLxs7g+1SEgVgZ0
 5aGk375m46hJQ==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
Date: Wed, 18 Aug 2021 14:59:25 +0200
Message-Id: <162929137186.372162.11203697127775599651.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
References: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 07:51:54 +0000, Joel Stanley wrote:
> Here are the aspeed changes for 5.15.
> 
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:
> 
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c872138c2c7166dc95c778f4decc165bace9cb33

       Arnd
