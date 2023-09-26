Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09C7AE35C
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 03:32:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=iqFM2qdr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A9sS/MXG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvj146WzKz3cCM
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 11:32:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=iqFM2qdr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A9sS/MXG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 93 seconds by postgrey-1.37 at boromir; Tue, 26 Sep 2023 11:32:45 AEST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvj0s5v4fz3c2b
	for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Sep 2023 11:32:45 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id DF2E35C0568;
	Mon, 25 Sep 2023 21:32:43 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 21:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695691963; x=1695778363; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=iqFM2qdrwdtNuhzQ4HP+X2tJ4aPrgSuXnESCe4kabvf4tgeuSXG
	IUQOdVRdzeATuztIh9yui6KA838SFU1N3/2h8xCycaThXuG9AMguZJ2d6dTIbOs2
	IP31yp12JYAHcc2lDPg0arkshhIaWPktn1mu3bTV+2p2ISBd9pGDA6aDeSsaLENx
	OPcxblSQrzZqaG1motcw0IuZlH06NlpKHcgGplBlI6ek4iCiq6YYqeL/w0C9Waib
	X4WRGK+befqhNGeKMynyFgKiwdWIyZBtR6U0HrvcRRcT/5rPPXIvG84uwn4dupy+
	YfvyZ3SVC300H5MxRjDAhsw1Ch8eY8wGrRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695691963; x=1695778363; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=A9sS/MXGzuXTVZNOK/xoupemIzzx8zkQ6LCm+LyJJXZ675lsGPG
	F45lhCbPKE7gOsoQpPMDUOMuBZ8ft6zb/P750LAX+HVJ/zNdebIHWw1ZINv8eLy6
	P4EuwMsrEscw0ulP8LqsThb3BG81f4vpAQdNTYFQYFnt68rgMOzCVeJJyrN4KiN4
	nsQxMOGP6jJsNLjd2Tbc7yfkq8v/fSCqf19BtszNCtM+tO4Aeue0G2SUbX7ec6/Z
	+N+2yANyP0eWhOey/2V5Mm4TkuptID8iv/VT2VhqmYT7Kzm5tXGL+1kBPjUPJryW
	+NcQXd2CvJZMApE0MtYMN+Y+3qFg2xcdOHA==
X-ME-Sender: <xms:uzQSZaiik_uOHbXBuo778rY44N4I3PwL5_gRMdsxEnc74c-cZWEkgA>
    <xme:uzQSZbBN1azh8vkJgNhvM60G-il_hCR7p6iw-ZYpQjUjyppYWAeDg3JBssBC_zhog
    RfZRQTguuCjDDLCXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:uzQSZSGMPnBpxE2FLuwPhejybGgZYc4ljo8wPyPU7aoSRTWskM85_Q>
    <xmx:uzQSZTS81g2KeyQd4eJQio0m7GOm9fRRFnLSjIISZiymmiSvnr9snw>
    <xmx:uzQSZXyeuKVB114erpw1liVOPuUOVWBcIrLyXIrD3ifOkZPfuTOrhA>
    <xmx:uzQSZSq3-6NyOTYpKOPYawPpq7Bd0dUP2ROJZ0jmgt-eE2OoIsjjww>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EE4111700089; Mon, 25 Sep 2023 21:32:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <e447ec5b-ae06-42cb-957b-30442bf4d85f@app.fastmail.com>
In-Reply-To: <20230925095532.1984344-4-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-4-u.kleine-koenig@pengutronix.de>
Date: Tue, 26 Sep 2023 11:02:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 03/40] soc/aspeed: aspeed-p2a-ctrl: Convert to platform remove
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
