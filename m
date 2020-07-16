Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C612221E6E
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jul 2020 10:32:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6nYF2ZWDzDqvD
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jul 2020 18:32:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p7Podd+v; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6nY56pbXzDqHd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 18:31:53 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id q7so6232338ljm.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YBdBkCZyYrnro0mG4wNU/SXS3tLA8FxNGX+obuNgjH8=;
 b=p7Podd+vPOqWJxeSsTXewwQJ0pYEiECsXkQ0W0tTlg1WtzqovoD0lIeXALNMQTneJY
 604+6fxhst8qRgbo6s1Hc639xjJUdtyMKoUX8PB/9JIopac0hBV6FjHPtNjovabGggjt
 AJ0s2M0cDTK0UZd1ZlVIE0BGTo0u9MiP2b46VswczuwB4MpvS5ARlyQBeZ6qR7xQbDdu
 1mO9Njf1lroyNzg122nkwu11lYwHrYVuQlW/fstTtq1jzzIvlsO4FhjhybmXpfwr+Spw
 DujOXbXHRH5cxw0nStYzF9/MswhlsqF6ivYvZNDaVDiuMBZ/UYdklChcy8oaXeOa2QOS
 gHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YBdBkCZyYrnro0mG4wNU/SXS3tLA8FxNGX+obuNgjH8=;
 b=snzMMvX6vM91b0K368afRv13X25JPi5rFmqzSZ8gOX2Xb7qwz5r0XPRU6yZiO44IZr
 z5BN+9Q2MBUQc5WJeoC0ucU2dywuVM+EZazHDzrgEB3ZDn0wSPM4/dpVwCmf0ORNI/ho
 KufZ7j6oxtl2VoxaQMf6HIFF99/Yl8KnDae5NvHxtGXrPf+oioeGQfOHNu4Nn085QaZZ
 U28UkW5rjspdF6EmG8mAQ9McDcVDIEIZnj7e0hyrAmsUeQnU+AJRvCb16fO/NuwIEEtK
 G5SCYNZ6hPQse2yIhmi5yaVOhv2uW2BlrFpm6r/ydaNPpq4wsYtTKi4xkKE1XuBPpzB6
 4Q5g==
X-Gm-Message-State: AOAM530WHJjeI8dnAQtxtR7belMMe3QlFVTuo8VcI1VeKcv0wpQzyiMq
 fjdo2ewe4l0+RmdDmkBjgk15i0eYAPTSiUp272D+NA==
X-Google-Smtp-Source: ABdhPJy4xVhgi7qV+wdCvfTxXW1sKMtMQ2SQtdo9WMbH1aOpTecfj5o/jZrVXV9VwVBxb/zyeN1VEJor6pJwOtfXLxk=
X-Received: by 2002:a05:651c:1291:: with SMTP id
 17mr1581632ljc.286.1594888305338; 
 Thu, 16 Jul 2020 01:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200701030039.2834418-1-joel@jms.id.au>
In-Reply-To: <20200701030039.2834418-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2020 10:31:34 +0200
Message-ID: <CACRpkdY_3HHfC1uDHVfnD529o5Wpa7msZU+YMomnpUS6qJjx4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Improve debug output
To: Joel Stanley <joel@jms.id.au>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 1, 2020 at 5:00 AM Joel Stanley <joel@jms.id.au> wrote:

> From: Andrew Jeffery <andrew@aj.id.au>
>
> We need to iterate over each pin in a group for a function and
> disable higher priority mux configurations on the pin before finally
> muxing the relevant function's signal. With the current debug output it
> is hard to track what register output is relevant to which operation, so
> break up the actions in the debug output by providing some more context.
>
> Before:
>
>     [    5.446656] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin 37 (B26) for 1e780000.gpio:341
>     [    5.447377] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
>     [    5.447854] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
>     [    5.448340] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
>
> After:
>
>     [    5.298053] Muxing pin 37 for GPIO
>     [    5.298294] Disabling signal NRI4 for NRI4
>     [    5.298593] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
>     [    5.298983] Disabling signal RGMII4RXD1 for RGMII4
>     [    5.299309] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
>     [    5.299694] Disabling signal RMII4RXD1 for RMII4
>     [    5.300014] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
>     [    5.300396] Enabling signal GPIOE5 for GPIOE5
>     [    5.300687] Muxed pin 37 as GPIOE5
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied, thanks!

Yours,
Linus Walleij
