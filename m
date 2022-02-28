Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123644C65EB
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 10:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6b8G0DJTz30NC
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 20:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BMCIAstr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BMCIAstr; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6b863tclz2yPY
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 20:44:52 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id z66so9851773qke.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m42zzm1A/Uk2fszLihUQmA9ldzbK7Fh11mCVbXlmHhY=;
 b=BMCIAstrNglzIjoRryZMWNKrJVUS0F+gf66wVvxk/abudp6l7oRiEV9Go/1Tp2Z5UK
 FZvgp6oJzdOMnvnNWiv4GiobNN5JtxdixkM5HIopzJq4MHyDAUH09wL2Zq8MKRGOY2G3
 OGFe9OjLjCkrljdSbJTS3hg5mDsKWg+CbHqK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m42zzm1A/Uk2fszLihUQmA9ldzbK7Fh11mCVbXlmHhY=;
 b=aIwr4UEGjG1lOoXVm02xB67JxsiqaTxRvZETvAW50g9QotiftlYSESw8I5nni2VPIL
 yRC5j7Ag2a448JghvEyy/gKfTGXOpwA6DW7cd2QiVtxRX5d2wNljTDQrJqUQ7zVl291R
 LD8zjyDKYKw342TIdi3tzEXdnYGw9Ia1F1JEsHaZvfrGsq3IOGoxrlsJOTkQ1xumMigp
 lhesWVDTph99PYfavmCK7S44ldqOiwIuy37UwNoSDaUcOD62B5E2e66nJedOtATXFEvh
 2rr5rAJaImb37Q0wp6beJbcTD1e+ZACusnu7zR9Kh4nOT+JYdB+WUxyxeZ+HH5EABNiU
 XYGA==
X-Gm-Message-State: AOAM532UvlTwMjUmmagI4YFsjqavrgHvTlYSU9ck9CfJCPDEnZYIML8g
 0nJYcskBDTsdbSBMXFfAn8K7MnjkVB+4JA1OXKA=
X-Google-Smtp-Source: ABdhPJymavUC7phOQxSAzrnChJkit6X3vSfBJh8VvkrOfuYY39VSMX5xk/p7XeOex4FlAIcndtpkSyXMeeVQYGpGKKo=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr10471405qkj.666.1646041489765; Mon, 28
 Feb 2022 01:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
 <20211208013337.13806-5-tommy_huang@aspeedtech.com>
In-Reply-To: <20211208013337.13806-5-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 09:44:37 +0000
Message-ID: <CACPK8XfJH=h_0f2Wp5akLWtdJwd=bmGdhrqJY8qrK9RX=4NtVQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/aspeed: Add AST2600 chip support
To: Tommy Haung <tommy_huang@aspeedtech.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 8 Dec 2021 at 01:34, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> From: tommy-huang <tommy_huang@aspeedtech.com>
>
> Add AST2600 chip support and setting.
>
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index d4b56b3c7597..d10246b1d1c2 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -82,9 +82,18 @@ static const struct aspeed_gfx_config ast2500_config = {
>         .scan_line_max = 128,
>  };
>
> +static const struct aspeed_gfx_config ast2600_config = {
> +       .dac_reg = 0xc0,
> +       .int_clear_reg = 0x68,
> +       .vga_scratch_reg = 0x50,
> +       .throd_val = CRT_THROD_LOW(0x50) | CRT_THROD_HIGH(0x70),
> +       .scan_line_max = 128,
> +};
> +
>  static const struct of_device_id aspeed_gfx_match[] = {
>         { .compatible = "aspeed,ast2400-gfx", .data = &ast2400_config },
>         { .compatible = "aspeed,ast2500-gfx", .data = &ast2500_config },
> +       { .compatible = "aspeed,ast2600-gfx", .data = &ast2600_config },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gfx_match);
> --
> 2.17.1
>
