Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D439EA12
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 01:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzTtw4n1fz2yy9
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 09:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Qc0M7i9q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ubFTo3by;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Qc0M7i9q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ubFTo3by; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzTtl0CsJz2xvN
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 09:22:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28BCB5803A8;
 Mon,  7 Jun 2021 19:22:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=QICwXEloCx6aw2/RCotid55ESt9TMAU
 7Fh6aVjperoc=; b=Qc0M7i9qAyYrzxXWgXuC95IXot+t6pTavyAWIdEeKVrFCUY
 RKtyVKM6aYP32csgFYUEIOZO6Pi97kYKTIlAWwljoB5/UlOe97YGZ2AmZpKAwCt9
 5qq56pefkTWmU7KGJ2ZAZrfQiBYOUrhhu1dE229jgPB4sHgjOOV71qZctGncC+LC
 HeGf2FLzT8EWS/Wrdwc264HZJp32Qcpj7RMJRg3ZE+s5fc3h9zpQ4YAuulEGEgpJ
 /RO6CUI20XVW/pVtGMonfL/odnniSNc7i7QIaOhSnkGp/8IOIX2c1HvHUg1n6Qxo
 lkFpsYGzxw0V8pGLnaGRT4zYJKm66DPfwh+WYJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QICwXE
 loCx6aw2/RCotid55ESt9TMAU7Fh6aVjperoc=; b=ubFTo3by9lSkT2+k7Fhzzt
 TX6lstx2njF6lqoexmHlcHwL601VjcpdSJKJi5RXvxcy3V5RbvuJk9Lb0wVF94Mg
 FkiROCrcliDuWinqknBv83XCq1vjP04hwadCXtwcnEllpYQoZ5kJXM/gntcWtpiu
 HAvO25XT7KK3jbv6y/GUh7Bc0agjk7mlYEDVC5OwdPHonaZCReU+aEO23cAZ6FWF
 1Mi8k7UFYzhg7lkGYbfKFe7TvJRywOz2l3Y05P5CN3nC2DCHrPaYDdQRohUX6p5t
 OnixvDrn6DdMCOuzmDKz0o9kjy+1jjLyprqkDz2lE7NErcrwziJ7/9rz/8VRXnlA
 ==
X-ME-Sender: <xms:R6q-YMo-JJfZP-iql89XEhlPDyMPh6gAwAj6YcDCSnPrwuSRxHGLPA>
 <xme:R6q-YCpUBkETy0EM1nQn8EXJQiMR13To0TX8bjFwOKYqdk_JGpHoJ01Lo1wDFbLn0
 rRoZb1W-z2QAc8Z8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:R6q-YBPqZ1lazXFrW8PmanqwwsBTsPNw9C5km0c0eKsczulqoeNRKg>
 <xmx:R6q-YD4o8_XdUnH1u1ykjxToir9lzpaiwD2F591RXcQfr94jYSJNmw>
 <xmx:R6q-YL6aG0jp2HljAXfFVxhxyQJ1Cuf7UMw85czeJ3Cv9iiRC4niVQ>
 <xmx:Sqq-YIxYtnS-BsfMWXfDqPIIYKzY4sSNrGqKWCvTbm_RWh4ujtdD2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 27546AC0062; Mon,  7 Jun 2021 19:22:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <578c8522-a182-427f-8587-746fc8ec93d5@www.fastmail.com>
In-Reply-To: <20210607071514.11727-3-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-3-steven_lee@aspeedtech.com>
Date: Tue, 08 Jun 2021 08:52:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_2/7]_dt-bindings:_aspeed-sgpio:_Add_ast2600_sgpi?=
 =?UTF-8?Q?o_compatibles.?=
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
Cc: Hongwei Zhang <Hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
> and update descriptions to introduce the max number of available gpio
> pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
