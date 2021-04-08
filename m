Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F999357915
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 02:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG2Mb1NlNz30CH
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 10:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=MM9XsgZA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YNL4vDQr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=MM9XsgZA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YNL4vDQr; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG2MV0S5Dz2yx6
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 10:34:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 68AEB5C011D;
 Wed,  7 Apr 2021 20:34:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 07 Apr 2021 20:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=A6y1xhjxB+rYO016EU+ElgKOQtyeyVG
 GpE9ZLWZByAU=; b=MM9XsgZA06Lv6b7FcLpi25PtwPNOLTLOEGZS/xqAzU8CCQ8
 xIVmlYvD4HgVEsdvIgO/tS3HeGPxlrHI9tQLhUnbEFoSVNJSYd1nPAFDcHpGe5V8
 t+pYm4DKrBnO4wNb4KDeq+MqUXpsB/vHGXqAB2KbR4QBATUUbs87tDrZR/7zjsW6
 kAwYaViXr8RZll8x6Y5MJqI4I5u8FyE9QwaaBOS2tvt2skdmECRz0CdSB+4CzUW5
 nyDUnsX/bNXsThWus3TU0E5Xq50lV0dsUphhjyEViNsk4g4NjMUuyq0FXWMoG9mz
 y9iBIxyJBdD4G2E9ZoBgJWcSgLHSNDdWMXI2/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=A6y1xh
 jxB+rYO016EU+ElgKOQtyeyVGGpE9ZLWZByAU=; b=YNL4vDQroo3M0wjmEHQfnf
 PO4yvEKjC1+dfFH8BOoIr9EwPf4GavKIkhPU6qYllfSnl80PkoAp8hu8A2PcqFlF
 tayxhpl0sEi07gqurjNd2U+4VhuyKFVMEb9WX6u1Fd5JBPX47YlWT8br7jTAH/td
 kI4Nn/IosWYi2nrFTpyr2WuaYisfXlwQyKS4qDQUYV4MQSN1p1VWxi0b3+UqpK94
 BI5tD/Y/gF3X9xG9ni3jYz0OtiP1iJ1rdGQXf2kQyrJMYE0DYakyZOkHwU6mJU6k
 XiQLKfGhX6wKMdE89N54SjwK9Qb8SneLWd7B5Oh+aZi+Ev+0yERTnU7oSFg2c2og
 ==
X-ME-Sender: <xms:kE9uYMp8BEY32VLg7Qz0qAT7IJ82-tBtQvVNDnBZa7dUxh5nPVP9zw>
 <xme:kE9uYCq6NFa6zTxFIBr0o0dtHT6eo_jDkCV4udIWxcQv9-l4bkSVCYu5zvUDyi2X6
 p80rPa1qyMb3HE8JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejkedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:kE9uYBNYzRU148cbJGs9Ll1TWfwG33zNYh2sWPaVFP1aIQpeBIp7JA>
 <xmx:kE9uYD7-9rXNHDFLZgxPmG3cNukQuoYZeD0BgRFaPcP1cq1jW3m8Jw>
 <xmx:kE9uYL64AcSmbQ9hqIx9a2GHimAjuTR3oMv5x8KwjCWKe6KXEuUfAw>
 <xmx:kU9uYNlN7jauyB3FeKCcj1mEbVUbFCjuJFGMZjIMInEza1jd7Bu-JA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0D824A0007A; Wed,  7 Apr 2021 20:34:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <dbe4fa5f-370a-41fd-a1ab-7b065b5cb8d1@www.fastmail.com>
In-Reply-To: <20210329150020.13632-21-eajames@linux.ibm.com>
References: <20210329150020.13632-1-eajames@linux.ibm.com>
 <20210329150020.13632-21-eajames@linux.ibm.com>
Date: Thu, 08 Apr 2021 10:04:03 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 20/22] ARM: dts: aspeed: everest: Enable fan watchdog
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Matthew Barth <msbarth@linux.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 30 Mar 2021, at 01:30, Eddie James wrote:
> Set watchdog 1 to pulse the fan watchdog circuit that drives the FAULT
> pin of the MAX31785, resulting in fans running at full speed, if at
> any point the BMC stops pulsing it, such as a BMC reboot at runtime.
> Enable watchdog 2 for BMC reboots.
> 
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
