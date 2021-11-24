Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9C45B7FF
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 11:06:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzc8y40XPz2ynp
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Nov 2021 21:06:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bGMI67JW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bGMI67JW; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzc8p733Sz2xXf
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Nov 2021 21:06:00 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id b67so2213074qkg.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Nov 2021 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OjRtNyQ6raL8RvlGNtWJ01DJpJ/kv1Yhqrl5JLjQHYQ=;
 b=bGMI67JWqh5edskOztk07XMljM3mU8bZWP0spIe4BmPuNUGVzE5WkRRwdEZ9A0/wUS
 2sOveFUxgck7Vu40CTdO+Ys9OMIz9Mmh8Y5j+T2C3KYJIObL+W+aN4Hr9syX/aZU4pTl
 6MU0gxy37t+OGdOMXEStV717WdO2tmR0p2K0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OjRtNyQ6raL8RvlGNtWJ01DJpJ/kv1Yhqrl5JLjQHYQ=;
 b=jhFafpd51u3AIj1T2+ixW/vG9I2ju/QqDYLB9sxrxi/dfhWadmeuU/gB5PCM23pKbo
 EtxNsJEod+/vigkaAmDJCF4Qyn/risY0m74cQ7a/5uHIsbLV9CkCniTKoU1ivbL0Bxuh
 YV5yKaFHoF9Q9/fc03eOV54zthBGpR2wwsLMs+YFntZmF3HGIJthfCJGSB087nux5dFi
 HzVmIqrKUU3Qtkf03GO5gKWuJTKRKYVbBaUToxrc4YAwDtRQ0U5IPQ2UlLNS0EZxMbxR
 I5IYLCaSqkLnhRTyV9xLGLgCgdp/OwRS3imQGu7/tMhqc+deDRW3A1/cYTVIbxDaHMnk
 jQeQ==
X-Gm-Message-State: AOAM53250/2JSH9gJYhIStfpVEnwgg9kXlO0+XBe29kooWGxVpt07Vx8
 u7xXifhvko00nIZw/hOhOaSiw8zMdP/GEiqY7A8=
X-Google-Smtp-Source: ABdhPJy5dM73ZzwuO7N5M6V2CcGuSCoYtcmQT3DfxOPj0vj8YZRetiDRfVGgCVBDrDAqWgAeUDge6MnvSSPtl5haYC0=
X-Received: by 2002:a37:a8e:: with SMTP id 136mr4514246qkk.395.1637748357381; 
 Wed, 24 Nov 2021 02:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Nov 2021 10:05:45 +0000
Message-ID: <CACPK8Xc8aD8nY0M442=BdvrpRhYNS1HW7BNQgAQ+ExTfQMsMyQ@mail.gmail.com>
Subject: Re: [PATCH] net:phy: Fix "Link is Down" issue
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 24 Nov 2021 at 06:11, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The issue happened randomly in runtime.  The message "Link is Down" is
> popped but soon it recovered to "Link is Up".
>
> The "Link is Down" results from the incorrect read data for reading the
> PHY register via MDIO bus.  The correct sequence for reading the data
> shall be:
> 1. fire the command
> 2. wait for command done (this step was missing)
> 3. wait for data idle
> 4. read data from data register

I consulted the datasheet and it doesn't mention this. Perhaps
something to be added?

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Fixes: a9770eac511a ("net: mdio: Move MDIO drivers into a new subdirectory")

I think this should be:

Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")

We should cc stable too.

> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  drivers/net/mdio/mdio-aspeed.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
> index cad820568f75..966c3b4ad59d 100644
> --- a/drivers/net/mdio/mdio-aspeed.c
> +++ b/drivers/net/mdio/mdio-aspeed.c
> @@ -61,6 +61,13 @@ static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
>
>         iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
>
> +       rc = readl_poll_timeout(ctx->base + ASPEED_MDIO_CTRL, ctrl,
> +                               !(ctrl & ASPEED_MDIO_CTRL_FIRE),
> +                               ASPEED_MDIO_INTERVAL_US,
> +                               ASPEED_MDIO_TIMEOUT_US);
> +       if (rc < 0)
> +               return rc;
> +
>         rc = readl_poll_timeout(ctx->base + ASPEED_MDIO_DATA, data,
>                                 data & ASPEED_MDIO_DATA_IDLE,
>                                 ASPEED_MDIO_INTERVAL_US,
> --
> 2.25.1
>
