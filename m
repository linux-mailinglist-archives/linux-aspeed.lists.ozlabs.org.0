Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03404452A6A
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 07:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtbVd5fQPz2xvf
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 17:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=axRjeAnc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=axRjeAnc; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtbVY4765z2xC2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 17:18:59 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id 132so19485501qkj.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Nov 2021 22:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moerj2/cgT79WMwA3cg6oVNVd7JpZXYnNz8s9GSEqKA=;
 b=axRjeAncLDk6D+syQ/d2VsHsutNSI4x27SjHRyoPl9o25rBGBK3j6Gh4Dn9KUiWnYT
 0MpySKJno6XucXPEWA+VlJam/a0zHvgekifkZK9g1vznIhawEDyupHKl1ijMsf+2rPC8
 rwSGWJalrbiZGu92meQeUQbIiBUy2xwuixcdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moerj2/cgT79WMwA3cg6oVNVd7JpZXYnNz8s9GSEqKA=;
 b=oaxQlWSwukemjMerSp8iFKHK/yrip1kCNm/F19H9GDWoJntaHlFjX4av3xVwpSC9Oj
 JaoXy07RdR5wP3jPdQeerRH5w9T/86cbyxELg9SNU5M5Hu40yK6sieTNcXkoVhuL2V+l
 HFqfzcluTzWUEGrUNkCxLSvoGQMGAZasfmbLLROnMt9DeXLfhV1OnEFVrvDEn48F4ipq
 My/uagTNOoaKdsptbPRch/tUOWRUjI3Am/FLVaBjWuwIKEf7jMgcZZPkB6rNuCFiM/RW
 acntC2v8qxxGZc8+XCqT/WYHlTZV1G3XidGKbubeMWcQuOZUmQX/4RcI90/Y9YKEBTBQ
 JIUw==
X-Gm-Message-State: AOAM5321q6BKY7+mpNs9+0XZpyWUpfGplpTi7rY1ZSHkmhaSqxNnHBzp
 oeGb2ABC0iY2GVigkl8qTlhkQ0hVKwdFRBFP8SM=
X-Google-Smtp-Source: ABdhPJwbRmw+e/yporUG0JiCfdTUsBHQLhSw4joRHWlLquSvp7BF321H3I8yxPtqP2ko/CFyW/RBwgtfEUdd7Wx+7jg=
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr4130440qkp.381.1637043535864; 
 Mon, 15 Nov 2021 22:18:55 -0800 (PST)
MIME-Version: 1.0
References: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
 <20211101110107.29010-4-tommy_huang@aspeedtech.com>
In-Reply-To: <20211101110107.29010-4-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 06:18:43 +0000
Message-ID: <CACPK8XembQc9vMZbschzC6NuXftcXAuzZbLw1ic==iXkK8c-PA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/aspeed: Update INTR_STS handling
To: tommy-huang <tommy_huang@aspeedtech.com>
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

On Mon, 1 Nov 2021 at 11:01, tommy-huang <tommy_huang@aspeedtech.com> wrote:
>
>     The V-sync INTR_STS is differnet on AST2600.
>     Change into general rule to handle it.
>
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx.h     |  2 ++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 26 ++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index 96501152bafa..5eed9275bce7 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -12,6 +12,8 @@ struct aspeed_gfx {
>         struct regmap                   *scu;
>
>         u32                             dac_reg;
> +       u32                             int_reg;
> +       u32                             int_clr_reg;
>         u32                             vga_scratch_reg;
>         u32                             throd_val;
>         u32                             scan_line_max;
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index b53fee6f1c17..1092060cb59c 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -60,6 +60,8 @@
>
>  struct aspeed_gfx_config {
>         u32 dac_reg;            /* DAC register in SCU */
> +       u32 int_status_reg;     /* Interrupt status register */

This is the same for all supported chips; do you need to introduce the
variable for it?

> +       u32 int_clear_reg;      /* Interrupt clear register */
>         u32 vga_scratch_reg;    /* VGA scratch register in SCU */
>         u32 throd_val;          /* Default Threshold Seting */
>         u32 scan_line_max;      /* Max memory size of one scan line */
> @@ -67,6 +69,8 @@ struct aspeed_gfx_config {
>
>  static const struct aspeed_gfx_config ast2400_config = {
>         .dac_reg = 0x2c,
> +       .int_status_reg = 0x60,
> +       .int_clear_reg = 0x60,
>         .vga_scratch_reg = 0x50,
>         .throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
>         .scan_line_max = 64,
> @@ -74,14 +78,26 @@ static const struct aspeed_gfx_config ast2400_config = {
>
>  static const struct aspeed_gfx_config ast2500_config = {
>         .dac_reg = 0x2c,
> +       .int_status_reg = 0x60,
> +       .int_clear_reg = 0x60,
>         .vga_scratch_reg = 0x50,
>         .throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
>         .scan_line_max = 128,
>  };
>
> +static const struct aspeed_gfx_config ast2600_config = {
> +       .dac_reg = 0xc0,
> +       .int_status_reg = 0x60,
> +       .int_clear_reg = 0x68,
> +       .vga_scratch_reg = 0x50,
> +       .throd_val = CRT_THROD_LOW(0x50) | CRT_THROD_HIGH(0x70),
> +       .scan_line_max = 128,
> +};

This patch combines adding the clear_reg functionality with support
for the 2600. Can you split them out; add int_clear_reg first, and
then add support for the 2600 in the following patch?


> +
>  static const struct of_device_id aspeed_gfx_match[] = {
>         { .compatible = "aspeed,ast2400-gfx", .data = &ast2400_config },
>         { .compatible = "aspeed,ast2500-gfx", .data = &ast2500_config },
> +       { .compatible = "aspeed,ast2600-gfx", .data = &ast2600_config },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gfx_match);
> @@ -113,13 +129,15 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
>  {
>         struct drm_device *drm = data;
>         struct aspeed_gfx *priv = to_aspeed_gfx(drm);
> -       u32 reg;
> +       u32 reg, clr_reg;
>
> -       reg = readl(priv->base + CRT_CTRL1);
> +       reg = readl(priv->base + priv->int_reg);
>
>         if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
>                 drm_crtc_handle_vblank(&priv->pipe.crtc);
> -               writel(reg, priv->base + CRT_CTRL1);
> +               clr_reg = (readl(priv->base + priv->int_clr_reg) |
> +                       CRT_CTRL_VERTICAL_INTR_STS);
> +               writel(clr_reg, priv->base + priv->int_clr_reg);
You do not need to do read-modify-write.

On the 2500 you're writing back the value you read. On the 2600 all of
the bits are read only except the INTR_STS bit, which is W1C, so you
can use the value you read from CRT_CTRL1, so this should be enough:

 writel(reg, priv->base + priv->int_clr_reg);

>                 return IRQ_HANDLED;
>         }
>
> @@ -147,6 +165,8 @@ static int aspeed_gfx_load(struct drm_device *drm)
>         config = match->data;
>
>         priv->dac_reg = config->dac_reg;
> +       priv->int_reg = config->int_status_reg;
> +       priv->int_clr_reg = config->int_clear_reg;
>         priv->vga_scratch_reg = config->vga_scratch_reg;
>         priv->throd_val = config->throd_val;
>         priv->scan_line_max = config->scan_line_max;
> --
> 2.17.1
>
