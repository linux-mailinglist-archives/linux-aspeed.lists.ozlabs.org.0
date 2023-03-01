Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8996A646B
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 01:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRFxb0tLGz3c46
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 11:49:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NVgStDPJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NVgStDPJ;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRFxR2RTvz30Lt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 11:49:31 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id cy6so47495349edb.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kn741iAhWjnSvmrDZleHGNSeYwFm8STm5Ya4EwcTIQA=;
        b=NVgStDPJRBmRlQZsmftDf8c4WCB2NVPYJ4id07IjmV94n5WTKVGkhCZ3Z/TAJu8hvx
         Gd/nqzFKpS0FsiKOjn/z1Ab2x+xTTfj7AB0Q9f4t2oBvcB9qDldjXgLP+/cwEDz65C1K
         2iiYuxr+OYj2OsJB1pFd7NQuGYZHBTKfxa0fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn741iAhWjnSvmrDZleHGNSeYwFm8STm5Ya4EwcTIQA=;
        b=fFBM8sHbNLAffk/rQvzYNydNZsSzSCx660jxl7bSUCzrN3pGqQyfEISwp8xK3duKVf
         3vjUWEY+kS7IMaJ4CVraFGOA6QEptQJFf2SHvoZRaiYBT5ZnaXznz5N7LqGGLhfgQQh5
         kFL+cT7qvEeWllg/dI7jlsKXyVxJqalpTeYv8rwQecEMxUu3Gw5NwVWS62zRKHsri6Wg
         XEqPTK+E4V48SBgb2AyORjI88S0lcWrm5yWW12oZPYbaBW2kAyuEhuR+BwE+ldU/DD4E
         Ik+f2z89xBjc84MyOnSWEvmM9uIaY0vBQpL+cldTOYOLpQ5pni2yc0EuIYwXgNeXq7TX
         Xrlg==
X-Gm-Message-State: AO0yUKXZG6CV3ForSM0C3/940XZ56qFk+9oDCTbJvdYNo9osmxLogvTY
	76R1PJSmZ/po6rGN269k4e6eHb4wuEV5X8xh/Ng=
X-Google-Smtp-Source: AK7set/JIQ8zzJbyxKugXjghghYkMBYBiKLVjci91LtkFEbgS/XapeFpjr8GfHBFs5PDfoV0Lz8HToyONIKZkyGAEnc=
X-Received: by 2002:a50:d548:0:b0:4ad:7439:cec7 with SMTP id
 f8-20020a50d548000000b004ad7439cec7mr2717158edj.7.1677631767973; Tue, 28 Feb
 2023 16:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-6-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-6-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 00:49:15 +0000
Message-ID: <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
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

On Tue, 28 Feb 2023 at 09:16, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Add reset line definitions for the AST2600 I3C block's reset inputs.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index b4d69103d722..b1c129977910 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -90,6 +90,12 @@
>  /* Only list resets here that are not part of a gate */

These definitions are part of a gate, yeah?

>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
> +#define ASPEED_RESET_I3C5              45
> +#define ASPEED_RESET_I3C4              44
> +#define ASPEED_RESET_I3C3              43
> +#define ASPEED_RESET_I3C2              42
> +#define ASPEED_RESET_I3C1              41
> +#define ASPEED_RESET_I3C0              40
>  #define ASPEED_RESET_I3C_DMA           39
>  #define ASPEED_RESET_PWM               37
>  #define ASPEED_RESET_PECI              36
> --
> 2.39.1
>
