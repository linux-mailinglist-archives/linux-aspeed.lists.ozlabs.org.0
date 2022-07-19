Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4E5790D0
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 04:25:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln2kL4kC6z3btn
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 12:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aTpX4sGw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pS78PrPF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aTpX4sGw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pS78PrPF;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ln2k90q6lz2yxF
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jul 2022 12:25:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5B9A63200931;
	Mon, 18 Jul 2022 22:25:29 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Mon, 18 Jul 2022 22:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658197528; x=1658283928; bh=wHVY6i+Yaf
	5t2+yX0N5Kt7nv5hQLK0Oovx2GIklJtSQ=; b=aTpX4sGwPceYAcol+aRJwJRpUW
	Ws0qvx10J5oXHkpQBZfDd2szjxbRk2gggw7TMmdyEZxsx3aMMiWA3LmZqfsoqYwc
	0D1pMO8fr4NxKWDrW8iJ0zBkkZG997AGfIqQHvIJ/gwCn6SoAC7QqjiMFEck0LsR
	8nZxCm2jGaOkk8BX7jZtLBQN2NjBNXF7ukK8Sxwwx/xl68nocPpDYTLFyBDXyR+8
	OkphJt3JHytQV7K5Ii1rcm4eyO4g5eyat003iLxCIl2u2T/5PJ+gDRunsBAC1Y/o
	SKlqHVZ+KGl10INkANhcQKpO8hNdosinPTA2bpJg3rZNsoFkJcUj3gs+5NgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658197528; x=1658283928; bh=wHVY6i+Yaf5t2+yX0N5Kt7nv5hQL
	K0Oovx2GIklJtSQ=; b=pS78PrPFoQbxYdgdgAJreVahHS11jVFvWdMb3BTpyocV
	X5EccwSepuM+WJzfS3iBN65HO1W+WN6fcKN0p12qSfiAf7STxbnlBoBpN/eUXGLa
	pil03+GUJM18xxStHOjkzhov4l/bA2mvNqojP3OfYEKa9teXyfGu2FCIGtcW59UX
	9CNCih44OqbAiYxDeFxDZ5IrHC+Al6wun1/71Aj7xjbbOCqiN8jebNOwOe57dP8+
	O+ial22JAj0ojjIe38t4IFkLdPF7CX1/udxpADBGcVNxk+AJUsUtlJTVKVcHehlb
	9/JAbF0Uh5XcLUktjmXLVcpPnBXv8DeyxYlR25tIog==
X-ME-Sender: <xms:GBbWYu8ZyEgtlAK2eauK7jhuhU6lg45oK9G8OEn-VMsP168n6923IA>
    <xme:GBbWYuvgyTZyN1rcXXx5O1R8Zw234ebXd_yGyrfI9I20mMLD74nrruGNRyhaXQE_S
    e4dKaKvO-A9wgI2dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedvvedvieeuteehiefftdfhjeevvdetffevgffhhfeuudffhedvkeef
    veeiueejleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
    uh
X-ME-Proxy: <xmx:GBbWYkA-DM7EumxPoo2RxEjArKOUfIEpPjB3TzZzDepky_KiOx8uZQ>
    <xmx:GBbWYmdtB-Mn7Ls71Sur7OJu5nFEJRqEpJs-wIoFsW_5HziqX6uwVw>
    <xmx:GBbWYjPjq7-YP3O2dQ28a68ufaUcXYd3JFgHKrOBb1GE-g4a_2gLJQ>
    <xmx:GBbWYkGo7aUd4jAMXTRZUB4fubtAZ7e7JimyaJdRDd_7SapwObWILQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31304A6007C; Mon, 18 Jul 2022 22:25:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <c7ae6f71-d977-49dd-b4a7-db8351b710e8@www.fastmail.com>
In-Reply-To:  <CABVgOSnhKMKc0_LvHVYPzL5NVnEuL51nQSm+8bZbjO=Q4seYiw@mail.gmail.com>
References: <20220715040354.2629856-1-davidgow@google.com>
 <38480b33-3b4d-44d4-bb24-6ab199d0c793@www.fastmail.com>
 <CABVgOSnhKMKc0_LvHVYPzL5NVnEuL51nQSm+8bZbjO=Q4seYiw@mail.gmail.com>
Date: Tue, 19 Jul 2022 11:55:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Gow" <davidgow@google.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-mmc <linux-mmc@vger.kernel.org>, Daniel Latypov <dlatypov@google.com>, Brendan Higgins <brendanhiggins@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Sadiya Kazi <sadiyakazi@google.com>, KUnit Development <kunit-dev@googlegroups.com>, kbuild test robot <lkp@intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 19 Jul 2022, at 11:11, David Gow wrote:
> On Mon, Jul 18, 2022 at 8:45 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>>
>> On Fri, 15 Jul 2022, at 13:33, David Gow wrote:
>> > While the sdhci-of-aspeed KUnit tests do work when builtin, and do work
>> > when KUnit itself is being built as a module, the two together break.
>> >
>> > This is because the KUnit tests (understandably) depend on KUnit, so a
>> > built-in test cannot build if KUnit is a module.
>> >
>> > Fix this by adding a dependency on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y),
>> > which only excludes this one problematic configuration.
>> >
>> > This was reported on a nasty openrisc-randconfig run by the kernel test
>> > robot, though for some reason (compiler optimisations removing the test
>> > code?) I wasn't able to reproduce it locally on x86:
>> > https://lore.kernel.org/linux-mm/202207140122.fzhlf60k-lkp@intel.com/T/
>> >
>> > Fixes: 291cd54e5b05 ("mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro")
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Signed-off-by: David Gow <davidgow@google.com>
>> > ---
>> >  drivers/mmc/host/Kconfig | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
>> > index 10c563999d3d..e63608834411 100644
>> > --- a/drivers/mmc/host/Kconfig
>> > +++ b/drivers/mmc/host/Kconfig
>> > @@ -171,6 +171,7 @@ config MMC_SDHCI_OF_ASPEED
>> >  config MMC_SDHCI_OF_ASPEED_TEST
>> >       bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
>> >       depends on MMC_SDHCI_OF_ASPEED && KUNIT
>> > +     depends on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y)
>>
>> Should this replace the line above? Isn't it just more constrained?
>>
>
> We need both lines. The first ensures that both KUNIT and
> MMC_SDHCI_OF_ASPEED are available, and the second just targets the
> case where KUNIT=m and MMC_SDHCI_OF_ASPEED=y.
> If we got rid of the first line, we could end up compiling this
> without KUnit at all (if MMC_SDHCI_OF_ASPEED=m).

Ah, yes. Fair enough!

Acked-by: Andrew Jeffery <andrew@aj.id.au>
