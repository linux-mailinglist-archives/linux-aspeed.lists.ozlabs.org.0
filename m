Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184348B2E17
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:42:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MRPTWh6i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQYp86xWgz3dLl
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:42:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MRPTWh6i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQYp36pTGz3cNV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 10:42:03 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AF5520075;
	Fri, 26 Apr 2024 08:41:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714092123;
	bh=yLN/Qb+eB/6AyNAKbEB/yMlsv9Gl2BYp81SCa6piTeg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MRPTWh6iLUPzVdEoN6OoxnclwEajv4PUZysrLyAeI30AMIhWlPLTwwk4v6ltGNUFN
	 tHGXIKanZihdwzVoroKvOwGJNrc3ARd8koi0aUc9RQLUlBlDMnerfnrYWkLkHei1wV
	 efSkxL9aqLaDWbMFYId3Xskp63kVqccJnm+VHVxOszpG/EVeMlaOyJc4wCrDWqyYan
	 Bv/6v0Z/fBlR3wvFujD4bAScafK87c8QGR5ajjxDsGTjdoVCHNfFhjTALI5tOvAMHS
	 vNK20+8DoBp4QsLP1jAAMsdxeuSwViKa7qRHWsZDVccbZzNEjKPtA+ccqkchMyBnhy
	 B+fOhM5t4K0sg==
Message-ID: <5ed8bfd6ce559a7d00ec89f1bd7ae1aea90e3ae7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 1/1] drivers: watchdog: revise watchdog bootstatus
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Joel
 Stanley <joel@jms.id.au>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 26 Apr 2024 10:11:57 +0930
In-Reply-To: <20240425090727.3787160-2-peteryin.openbmc@gmail.com>
References: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
	 <20240425090727.3787160-2-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-25 at 17:07 +0800, Peter Yin wrote:
> Regarding the AST2600 specification, the WDTn Timeout Status Register
> (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
> on ast2500 if the boot was from the second boot source.
> It does not indicate that the most recent reset was triggered by
> the watchdog. The code should just be changed to set WDIOF_CARDRESET
> if bit 0 of the status register is set. However, this bit can be clear wh=
en
> watchdog register 0x0c bit1(Reset System after timeout) is enabled.
> Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRESE=
T
> in ast2600 SCU74 or ast2400/ast2500 SCU3C.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 109 ++++++++++++++++++++++++++++++++--
>  1 file changed, 103 insertions(+), 6 deletions(-)

After this patch the probe() implementation is ~250loc with a whole
bunch of conditional behaviours based on the SoC version. Maybe it's
time to break it up into version-specific functions that are called
from the probe() implementation?

Andrew
