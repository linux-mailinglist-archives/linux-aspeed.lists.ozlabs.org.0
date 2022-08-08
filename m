Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADB58BE77
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 02:30:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1HDB6Qjqz306l
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 10:30:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ul2sTnvJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pan93dAt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ul2sTnvJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pan93dAt;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1HD70mkyz2xJJ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Aug 2022 10:30:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3341C5C00E7;
	Sun,  7 Aug 2022 20:30:29 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 07 Aug 2022 20:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1659918629; x=1660005029; bh=vUg4jzb8rp
	TB+PxxVtsFWKsRKVaRqX5qBQyFHHywWLw=; b=ul2sTnvJcx6bvj1kq/rAQxb99P
	aCxhnjnuDUYyGfTdJOAsBbmSWPvd7h7hecTnq0LDXdybBGv29uZcvSj2j7kYbQnX
	ihhtwnD7aHDXxfbRfRZgkOtx9zlaJyq63GBtl3s1T03UwdiT9z7sP3QSeedPkGu8
	x05fTZ2oUCwfTKr/5QOUaS9f24v5fIyPTpcX39p6ZfbNnYaDCRb5zlK/K675/Q2i
	3Y1biK1qt+QK9Y8gfydg2VAwfaXm6AgvxAT+Ii1ruToYJbJpfgolPf9yVRo11mE0
	jHnvX/iMmCrfRu/JL/qcfr0H5E1/1AFqDk2m418aSgBoI4SymlEJJuwm8yaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1659918629; x=1660005029; bh=vUg4jzb8rpTB+PxxVtsFWKsRKVaR
	qX5qBQyFHHywWLw=; b=pan93dAt3RorWn/i4ZOUsL4jhGye0xO+tiPzW69qbDpi
	UTd6G/UXb0P0e4pijH+gw17B86X3NKy8w7OiYDSs/I8PUfZZDTh5t/r2xxxeVZTr
	yGPBa28D40WWWtnLVw1yTG5Tb5LEmHnHelEOIxXLRFt4gCdOWSs1HzbZNDyFgWzp
	ef7wgdJXdMA88/P1YT+A6LuFlex2uUEYZYclDlD+G1NjujdvHGiw00VFMDFqMU1V
	SnizgizcEy42/Uq4s5WABMlOUOe6ZtJaf6PMIf1VZRCGZwgid5LRSsMVhKIJy1VN
	GXTVoIxlaXLtT7c8IZ/HGzRZnRCFGv4bcyIYuKWu6g==
X-ME-Sender: <xms:JFnwYpPUe1WCB0VXlpfZMdEy7TjWHvCfvWd26ni1CPPQ-NBQvk5P4w>
    <xme:JFnwYr-wL2BHNmswcoeZAr3ApbeHhqmqNl0BSPkwmtskRWA7wnbEpteAuLZvm5Vf_
    v9DUZXnSuB-qY2gHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:JFnwYoQzjlafM2BZNwjWfq0UB3EyuEiMLqRe4NxAd7mI80N47DRfgw>
    <xmx:JFnwYlvzZ9cxIFR4y-ejEDvE03eadETZAZ5S3qnda9FwV3yfKCY8Zg>
    <xmx:JFnwYhckDpqxTEKteuF9gtTMCSFxw_R1NSk2nXbW9PWQbl9DVYWkBA>
    <xmx:JVnwYrvocnTQhp5uHJITtSoHcwbUuddhD62EerLVp3ua8XdjBP-zsg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B5B6170007E; Sun,  7 Aug 2022 20:30:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <d52e126e-3dc3-4645-a9f0-2f4e3411010a@www.fastmail.com>
In-Reply-To: <20220805090957.470434-1-j220584470k@gmail.com>
References: <20220805090957.470434-1-j220584470k@gmail.com>
Date: Mon, 08 Aug 2022 10:00:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ken Chen" <j220584470k@gmail.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed-g6: enable more UART controllers
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <Potin.Lai@quantatw.com>, Michael Garner <garnermic@fb.com>, linux-kernel@vger.kernel.org, Cosmo.Chou@quantatw.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 5 Aug 2022, at 18:39, Ken Chen wrote:
> Setup the configuration of UART6, UART7, UART8, and UART9 in
> aspeed-g6.dtsi.
>
> Signed-off-by: Ken Chen <j220584470k@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 64 +++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 8c0de3f27883b..fe7cef6b5e976 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -34,8 +34,12 @@ aliases {
>  		serial2 = &uart3;
>  		serial3 = &uart4;
>  		serial4 = &uart5;
> -		serial5 = &vuart1;
> -		serial6 = &vuart2;
> +		serial5 = &uart6;
> +		serial6 = &uart7;
> +		serial7 = &uart8;
> +		serial8 = &uart9;
> +		serial9 = &vuart1;
> +		serial10 = &vuart2;
>  	};
> 

Have you tested the AST2600 systems in OpenBMC with this patch to see 
if you're not breaking any assumptions made by userspace about serial 
numbering, given the aliases exist?

Andrew
