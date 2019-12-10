Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B5119C0D
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Dec 2019 23:13:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XZ8h6fCvzDqcR
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 09:13:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CeFET6SF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ipJwzUWJ"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XZ5K6G8lzDqGh
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 09:11:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 326DAF5A;
 Tue, 10 Dec 2019 17:10:57 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 17:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=iTzj/LXruarNxkB4mF+5qgnxYnni345
 HnB4zzW+dtao=; b=CeFET6SFvvOE8YyX5U34URQmorm1Zg3iCfE5rXF71XrLsVG
 giyMAGOcfVkLtVPHkfQNU1dCrua9wiUW9Np2OHESJiYHcc090vZyjEMIdEvkYxnn
 ZuYcMc7hmSP611btvl7KumhtA5vrmJwWtoMfLZuGLvseUMVk9kL16OmKjxXcgtVN
 MKmtwhlc6gP6P7hP3tNT1QNTg5quvUs6KpR466SRb51wv4XaEifDJJunVgPAgoZy
 ZepqZRxvMqx5TNoWdLacjk3E7vp5TwJdIpsnS5NzbCDQUHRxCGAfrO9LMHAZ34q2
 Y7MK+ct62tW0jBiaXpmVdDoWx7oRqQGydg8hLvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iTzj/L
 XruarNxkB4mF+5qgnxYnni345HnB4zzW+dtao=; b=ipJwzUWJtdhmKRNun/ZAsR
 aMJ+C3uwPWPBTkCIeYbXdnP7phZ9WcW+P8DN8BVA1KwVrMQ23gTZkR2u//dwUCxe
 YroByIKLA3BfeSthfMMDPhhiE9938ISPW03bEr+VUMke1hA8K47MZwwjS5qjNgwC
 nZdTmoQIzW14j4XmYLjBHBky+x5jAkzDS1cMOWB+rRgQ4vfmemLCTZU/e0AJLNZ2
 KFpmbFSDFxraP8nqzlPITpvd8EHvk+CLYO3fpGbP71hSHvtwbZ5ryeddofpZ42Uy
 l3jzqHr0Vyg+x15g2PLwA+VNjsJO4BfQzCeKH1m/miWQiELGOZYdZ6fTK4JCKB0A
 ==
X-ME-Sender: <xms:7xfwXY-JogK4UnIVNCkzWFBVV5d4RmKSrOPzwzavIsixdDhUueZZtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:7xfwXcGiJxH3pF9WB_W9UqzemEHMu2DN__Qi5Gy42va_s7-oz1VoEw>
 <xmx:7xfwXb42G6oXpxQpY6OyGru9RkoJqIsfN-WL3b2U-5cmfkiK9-W4SQ>
 <xmx:7xfwXTmMCcNi4xGkFOcmkjHwUKL8BYE2o_l_yX-3sg2Wwm3pezufCA>
 <xmx:8BfwXbFv2yYn4A5iNzu1Uzqg1LES15xXThOEbQtiJxOt934a-ItNAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 78AE2E00A2; Tue, 10 Dec 2019 17:10:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
In-Reply-To: <20191210202842.2546758-1-arnd@arndb.de>
References: <20191210202842.2546758-1-arnd@arndb.de>
Date: Wed, 11 Dec 2019 08:42:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Arnd Bergmann" <arnd@arndb.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] gpio: aspeed: avoid return type warning
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Hongwei Zhang <hongweiz@ami.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 11 Dec 2019, at 06:58, Arnd Bergmann wrote:
> gcc has a hard time tracking whether BUG_ON(1) ends
> execution or not:
> 
> drivers/gpio/gpio-aspeed-sgpio.c: In function 'bank_reg':
> drivers/gpio/gpio-aspeed-sgpio.c:112:1: error: control reaches end of 
> non-void function [-Werror=return-type]
> 
> Use the simpler BUG() that gcc knows cannot continue.
> 
> Fixes: f8b410e3695a ("gpio: aspeed-sgpio: Rename and add Kconfig/Makefile")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
