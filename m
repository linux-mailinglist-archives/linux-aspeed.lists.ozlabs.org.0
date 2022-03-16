Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CE4DA8FA
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 04:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJG8s4NG0z30Dy
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Mar 2022 14:34:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=X9BHhzGW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KhaAa1BR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=X9BHhzGW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KhaAa1BR; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJG8h72Fsz2xt0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 14:33:55 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B31845C0222;
 Tue, 15 Mar 2022 23:33:51 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 15 Mar 2022 23:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=wX0N7PGjtWJbvi/zYtG/aI4ifQcXEvByFsuvP+
 KfLfc=; b=X9BHhzGWvxXkgWkxJRsYQG1iqA7AhjDIxM/N/DPUwCrXCZmlN+X1O6
 3EKIuiuw/SIbhIr/PMg0mzds98DxpTruLW90QaS0CsVR6Qs/YMcoZHn7HstGGrWV
 NeZ2A06xH1jOGaptDHW3XurPoVGZdouZvpETBTLbdveOVB764jJgCEMXmpKFA4XG
 Yh6WoRkufbnunW0oZMcah2cXhYXIjI7gnpD4ppE9kItQ+IIF63PksvkmoqbSqmYO
 Vj8p3NSPACYyjYjTIxvtpOXZOt2+aMvnRqv24z/UwiqTcVuGhE6/PxaDWVxPQhgx
 rGlcaf79TmOCezgpnZfVskROs8RZQWDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wX0N7PGjtWJbvi/zY
 tG/aI4ifQcXEvByFsuvP+KfLfc=; b=KhaAa1BRYT7ftf3hqH19eEh0589MEb1Q7
 b4OT+KWm6d3b79tYVAA7btKuJU0qbmWQqf+2pHr9/0p2RvvCINWntx/5IrplKlzl
 7RdJhGC4qVpOzNweWWt//xo4tLNyYzOHpqH60OqOoSvtkyofMu9R3PvF6tf6ig2v
 7dC9u5Ppg/tmXUD27oQO0Car8N2IYKXZdjG+s2RqN2QV9GXTmDZxxPaND8RCQPPx
 EYFLVhHMnBNU7+KaKXEy0MBIK24HBjvU4LVcVmZsJPmYnOyzhWvqGzTAy+xSiMGw
 WXWWOT2YV/nLg/3sYnn44EW4Nd5+VDSrscM0b3VyQ7GPR9NFIyeGg==
X-ME-Sender: <xms:nloxYpSkEzp3MkI6LMdOY7NUTDTcfC7Q6s6HyCIlp1ylzYiU-nXgaw>
 <xme:nloxYiwnoLjptu_nQqaAtt1hRKtVFYoL2toYDlJNGQyP8FWEJRJ8wG5FHnY6d1jav
 izsmE94hKmiloJKgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:nloxYu2NUru6wLySgDQQrpEVlCJ27_vlryI3zM84cGYUCzV4v6mgBQ>
 <xmx:nloxYhDICI8BqcTvcLkmSFc5uCMXv70EKvSjfH670smH5dRMDpe14g>
 <xmx:nloxYihTf1VkBbAu_cAT0UF2yskb7SwEeM4nfYpczzxS_QXpB4ojKg>
 <xmx:n1oxYmjUUVPwhBI0nh4L-pJQ15bCp0hzO1Qb8c6NySEgcFVt14K9_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 84860F6007E; Tue, 15 Mar 2022 23:33:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <700af02b-a220-495f-861a-af10f30b482a@www.fastmail.com>
In-Reply-To: <20220308003745.3930607-4-quic_jaehyoo@quicinc.com>
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <20220308003745.3930607-4-quic_jaehyoo@quicinc.com>
Date: Wed, 16 Mar 2022 14:03:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
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



On Tue, 8 Mar 2022, at 11:07, Jae Hyun Yoo wrote:
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

The idea behind the quad group was not to define a function for it 
specifically, but to re-use the FWSPID function and select the specific 
group associated with the specific style of SPI bus you desire. This 
way you'd have a pinctrl node like:

pinctrl_fwqspi_default = {
    function = "FWSPID";
    group = "FWQSPI";
};

(note the lack of 'Q' in the function name)

Maybe that's an abuse of groups, but I don't see a need for the 
function name to match the group name here, we're still doing SPI.

This can be seen in the DTS fix that Joel sent (disregarding the mixed 
voltage pins problem).

Thoughts?

Andrew

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
>  	ASPEED_PINCTRL_FUNC(FWSPIWP),
>  	ASPEED_PINCTRL_FUNC(GPIT0),
>  	ASPEED_PINCTRL_FUNC(GPIT1),
> -- 
> 2.25.1
