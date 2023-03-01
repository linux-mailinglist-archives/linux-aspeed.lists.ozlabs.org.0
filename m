Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A556A6468
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 01:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRFwr5K1Wz3bhP
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 11:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QIENcFI8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QIENcFI8;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRFwm3rxxz30Lt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 11:48:56 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id ec43so47435648edb.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 16:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvkdEiT/o/nkHi7j8FGqZTLRBkJbYTC27btZyIK9WrA=;
        b=QIENcFI8+6rxnuLpHosO23D/IpxO6/3VuTaDrv6X+TbU5eskJJ3Yu7CY0nQ22N0gP3
         o4+oY0RELOouGZm8JiKjPCjUlYS59sTJdxPRbn8GVB+KYyvihL5pctpLSTbVRZxUoU0U
         IHZXFo/M7ZquBhRJVUaDUR+eCF5lq3t9zib+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvkdEiT/o/nkHi7j8FGqZTLRBkJbYTC27btZyIK9WrA=;
        b=N5/11OiidVIX7vkVVUK6CpE8rUJLVO5YdrHi2zM6crchmU939g3mTAO6MQRdUZTKH2
         kjZF3juYA+jNCx5nNZmOz8fxIkTGI0n1ciBfEAa1u7WQOBFY8wJehYxVF50EiQ8k/4D1
         S1drpKwlas2gqafLJJQZpI0x+Bjd9qGwPI4DSnhl98oRaRNBAOMC3riG1kb6cVdw1q1N
         rOFeo8jHyVTbvi2vv2yWWshXDVc5uCXt5nsT5Tj3nyfiOcw696j1Bumh9kA2ix/kuKfd
         nnSye52rJ7CaPWgoYAz5tzMLF8cmXBFnLOUnAAQmCoUutSRjEZlmdj7jN7P72p5igGif
         fhBA==
X-Gm-Message-State: AO0yUKXeJ6MGTU9anMHCWdXLVX0faJ4ihaLYFQzQKeC0gm2C+2zeX5ru
	WfHktNx7u7OlYBAiVo0Gnu6kutHBQDbpTKcT0Vc=
X-Google-Smtp-Source: AK7set9lF58MskXtvSfppNec4BhtNvtP/wtqKdIOA5MO+ofQRY65q1/eVgGQ7BC95tETOFekBcYD6DJCF4iNchcNbHo=
X-Received: by 2002:a17:907:a0e:b0:8f7:f3d4:942c with SMTP id
 bb14-20020a1709070a0e00b008f7f3d4942cmr4034612ejc.7.1677631733122; Tue, 28
 Feb 2023 16:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-5-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-5-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 00:48:40 +0000
Message-ID: <CACPK8XcoLhe=zypSh-h_8VGheVqqiQxZV5Z8NXFs2r49zA1wNQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7
 clock definitions
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
> The current ast2600 clock definitions include entries for i3c6 and i3c7
> devices, which don't exist: there are no clock control lines documented
> for these, and only i3c devices 0 through 5 are present.
>
> So, remove the definitions for I3C6 and I3C7. Although this is a
> potential ABI-breaking change, there are no in-tree users of these, and
> any references would be broken anyway, as the hardware doesn't exist.
>
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v3:
>  - split dt-bindings and clk changes
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index dd1581bfdf58..b4d69103d722 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -57,8 +57,6 @@
>  #define ASPEED_CLK_GATE_I3C3CLK                40
>  #define ASPEED_CLK_GATE_I3C4CLK                41
>  #define ASPEED_CLK_GATE_I3C5CLK                42
> -#define ASPEED_CLK_GATE_I3C6CLK                43
> -#define ASPEED_CLK_GATE_I3C7CLK                44
>
>  #define ASPEED_CLK_GATE_FSICLK         45
>
> --
> 2.39.1
>
