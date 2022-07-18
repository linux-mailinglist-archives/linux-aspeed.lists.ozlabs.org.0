Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956457791E
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jul 2022 02:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmNgk2nxhz3c2K
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Jul 2022 10:51:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Txgoqm8L;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=18tngN32;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Txgoqm8L;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=18tngN32;
	dkim-atps=neutral
X-Greylist: delayed 354 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 10:51:08 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmNgc3vv2z2xmk
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Jul 2022 10:51:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1429F320039A;
	Sun, 17 Jul 2022 20:45:10 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 20:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658105110; x=1658191510; bh=9eCT8yjok0
	PcSR4T5HvuxY2Sn6RNMobB+nq9wlqocDU=; b=Txgoqm8L3eOo97F6L2M1hCzzWs
	eZ1ANe5/eX/M3qB5ZKrWRI4vAfEaOBH54clcBHo9bsRLf+ogW5P3Ni0pLEbuWUfB
	aaMPf6Nb9tEjDJkvlV0r/B5BGg+w3klBfR+HgltvUZx8+y7/c4gLvnQ5X3wtFQGv
	1vv6RYDzhWqic+hY/hovn0opbtb/dj3MEzRgtQxzWTlUMJT2czTAfmQSG1hz7e39
	QwEREcL8+VGzle+hjZJ6tH4Dmq45iqZdaR1W9+XrX0NwZf62FI5OfdiDiEPFVxiq
	16zax4Moze54MA/lx9l6yJa+ub1r4LAbvMliFPrEGPC+3jQISgZ+THBIp3uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658105110; x=1658191510; bh=9eCT8yjok0PcSR4T5HvuxY2Sn6RN
	MobB+nq9wlqocDU=; b=18tngN32W7+K7CjfUBw8Ftb5OhGZaov/D6q/jVY1lDqI
	lvOfiOAtDBBreSofiFmQ71gjlWcuIXK5H+fBAk4UQXFJwvGXyt6LxsZ3LAkO7mPi
	mftuFQK02EhH3pNPSaiNMIPjumnj5SO6L1oI5XW6a6wWAJPmRcfNTxnjUsm2EHQn
	6hlMXQJT8xskwpajkQ0bLjTgmaMRRrV7t26YVPqKz5S/XntreGCGjUn2S+N0CYp9
	hkQG11QZtKv+yDHYS8QvkkAg3Z9Hm5SpVmOZ+wN+xsqJfryuZ/rj7qe+iCyhtmXz
	CZCZNkYQGbHa08hEBWclVHKfz2mY2gh8OpEqvij9vA==
X-ME-Sender: <xms:Fq3UYvQ1yZLBY26aY3nfTTYnRxIPYyFXwz0EjSDD4LZ8eoxPWggs2Q>
    <xme:Fq3UYgxNC-OugEvu8FYfILLTXZwUzEdwWWbThul_0lmQQtQT7jV-84lQSCbNj_FSq
    ZOAOOgm4VoIPMXxVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedvvedvieeuteehiefftdfhjeevvdetffevgffhhfeuudffhedvkeef
    veeiueejleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
    uh
X-ME-Proxy: <xmx:Fq3UYk3ueDkE8gWGk2gk21Bq1KCHDJERCrXeRatY4ULnUI88ziGRRA>
    <xmx:Fq3UYvAQdtizsOSm6j5-tjJVvqtctzAO8e5CGZA0gR7VqLfDqEk6dA>
    <xmx:Fq3UYoiaADdvIc4N8pDf_Z8Z0S3BX5AsBxvAodQAkEX4HmHN6fWBcA>
    <xmx:Fq3UYtbeYo5nNMmCMWUBTsv0pnBXPWFB01VCpxzTT2NXElz8b4ImqQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 26B5A170007E; Sun, 17 Jul 2022 20:45:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <38480b33-3b4d-44d4-bb24-6ab199d0c793@www.fastmail.com>
In-Reply-To: <20220715040354.2629856-1-davidgow@google.com>
References: <20220715040354.2629856-1-davidgow@google.com>
Date: Mon, 18 Jul 2022 10:14:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Gow" <davidgow@google.com>,
 "Brendan Higgins" <brendanhiggins@google.com>,
 "Daniel Latypov" <dlatypov@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: test: Fix dependencies when KUNIT=m
Content-Type: text/plain
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
Cc: kbuild test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-mmc <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, Sadiya Kazi <sadiyakazi@google.com>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 15 Jul 2022, at 13:33, David Gow wrote:
> While the sdhci-of-aspeed KUnit tests do work when builtin, and do work
> when KUnit itself is being built as a module, the two together break.
>
> This is because the KUnit tests (understandably) depend on KUnit, so a
> built-in test cannot build if KUnit is a module.
>
> Fix this by adding a dependency on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y),
> which only excludes this one problematic configuration.
>
> This was reported on a nasty openrisc-randconfig run by the kernel test
> robot, though for some reason (compiler optimisations removing the test
> code?) I wasn't able to reproduce it locally on x86:
> https://lore.kernel.org/linux-mm/202207140122.fzhlf60k-lkp@intel.com/T/
>
> Fixes: 291cd54e5b05 ("mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  drivers/mmc/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 10c563999d3d..e63608834411 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -171,6 +171,7 @@ config MMC_SDHCI_OF_ASPEED
>  config MMC_SDHCI_OF_ASPEED_TEST
>  	bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
>  	depends on MMC_SDHCI_OF_ASPEED && KUNIT
> +	depends on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y)

Should this replace the line above? Isn't it just more constrained?

Regardless, thanks for your work here, the kunit integration with the 
ASPEED SDHCI driver bothered me a lot when I wrote it.

Andrew
