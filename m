Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C47AE35F
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 03:33:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=hIuW4ymT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=j4TqUsQR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvj272hdrz3c50
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Sep 2023 11:33:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=hIuW4ymT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=j4TqUsQR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvj2316lQz3c2b
	for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Sep 2023 11:33:46 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E25A85C2686;
	Mon, 25 Sep 2023 21:33:44 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 21:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695692024; x=1695778424; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=hIuW4ymTKqQ4AcVsxoZIYE3WOO4oCddhfwnhBZHX0suyvfCdq5O
	/UE8xYo17PaSaeQDBm99nGWhRh4fm/6bJ/neUWUM34Ut5qm3hqKDRM0l9HXMOA+j
	j5cIgH+jelC7MQbtgciHSXW0auQ+JIRZ0CtG3cmxVsLFmS5yc2y6+b01cANHB6EE
	DXoTa1TWVeZKj4fu8iL79lGMy6JgcW7icCGyecM9yjPtTbV+1u63Q0P7I6rauhhG
	bvaIsWyHv7z5iB4AJ5kRVIeUEQoANEttIIucsdSreKwiw2Zoj5/DQKw5+U8FNtYO
	I+pPvIK39aIZKGnncEajbgeyyLK2NBBUh8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695692024; x=1695778424; bh=w4gsiSlns8NKzCbLupKqwoRRqRNO/EeFJL+
	H/CZgEis=; b=j4TqUsQRKNKlyRbBubsg+GMJzT+6o+b+DJyngz+034OiFvn0/Jk
	AmOnhI90UEQZu4Bnq4x8JHqah7VCxPJ5MYVylNb5/USXSoWeIuCgDd/FpgIKxMd1
	8Y5u2V6JqvQVbj7AmYWYVYMNpbTCPiZOi65gFhoy7PiqrMOn8z8vmT1/nVmB114N
	GO/gHeBIi6Cvm0RPtqo2RssIGjJxgmT2AxvG0IHLGTn4I3HvhGNtCfr61OcthTSd
	q6mDPzQ2WZ0KD5e1lNP2MGilxQ5eCc4cKXgNxpoQIaWGBU5TARnaAxkw0DLrk81X
	A2bN3vD9tsqfKsdw73MegshEYeFExy4UeAg==
X-ME-Sender: <xms:-DQSZVnbdOA6QwqiLsmHdLusfTnCDRDYAC7aACMnpHCotjufhKaIfQ>
    <xme:-DQSZQ131TqvzocHClzhBZQex1kmAWVTOOBeX1kKS8tnE8i-Nm2bd9w7d2q6A_Hzo
    h5eHTNEBAampQkKag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:-DQSZbq2NdObvNPCY5iZt5h4yRJ6Lei1pnq_uCSzyV89cNk9SXn10w>
    <xmx:-DQSZVlVZTS-kriRKXTOJnCzD4lVnZ0FFF-FJu9cVkZdKMKFI33_Jw>
    <xmx:-DQSZT0RI3JmBKW3NaLDOw1HQ_hwN-NGyjwS_5IQ0xQrl1iNzRVELg>
    <xmx:-DQSZUzl0oy8IwJIleKH-TJpLHn-IIH3Vsqk3uQcVEECZnMn_MslNQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3A58A1700089; Mon, 25 Sep 2023 21:33:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <97424091-2784-4daf-b7a2-062fde210c2d@app.fastmail.com>
In-Reply-To: <20230925095532.1984344-2-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-2-u.kleine-koenig@pengutronix.de>
Date: Tue, 26 Sep 2023 11:03:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 01/40] soc/aspeed: aspeed-lpc-ctrl: Convert to platform remove
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
