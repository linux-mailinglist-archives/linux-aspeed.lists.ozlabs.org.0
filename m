Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D14C99C5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 01:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7ZQw5G0Dz3bfb
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 11:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=xPqb8e1d;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aNVTKyQA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=xPqb8e1d; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aNVTKyQA; 
 dkim-atps=neutral
X-Greylist: delayed 388 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 11:15:57 AEDT
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7ZQj1f58z30Hg
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 11:15:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2AB9B5C01FC;
 Tue,  1 Mar 2022 19:09:26 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 01 Mar 2022 19:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=RC3OmsTlLAhw7qINDi2JUOqFcPDvTCTiD6tbe8
 w7L70=; b=xPqb8e1dCyqjyeCQzx+FwlVDTHpTYXPz3BHoolYCe4az6zkOnHIpVy
 gbHg+XZJ1ae2+4fEPjZehmt3m4+4NG4379ml25sTopsN1i2jaOSJ1/A4zZ8hwCMW
 J0ME4E6bvAGFoYBPrAuZq2s58BLDSPfGksnAWzSKm0H0/uvasNDv45VAL05mLr9H
 FNYUC4mZJjTgHFhtdmJhstnQVt8hc515nFUjSIRHu8e/0zcspFqF+1MGnUf9xAVn
 heoUTeVjmTbHrTh9t9oGdRoOHRuCr+ja+K74ZDpG8yfU6MHi2GYt4WwnqJWWeXKv
 qHo47/3w20q69xV3KV1CnfDRJpK++VLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RC3OmsTlLAhw7qIND
 i2JUOqFcPDvTCTiD6tbe8w7L70=; b=aNVTKyQAnxF/xm+0rRxaXuuAThkyZZ1AM
 c3Sq5QqXo/ZnvInff00STzPQkWSnn/6ZYqoTghFdIg2v/H7fcihS1fiXKzQy/5Vy
 5qGCk2q9EaCrZ1sLS0uRl3pYFeA7VovEcNNeuVFek+vxuet4zsCMUWDRe04JWoOS
 OKf3ss4lsH3BhbpVhtKv4bdV/uurfolpkyluXAK2Ma8uOqB7WgtTOzu8imI5ob72
 igPnDlVUgZaytWs6CtdImP8bXVLM86K2lCjeW5zuJG84YBtm4F3SEvDR6P5UFxYb
 qPymS1/jF0ClrKAoXTeH5xhaIiADp2w27D5iD3f+sGXj19VW69bjg==
X-ME-Sender: <xms:tbUeYj5J-NGuWU_qmdrzTHfrQkOeCF_wnIgN0gd261zHXsNX61wUww>
 <xme:tbUeYo7_ogkzJaVtEB5RijUHn-2sAiZCS7X16igIthqpIwkrNILxMKFvGJgJYQN4r
 _wJtdCoo5mpm3WpdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtfedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:tbUeYqe7SD6MqRBlP96aQpQKrehwigutIIY8NsdvFjQSEGXdckx9Sg>
 <xmx:tbUeYkJcZ_K2B2O0Pqk1Lg7Ae_hvvWY3mmPTbOfPSvXgVfl0WdL-1A>
 <xmx:tbUeYnJYAZjEoaVoEA0wSYCBUe1l336K10Qw1QdfAuBpZatqUOz2UQ>
 <xmx:trUeYtjtgOCu9s-_tKUMJa3UGo4SVSOcjuICjWjsUASq-DTbFnZjhQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 23800F60084; Tue,  1 Mar 2022 19:09:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
In-Reply-To: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
References: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
Date: Wed, 02 Mar 2022 10:39:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Weiguo Li" <liwg06@foxmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: fix null dereference in debug
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 2 Mar 2022, at 06:00, Weiguo Li wrote:
> "pdesc" is null checked, but already dereferenced ahead in debug.
> Swap their positions to avoid potential null dereference.
>
> Signed-off-by: Weiguo Li <liwg06@foxmail.com>

Thanks.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index c94e24aadf92..83d47ff1cea8 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev 
> *pctldev, unsigned int function,
>  		const struct aspeed_sig_expr **funcs;
>  		const struct aspeed_sig_expr ***prios;
> 
> -		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> -
>  		if (!pdesc)
>  			return -EINVAL;
> 
> +		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> +
>  		prios = pdesc->prios;
> 
>  		if (!prios)
> -- 
> 2.25.1
