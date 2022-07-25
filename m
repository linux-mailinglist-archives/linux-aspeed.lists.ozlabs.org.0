Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0F57F83F
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Jul 2022 04:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrkdT0qtvz3bnM
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Jul 2022 12:34:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=iY2Py46q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dzmZj9BC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=iY2Py46q;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dzmZj9BC;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrkdJ3Ykrz3bVt
	for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Jul 2022 12:34:11 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C53845C00DB;
	Sun, 24 Jul 2022 22:34:06 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 24 Jul 2022 22:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658716446; x=1658802846; bh=hPE2N2f6Pz
	RN1KjeuYB8e5WQn1u843l61OiuDowxp18=; b=iY2Py46qg8sbwdYqokq6cMY+d2
	fyNQOeGrsmERkRH90qWIx7Iwd6iqcx63+VYuoW98G4TuSUfwbBGSVIeytPuJ8R0M
	RG0Qyy76OzdGa9yLojUoMxT/1sf0NOhK495Lgm9L+sLRWAZ220a1BIrRQ0upB53i
	qLNstWmQorapTAn7pgVv104WeMzCLc47zXwePKhQtlPdtFslGBsG5YT8Mvd85ZNl
	llYwTcq1h+fYVvS/z1NnrCAM9eUt3KkuZPwTyxWS6UhFA0qdi+CC7ngyzXicU5PE
	o4hTvKvKbwVLnpPUoDjo6soGV7y9FhthPpilm6sT2et5r+Z9fytTCM9TeBzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658716446; x=1658802846; bh=hPE2N2f6PzRN1KjeuYB8e5WQn1u8
	43l61OiuDowxp18=; b=dzmZj9BCm9/igoh6IzycbTnlHBTst5+b0xfDat/0kBNi
	1cRIg1eQ0BqrKnj6UVwX8FmDjsZJNfSRTeBvyQPzCOGXvTq4IlVkKUO4QZr8v7ex
	Nzud/jc9BMLKyOfC+xd5QFTsGUOilQYf9j0clSnaTb3Z1UUmS5X0Rp+BGzKyH4lS
	72vHQkyLFDAqNtvZQUOCESyb68rGg6g/GLxwpKD9tRmbGkivymmUo1cnmLUVDCkJ
	MSLcbIgRVWK82fToXLdGfVUnmEoOu6Bgle46ujlNRGUMdXPBnSW0KiXtvtZWzy3J
	0cYP2eYMZOrRfaDrKzCJuT1OCywKcXEiHE2yfguahA==
X-ME-Sender: <xms:HgHeYvVL7FUgX1qa1cl8kA6KU8GKDDzRc4ZnOQCN5qUgYxl8M0IhhQ>
    <xme:HgHeYnmRrKXbLZ2u2gub9JKc5aBx9SV32fP_PyW19GLb4sJZZ5EOtXNXvdAHB4lFQ
    1NOVPDKjHASWrP5LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtjedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:HgHeYrb-GJYiMFY3t5CvfR0ugI7_t2YP08kOL-t6sibybbmKRCZQTQ>
    <xmx:HgHeYqVjJ0ZiWNmGcfwGML7yrVe0iKzkOeScbaRMaFlbPngFThpt0g>
    <xmx:HgHeYplvq3AAoRiwITQEzgfv7sL2c49pBtQCU7CwvyqHaDfUtZbviA>
    <xmx:HgHeYiAQj2l70JevPPryjRNkz_K8gSYy-5rKgM-C9Ez_Hsp8-0ps1g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B538170007E; Sun, 24 Jul 2022 22:34:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <9e0ed5ce-c542-4c2a-93d1-8c7a551921b1@www.fastmail.com>
In-Reply-To: <20220523060532.7864-1-juergh@canonical.com>
References: <20220523060532.7864-1-juergh@canonical.com>
Date: Mon, 25 Jul 2022 12:03:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Juerg Haefliger" <juerg.haefliger@canonical.com>,
 "Russell King" <linux@armlinux.org.uk>, "Joel Stanley" <joel@jms.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] ARM: aspeed: Kconfig: Fix indentation
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 23 May 2022, at 15:35, Juerg Haefliger wrote:
> The convention for indentation seems to be a single tab. Help text is
> further indented by an additional two whitespaces. Fix the lines that
> violate these rules.
>
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
