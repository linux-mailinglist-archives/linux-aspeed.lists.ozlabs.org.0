Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D929CDCF
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 05:28:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLbCk0XmkzDqRh
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 15:28:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HM99HBk8; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLbCZ72PKzDqLF
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 15:27:51 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id p45so2585346qtb.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 21:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELimXLIjFFEyZU/ch1CMaoy2YuMN5MJVjff2er+s7NQ=;
 b=HM99HBk83YvD2YeS+eQsdX3b8HsDJPHH2RUbI86H++j7WB8wVMh0dqhupICJ4TmMd+
 JHaTXnKkRz33Mz2ZhTVPwiICOg0FYj7XW93kWewABTZf9Fp5rOlUwYQ2/tV+lQGFTRtk
 v6z4LQ92auwCat4tQ5JI+JVoxqgPR9uiC5nbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELimXLIjFFEyZU/ch1CMaoy2YuMN5MJVjff2er+s7NQ=;
 b=mDawGhrBgVEsum5AXUhvjDfolpjL7g7N6QaRmoqG5QXVQY8f3g9OMJQe+IU6PJQpDD
 1/z2lnWFxyvrfPbQgUmbnarTT04PquoGCLy5xH3AzRHe5FlcsJPkdu5tkec9Qj0JN1EY
 GT2VzYJWePkEk1y77AN84Y3HGldONonwaNVHgEjIkrJVnAZQzwBRhFpE7NpjMSYm5JWI
 xp8+1hBDbFjchIvAR7i2246XBKADLu/0xXlK/In10jJl2O6doMk5nvd9H7DIqhEi36hD
 E2hO4csDDWk5xC2FgBbJd+e2I1b9w7ZVi/eD9dWRi7n35xFKhEYB09iVWnXHuoGkZZQs
 24KQ==
X-Gm-Message-State: AOAM53128gzeO1s/wteHXZvFCjsdAbm5wKdUbtX6bWiVBK1OJ6LyEJvg
 rqCw1mlVrhrP4KWPIr8CpE9L1JyJdOI0jBbiQDU=
X-Google-Smtp-Source: ABdhPJw4sL0/a9JoSrIwywzd8l+q04n/V4qcoRQ1usL9+UKdAACMkTARtNb9rBqxdCnSCJBOQ/U2QBCJqcZJxGf9rjM=
X-Received: by 2002:ac8:794f:: with SMTP id r15mr409042qtt.385.1603859268783; 
 Tue, 27 Oct 2020 21:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201008015106.3198-1-billy_tsai@aspeedtech.com>
 <20201008015106.3198-3-billy_tsai@aspeedtech.com>
 <CACPK8XeKdmvVB_CTND7mSRvtTRz8i+Zw1=E06OP-=r3=pnh9gw@mail.gmail.com>
 <D35132A5-2676-4806-AF35-9110DF0CC88B@aspeedtech.com>
In-Reply-To: <D35132A5-2676-4806-AF35-9110DF0CC88B@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 04:27:36 +0000
Message-ID: <CACPK8XccGJgd4eNiRyE8D2VphpuONZC4CmiC4tDk0pFYmaTdJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Arm: dts: aspeed-g6: Add sgpio node and pinctrl
 setting
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 12 Oct 2020 at 05:25, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> Hi Joel,
>
> On 2020/10/8, 11:49 AM, Joel Stanley wrote:
>
>     On Thu, 8 Oct 2020 at 01:51, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>     > >
>     > > This patch is used to add sgpiom and sgpios nodes and add pinctrl setting
>     > > for sgpiom1
>     >
>     > The code looks good Billy.
>     >
>     > Please split the change in two: device tree changes (arch/arm/dts) in
>     > one, and pinctrl in the second, as they go through different
>     > maintainers.
>     >
>
>     If I split the change in two, the patch of dts will have a compiler error.
>     Because that the sgpiom1 node needs the pinctrl symbol "&pinctrl_sgpm2_default".

The drivers/pinctrl/ changes should be split from the
arch/arm/boot/dts/ changes.

You should keep the arch/arm/boot/dts/ changes in the same patch.

Cheers,

Joel
