Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8B6A6470
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 01:50:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRFyv4N7qz3c6P
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 11:50:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dyyWssqt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dyyWssqt;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRFyn15fQz3bTc
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 11:50:41 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id s26so47344570edw.11
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 16:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ynnNEJ0OvCRhJyHXpVT5xLF+Y6XFOKfk2/bquuxHgOg=;
        b=dyyWssqtEcqiKT7VoraJN8oiAk/zyVGRWxc5Rj4xO/OalLZ8gwyyvaGZIxRK8w3WTr
         g5b9CL3uPhY6+FpgXgpCDQGHDmrA+AJ3TIoba7l4CcIF5DNl/JBawLLs33Zd7Nnt22Om
         vh6StvCmQ86GV3oBklBuFUifqCkBlHSG99yVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynnNEJ0OvCRhJyHXpVT5xLF+Y6XFOKfk2/bquuxHgOg=;
        b=YTQggiiuDWd88zgWwqmvP6Ct1AdbPnw3pFVCHYD5f3A+hDQOVVOphEZ8Ni3ra+ZH+m
         e0QGZlNJ5JdHhChBwkInA0tV97YvPLlZLyrw1FPCKQgkanm23mxLTX3xbfZm9WBjUxig
         Dj9VmqXlUAwCY3Qt45pvY7ep9q/7HAJf1uv/bdAIZCSTjgaovTkS1mAZ01o3a0a9pKPu
         w/xbqQ0MVxuqEWLirBUR9c4oSgorjMxrnZsDtHeKtWSvAPSUYr0NGZ1C6KRwnPGN7FWN
         dlWDq11K+I1ft938+fkGTJAGOe8ZeaFvWEnEOrEIn9tQqBIf+cU3EfAZiRRTl0ELIiKj
         o3OA==
X-Gm-Message-State: AO0yUKXf1a2cQ7msyI4lc8x5xSCnFykdMlDdZHM86z2f4HMBdzUOFNIf
	EkPQoUsqgcPluAnjLUwyvOs6aX5QAnRkW6pW1ds=
X-Google-Smtp-Source: AK7set+7WDDBuXBGzo96ZtLI2wdyOJir2jdHhZzySjRCGEPwTLVIKS28KjoazkzNIINdilRJOZV0Xs8xUA3r2vgOdQ4=
X-Received: by 2002:a50:c319:0:b0:4ad:7439:cec3 with SMTP id
 a25-20020a50c319000000b004ad7439cec3mr2710135edb.7.1677631836974; Tue, 28 Feb
 2023 16:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-2-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-2-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 00:50:24 +0000
Message-ID: <CACPK8XffdV3YMy0eu4sZQhw-tS2g5kz_RHLD98Up9G0P9NAR4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: ast2600: allow empty entries in aspeed_g6_gates
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
> We're about to remove an entry from aspeed_g6_gates, but we won't want
> to alter/reorder existing entries. Allow empty entries in this array.

Nice. So it's recorded somewhere: the gates array should be
sequential, with the include/dt-bindings/clock/ast2600-clock.h defines
starting at 0 and counting up. If a clock gets mistakenly added and
needs to be removed, we can't have a "hole" in the array so instead we
leave it NULL and skip over adding it.

We could simply remove the bad entry but this would break the
theoretical case of a device tree with an old header, so we leave the
gaps in place :(

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel




>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>
> ---
> v3:
>  - reword commit message
> ---
>  drivers/clk/clk-ast2600.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 9c3305bcb27a..1f08ff3c60fa 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -652,6 +652,9 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
>                 u32 gate_flags;
>
> +               if (!gd->name)
> +                       continue;
> +
>                 /*
>                  * Special case: the USB port 1 clock (bit 14) is always
>                  * working the opposite way from the other ones.
> --
> 2.39.1
>
