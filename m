Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B26E323408
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Feb 2021 00:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlZNQ3xsLz30Qn
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Feb 2021 10:03:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=EwIJLES+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EwIJLES+; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlZNM6GFYz30Lj
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Feb 2021 10:03:29 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id h26so207295lfm.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Feb 2021 15:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRhAYey+svcGCwXyGWPv7V5X8SwkvAprp73I+85/pQc=;
 b=EwIJLES+pr00B3Dj/+oItlJmVww8ftL2KnWVjRMnQaHEG7lVUwSd2+iiKPcjHW+/uF
 kRgLBauqcCoAc97koaMrwcK6tUixzC39s8XbJ1Jn9fC0TuWt0ShAWxtlwQq2uW0Vmc64
 PoYVSlGinQsHBMPvyFrp+iyn7sctUWm/IR0aplZ4FIRVCi4r0Kvu4bvA9nNJB+ttUk74
 R/wnQOzJkJHXZhUCUyYk29X4vg2hOakJ3a/XPTt9aBTqhppn9SUzoOE+NtH8DMoi42qH
 //rMBJ3/v2fi4rhaau8tQx8TwsyAzGl6ghZ3IAfsOcucycpbZHbwQ7TIsmnA55+pKYiZ
 MNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRhAYey+svcGCwXyGWPv7V5X8SwkvAprp73I+85/pQc=;
 b=I2l/uLmumyncN/ziSu3ZA0+9fLlkwvpzHFKhP+3CWJz0yWZzy+7ZtfeH0btWCwff/2
 r6OnFtJ0reKQpN2iret2i3beHj6QJ4fj8pWBfhri2hRYVyITtqUsgwwaLiutNDt8lOPM
 2NR1lgRgGh3T2AJi8qOos25rFEjleaGSkb1XUYz/kGSkFcB5phx0WZpuuioWDHVMV0B9
 l+/XrjQn2ZUqOhcLaa1jm6SjxIDnLXpT0j7I6YFYyvIYt6iAtyr3DvsvJJt5VSZOS1EA
 CbHvAKkTfk/HLA9ru6lK2NWcAZh6LRHrWDv7oeku1PW4X56RzBss+hFcFcsSGYeObm89
 Eihw==
X-Gm-Message-State: AOAM531/1+N5AvE/iR2vFy1ysf5BoUxo4MK4TarWdMQ1wnR8cxUuSvd4
 gKoAvLcLl0gNHoXuCzb4vVhByPWVm7zfslXZf7ksBg==
X-Google-Smtp-Source: ABdhPJzfYSmA9BfP+wP5v//IugfBYumbU1mW5LCBy8Jxvuc1gfBn/zeSpz5/3ST6REQJKCOhL/hkhkouT30tX4hi+hY=
X-Received: by 2002:a05:6512:965:: with SMTP id
 v5mr7893451lft.446.1614121405073; 
 Tue, 23 Feb 2021 15:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
 <20210216182735.11639-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-4-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 23 Feb 2021 15:03:13 -0800
Message-ID: <CAFd5g47MBQ67S3XzaH9rDPSieihNJ_WPhUgw=Pkg1Vk1PK3AvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] i2c: aspeed: add buffer mode transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Tested-by: Tao Ren <taoren@fb.com>

Overall looks pretty good! There were just a couple bits of code which
were not immediately obvious to me that I would like to see improved:

> ---
> Changes since v2:
> - Refined SoC family dependent xfer mode configuration functions.
>
> Changes since v1:
> - Updated commit message.
> - Refined using abstract functions.
>
>  drivers/i2c/busses/i2c-aspeed.c | 464 ++++++++++++++++++++++++++++----
>  1 file changed, 412 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..343e621ff133 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
[...]
> +static inline u32
> +aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
> +{
> +       u8 slave_addr = i2c_8bit_addr_from_msg(msg);
> +       u32 command = 0;
> +       int len;
> +
> +       if (msg->len + 1 > bus->buf_size)
> +               len = bus->buf_size;
> +       else
> +               len = msg->len + 1;
> +
> +       if (bus->buf_base) {
> +               u8 wbuf[4];
> +               int i;
> +
> +               command |= ASPEED_I2CD_TX_BUFF_ENABLE;
> +
> +               /*
> +                * Yeah, it looks bad but byte writing on remapped I2C SRAM
> +                * causes corruption so use this way to make dword writings.
> +                */

Not surprised. It looks like you reuse this code in a couple of
places, at the very least I think you should break this out into a
helper function. Otherwise, please make a similar comment in the other
locations.

Also, why doesn't writesl()
(https://elixir.bootlin.com/linux/v5.11/source/include/asm-generic/io.h#L413)
work here?

> +               wbuf[0] = slave_addr;
> +               for (i = 1; i < len; i++) {
> +                       wbuf[i % 4] = msg->buf[i - 1];
> +                       if (i % 4 == 3)
> +                               writel(*(u32 *)wbuf, bus->buf_base + i - 3);
> +               }
> +               if (--i % 4 != 3)
> +                       writel(*(u32 *)wbuf, bus->buf_base + i - (i % 4));
> +
> +               writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, len - 1) |
> +                      FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
> +                      bus->base + ASPEED_I2C_BUF_CTRL_REG);
> +       }
> +
> +       bus->buf_index = len - 1;
> +
> +       return command;
> +}
> +
[...]
