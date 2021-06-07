Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61239EA62
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 01:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVTK4GjKz2yyQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 09:49:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=l6z0Gr9y;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vELRD1ZY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=l6z0Gr9y; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=vELRD1ZY; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVTC5CQbz2yR4
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 09:49:19 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C28B158056A;
 Mon,  7 Jun 2021 19:49:16 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ftd1wQj/z6/pwKmUrvqwIr0/STXPEvr
 2JxgGS6MVzjc=; b=l6z0Gr9ywWgB4cD0mG1R6qklLXlwcF8xSYPDrvNZpVavmH1
 9892zn8p0TngINVj6sKfNTkM5R05sR4BTNFqcZqV1mg5HgujdkpbX3HpYTExK9qD
 pV5WBdKCyN3RbG6mYrYz99SDIUaN0YmAR3zSNMUrMlSAvt4O4//Fxc0scHZSGUiQ
 jVYfPeUwQ03s0+Ev6m4EGQkvmKdYPY+HNMRJQSdDPXqOOqgdlpBVw8vfmhKuEZFW
 dS7EjeOjfWefyKNkChcVxCTxWpw2Y/A1iw0cbY1zeoZiCEnNP3UJxyqCz4MEI20B
 vqOv6SD8b+jwDXUmfniQHF4sgiLcr0IRardgrSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ftd1wQ
 j/z6/pwKmUrvqwIr0/STXPEvr2JxgGS6MVzjc=; b=vELRD1ZYHbELpLRRnqPNE6
 gws5mQj72mx1yZgdp4bJInAvtvmoXH0dJbF7Vomps1NSCNdzY35LNNWoURTWmSMR
 02Ec1hNAHUUVR1znR02sFxCfCA7Uv0FLcUQMDpdIR9a3TNkF+4CNLRC1Cnk4jPBL
 9CFY6viRJgXtXU0Y2lIQdi7smmH8s+pz86Qt25UMqaE0S/QSrZz/8Q6raxOCtyZL
 3HOXtE2ULX0Bhm9bKYNZ7CK0n0VUDgPZmGkDu6XAccxpuN+lCq8KsyQAag9AKO1P
 QwxD80R4PvXroKXKkTyxknulcEqaoiF5Fo4jGpMX2GbyjLKjxX5Vu8rP/s8PUlPQ
 ==
X-ME-Sender: <xms:ebC-YIafmIvzv_bMUrujeDJas1yTeLyiv0zds0WsF7s267FUKSuG_g>
 <xme:ebC-YDZszBq0gSIC39UnMI9Rl_WvvOmTHQCM4lYKQwdaXCXToIGMgiz2L8wx-FbTI
 BkBK2XVCuJk3Qjk8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ebC-YC_vap9e8qxNOaDUxH3PX0ix6v-JWKIPE9Hu-yYFeXLBwyaeWw>
 <xmx:ebC-YCp9o3nC82Fueo3nusZisZiTBhobAPSI1_ImbhP2pjtkdH61YA>
 <xmx:ebC-YDrLC7hG-K7eonoSICQSGf2DCBEabrIkGMKK4YTNhZ0Ss-fr2w>
 <xmx:fLC-YAigQzk7FLwe5RPRrVZx8JrOeb9omCOVZ3zbEjrG109A9nBiVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3E44AC0062; Mon,  7 Jun 2021 19:49:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <27d1ae78-a58c-4e40-b844-2bbd4bda15f4@www.fastmail.com>
In-Reply-To: <20210607071514.11727-6-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-6-steven_lee@aspeedtech.com>
Date: Tue, 08 Jun 2021 09:18:52 +0930
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
Subject: Re: [PATCH v4 5/7] gpio: gpio-aspeed-sgpio: Add set_config function
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
> AST SoC supports *retain pin state* function when wdt reset.
> The patch adds set_config function for handling sgpio reset tolerance
> register.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
