Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBDB359635
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqGJ564mz30JL
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 17:17:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o2f38BEs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o2f38BEs; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqGH0dTbz2xb8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 17:17:43 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D83661178;
 Fri,  9 Apr 2021 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617952660;
 bh=uygj9zBfptFX92rchP4Ynh/JGD0wJp90BR8NgN0XWbU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o2f38BEsEIKhiqiWk/PsQpFwVE2m4pitqyKjdNGWESG2Zf4lxm8hj4ZO+Fq7Wm956
 cMlZD+r7hciqVFG3Ug6Xw1WpzrKy9VbcEFKlYJwBSuI+8XLMCyoLeJDJCoU3BgvnqH
 +4LoJyWCJK/A4iD8pHN7DkPDkp8yV7TXJSbixo6f8YV4koda0w/I4oikDfm82oh7Ut
 +4n2M06bZyshzLt5dI7La7Di3hWHgwKS/uk1NDeev0Ox58a/5geWBbJVvEjXcXI74F
 Av7PPV734QUEYnJkWoZMw/bJ+6FKyovVnFjNI0QzseRrcxw7KBwQQWZR8byrwklcTf
 lPessPAZ4Zgqw==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13
Date: Fri,  9 Apr 2021 09:17:35 +0200
Message-Id: <161795265048.1749935.15830124997910239772.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
References: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:14:27 +0000, Joel Stanley wrote:
> Here's a pull request from me for the ASPEED and Nuvoton changes
> targeting the v5.13 merge window. As you can see I've chosen to
> arrange the pull request as one single "BMC-related" set of changes.
> If we choose to continue with this, in the future I will cover the
> ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.
> 
> The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e3bbc53ac8827babb5001037883e4edd2068168d

       Arnd
