Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782486A648D
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 02:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRGK36vq6z307t
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 12:06:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PprWuKMV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PprWuKMV;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRGJw1SLTz301F
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 12:06:24 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id h16so47559369edz.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 17:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntMlB8tUMTxfsC0GrFp2J+8lL/27lfUXu3oM6wbn744=;
        b=PprWuKMV7WpSgqmEXbYQIdsI2Y80bAnVmj++7Ldciu54FpEHWmr99uqdPZ4m6ZXSj1
         4zGCiCRFJu5sC0IZkyHgUhpxTf5+eET3HpQelxrdjoNTxrYaVaYmFTiqK7avD2siqsFp
         lhtalSkVoEpNcm7hhAwrydOtn+egUwai6yFKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntMlB8tUMTxfsC0GrFp2J+8lL/27lfUXu3oM6wbn744=;
        b=LXy2yXH+ZJt8usJG90NyA2ewXSea7ieInaKBF4zrug/nX3Rq3tuudw3m66XjIATE5Y
         eXh0xn3HsG3DNRfgZBL0EtEzyCyNPxovUamF1Ja6j6xAs0MqRPGFE3wPpCfaT+rk8XYB
         wblbMFZzEazalgYTi0IYmIQGXOWuOV+kDW40gsUVoQscFc8cV49dW1Dv6HrniovNl9hd
         y4B5Yz64ew/Hk9lb30WVWSo/JfNxs+NmwHxOc89avf5F7MPmJizXzafP2xtgs6hFrJ6O
         jJygrqyOlUWuoykH0+7ALjw5B7GUdTGZPatIRf9mHDf9rqt/9FKKASDWvaj9+Seihi7k
         oj3w==
X-Gm-Message-State: AO0yUKUHav7lMiSlO2Gpd+FhgZLzdjUpTnguFQjt6bBkXUggMoMoZTSz
	6DxZud8c3m8jrvpTIFCp84G6KDx6h2LhfgB4arY=
X-Google-Smtp-Source: AK7set88rqwV4LYOMsTnEC1Hn1DhWWXoane1rPqIDpdVR8bXYOAQBHwU/oCt/7oEewEy4sUSGldGvTwbi6z+oHuzvXU=
X-Received: by 2002:a17:907:d30d:b0:88d:ba79:4317 with SMTP id
 vg13-20020a170907d30d00b0088dba794317mr9636315ejc.7.1677632779652; Tue, 28
 Feb 2023 17:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-4-jk@codeconstruct.com.au> <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
 <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
In-Reply-To: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 01:06:07 +0000
Message-ID: <CACPK8Xfd5UzSC=pnVL+Rn6xj4sFkWBfB27c4O=qX8CjdL=fSqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
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

On Wed, 1 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> Thanks for the review. Some replies inline:
>
> > > @@ -15,7 +16,7 @@
> > >
> > >  #include "clk-aspeed.h"
> > >
> > > -#define ASPEED_G6_NUM_CLKS             71
> > > +#define ASPEED_G6_NUM_CLKS             72
> >
> > NUM_CLKS seems dangerous. Should we instead use
> > ARRAY_SIZE(aspeed_g6_gates)?
>
> Yep, that would have saved me some time debugging. That would suit as a
> separate change though, would you like it in the same series?

Doesn't matter much. Perhaps include it at the end, for both the
aspeed drivers? But separately is fine too.

>
> > >         /* USB 2.0 port1 phy 40MHz clock */
> > >         hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL,
> > > 0, 40000000);
> > >         aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
> > > +
> > > +       /* i3c clock: source from apll, divide by 8 */
> > > +       regmap_read(map, ASPEED_G6_CLK_SELECTION5, &val);
> > > +       val &= ~(I3C_CLK_SELECTION | APLL_DIV_SELECTION);
> >
> > Is there any value in registering a mux device here? See the emmc
> > extclk device.
>
> We won't be doing any mux configuration here, so I figure the static
> setup is fine.

ack

>
> > > +       val |= FIELD_PREP(I3C_CLK_SELECTION,
> > > I3C_CLK_SELECT_APLL_DIV);
> > > +       val |= FIELD_PREP(APLL_DIV_SELECTION, APLL_DIV_8);
> > > +       regmap_write(map, ASPEED_G6_CLK_SELECTION5, val);
> >
> > This is a departure in style from the existing code. The existing
> > code did things like this:
> >
> >         regmap_update_bits(map, ASPEED_G6_CLK_SELECTION1, GENMASK(10, 8), BIT(10));
> >
> > Which uses the regmap API instead of FIELD_PREP macros.
>
> Yep, that's much nicer, I'll change. The FIELD_PREP parts are just from
> the initial ASPEED implementation.

Cool.
