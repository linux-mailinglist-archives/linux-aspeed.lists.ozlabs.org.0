Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1FB8B6785
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 03:38:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YWNZ6eSu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT2sG1GCdz3cWv
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 11:38:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YWNZ6eSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT2s85WCwz3cWD
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2024 11:38:20 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F402E200EF;
	Tue, 30 Apr 2024 09:38:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714441100;
	bh=iO2Qb5vOGlEJy2p0kRpFmo54k139J+5qqBLF4SdTE8M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YWNZ6eSuJjdbazCq5Tr+/UMFUigvmiomlY34UiNQ8iZ6ukGL8t2ygckWbW1FQPw9r
	 RUeeQGYiZKxASLXC4rgHy1PIE6o8XoALUjlioZrOuwUW5ZjmgYcKmbsc50mIeCVXni
	 oJaGFoo+2fA6LPSY+LMM4E6fTl9NonCyWAwD0qFIwOLUvdmKadqtZK601bTUmdyXrY
	 2EUw64UOzIzHckNCD8Rn/cfiZ0KYODOl5DmnQS3GfkoC5O1+dma7eD9mhKmJ5HRMe5
	 ZAswFxFNqvUPPyphfQ23WKJRJ4REOwCXp1NerfE53XMINCfVWGcC1iO1OhYCemDU2M
	 661FS1yGDsWFA==
Message-ID: <e694ba58197687dce68d568dfcb078ff3a6c6fed.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 1/1] drivers: watchdog: revise watchdog bootstatus
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Date: Tue, 30 Apr 2024 11:08:17 +0930
In-Reply-To: <CAPSyxFRG8mooBg1QWZk8sw=cWzoUQqk=WnyAtgPfRBmQRKtvaQ@mail.gmail.com>
References: <20240428142937.785925-1-peteryin.openbmc@gmail.com>
	 <20240428142937.785925-2-peteryin.openbmc@gmail.com>
	 <d231737bfa9f3dd3c0a4370ab2e86557a407980d.camel@codeconstruct.com.au>
	 <CAPSyxFRG8mooBg1QWZk8sw=cWzoUQqk=WnyAtgPfRBmQRKtvaQ@mail.gmail.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-04-29 at 22:54 +0800, Peter Yin wrote:
> Hi Andrew,
>     I am not sure how to add the Fixes tag, Is it like this?
>=20
> Fixes: 6a6c7b006e5c (watchdog: aspeed: Add support for
> aspeed,reset-mask DT property).

Approximately, yes, but it must not be wrapped.

Some more info is provided in the submitting-patches documentation:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>=20
> Is it the correct commit ID or should I base on which commit ID?
>=20

The correct commit ID to use is the one that introduces the problem.
Using `git blame drivers/watchdog/aspeed_wdt.c` it appears you're
changing the behaviour that was introduced in 49d4d277ca54 ("aspeed:
watchdog: Set bootstatus during probe"):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D49d4d277ca54e04170d39484c8758a0ea9bca37d

Andrew
