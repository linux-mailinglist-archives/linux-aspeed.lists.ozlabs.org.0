Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A932D2F27
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 17:10:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4sL5CWnzDqZC
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 03:10:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr4qY5lj9zDqZC
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Dec 2020 03:08:57 +1100 (AEDT)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Joel Stanley <joel@jms.id.au>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
Date: Tue,  8 Dec 2020 17:08:41 +0100
Message-Id: <160675365667.2641537.14525389407250717385.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
References: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:41:35 +0000, Joel Stanley wrote:
> Here are some ASPEED SoC changes for the v5.11 merge window.
> 
> These are mostly the 5.10 changes without the XDMA driver, which I
> didn't get a response on my question about where we wanted that to
> live[1]
> 
> https://lore.kernel.org/linux-arm-kernel/CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com/
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 00c543f6f3f46ce02e300d76e22bb21a8a75e872

       Arnd
