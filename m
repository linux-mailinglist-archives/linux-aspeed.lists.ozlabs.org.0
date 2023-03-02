Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17C6A7A11
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 04:30:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRxTF4dJ2z3cMm
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 14:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TkrdMran;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TkrdMran;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRxT5681fz3cFt
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 14:30:49 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id s26so62184891edw.11
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Mar 2023 19:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ/MILgWgQHwHoMlCWIsaUJfI9Yq/sjBc9o0dijE/U4=;
        b=TkrdMran+QTp11FGYtrmiFOgICKvxsB880yoTwhfzzQ023beTC86M5b6H9KF+TF7JS
         gXMtCyKllvGLAasjyP7cwTQ5S2qMA4z894n6Xvt+RkpyuSUwpiZUDdemN4KC494OWRdt
         gDPvZsh67qFX7xrF5ooj6Drt6dHIJx803zpiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ/MILgWgQHwHoMlCWIsaUJfI9Yq/sjBc9o0dijE/U4=;
        b=ONgB475CU8kyNKVywZmz7hNF3EK31AINF7XVIAvA7uwUcx06TB+MPzboKZ9zDqCpS2
         Ixn3EHHr9LzAJ11Sdqdv8aWH74fyFLVO0jXRLNrzkN4BY4UcJGMW0NI0KVxPDt2H36gJ
         GVNvWYmBz7cIO9C5HMxJU0vbSLsFy86pJkPPCXika50mH3KrhWdC5VrQ2PTOOGX72DVI
         2VrIUeMFHKrTP+X8VEoeaPN7C5iwpaBqpXTscD6PuoaShUNeRh0kLDl7gqlPBNwnNsCP
         Srh85cPclxPmIfBc/scW29i68JVXjpJIpozxqiVRfXvJp7foEqiweEwrsFaThmsa/s1R
         +qIw==
X-Gm-Message-State: AO0yUKWzPxiQwo07Cz2J2RomfZVGFUcqipwNP9oXEPgimRkL2V/mUIhs
	B8VyYdRbQdkXby0uCPlJw5Q2IlOyPgRCTBikpN4NFDcf
X-Google-Smtp-Source: AK7set8+mnvjDp4w2b20qHE8h3/Ugm6+aH6rWINdH+bet2ruNmbNyMh60NFSiWq6rRy8Zc4OAFxwFcG857/lB2ueFo0=
X-Received: by 2002:a17:906:52d2:b0:8b1:7ac6:318a with SMTP id
 w18-20020a17090652d200b008b17ac6318amr4156156ejn.4.1677727844867; Wed, 01 Mar
 2023 19:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-6-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-6-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2023 03:30:31 +0000
Message-ID: <CACPK8Xd7pFjc94Pf9pzedH3kkckeBBjh1TNaGGvfD=7+aMB2MA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock +
 reset handling
To: Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Add a little description about how reset lines can be implicit with
> clock enable/disable. This is mostly based on the commit message
> from the original submission in 15ed8ce5f8.

Excellent, thank you.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/clk/clk-ast2600.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 09f26ab5f9af..a094a2601a37 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -73,6 +73,27 @@ static void __iomem *scu_g6_base;
>  static u8 soc_rev;
>
>  /*
> + * The majority of the clocks in the system are gates paired with a reset
> + * controller that holds the IP in reset; this is represented by the @reset_idx
> + * member of entries here.
> + *
> + * This borrows from clk_hw_register_gate, but registers two 'gates', one
> + * to control the clock enable register and the other to control the reset
> + * IP. This allows us to enforce the ordering:
> + *
> + * 1. Place IP in reset
> + * 2. Enable clock
> + * 3. Delay
> + * 4. Release reset
> + *
> + * Consequently, if reset_idx is set, reset control is implicit: the clock
> + * consumer does not need its own reset handling, as enabling the clock will
> + * also deassert reset.
> + *
> + * There are some gates that do not have an associated reset; these are
> + * handled by using -1 as the index for the reset, and the consumer must
> + * explictly assert/deassert reset lines as required.
> + *
>   * Clocks marked with CLK_IS_CRITICAL:
>   *
>   *  ref0 and ref1 are essential for the SoC to operate
> --
> 2.39.1
>
