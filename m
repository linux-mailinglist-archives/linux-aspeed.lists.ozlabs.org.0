Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C42D4BE3
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 21:32:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crpcg06kNzDqtv
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 07:32:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrpbJ4jXSzDqvL
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 07:30:52 +1100 (AEDT)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Joel Stanley <joel@jms.id.au>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
Date: Wed,  9 Dec 2020 21:30:38 +0100
Message-Id: <160754580117.2405127.13379631047169707253.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:30:44 +0000, Joel Stanley wrote:
> Here are some ASPEED changes for the 5.11 merge window.
> 
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
> 
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 419fd286274e32c2533f1305d76b04b32ae49853

       Arnd
