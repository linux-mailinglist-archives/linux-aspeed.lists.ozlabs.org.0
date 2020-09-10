Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A82640D7
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 11:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnCYQ4qgszDqdm
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 19:01:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=susunWFF; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnCY70RSzzDqZN
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 19:01:08 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id f18so4240850pfa.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikzS6RYjoj2agknRb+4ptOX5afJxX0ugn9/c1CJ7PGY=;
 b=susunWFFKwqMfxgI6ByE2bxzf0efOUepi18FJy0I3JaGM6PyRxlr5pWK3ZQrDC2hnN
 ReIMsZIjJ33de7BpVFfN6XqNS2jyfb9GZ4K4h/I+P+A/84lrh4EPnpGm+66JuThreZhq
 iAMtKUT4cO0Ytr/lL4S5Sgtjvq1DbmwGLc9mWMpW0LEU+uV0uBZdkKDexwQrIXp5JxOQ
 RA7+krRJzRP7PBsEmcwR2pTSvNWBUhC9PH7lfT+vnhnZJ2EJ/bJDi6mlKCS+wRvd9Aam
 hrjVglwXEJHhNVjheCVAFPlrQygD9qBLmsofYecD5zPuBl8kXkIXPqbFzTT4CDb1bFpn
 vioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikzS6RYjoj2agknRb+4ptOX5afJxX0ugn9/c1CJ7PGY=;
 b=inGQi67Dlq9qarii9ymo8wYJNuONBAAjwkFasTQWnogReE2cffTjVn/4XRAEgk3L6L
 2RvpM4DuuUL20Vqz/qANtYo5tUKPUkz2EG+l+BZBUW43g/1ldV73zzDsSWOAzNoxy+dy
 8g178XN7IBs1s+jV45CiktHUFwEOuXtxG7r0441rtVrjI0gIXS/CVTvUN6faB+ESqomG
 BBeb/I3bWvMHA9t2tpFXN9wBP+/Z0dOzyax1iv5MzpamM7lwJRXqu6um85hs4gd5fABi
 t6vHi9Opoq7/hl0jZqk6EafJNU2qrjHmXROoS/YVj5o2vT1TxAEYDtCChvTrEP3c1g7J
 pT1w==
X-Gm-Message-State: AOAM533UeL1RP5PFWgCEZzq8CwCArYsHaYT6vDqc+FZ2te/CEpnzZQrz
 /Wqr2ACY2kvli9hvQC6Ju9d5RVLRbOa9H2K7VvW4zg==
X-Google-Smtp-Source: ABdhPJyz+lxVXWAN3RjhjfBgNFqBMssrHGsYLq26O3vVlwR5Eg9ERiehVAHVqUqpwEj5gFDwZOX+ebtv3+a8IJuSeMA=
X-Received: by 2002:a63:fd03:: with SMTP id d3mr3605973pgh.201.1599728464251; 
 Thu, 10 Sep 2020 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-4-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-4-eajames@linux.ibm.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 10 Sep 2020 02:00:53 -0700
Message-ID: <CAFd5g46ghV7ArmM8LnMkGa-Nip_fT934+3cPOkVxS-b5odZXYw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wsa@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 9, 2020 at 1:31 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

Sorry, looks like I didn't get my comment in in time.

Looks good in principle. One minor comment below:

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 31268074c422..724bf30600d6 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -69,6 +69,7 @@
>   * These share bit definitions, so use the same values for the enable &
>   * status bits.
>   */
> +#define ASPEED_I2CD_INTR_RECV_MASK                     0xf000ffff

Could we define ASPEED_I2CD_INTR_RECV_MASK to be ASPEED_I2CD_INTR_ALL ?

>  #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT                        BIT(14)
>  #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE              BIT(13)
>  #define ASPEED_I2CD_INTR_SLAVE_MATCH                   BIT(7)
> @@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>         writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>         irq_remaining = irq_received;
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> --
> 2.26.2
>
