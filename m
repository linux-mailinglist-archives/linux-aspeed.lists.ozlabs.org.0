Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2927AE365
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 03:40:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=eiMP9I+G;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bjG9ANdS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvjBJ6Vw1z3cCM
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 11:40:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=eiMP9I+G;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bjG9ANdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvjBD0NjMz3bYx
	for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Sep 2023 11:40:52 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C1FA85C017D;
	Mon, 25 Sep 2023 21:31:06 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 21:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695691866; x=1695778266; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=eiMP9I+GYtijmNB30gzVkjhrZ07gKOEGyhOfsl71Wzz33L1Sny1
	rX4v5syH41sqU0+lwNZlnCazh3LYB6X+k0rPvmIfRJEwcAXCvEqdTpviZyiljv6A
	NqZ2EQQ+h840ORSuy8oXXoOHBQT7fNUVJFyixPzASnlNthryoEC0Bqe6BLuVRSjP
	unUwITl8Opus4zcdK8iYAtEWOzrobHEFroXwjN+RkHfSzjhG98u/UqaeLs+/HIfW
	UgLcg6lIY0LLMZiX5quNk/UJowncsfD7P39lE583/OF8ZPs5ezodkxX1kVQBbAfr
	fa3Mwqj08cYPDW6QsTqOh1CPkHsY/cid5OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695691866; x=1695778266; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=bjG9ANdSBUgpnplqMQZ5v+3DZx/VmzCVt4tn9IXyRJVkA4gZW3v
	qsKptQKPqZ4OKB/sJG/kuBfoKLVeSswySMaledWcp2oLuroGP9w/yDCrtUbGP6Bk
	pDF1cEkXFzMD9tjLf1j9o4RCn2WTTsFxrL1P/7VKd2wTBH+bbfcwa8WrLgMcajnY
	Ygo7+8EPbmgNvLao2+WWhy437Mmq+ExY/Edc9ceiX0fO1WjVbH/QpqNtsW5Ni/vA
	tmkuq8Xa+niEwneJFXwa2YxjfCeAWPwxHgLrApA/0Wtg/uJiVsrbpe/IJ+oDOuWI
	MvVrI5+rR25WdvR9orz8LhXeqLHoetF8+/Q==
X-ME-Sender: <xms:WjQSZcWvWkT_Pmn0CVwGHaYCs3xp6lIgtz5e8ThJyBfeEWqkI2mXlQ>
    <xme:WjQSZQnxGbzKgUBSH6vd9m-rP6dAAkCosS56sbz5Y0iByWVgCxOQ2Ge4NUUtjQGWk
    HVYXkUflRDgXi9TbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WjQSZQYPRl_OKkOAF2tMOK2yF8-NZKt3AJrJiqX5mioRZdq3qpPrTQ>
    <xmx:WjQSZbU1v9RsPtKCJ-agKhaxCq0_zTO1hCuy3vNe3ltgsTvhaY7O_g>
    <xmx:WjQSZWlAyhRgW3AJFCwVZNZp9qlNhJrzvFKLpBY1FJ_0pcOZxmxbug>
    <xmx:WjQSZdvIa2U8ULxtE0u0fYpkqFnZZFUYFJ9P51iuwl1fuGcdcRxI6g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 398831700089; Mon, 25 Sep 2023 21:31:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <39fe757e-0b0c-4aa0-9150-29bf4e255788@app.fastmail.com>
In-Reply-To: <20230925095532.1984344-3-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-3-u.kleine-koenig@pengutronix.de>
Date: Tue, 26 Sep 2023 11:00:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 02/40] soc/aspeed: aspeed-lpc-snoop: Convert to platform remove
 callback returning void
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 25 Sep 2023, at 19:24, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling =
by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
