Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD74E8C86
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRdFY6P54z3c1q
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=l5ngCRHM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TXLtIrp6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=l5ngCRHM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TXLtIrp6; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRdFT3bmHz2ynk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 14:18:37 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 76A155C00EF;
 Sun, 27 Mar 2022 23:18:35 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 23:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=sjzRwe+i0dJfsZHh+Yw21DnuDdIQXrGz53BXl1
 zcHYI=; b=l5ngCRHMS3I74prq3hsF2qNcAN4/b+Wllq2tAcfDxEyf3cfHM9vkOD
 wENQTvocKCPF6oi6KOxglAN4QBNN+NLx+mh+qiXmQmZEk0/4gl/pjeW/KXtCeHdN
 V8xLCQUndrn4fQxu8a+aA/rrZDllottvze418qQkldik5NvNgJsZGjTYiK1cVz6a
 gBN1qH86RhJrAe5y/TXIJhfVGy3VNGL/l3TZsgmeKZvZfckSY5hKmR8r4GsV/JNH
 oYxRtO+WcGFPTlHN/6/qhFvQ6Easg2zYEIhYorENpY+BGN1ec+5UHzRokDzDEplh
 D9rAjfF2z68jrVJ8hht2dzIVKjUBX2vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sjzRwe+i0dJfsZHh+
 Yw21DnuDdIQXrGz53BXl1zcHYI=; b=TXLtIrp6LzdS8Tcg2TmXRN8LBw43b1/M7
 IepCo+6y06+T4Q6u9Xv3sdB21ajF1XGPftpZQMI3azjtqgOWUwiSeGvlqbn/FAt7
 HVkEF+VLNh/JZn37SpcjNVwyz9dkGqLes5nrVaoK+sFfvZa7/TB6MEbOAzOEE+K0
 rfEo7/E6JY/hoVO1ghQQV37fwoAxPhSd9Yrjr1Y9Ut/pMzlcNtyDRhO2k5O4r8sT
 aCY7/zpjQnhgG2ErltN/NuEmUcvxud1u0VQkZySzRfI2T3CSOoWF8F/l0sor/O7v
 StAdlNAHAs3CtftAswJiNRjdGggSWzYj3AljHT9DSPDGFBoUtzYcw==
X-ME-Sender: <xms:CylBYnUgPuf0VZ9_bImdUekIgNm4H7ZFVsqOvpFahsWix_lHovSXtA>
 <xme:CylBYvkLb_DAr9HED1zu9XMcgJ-ilsoYOT-kYnWYzl8HWhPiPnd9cbLr8jAC7v2vt
 oD1sBLB4xW4qhXosA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdffudfgudeivdfgffevueelkeekjeekudejfeelgeeivdevhfdtudfh
 gedvgfehnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruh
X-ME-Proxy: <xmx:CylBYjYn9hK7Ol4leZbaTchVL5DjFpx1IEwcVzpt07iquLHxcA9HQQ>
 <xmx:CylBYiWitHgsFyxfeWiA3MavdRgzn3wKBYWZHNECm_p7PI2Do9rXHA>
 <xmx:CylBYhkM9nrMjpGM01GfpUJXhl2sqT8xG-3YgQlSAWRf10GGidFL6g>
 <xmx:CylBYvaMeHNBAEjwsIN9H8IVtFEi-yXFo1DifHyahE2WhkLD91sCIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2DBFEF6043F; Sun, 27 Mar 2022 23:18:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <c846fd5f-56e0-4289-af2c-42603c1abda2@www.fastmail.com>
In-Reply-To: <20220325154048.467245-3-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-3-quic_jaehyoo@quicinc.com>
Date: Mon, 28 Mar 2022 13:48:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/5] pinctrl: pinctrl-aspeed-g6: remove FWQSPID group
 in pinctrl
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
> FWSPIDQ2 and FWSPIDQ3 are not part of FWSPI18 interface so remove
> FWQSPID group in pinctrl. These pins must be used with the FWSPI
> pins that are dedicated for boot SPI interface which provides
> same 3.3v logic level.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> ---
> Changes in v2:
>  * None.
>
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index a3fa03bcd9a3..54064714d73f 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -1236,18 +1236,12 @@ FUNC_GROUP_DECL(SALT8, AA12);
>  FUNC_GROUP_DECL(WDTRST4, AA12);
> 
>  #define AE12 196
> -SIG_EXPR_LIST_DECL_SEMG(AE12, FWSPIDQ2, FWQSPID, FWSPID,
> -			SIG_DESC_SET(SCU438, 4));
>  SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
> -PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIDQ2),
> -	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
> +PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, GPIOY4));
> 
>  #define AF12 197
> -SIG_EXPR_LIST_DECL_SEMG(AF12, FWSPIDQ3, FWQSPID, FWSPID,
> -			SIG_DESC_SET(SCU438, 5));
>  SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
> -PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIDQ3),
> -	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
> +PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, GPIOY5));
> 
>  #define AC12 198
>  SSSF_PIN_DECL(AC12, GPIOY6, FWSPIABR, SIG_DESC_SET(SCU438, 6));
> @@ -1520,9 +1514,8 @@ SIG_EXPR_LIST_DECL_SEMG(Y4, EMMCDAT7, EMMCG8, 
> EMMC, SIG_DESC_SET(SCU404, 3));
>  PIN_DECL_3(Y4, GPIO18E3, FWSPIDMISO, VBMISO, EMMCDAT7);
> 
>  GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
> -GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
>  GROUP_DECL(EMMCG8, AB4, AA4, AC4, AA5, Y5, AB5, AB6, AC5, Y1, Y2, Y3, 
> Y4);
> -FUNC_DECL_2(FWSPID, FWSPID, FWQSPID);
> +FUNC_DECL_1(FWSPID, FWSPID);

Really this is the FWSPI18 group now? The FWSPID name never made sense. 
I'm not sure what I was thinking.

Actually, I think it's worth squashing this with 3/5 so it's a proper 
fix rather than separate remove/add?

>  FUNC_GROUP_DECL(VB, Y1, Y2, Y3, Y4);
>  FUNC_DECL_3(EMMC, EMMCG1, EMMCG4, EMMCG8);
>  /*
> @@ -1918,7 +1911,6 @@ static const struct aspeed_pin_group 
> aspeed_g6_groups[] = {
>  	ASPEED_PINCTRL_GROUP(FSI2),
>  	ASPEED_PINCTRL_GROUP(FWSPIABR),
>  	ASPEED_PINCTRL_GROUP(FWSPID),
> -	ASPEED_PINCTRL_GROUP(FWQSPID),

We should also remove the function (not just the group).

Andrew

>  	ASPEED_PINCTRL_GROUP(FWSPIWP),
>  	ASPEED_PINCTRL_GROUP(GPIT0),
>  	ASPEED_PINCTRL_GROUP(GPIT1),
> -- 
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
