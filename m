Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E183757C249
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 04:32:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGnF5kKMz305d
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 12:32:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=TfCDlmww;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Sp0DjLmp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=TfCDlmww;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Sp0DjLmp;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGn94NJtz304m
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 12:32:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AFD985C0107;
	Wed, 20 Jul 2022 22:32:27 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658370747; x=1658457147; bh=qPsgyAh6vx
	AcBku0AGKtaalP35Gfzz6TVkglhgzTCfo=; b=TfCDlmwwH47WJTR9fRjEPFs/LX
	oWzD52plhrTUCrP7AQ/UM6vTfFGDjuKAuxrW9x+TNDo0ZkukRQdkcw+425pr00EV
	86+NkGWkiqH76S67jny06tOsTtm/Na/+C7qJfGB3K8tbzUbqgGqx/byIT2A2j5wI
	cOy/GZhq8XMbFDmNiXsD5Zfu9Ktxnf9qNzqJ5w4K5So5L/cu0v9Xk6kknKObK9eb
	9tdh943e4MCYLBR8CBG9q+FGPnhdE7I7TuVV0Voj/ycDwqGZZ8LNQ6bKLEWEO+Xy
	estid6hZkiWOgOY0SCfhwu0KRhExpc9NNBFPYMOzsr3x3op6W0KRow2p35yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658370747; x=1658457147; bh=qPsgyAh6vxAcBku0AGKtaalP35Gf
	zz6TVkglhgzTCfo=; b=Sp0DjLmpb9Oq2hMYd3sius2kGoePd7rsI8aH7QFr1g4g
	38IhewqNg32T1005sAgg3GRdB7txvF3XOT9nFogl3ciPZw7m2WvOxoDjRRq+wL7N
	ZnV4rQZIHLMSZl0ZzYFMGMKDimrBD0LZBdY2BnWoRHm41+oRd6B5/Rq2lpUaYhhk
	G32omOLFHT7k5N/CSCC9fuQATnaqTjxaG5XJTR9IvXeC5tSxHzdkWTdbLIx3do/j
	ZyQaM3aGwv8N05Lk/R+0RlwRWfL+idTM3JJOShxsBc+K1lsdNG4iiWEKBqYTypz4
	md4Am+JATq/mfwANGDM9sFTyIbXz1T4EzdkTwnxnTQ==
X-ME-Sender: <xms:u7rYYkMFMFswSPH8jgZXh65mQGIcstAKOkxizLUcsOS5F1CZ9ZjVGw>
    <xme:u7rYYq-L5jPXUsfCQTfwLa5jnoq_Koa6MEWV0_dN4ptG4ZgCWCrVlTB0WQfN9eVF7
    D-fCNWfLY31TK0L9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:u7rYYrQLXbkkUAAuHaLNkHLtK-baYgtT0QAyBCyygHfeN64sX5AVIw>
    <xmx:u7rYYssf9auu4KaFrNQtw5AxUmXTVq5tkl6uyYjwW_a2F3wDo_klhQ>
    <xmx:u7rYYsevVgcF_0ztZcPFGep45FZc3GXWaV7y4nuO6gCA2g6MMz9opA>
    <xmx:u7rYYkRBBbXX-kbfFpWoubFwBzv1XbLW0DhBrtqPRTSdTT78itGh3A>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B764170007E; Wed, 20 Jul 2022 22:32:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <04383a64-be4e-46f9-b996-3db28244b3a8@www.fastmail.com>
In-Reply-To: <20220611095828.1090-3-aladyshev22@gmail.com>
References: <20220611095828.1090-1-aladyshev22@gmail.com>
 <20220611095828.1090-3-aladyshev22@gmail.com>
Date: Thu, 21 Jul 2022 12:02:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Konstantin Aladyshev" <aladyshev22@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: aspeed: ethanolx: Configure RTS/CTS for UART1
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
> UART1 is used for connection to the main EPYC CPU. Besides the main
> TX/RX signals this connection has flow control signals RTS/CTS,
> therefore configure this pins on the BMC side.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
