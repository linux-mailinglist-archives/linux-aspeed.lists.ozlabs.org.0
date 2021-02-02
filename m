Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3D30B6AB
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 05:48:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVC3y6YgVzDr81
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 15:47:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVC2k6K1YzDqpM
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 15:46:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=oR6iXsBg; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVC2j6qsXz9tjx;
 Tue,  2 Feb 2021 15:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1612241214; bh=vRDOvL4of/Oeu9QXEMbQYJHdwg+PyqoJY0e1Wu5OGCM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oR6iXsBgaRYY+BNPiqtgy6g6SMZZPbqAfupBNijMUu5jYcewGR5RejzgnnQYPaoTR
 8Ihjcex28jr1Qkq5LEJM4CaIHyxraYnJKBNAcx5Xaf/6fv37bnmfadzlc+j3mfKurA
 jpVa9/6CsbmTGgPP5QfCn5dgJpDWGdor/c/eZ0JevetzegsysCaGt7P09DEkar/rDv
 /gSd7NA59yP3QfhNIvm2Cwam9kBlwY8JRx9xE4NMaoUZTTjJ8UioaEKKwK64EtIUkF
 r6v7a+Mpmf6ss9ItRQgkEWk6WQUp+SePJjpebO3sEF7xdT49rmB5gk8OHaaxqLi9E3
 yw5yqz9YBZ0Ww==
Message-ID: <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
Subject: Re: [PATCH 2/2] drm/aspeed: Use dt matching for default register
 values
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 02 Feb 2021 12:46:52 +0800
In-Reply-To: <20210111044638.290909-3-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> There are minor differences in the values for the threshold value and
> the scan line size between families of ASPEED SoC. Additionally the
> SCU register for the output control differs between families.
> 
> This adds device tree matching to parameterise these values, allowing
> us to add support for the AST2400 now, and in the future the AST2600.

Looks good to me. Two super minor things:

> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -60,7 +60,8 @@ static void aspeed_gfx_enable_controller(struct
> aspeed_gfx *priv)
>         u32 ctrl2 = readl(priv->base + CRT_CTRL2);
>  
>         /* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
> -       regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
> +       regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), BIT(16));

The comment references SCU2C; but you've implied that this will
change...

> @@ -228,7 +258,7 @@ static ssize_t dac_mux_store(struct device *dev,
> struct device_attribute *attr,
>         if (val > 3)
>                 return -EINVAL;
>  
> -       rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
> +       rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
>         if (rc < 0)
>                 return 0;
>  
> @@ -241,7 +271,7 @@ static ssize_t dac_mux_show(struct device *dev,
> struct device_attribute *attr, c
>         u32 reg;
>         int rc;
>  
> -       rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
> +       rc = regmap_read(priv->scu, priv->dac_reg, &reg);
>         if (rc)
>                 return rc;

You've removed the only uses of ASPEED_SCU_MISC_CTRL here, maybe drop
the #define too?

Regardless:

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy


