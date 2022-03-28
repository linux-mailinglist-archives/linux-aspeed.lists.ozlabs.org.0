Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A6F4E8C88
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRdFk0gcjz3c1q
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:18:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=QbVeoiFX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GytlGl1x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=QbVeoiFX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=GytlGl1x; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRdFf0ZkQz3050
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 14:18:46 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3036D5C00FD;
 Sun, 27 Mar 2022 23:18:44 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 23:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Yshv9BLFjPJ78PJwJxlrkuj05rUaho9JiRKiKI
 SnGNU=; b=QbVeoiFXSuey4MjJCnWBz62DjwNta5Ko2w6wZOBcY3q0OM/r4k4A30
 etQyhP/5rFncbIp8NZVngUDEy6wgxvpfDbkEIVErB/d/GuBcfoM6sWTKhiw1lqgE
 hVLxvBBipOPzs5j50b9b0buSrvfcKjZrv+9XbYzuAgsO0z52Cl88uaK2vOpVwWyS
 sJ4lkFw2UWOno41Kc7z10b5aqcy6k9ZaCOtTvhL+0C+DO9fsMYuqRHE9ujDEWhV+
 nyv6gypOwoq8TPBbox2JCjjhso/sUCRQ+4XiY05Ry+AOaNUsdomcICrwvvEcBMVb
 V8NOvr2dA9TjZM4eJAQe7f7ICF3Lm7fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Yshv9BLFjPJ78PJwJ
 xlrkuj05rUaho9JiRKiKISnGNU=; b=GytlGl1xT7rCZeKHsbo6sNf1Dtld9DP/8
 DW8oNPH3xV7x8ItbKhgYzEzdPFQKA7aOuoQXKGR1Y9e21QZTpZ3k2DPaZRcZdvlO
 JQO5hXolbrvpuE76w46Cu85lA5hPQFT5WS8GJYEhA2x1zeHYmc24VBRo+SeVK8As
 TAyGxM+N1JT8e1dbJVI7r+Z2nJNpcj+dSnhoajSag/DEm9MfMbStoZkq9vgxSyWJ
 EW7embwHyHl0nfoENFftQu3RKlueSaMDSp1tEGC5s3w8Gdf2jsiGAMqW3W+ojjhf
 Cp2NgblTc9ct7KmjT8Ej3aPF9MgyrbhAT9VBpJ5pODLlDkhy1o7Zg==
X-ME-Sender: <xms:EylBYlsqJfmWm3Jot5a4ltW__BVaKhQkHYkzVfupdm1NhEvTrPNO4A>
 <xme:EylBYufmuraSZqNh7xcV0RUMzelai8fHp-CwefyrEpxkN3b-tsyndZ-2VJLBMLGLp
 FVg1lHnqsAJJZGGXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:EylBYowyXN_TJa57RCHJbgdyXDI-ynzFH7LDvP30svi_JF8EN9uA6g>
 <xmx:EylBYsO5njVQadAbJtUfhiurc71pncSZAqdGcdJvWrQ6gp6CkN6SSA>
 <xmx:EylBYl8OggX_6rnCX8tYJoRrSDYKwNqmJ-HcMVnsgkcfDcUA-lVwlg>
 <xmx:FClBYuP4Vw5S-9u6wvKxkNxM3Etx5Rf1G22zacEb2AFekJFFYRHBtQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7580DF6043F; Sun, 27 Mar 2022 23:18:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <50fe6b39-e5ca-439c-a390-59eddca4a021@www.fastmail.com>
In-Reply-To: <20220325154048.467245-4-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-4-quic_jaehyoo@quicinc.com>
Date: Mon, 28 Mar 2022 13:45:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/5] pinctrl: pinctrl-aspeed-g6: add FWQSPI
 function-group
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
> From: Johnny Huang <johnny_huang@aspeedtech.com>
>
> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
> and FWSPIMISO (AB13).
>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v2:
>  * None.
>
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 54064714d73f..80838dc54b3a 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -1236,12 +1236,17 @@ FUNC_GROUP_DECL(SALT8, AA12);
>  FUNC_GROUP_DECL(WDTRST4, AA12);
> 
>  #define AE12 196
> +SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438, 4));
>  SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
> +	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
> 
>  #define AF12 197
> +SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438, 5));
>  SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
> +	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
> +FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
> 
>  #define AC12 198
>  SSSF_PIN_DECL(AC12, GPIOY6, FWSPIABR, SIG_DESC_SET(SCU438, 6));
> @@ -1911,6 +1916,7 @@ static const struct aspeed_pin_group 
> aspeed_g6_groups[] = {
>  	ASPEED_PINCTRL_GROUP(FSI2),
>  	ASPEED_PINCTRL_GROUP(FWSPIABR),
>  	ASPEED_PINCTRL_GROUP(FWSPID),
> +	ASPEED_PINCTRL_GROUP(FWQSPI),
>  	ASPEED_PINCTRL_GROUP(FWSPIWP),
>  	ASPEED_PINCTRL_GROUP(GPIT0),
>  	ASPEED_PINCTRL_GROUP(GPIT1),
> @@ -2152,6 +2158,7 @@ static const struct aspeed_pin_function 
> aspeed_g6_functions[] = {
>  	ASPEED_PINCTRL_FUNC(FSI2),
>  	ASPEED_PINCTRL_FUNC(FWSPIABR),
>  	ASPEED_PINCTRL_FUNC(FWSPID),
> +	ASPEED_PINCTRL_FUNC(FWQSPI),

You need to update the binding documentation as well.

Andrew
