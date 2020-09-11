Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21F2656AF
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BndZp5zYPzDqkp
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:34:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gEWMwmOr; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BndZh1cnkzDqdf;
 Fri, 11 Sep 2020 11:34:03 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id r7so11521436ejs.11;
 Thu, 10 Sep 2020 18:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zul1Nw9Eq2BdOpetRpWHxzz4+/VY91T8rqh4YA+EBic=;
 b=gEWMwmOrbB/LYJOtJWKIPzwH6SGa/CfYkilzx1UOv3nDPHNrqMURijPx+S+LNyZS9s
 g5YGaNLua3+1IFMr6UjmNZ+zZB03PYIR4vwT+XMxr1qbXF8Pvz/4BFZeAt54rm+HRZO5
 z4muUw8+DXycixI0L1n2dJx2KciCMIiDNf05g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zul1Nw9Eq2BdOpetRpWHxzz4+/VY91T8rqh4YA+EBic=;
 b=pNapo0LTWyyrpMk6+gNjXivuqIYUqX1X1QHXgB38zDXMXEJsTM0Qh80N12omz+Rgjj
 23Z2QM8OPuwNPSJT7GBrqbSsbKGyAzMzBB3uuBf9hLb12G/ODHV4bwm9hMMiwwJPAUwD
 PS6roKRIgb+UKP2X86u9xiw+VL8BD6zKmijPVjQjnJEHFszE8O2Cc0w3RrL5XnnFSl5D
 H6HROSRS5wXI6OGY8ctg9WLmXtDMqOOtn1Xgdvba2gUTXtJUx5Fhg/0caCc6Al5bCgFw
 H6rvMELboEBd3vArHCUvudWQHP0RH+WY+OKg9M1KaZxfnKo6nrzhPF1y6BHt8ZOrBE1S
 58lQ==
X-Gm-Message-State: AOAM533m0LC0XxUQ+oUf9vpz3UTGaoU55wNBlxb2RyXs5K2KWcGz+EI6
 ciNbV0KWoeaKr/urV7FTNYDqW2BljuxE2gf17JQ=
X-Google-Smtp-Source: ABdhPJx2ir+MlnMFHJUzyxfU0Dt11F/+kuo/3+cMlKIRJNz0n3WGSvpgprWg3nu2Xy48NKFqcDLAQWy5mIVP/T7J0Q4=
X-Received: by 2002:a17:906:b6d5:: with SMTP id
 ec21mr11272409ejb.396.1599788040951; 
 Thu, 10 Sep 2020 18:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200910151840.25333-1-eajames@linux.ibm.com>
 <20200910151840.25333-2-eajames@linux.ibm.com>
In-Reply-To: <20200910151840.25333-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 01:33:49 +0000
Message-ID: <CACPK8XcywanG8BN0-0a41CeTJEAb89OR7SnsPRgbddaC01vO-w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add AST2600 APLLdivN definition
To: Eddie James <eajames@linux.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, linux-clk@vger.kernel.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 15:18, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add a new clock definition for the "APLLdivN" as described in the
> AST2600 specification. This clock is simply the APLL divided by a
> factor defined in the SCU registers. It is the input to the FSI
> bus.

Ah, that's where the name comes from. Would calling it APLL_DIV make more sense?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 62b9520a00fd..5a9ae0a1d574 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -87,6 +87,7 @@
>  #define ASPEED_CLK_MAC2RCLK            68
>  #define ASPEED_CLK_MAC3RCLK            69
>  #define ASPEED_CLK_MAC4RCLK            70
> +#define ASPEED_CLK_APLLN               71
>
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
> --
> 2.26.2
>
