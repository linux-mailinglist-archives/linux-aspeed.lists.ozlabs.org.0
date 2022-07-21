Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2A57C24D
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 04:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGp76vdTz304m
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 12:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=FCkpsXqJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VCwm2VxH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=FCkpsXqJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VCwm2VxH;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGp360LZz304m
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 12:33:15 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E7FF55C0101;
	Wed, 20 Jul 2022 22:33:13 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658370793; x=1658457193; bh=/yfj/PjdcA
	cazXFx3w+y281UesI0amFCc8gQXZmr7jw=; b=FCkpsXqJBkkmkdSeCduKJovVk1
	b0CtQPcnafn5MH/nm9Em1qqEg800tVDa4v3pplSHjPTJciW/YKC1Z78KgKXMqAdX
	C0OZPluA4C9fkePVyw8tENqvRtzwhxBmP5F3xBeJbXej9vDTxFwI1cm5/mSDfCM2
	n6Ru3+JpBXofoApD0Tn/q8heR8MMIoHPd/368jxpUYQkHGmMoZvyWxCiyB/4z2tX
	dOAbzVESQPvE0HQjg00qex2hurKKdWT2NuVvq/OOvL8wr1aNjArYREYqfr+PJAVP
	HiGtKNttvkClU4IHnZn9XeyNtSO3WLaHDoWuDIf63cxCDDFIkvEW83F93HGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658370793; x=1658457193; bh=/yfj/PjdcAcazXFx3w+y281UesI0
	amFCc8gQXZmr7jw=; b=VCwm2VxHJBFT4nidQr0c90ODRRK57B6AhdljiX7HuXGf
	f6boYFm7AILiWMsUYm3oLsEA9CYlQKN5jZe1Gqg1Otjeu75F0OOSpFX+qkA6FiSh
	nuxZNJG04enyjJgAICGI88CxYoBe9usXleqvkkAJZQ2kNmlbFYJSg8kQ4+l4cK3o
	ebO35yehnthB0tfFMNCPZygKtHCwxdE7mjzI8/fz+mdtYr/mfKmrdI4/QNi3pipu
	CtVUcI51LXi6e5HiXF08XClAt0Di9115ziOw+RgCNqEjavdw1qDFh4U4EWmWMUIJ
	cPu5GeSdkGi0pdPgsRmJWmuYV0d8qyQpcYp+H9VoRg==
X-ME-Sender: <xms:6brYYnuGXAB0XoNRBtlwDXl3a4ML-JLj-prDQwn4grW2uozkiANfEg>
    <xme:6brYYofgkTPl4DHdhZJeSYuyKtUbS8FgHdeQoppgTlO4HHvnUrTm-QziHm8y_iKW3
    Eiihk-SH-erHLP0jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6brYYqw7qgrfy7p7XDzZw2T8FvnbPESbFAmc-yWMmm1LVzujTL6DzA>
    <xmx:6brYYmNci-tlVGT1RW5mejMvg3bLZ7ADk8KL9mVEMfG4TPr6OA-A4w>
    <xmx:6brYYn8M38ByWvs1-QX6uq_TTy9qHX20NDv8ZGK9NJT4DjTOqHFh9w>
    <xmx:6brYYnyAtIv9Z-KJTsk5uGYQAhijFy2bSfYKw5wjr5_yIwtp3g1ZoQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AFBF8170007E; Wed, 20 Jul 2022 22:33:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <854eb3ca-abd6-4d9a-b461-cdb3a1ad22aa@www.fastmail.com>
In-Reply-To: <20220611095828.1090-5-aladyshev22@gmail.com>
References: <20220611095828.1090-1-aladyshev22@gmail.com>
 <20220611095828.1090-5-aladyshev22@gmail.com>
Date: Thu, 21 Jul 2022 12:02:52 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Konstantin Aladyshev" <aladyshev22@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: aspeed: ethanolx: Enable VUART
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 11 Jun 2022, at 19:28, Konstantin Aladyshev wrote:
> Enable virtual UART for BMC<->Host communication.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
