Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69E6A7A8F
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 05:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRyyt3C8Qz3cCy
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 15:38:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MY4cskbm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MY4cskbm;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRyyj6m5Cz3bvZ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 15:38:03 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id o12so62666274edb.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Mar 2023 20:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cH5QCWPvK5yIWKHOjLm1DJOS8y866l+SddIKwDhm72I=;
        b=MY4cskbmwusawU8T7AnxkNnsEDLOkB2G+nL/682DS0Lt0IdiB2NXWH9CEjaDt7I8RM
         +zHXbQEqJgSkUjRF6yo7yUz8jw7uSCrxoJgLg0PlpYWcBQknIdK6AgJWjQYJC8rWNGNw
         KBojVr2FyzuO2q+q3XJNlq0UEys1fmRhEP+og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cH5QCWPvK5yIWKHOjLm1DJOS8y866l+SddIKwDhm72I=;
        b=OsGEoZZ42z0ij8RjNdR5Xz/p+myWh0E9LbLrYJ+QY5DmF5X7ePlZ7QyHY5z9otYNVD
         5unF8pmooCTk9kGGykYZJCaCmVb4vHGltLbhjFP5whmdsKoCJh2Tda94A9JYu3NCcOLQ
         g1XjuFcsDz+91qjj8qm+cZDVTDk0H2wBtrBctDxmLux8jbKDXEaZtujVWDNPSkfqRn45
         ZC7USZio/YPB0gx1Glx7XRHxibgj55uuOXGOsMSQRMvRytmfQGiDv9ETBl+ZdoYv3+g6
         u4GQD4fE0gQDI/fGHTwENutN6peKXiPdV7Xr4/MCoidsR/05smpwJu3wCswVaP5hfzNu
         o6vA==
X-Gm-Message-State: AO0yUKW0D9sPRKsXt+wINNaKJVqm9q+l0PGbDch0sjU1cbLwgIrvAnYy
	NmpPCy1rse/rTgxWo/QamazZ1UDYIvB9UUULADI=
X-Google-Smtp-Source: AK7set8sNmWm/8ILzJnLjhfsBQegrCZWioL4601vbmBfjTc1luoGfB69rsH3LmqFUTACR4tMATlZqEyS7SZf3G3sR5w=
X-Received: by 2002:a17:906:1751:b0:8e3:da0f:f9b7 with SMTP id
 d17-20020a170906175100b008e3da0ff9b7mr4614883eje.4.1677731878401; Wed, 01 Mar
 2023 20:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2023 04:37:35 +0000
Message-ID: <CACPK8XdDL1Wm4juJhANwmkacAfmYTJTdQAFVd9t8wPPLUfBxaA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add definitions for AST2600 i3c clocks
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
> This series adds some base configuration for the i3c controllers on
> ast2600 hardware. We'll use the reset and clock definitions in the
> proposed dt binding example, hence sending these first.

Cool, looks good:

 clkin                                6        6        0    25000000
        0     0  50000         Y
    apll                              1        1        0   800000000
        0     0  50000         Y
       i3cclk                         2        2        0   100000000
        0     0  50000         Y
          i3c5clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c4clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c3clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c2clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c1clk-gate                1        1        0   100000000
        0     0  50000         Y
          i3c0clk-gate                1        1        0   100000000
        0     0  50000         Y

Tested-by: Joel Stanley <joel@jms.id.au>

Thanks for the cleanups and documentation.

Cheers,

Joel

>
> v5:
>  - use regmap_update_bits rather than FIELD_PREP
>  - drop reset defines; resets should be handled by clock control
>  - add comments for the above
>  - add comment for NUM_CLKS semantics
> v4:
>  - ensure we have enough space in ASPEED_G6_NUM_CLKS
> v3:
>  - split dt-bindings from clk changes
>  - unify subject prefixes
> v2:
>  - based on feedback from Joel Stanley: avoid adding RESERVED clock
>    definitions, allowing empty entries in aspeed_g6_gates instead.
>
> Jeremy Kerr (6):
>   clk: ast2600: allow empty entries in aspeed_g6_gates
>   dt-bindings: clock: ast2600: Add top-level I3C clock
>   clk: ast2600: Add full configs for I3C clocks
>   dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
>   clk: ast2600: Add comment about combined clock + reset handling
>   dt-bindings: clock: ast2600: Expand comment on reset definitions
>
>  drivers/clk/clk-ast2600.c                 | 67 ++++++++++++++++++++---
>  include/dt-bindings/clock/ast2600-clock.h |  5 +-
>  2 files changed, 60 insertions(+), 12 deletions(-)
>
> --
> 2.39.1
>
