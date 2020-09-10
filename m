Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155B263BAC
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 05:57:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn4pX4rsSzDqbY
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 13:57:24 +1000 (AEST)
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
 header.s=google header.b=ncxUvo1a; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn4pQ2F8hzDqWs
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 13:57:18 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id p9so6620941ejf.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 20:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+D12hGVwScuYyxWOHUH1+5ysjpRMewwxlzMDyf/Wpc=;
 b=ncxUvo1acHcF8r+VD2TvqZtMAGKG9IUqN1MWUk1S8vuZQK2tJYl7rtKPRfWM3FE+cW
 MjCQyLN1I4qJztPKyBb6+giQbVg4l5QQvwL9Fkf0cLUfHeoT4oDB7PTS/r8VqNhM8gDW
 zjFmqgjyrFFpY6fQj8givVovWGzUH6JrowmPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+D12hGVwScuYyxWOHUH1+5ysjpRMewwxlzMDyf/Wpc=;
 b=JCujekrWzN///7r0R4jDm9Bdls+HLjRonej4RvuKNZKN1zGZsdT9IJEmlMd1tBO0CU
 +5yHjW5wZ7nke8EPxNk23Lslpk9sV9HqJ0c/e4W/J5Tp0jAVmHR7+lgEwwKHy56aC039
 XtxYCNbPniS1Y0/UL3rWNkUg+Pc2eBgUulXEj4K1Xrqj5ce9rgHjNxreY5v1jWuGVm1J
 nLVWUlPJz52yH6JVflJSKn2fmg/616xm9C9lAGSHUllVbWuUsjsDdhU2HALXOPUOJ4UV
 gJoTp7gU+TOT/0VRmzOrZBodtlilzwi+Ay7F99oxGNBNG+QP0ixgrwKsyEYOur2G9aMD
 NGQQ==
X-Gm-Message-State: AOAM5320EB5l0+2aHM7DvylTFdz//d7/bYvKLUb4ks5AZ7tyN6MXSUTY
 ITfqiTms9hb/zLkNlhQ/F+UrXyBG6WC9xi9x7jgjM3E7ICijIw==
X-Google-Smtp-Source: ABdhPJyxgIT5FVRYlESJqvho8jAdaQREuczgbp6vegxqirYKG53fie1HrraaFgLNUkCqk3UFhiPiQF4GMbPtQBShrUQ=
X-Received: by 2002:a17:906:b6d5:: with SMTP id
 ec21mr6513096ejb.396.1599710235338; 
 Wed, 09 Sep 2020 20:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
 <20200715135418.3194860-2-jk@codeconstruct.com.au>
In-Reply-To: <20200715135418.3194860-2-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 03:57:02 +0000
Message-ID: <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by
 default
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020 at 14:06, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, the IRQ setup for the SGPIO driver enables all interrupts for
> dual-edge trigger mode. Since the default handler is handle_bad_irq, any
> state change on input GPIOs will trigger bad IRQ warnings.
>
> This change applies sensible (disabled) IRQ defaults.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 927d46f159b8..23a3a40901d6 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c

I've re-ordered the lines in the diff to make it easier to review:

> @@ -451,9 +451,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
>                 /* trigger type is edge */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
>                 /* dual edge trigger mode. */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> +               iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));

You're changing the trigger mode from dual edge to single edge.

> -               /* enable irq */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));

And also removing the enabling of IRQs. This part makes sense, as it's
what the commit message says.

If you think a sensible default should be single edge (and I would
agree with that change), perhaps update the comment to say "set single
edge trigger mode" and mention it in your commit message.

Cheers,

Joel
