Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A0442424
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjqF62szTz2yHB
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:36:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TI5IZanq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TI5IZanq; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjqF20Fcdz2xBJ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:36:53 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id v4so2972732qtw.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pmid3FU5YvCxo0zgOGInuBcMmgEuXW80FVg90+iTmBQ=;
 b=TI5IZanq3Fhrg9BqUaGHomQGExeanmPBRt6rkePMxm+nhhpNKkkWjJOc0GsInRMNk7
 VPlRfeqdhel3q3OV8PBcmLt79mL3j2cNQ6RJ8mmzNWYqOf7SBgHXjQFzYyKKzHKIGCkt
 dJv7isjhUh3GOcHeYHSDDq426L916mLlzJGUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pmid3FU5YvCxo0zgOGInuBcMmgEuXW80FVg90+iTmBQ=;
 b=JxteIWk6gR+IJgG7Y9spq9crh6akwdC9uhXgskWgoKgXi2WE8kKCCuPwnJGo4qaUEW
 2uF3JYQDnnTpQ48YfcNrqzW8klUpvc3s0zQhnRECvkK0Hx7kjzj9WkeL0bov6iPC7wR/
 IK7AeqPBGTlWwUcXugCmXVAQZXTlP5JjptSS19mt0iP4lhIiCJIl6WWumYQ3ZHf60C1Y
 WarssLSpxmJ427ZLSqJ+a2OQeMfwFlTfDrCM+JEyv5n5W/Sjwuhrcy2GZUpJT3+IeCrR
 2OTen6IO7Gi1J7Tlsw3Im8vTcVAw5jSNn3CThqa3OsJ1/btYLkOHkuKuDqHt3cY0bUal
 AxIg==
X-Gm-Message-State: AOAM531VFSfQB5zFofldZEwB7dTjn4uGQd9/WUdaNxpVjnsGNz0pTWgH
 ZZwkdpVKJzuSvFAwRAFkmp/LZVL0Eg3VCF9hMgE=
X-Google-Smtp-Source: ABdhPJyRea5xbiVxpgagPn5g8jYKHqnv1Wr8Iudl5+8G0cJaDNMGFdAblrI+/llOFZb3xgPlWKt9BlHm3lZ6cZ5SSD8=
X-Received: by 2002:ac8:5e49:: with SMTP id i9mr32849455qtx.145.1635809810659; 
 Mon, 01 Nov 2021 16:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
In-Reply-To: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:36:38 +0000
Message-ID: <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
Subject: Re: [PATCH -next 0/4] Add LCLK control into Aspeed LPC sub drivers
To: Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Zev Weiss <zev@bewilderbeest.net>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> Hello all,
>
> This series is for appliying below fix to all Aspped LPC sub drivers.
> https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
>
> An LPC sub driver can be enabled without using the lpc-ctrl driver or it
> can be registered ahead of lpc-ctrl depends on each system configuration and
> this difference introduces that LPC can be enabled without heart beating of
> LCLK so it causes improper handling on host interrupts when the host sends
> interrupts in that time frame. Then kernel eventually forcibly disables the
> interrupt with dumping stack and printing a 'nobody cared this irq' message
> out.
>
> To prevent this issue, all LPC sub drivers should enable LCLK individually
> so this patch adds clock control logic into the remaining Aspeed LPC sub
> drivers.

Thanks for sending this out!

This will resolve a few of the issues we have in the issue tracker:

https://github.com/openbmc/linux/issues/210
https://github.com/openbmc/linux/issues/130

The patches look good to me. I think you've just missed Corey's PR for
v5.16, but I will stick them in the openbmc tree once they've had a
review.

Cheers,

Joel

>
> Please review this series.
>
> Thanks,
> Jae
>
> Jae Hyun Yoo (4):
>   ARM: dts: aspeed: add LCLK setting into LPC IBT node
>   ipmi: bt: add clock control logic
>   ARM: dts: aspeed: add LCLK setting into LPC KCS nodes
>   ipmi: kcs_bmc_aspeed: add clock control logic
>
>  arch/arm/boot/dts/aspeed-g4.dtsi   |  1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi   |  5 +++++
>  arch/arm/boot/dts/aspeed-g6.dtsi   |  5 +++++
>  drivers/char/ipmi/bt-bmc.c         | 24 ++++++++++++++++++++++-
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 31 ++++++++++++++++++++++++++----
>  5 files changed, 61 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>
